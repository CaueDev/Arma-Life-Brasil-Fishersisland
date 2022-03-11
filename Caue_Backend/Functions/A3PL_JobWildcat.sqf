/*
    Client
*/
['A3PL_JobWildcat_BuyMap', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_mapType",""]
    ];

    private _timeLeft = missionNameSpace getVariable ["A3PL_JobWildcat_MapTimer",(diag_ticktime-2)];
    if (_timeLeft > diag_ticktime) exitwith {[format ["Por favor, espere %1 segundos antes de comprar outro mapa",round(_timeLeft-diag_ticktime)],Color_Red] call A3PL_HUD_Notification;};

    private _markname = switch (_mapType) do {
        case "iron": {"ferro"};
        case "coal": {"carvão"};
        case "aluminium": {"alumínio"};
        case "sulphur": {"enxofre"};
        case "oil": {"petróleo"};
    };

    private _markers = [];

    if (_mapType isEqualTo "oil") then {
        if ((player getVariable ["getjobplayerguy",0]) < 1000) exitwith {["Você não tem dinheiro suficiente para comprar este mapa",Color_Red] call A3PL_HUD_Notification;};
        player setVariable ["getjobplayerguy",(player getVariable ["getjobplayerguy",0]) - 1000,true];

        private _oilArray = missionNamespace getVariable ["Server_JobWildCat_Oil",[]];
        private _exactLocation = (selectRandom _oilArray) select 0;

        private _marker = createMarkerLocal [format["%1_marker",floor (random 5000)],_exactLocation];
        _marker setMarkerShapeLocal "ELLIPSE";
        _marker setMarkerSizeLocal [100,100];
        _marker setMarkerColorLocal "ColorGreen";
        _marker setMarkerTypeLocal "Mil_dot";
        _marker setMarkerAlphaLocal 0.7;
        _markers pushback _marker;

        private _marker = createMarkerLocal [format["%1_marker",floor (random 5000)],_exactLocation];
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerColorLocal "ColorBlue";
        _marker setMarkerTypeLocal "Mil_dot";
        _marker setMarkerTextLocal "PETRÓLEO NESTE LOCAL";
        _markers pushback _marker;
    };

    if (_mapType IN ["iron","coal","aluminium","sulphur"]) then {
        if ((player getVariable ["getjobplayerguy",0]) < 500) exitwith {["Você não tem dinheiro suficiente para comprar este mapa",Color_Red] call A3PL_HUD_Notification;};
        player setVariable ["getjobplayerguy",(player getVariable ["getjobplayerguy",0]) - 500,true];

        private _resArray = missionNameSpace getVariable ["Server_JobWildCat_Res",[]];
        private _newResArray = [];
        {
            if ((_x select 0) == _mapType) then {_newResArray pushback _x;};
        } forEach _resArray;

        _exactLocation = (selectRandom _newResArray) select 1;

        _marker = createMarkerLocal [format["%1_marker",floor (random 5000)],_exactLocation];
        _marker setMarkerShapeLocal "ELLIPSE";
        _marker setMarkerSizeLocal [100,100];
        _marker setMarkerColorLocal "ColorGreen";
        _marker setMarkerTypeLocal "Mil_dot";
        _marker setMarkerAlphaLocal 0.7;
        _markers pushback _marker;

        _marker = createMarkerLocal [format["%1_marker",floor (random 5000)],_exactLocation];
        _marker setMarkerShapeLocal "ICON";
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerTypeLocal "Mil_dot";
        _marker setMarkerTextLocal format ["%1 NESTE LOCAL",toUpper _markname];
        _markers pushback _marker;
    };


    if ((count _markers) isEqualTo 0) exitwith {};
    missionNamespace setVariable ["A3PL_JobWildcat_MapTimer",(diag_ticktime + 300)];

    [_markers] spawn {
        params [["_markers",[]]];
        sleep 900;
        {deleteMarkerLocal _x;} forEach _markers;
    };

    [format["Você comprou um mapa de %1, o local será marcado em seu mapa por 10 minutos",_markname],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_JobWildCat_ProspectOpen', {

    disableSerialization;

    closeDialog 0;
    createDialog "Dialog_Prospect";
    private _display = findDisplay 131;

    private _control = _display displayCtrl 2100;
    {
        _control lbAdd (_x select 7);
    } forEach Config_Resources_Ores;
    _control lbAdd "Petróleo";
    _control lbSetCurSel 0;

    _control = _display displayCtrl 1601;
    _control buttonSetAction "[(lbText [2100,(lbCurSel 2100)])] call A3PL_JobWildcat_ProspectInit; closeDialog 0;";

}, false] call Server_Setup_Compile;

