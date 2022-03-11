/*
    Client
*/
['A3PL_Resources_DigOre', {

    private ["_veh","_dmg"];
    _veh = param [0,objNull];
    _dmg = _veh getHitPointDamage "HitShovel";
    if (currentWeapon player != "A3PL_Shovel") exitwith {["Você não está carregando uma pá",Color_Red] call A3PL_HUD_Notification;};
    if (_dmg < 1) then
    {
        _veh setHitPointDamage ["HitShovel",_dmg + 0.1];
    };

}, false] call Server_Setup_Compile;

['A3PL_Resources_StartDigging', {

    private ["_inMarker","_eBucket","_s","_sBucket","_pos","_digProgress","_t"];
    _inMarker = false;

    {
        if ((getpos player) inArea _x) exitwith {_inMarker = true};
    } foreach ["A3PL_Marker_Sand1","A3PL_Marker_Sand2"];

    if (!_inMarker) exitwith {["Você não está em uma área de coleta de areia",Color_Red] call A3PL_HUD_Notification;};

    if (currentWeapon player != "A3PL_Shovel") exitwith {["Você não está carregando uma pá",Color_Red] call A3PL_HUD_Notification;};

    [player,"A3PL_Shovel_Dig"] remoteExec ["A3PL_Lib_SyncAnim", 0];
    _digProgress = 0;
    _s = false;
    _t = 0;
    waituntil {sleep 0.1; _t = _t + 0.1; if (_t >= 2) exitwith {true}; animationState player == "A3PL_Shovel_Dig"};
    ["Você está cavando areia, fique parado!",Color_Green] call A3PL_HUD_Notification;
    while {animationState player == "A3PL_Shovel_Dig"} do
    {
        uiSleep 2;
        _digProgress = _digProgress + 10;
        if (_digProgress >= 100) exitwith {_s = true};
    };
    [player,""] remoteExec ["A3PL_Lib_SyncAnim", 0];

    if (!_s) exitwith {["Escavação de areia foi cancelada!",Color_Red] call A3PL_HUD_Notification;};

    _eBucket = objNull;
    {
        if ((_x getvariable ["class",""]) == "bucket_empty") exitwith {_ebucket = _x;};
    } foreach (nearestObjects [player, ["A3PL_Bucket"], 5]);

    if (isNull _eBucket) exitwith {["Não foi possível encontrar um balde vazio em um raio de 5 metros",Color_Red] call A3PL_HUD_Notification;};

    _pos = getPos _eBucket;
    deleteVehicle _eBucket;

    _sBucket = createVehicle ["A3PL_BucketSand",_pos, [], 0, "CAN_COLLIDE"];
    _sBucket setVariable ["class","sand",true];

    ["Escavação de areia concluída!",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;
/*
    Server
*/
['Server_Resources_OreHandleDamage', {

    private ["_ore","_projectile","_dmgValue"];
    _obj = param [0,objNull];
    _projectile = param [1,""];

    if (!(_projectile IN ["A3PL_Shovel_Bullet","A3PL_PickAxe_Bullet"])) exitwith {};
    _dmgValue = _obj getVariable ["dmg",0];
    if (_dmgValue >= 1) exitwith
    {
        private ["_pos","_oreClass","_arrayToCheck","_varname","_oreClass","_classname","_amount","_itemClass"];

        _varname = _obj getVariable ["varName",""];
        _arrayToCheck = missionNameSpace getVariable [_varname,[]];
        {
            if (_x == _obj) exitwith
            {
                _arrayToCheck deleteAt _forEachIndex;
            };
        } foreach _arrayToCheck;
        missionNameSpace setVariable [_varname,_arrayToCheck,false];

        _pos = getPos _obj;
        _oreClass = _obj getVariable ["oreClass","Metal"];

        deleteVehicle _obj;

        _amount = [_oreclass,"amount"] call Caue_Config_GetOre;
        _itemClass = [_oreclass,"itemclass"] call Caue_Config_GetOre;
        _classname = [_itemClass,"class"] call Caue_Config_GetItem;
        for "_i" from 0 to _amount-1 do
        {
            private ["_smallOre"];
            _smallOre = createVehicle [_classname,([_pos,0.2+random 1,random 360] call BIS_fnc_relPos),[],0,"CAN_COLLIDE"];
            _smallOre setVariable ["class",_itemClass,true];
        };
    };

    _obj setVariable ["dmg",_dmgValue + 0.1,false];

}, true] call Server_Setup_Compile;

['Server_Resources_SearchMarkers', {

    private ["_output"];
    _output = [];

    {
        private ["_name","_s","_c"];
        _s = _x splitstring "_";
        _c = count _s > 1;
        if (_c && (_s select 0 == "Ore")) then
        {
            _output pushback _x;
        };
    } foreach allMapMarkers;
    _output;

}, true] call Server_Setup_Compile;

['Server_Resources_SpawnOres', {

    if (isNil "Server_Ores") exitwith {diag_log "Error spawning ores: Server_Ores is undefined"};

    {
        private ["_class","_areaNumber","_amountOres","_classname","_min","_max","_varname","_amount","_ores"];

        _class = (_x splitString "_") select 1;
        _areaNumber = (_x splitString "_") select 2;

        _varname = format ["Server_Ores_%1_%2",_class,_areaNumber];
        _amountOres = count (missionNameSpace getVariable [_varname,[]]);

        if (_amountOres < 1) then
        {
            switch (_class) do
            {
                case ("Metal"): {_classname = "A3PL_Resource_Ore_Black";};
                default {_classname = "A3PL_Resource_Ore_Black";};
            };
            _min = [_class,"min"] call Caue_Config_GetOre;
            _max = [_class,"max"] call Caue_Config_GetOre;

            _amount = floor (_min + (random (_max-_min)));

            _ores = missionNameSpace getVariable [_varname,[]];
            for "_i" from 0 to _amount do
            {
                private ["_pos","_ore"];
                _pos = ([_x] call CBA_fnc_randPosArea) findEmptyPosition [0,25,_classname];
                _ore = createVehicle [_classname,_pos,[],0,"CAN_COLLIDE"];

                _ore setVariable ["oreClass",_class];
                _ore setVariable ["area",_x];
                _ore setVariable ["varname",_varname];

                _ore addEventHandler ["HandleDamage",{[param [0,objNull],param [4,""]] spawn Server_Resources_OreHandleDamage;}];;

                _ores pushback _ore;
            };
            missionNameSpace setvariable [_varname,_ores];
        };
    } foreach Server_Ores;

}, true] call Server_Setup_Compile;