['A3PL_JobWildcat_ProspectInit', {

    params [
        ["_prospectFor2","Petróleo"]
    ];

    private _prospectFor = [_prospectFor2] call {
        private _type = _this select 0;
        if (_type isEqualTo "Petróleo") exitWith {"oil"};
        if (_type isEqualTo "Ferro") exitWith {"iron"};
        if (_type isEqualTo "Carvão") exitWith {"coal"};
        if (_type isEqualTo "Alumínio") exitWith {"aluminium"};
        if (_type isEqualTo "Enxofre") exitWith {"sulphur"};
    };

    if (_prospectFor isEqualTo "oil") then {
        private _checkOil = [getpos player] call A3PL_JobWildcat_CheckForOil;
        private _haveOil = _checkOil select 0;
        private _oilLocation = _checkOil select 1;
        if !(_haveOil) exitwith {[0,"oil"] spawn A3PL_JobWildCat_Prospect;};

        [1,"oil"] spawn A3PL_JobWildCat_Prospect;
    } else {
        private _checkOres = [getpos player,_prospectFor] call A3PL_JobWildcat_CheckForRes;
        private _haveRes = _checkOres select 0;
        private _resLocation = _checkOres select 1;
        if !(_haveRes) exitwith {[0,_prospectFor] spawn A3PL_JobWildCat_Prospect;};

        [1,_prospectFor] spawn A3PL_JobWildCat_Prospect;
    };

}, false] call Server_Setup_Compile;

['A3PL_JobWildcat_Prospect', {

    params [
        ["_signs",0],
        ["_prospectFor","oil"]
    ];

    if ((animationState player) == "acts_terminalopen") exitWith {["Você já está procurando!",Color_Red] call A3PL_HUD_Notification;};
    if !(isNil "Player_Prospecting") exitWith {["Você já está procurando ou a procura foi cancelado por entrar em um veículo",Color_Red] call A3PL_HUD_Notification;};

    Player_Prospecting = true;
    [player,"Acts_TerminalOpen"] remoteExec ["A3PL_Lib_SyncAnim",-2];
    ["Agora você está procurando minerios e não pode se mover, levará cerca de um minuto para procurar por essa área", Color_Red] call A3PL_HUD_Notification;

    private _prospectArray = [];
    switch (_prospectFor) do {
        case ("oil"): {
            _prospectArray = switch (_signs) do {
                case 0: {[5,["Não encontrei nenhuma rocha portadora de petróleo abaixo da superfície",Color_Red]]};
                case 1: {[10,["Encontrei uma rocha portadora de petróleo abaixo da superfície",Color_Green]]};
            };
        };

        case ("iron"): {
            _prospectArray = switch (_signs) do {
                case 0: {[3,["Não parece que há minérios de ferro abaixo",Color_Red]]};
                case 1: {[3,["Parece que há minérios de ferro abaixo",Color_Green]]};
            };
        };

        case ("coal"): {
            _prospectArray = switch (_signs) do {
                case 0: {[3,["Não parece que exista algum resíduo de carvão nessa área",Color_Red]]};
                case 1: {[3,["Acabei de tirar uma amostra do solo e parece conter um pouco de cinza de carvão",Color_Green]]};
            };
        };

        case ("titanium"): {
            _prospectArray = switch (_signs) do {
                case 0: {[3,["Peguei uma amostra do solo e ela não contém nada que possa indicar minérios de titânio nessa área",Color_Red]]};
                case 1: {[3,["Parece que há um pouco de resíduo de titânio nesta área!",Color_Green]]};
            };
        };

        case ("aluminium"): {
            _prospectArray = switch (_signs) do {
                case 0: {[3,["Não parece que esta terra é adequada para minérios de bauxita(aluminio)",Color_Red]]};
                case 1: {[3,["Parece que esta terra é adequada para minérios de bauxita(aluminio)!",Color_Green]]};
            };
        };

        case ("sulphur"): {
            _prospectArray = switch (_signs) do {
                case 0: {[3,["Peguei uma amostra do solo e não contém residuos de enxofre",Color_Red]]};
                case 1: {[3,["Acabei de tirar uma amostra do solo e parece conter alguns residuos de enxofre",Color_Green]]};
            };
        };
    };

    _prospectArray params [
        "_animTime",
        "_animMsg"
    ];

    private _canProspect = true;
    for "_i" from 0 to _animTime do {
        uiSleep 3.7;
        if !((vehicle player) isEqualTo player) exitWith {_canProspect = false;};
    };

    if !(_canProspect) exitwith {_timeOut = 20; [format["Você entrou em um veículo, a procura não está disponível por %1 segundos",_timeOut],Color_Red] call A3PL_HUD_Notification; [_timeOut] spawn {uiSleep (param [0,0]); Player_Prospecting = nil;};};

    Player_Prospecting = nil;
    _animMsg call A3PL_HUD_Notification;
    [player,""] remoteExec ["A3PL_Lib_SyncAnim", 0];

    private _listOres = [];
    {
        _listOres pushback (toLower (_x select 0));
    } forEach Config_Resources_Ores;

    if ((_signs isEqualTo 1) && (_prospectFor IN _listOres)) then {
        [format["Você encontrou %1",([_prospectFor,"name"] call Caue_Config_GetOre)],Color_Green] call A3PL_HUD_Notification;
        [player,_prospectFor] remoteExec ["Server_JobWildCat_SpawnRes",2];
    };

}, false] call Server_Setup_Compile;

['A3PL_JobWildcat_CheckForRes', {

    params [
        ["_pos",[0,0,0]],
        ["_resType",""]
    ];

    private _res = false;
    private _resLocation = [0,0,0];
    {
        if (((_pos distance (_x select 1)) < 100 ) && ((_x select 0) == _resType)) exitwith {
            _res = true;
            _resLocation = _x select 1;
        };
    } forEach Server_JobWildCat_Res;

    private _return = [_res,_resLocation];

    _return;

}, false] call Server_Setup_Compile;

['A3PL_JobWildcat_CheckForOil', {

    params [
        ["_pos",[0,0,0]]
    ];

    private _oil = false;
    private _oilLocation = [0,0,0];
    {
        if ((_pos distance (_x select 0)) < 100) exitwith {
            _oil = true;
            _oilLocation = _x select 0;
        };
    } forEach Server_JobWildCat_Oil;

    private _return = [_oil,_oilLocation];

    _return;

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_JobWildCat_RandomizeOil', {

    Server_JobWildCat_Oil = [];

    for "_i" from 0 to 76 do {
        private _randPos = ["OilSpawnArea"] call CBA_fnc_randPosArea;
        private _overWater = !(_randPos isFlatEmpty [-1, -1, -1, -1, 2, false] isEqualTo []);

        while {_overWater} do {
            _randPos = ["OilSpawnArea"] call CBA_fnc_randPosArea;
            _overWater = !(_randPos isFlatEmpty [-1, -1, -1, -1, 2, false] isEqualTo []);
        };

        private _oilAmounts = [50,100,150,200,300,400,500,600,1000,1500];
        private _r = floor random 10;
        private _arr = [_randPos,(_oilAmounts select _r)];

        Server_JobWildCat_Oil pushback _arr;
    };

    publicVariable "Server_JobWildCat_Oil";

}, true] call Server_Setup_Compile;

['Server_JobWildcat_RandomizeRes', {

    Server_JobWildCat_Res = [];

    {
        _x params [
            "_name",
            "_minArea",
            "_maxArea",
            "_minOres",
            "_maxOres"
        ];

        private _areas = round(_minArea + (random (_maxArea - _minArea)));
        for "_i" from 0 to _areas do {
            private _randPos = ["OilSpawnArea"] call CBA_fnc_randPosArea;
            private _overWater = !(_randPos isFlatEmpty [-1, -1, -1, -1, 2, false] isEqualTo []);

            while {_overWater} do {
                _randPos = ["OilSpawnArea"] call CBA_fnc_randPosArea;
                _overWater = !(_randPos isFlatEmpty [-1, -1, -1, -1, 2, false] isEqualTo []);
            };

            private _arr = [_name,_randPos,round(_minOres + (random (_maxOres - _minOres)))];

            Server_JobWildCat_Res pushback _arr;
        };
    } forEach Config_Resources_Ores;

    publicVariable "Server_JobWildCat_Res";

}, true] call Server_Setup_Compile;

['Server_JobWildCat_SpawnRes', {

    params [
        ["_player",objNull],
        ["_foundOre",""]
    ];

    private _objClass = "";
    _objClass = switch (_foundOre) do {
        case ("iron"): {"A3PL_Resource_Ore_Pink"};
        case ("coal"): {"A3PL_Resource_Ore_Black"};
        case ("aluminium"): {"A3PL_Resource_Ore_Orange"};
        case ("sulphur"): {"A3PL_Resource_Ore_Yellow"};
    };

    if (_objClass isEqualTo "") exitwith {};

    private _obj = createVehicle [_objClass,_player,[],0,"CAN_COLLIDE"];
    _obj setVariable ["oreClass",_foundOre,false];

    {
        if ((toLower (_x select 0)) == _foundOre) exitwith {
            _obj setVariable ["smallOreItemClass",_x select 5,false];
            _obj setVariable ["smallOreAmount",_x select 6,false];
        };
    } forEach Config_Resources_Ores;

    _obj addEventHandler ["HandleDamage",{
        private _obj = param [0,objNull];
        private _sel = param [1,""];
        private _dmg = param [2,0];
        private _ins = param [6,objNull];

        private _wep = currentWeapon _ins;
        if (typeOf vehicle _ins == "A3PL_MiniExcavator") then {_wep = vehicle _ins currentWeaponTurret [0];};

        /*
        if (_wep isEqualTo "A3PL_Pickaxe") then {
            playSound3D [format["cauedev.github.io\sounds\mine\mine%1.ogg",(1 + (round(random 4)))], _obj, false, getPos _obj, 3, 1, 15];
        };
        */

        private _oldDmg = _obj getVariable ["dmg",0];
        private _giveEach = _obj getVariable ["smallOreAmount",1];
        private _newDmg = _dmg;
        private _prevDamage = _obj getVariable [format ["%1_dmg",_sel],0];

        if ((_dmg >= 0.55) && (_sel == "hitpickaxe")) exitWith {deleteVehicle _obj;};

        private _itemClass = "";
        if ((_dmg >= (_oldDmg + (0.55 / _giveEach))) && (_sel == "hitpickaxe") && (_wep IN ["A3PL_Machinery_Pickaxe","A3PL_Pickaxe"])) then {
            private _random = random 100;
            if (_random < 5) then {
                _random = random 100;
                switch (true) do {
                    case (_random < 1): {_itemClass = "diamond";};
                    case (_random < 4): {_itemClass = "diamond_emerald";};
                    case (_random < 9): {_itemClass = "diamond_ruby";};
                    case (_random < 19): {_itemClass = "diamond_sapphire";};
                    case (_random < 30): {_itemClass = "diamond_alex";};
                    case (_random < 50): {_itemClass = "diamond_aqua";};
                    case (_random <= 100): {_itemClass = "diamond_tourmaline";};
                };
                if (([_ins,[[_itemClass,1]]] call Caue_Inventory_TotalWeight) > (_ins getVariable ["MaxWeight",100])) then {
                    ["Seu inventario esta cheio!",Color_Red] remoteExec ["A3PL_HUD_Notification",(owner _ins)];
                } else {
                    [_ins,_itemClass,1] call Server_Inventory_Change;
                    ["Você encontrou uma joia rara!",Color_Green] remoteExec ["A3PL_HUD_Notification",(owner _ins)];
                };
            } else {
                _itemClass = _obj getVariable ["smallOreItemClass","ore_metal"];
                if (([_ins,[[_itemClass,1]]] call Caue_Inventory_TotalWeight) > (_ins getVariable ["MaxWeight",100])) then {
                    ["Seu inventario esta cheio!",Color_Red] remoteExec ["A3PL_HUD_Notification",(owner _ins)];
                } else {
                    [_ins,_itemClass,1] call Server_Inventory_Change;
                    ["Você coletou um minerio", Color_Green] remoteExec ["A3PL_HUD_Notification",(owner _ins)];
                };
            };
            _obj setVariable ["dmg",_dmg,false];
        };

        if ((_sel == "hitshovel") && (!(_wep IN ["A3PL_Machinery_Bucket","A3PL_Shovel"]))) then {_newDmg = _prevDamage;};
        if ((_sel == "hitpickaxe") && (!(_wep IN ["A3PL_Machinery_Pickaxe","A3PL_Pickaxe"]))) then {_newDmg = _prevDamage;};
        _obj setVariable [format["%1_dmg",_sel],_newdmg,false];

        _newDmg;
    }];

}, true] call Server_Setup_Compile;
