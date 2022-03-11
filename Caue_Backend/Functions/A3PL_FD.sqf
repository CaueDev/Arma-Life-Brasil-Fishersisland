['A3PL_FD_ChangeHosePressure', {

    private ["_currentPressure","_newPressure"];
    _currentPressure = player getvariable ["pressure","high"];
    switch (_currentPressure) do
    {
        case ("high"): {_newPressure = "medium"};
        case ("medium"): {_newPressure = "low"};
        case ("low"): {_newPressure = "high"};
    };

    player setvariable ["pressure",_newPressure,false];

}, false] call Server_Setup_Compile;

['A3PL_FD_ConnectAdapter', {

    private ["_hydrant","_adapter","_itemClass","_pos","_dir"];

    if(!([] call Caue_Player_AntiSpam)) exitWith {};

    _hydrant = param [0,objNull];
    if (!((typeOf _hydrant) IN ["Land_A3PL_FireHydrant","Land_A3PL_Gas_Station"])) exitwith {["Você não está interagindo com um hidrante/tanque de gasolina",Color_Red] call A3PL_HUD_Notification;};
    if (((count (attachedObjects _hydrant)) > 0) && (typeOf _hydrant == "Land_A3PL_FireHydrant")) exitwith {["Já existe um adaptador conectado a essa fonte de água",Color_Red] call A3PL_HUD_Notification;};
    if (player_itemClass != "FD_adapter") exitwith {["Você não está segurando o adaptador adequado",Color_Red] call A3PL_HUD_Notification;};

    switch (typeOf _hydrant) do
    {
        case ("Land_A3PL_FireHydrant"): {_pos = [-0.005,0.15,-0.076]; _dir = -180; _hydrant animateSource ["cap_hide",1];};
        case ("Land_A3PL_Gas_Station"): {_pos = [-3.72154,3.51953,-2.1]; _dir = -90;};
    };

    _adapter = createVehicle ["A3PL_FD_HoseEnd1_Float",_hydrant modelToWorld _pos, [], 0, "CAN_COLLIDE"];
    _adapter setDir (getDir _hydrant + _dir);

    _itemClass = "FD_adapter";

    [player,_adapter,_itemClass] remoteExec ["Server_Inventory_Drop", 2];
    deleteVehicle Player_Item;
    Player_Item = objNull;
    Player_ItemClass = "";
    call A3PL_FD_ConnectAnimation;

}, false] call Server_Setup_Compile;

['A3PL_FD_ConnectAnimation', {

    player playmove "Acts_carFixingWheel";
    [] spawn
    {
        sleep 4;
         player switchmove "";
    };

}, false] call Server_Setup_Compile;

['A3PL_FD_ConnectHose', {

    private ["_end"];

    if(!([] call Caue_Player_AntiSpam)) exitWith {};

    _end = param [0,objNull];
    if (!(_end isKindOf "A3PL_FD_HoseEnd1_Float")) exitwith {["Você não está interagindo com um adaptador de mangueira localizado em uma fonte de água",Color_Red] call A3PL_HUD_Notification;};
    if (!((attachedTo _end) isKindOf "Land_A3PL_FireHydrant")) exitwith {["Você não está interagindo com um hidrante",Color_Red] call A3PL_HUD_Notification;};
    if ((count (ropes _end)) > 0) exitwith {["Já existe uma mangueira conectada a este adaptador",Color_Red] call A3PL_HUD_Notification;};

}, false] call Server_Setup_Compile;

['A3PL_FD_ConnectHoseAdapter', {

    private ["_end","_endName","_myAdapter","_TOEnd","_TOmyAdapter","_dirOffset","_attachOffset","_memOffset","_animate","_otherEnd"];
    _end = param [0,objNull];
    _endName = param [1,""];

    if(!([] call Caue_Player_AntiSpam)) exitWith {};

    _myAdapter = call A3PL_Lib_AttachedFirst;
    _otherEnd = [_myAdapter] call A3PL_FD_FindOtherEnd;

    if (_otherEnd == _end) exitwith
    {
        ["Você não pode conectar assim",Color_Red] call A3PL_HUD_Notification;
    };

    _TOEnd = typeOf _end;
    _TOmyAdapter = typeOf _myAdapter;

    if (!(_TOEnd IN ["A3PL_FD_HoseEnd1_Float","A3PL_FD_HoseEnd1","A3PL_FD_HoseEnd2","A3PL_FD_yAdapter","A3PL_Pierce_Heavy_Ladder","A3PL_Pierce_Pumper","A3PL_Tanker_Trailer","A3PL_Fuel_Van"])) exitwith {["System: You are not interacting with a proper hose adapter/inlet",Color_Red] call A3PL_HUD_Notification;};
    if (!(_TOmyAdapter IN ["A3PL_FD_HoseEnd1","A3PL_FD_HoseEnd2"])) exitwith {["Você não está segurando o tipo de adaptador correto (reporte isso se for um bug)",Color_Red] call A3PL_HUD_Notification;};
    if (_TOmyAdapter == "A3PL_FD_HoseEnd1" && _TOEnd == "A3PL_FD_HoseEnd1_Float") exitwith {["Você está conectando um adaptador macho a um adaptador macho, use o outro adaptador do outro lado",Color_Red] call A3PL_HUD_Notification;};
    if (_TOmyAdapter == "A3PL_FD_HoseEnd1" && _TOEnd == "A3PL_FD_HoseEnd1") exitwith {["Você está conectando um adaptador macho a um adaptador macho, use o outro adaptador do outro lado",Color_Red] call A3PL_HUD_Notification;};
    if (_TOmyAdapter == "A3PL_FD_HoseEnd2" && _TOEnd == "A3PL_FD_HoseEnd2") exitwith {["Você está conectando um adaptador fêmea a um adaptador fêmea, use o outro adaptador do outro lado",Color_Red] call A3PL_HUD_Notification;};
    if (_TOmyAdapter == "A3PL_FD_HoseEnd2" && _endName == "fd_yadapter_in") exitwith {["Você está conectando um adaptador fêmea a uma entrada fêmea do adaptador Y, use o outro adaptador do outro lado da mangueira",Color_Red] call A3PL_HUD_Notification;};
    if (_TOmyAdapter == "A3PL_FD_HoseEnd1" && _endName == "fd_yadapter_out1") exitwith {["Você está conectando um adaptador macho a uma tomada do adaptador Y macho, use o outro adaptador do outro lado da mangueira",Color_Red] call A3PL_HUD_Notification;};
    if (_TOmyAdapter == "A3PL_FD_HoseEnd1" && _endName == "fd_yadapter_out2") exitwith {["Você está conectando um adaptador macho a uma tomada do adaptador Y macho, use o outro adaptador do outro lado da mangueira",Color_Red] call A3PL_HUD_Notification;};
    if (_TOmyAdapter == "A3PL_FD_HoseEnd1" && _endName == "fd_yadapter_out2") exitwith {["Você está conectando um adaptador macho a uma tomada do adaptador Y macho, use o outro adaptador do outro lado da mangueira",Color_Red] call A3PL_HUD_Notification;};
    if (_TOmyAdapter == "A3PL_FD_HoseEnd2" && _endName IN ["inlet_ds"]) exitwith {["Você está conectando um adaptador fêmea em uma entrada de escada fêmea, use o outro adaptador no outro lado da mangueira",Color_Red] call A3PL_HUD_Notification;};

    switch (_endName) do
    {
        case ("fd_yadapter_in"): {_dirOffset = -90; _attachOffset = [-0.15,0,0]; _end setVariable ["inlet",_myAdapter,true]};
        case ("fd_yadapter_out1"): {_dirOffset = 115; _attachOffset = [0.07,-0.10,0];};
        case ("fd_yadapter_out2"): {_dirOffset = 60; _attachOffset = [0.07,0.10,0];};
        case ("inlet_r"): {_dirOffset = -180; _attachOffset = [0,0,0]; _memOffset = "inlet_r"; _animate = "Inlet_R_Cap";};
        case ("inlet_ds"): {_dirOffset = -90; _attachOffset = [0,0,0]; _memOffset = "inlet_ds"; _animate = "Inlet_DS_Cap";};
        case ("outlet_ps"): {_dirOffset = 90; _attachOffset = [0.05,0,0]; _memOffset = "outlet_ps"; _animate = "Outlet_PS_Cap";};
        case ("outlet_ds"): {_dirOffset = -90; _attachOffset = [-0.05,0,0]; _memOffset = "outlet_ds"; _animate = "Outlet_DS_Cap";};
        case ("outlet_1"): {_dirOffset = 90; _attachOffset = [0,0,0]; _memOffset = "outlet_1"; _animate = "outlet_1_cap";};
        case ("outlet_2"): {_dirOffset = 90; _attachOffset = [0,0,0]; _memOffset = "outlet_2"; _animate = "outlet_2_cap";};
        case ("outlet_3"): {_dirOffset = 90; _attachOffset = [0,0,0]; _memOffset = "outlet_3"; _animate = "outlet_3_cap";};
        case ("outlet_4"): {_dirOffset = 90; _attachOffset = [0.12,0,0]; _memOffset = "outlet_4"; _animate = "outlet_4_cap";};
        default {_dirOffset = -180; _attachOffset = [0,-0.04,0];};
    };

    switch (_TOEnd) do
    {
        case ("A3PL_Fuel_Van"): {_dirOffset = 180; _attachOffset = [0,0,0]; _memOffset = "outlet_1"; _animate = "outlet_1_cap";};
    };

    _dir = getDir _end + _dirOffset;

    if (!isNil "_memOffset") then
    {
        _myAdapter attachTo [_end,_attachOffset,_memOffset];
    } else
    {
        _myAdapter attachTo [_end,_attachOffset];
    };

    if (!isNil "_animate") then { _end animate [_animate,1]; };

    _myAdapter setDir (_dir + (360 - (getDir _end)));

    call A3PL_FD_ConnectAnimation;

}, false] call Server_Setup_Compile;

['A3PL_FD_ConnectWrench', {

    private ["_hydrant"];

    if(!([] call Caue_Player_AntiSpam)) exitWith {};

    _hydrant = param [0,objNull];
    if (!(_hydrant isKindOf "Land_A3PL_FireHydrant")) exitwith {["Você não está interagindo com um hidrante",Color_Red] call A3PL_HUD_Notification;};

    _newWrench = createVehicle ["A3PL_FD_HydrantWrench_F",_hydrant modelToWorld [0,-0.25,0.445], [], 0, "CAN_COLLIDE"];
    _newWrench setDir (getDir _hydrant);

    [player,_newWrench,"FD_hydrantwrench"] remoteExec ["Server_Inventory_Drop", 2];
    deleteVehicle Player_Item;
    Player_Item = objNull;
    Player_ItemClass = "";
    call A3PL_FD_ConnectAnimation;

}, false] call Server_Setup_Compile;

['A3PL_FD_DeployHose', {

    private ["_adapter1","_adapter2","_rope"];
    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    if (Player_ItemClass != "FD_Hose") exitwith {["Você não está segurando uma mangueira",Color_Red] call A3PL_HUD_Notification;};
    _lengths = param [0,objNull];
    [player,objNull,Player_ItemClass] remoteExec ["Server_Inventory_Drop", 2];

    deleteVehicle Player_Item;
    Player_Item = objNull;
    Player_ItemClass = "";

    _adapter2 = createVehicle ["A3PL_FD_HoseEnd1",(player modelToWorld [0,5,0.5]), [], 0, "CAN_COLLIDE"];
    _adapter1 = createVehicle ["A3PL_FD_HoseEnd2",(player modelToWorld [0,0,0.5]), [], 0, "CAN_COLLIDE"];
    _adapter2 allowDamage false;
    _adapter1 allowDamage false;

    _rope = ropeCreate [_adapter1, [0,0.03,0.00], _adapter2, [0,0.03,0.00], _lengths];

}, false] call Server_Setup_Compile;

['A3PL_FD_DropHose', {

    private ["_adapter"];
    _adapter = param [0,objNull];

    detach _adapter;

}, false] call Server_Setup_Compile;

['A3PL_FD_EngineLoop', {

    private ["_veh","_end","_water","_source","_sourceAmount","_i"];
    _veh = param [0,objNull];

    if (missionNameSpace getVariable ["A3PL_FD_EngineLoopRunning",false]) exitwith {};
    A3PL_FD_EngineLoopRunning = true;

    _i = 0;
    waitUntil {sleep 0.1; _i = _i + 0.1; if (_i > 3) exitwith {_veh animate ["ft_lever_8",0,true]}; _veh animationPhase "ft_lever_8" > 0};
    while {(_veh animationPhase "ft_lever_8" > 0)} do
    {
        _end = [objNull,_veh,"inlet_ds"] call A3PL_FD_FindAdapterCap;
        if (!isNull _end) then
        {
            _source = [_end] call A3PL_FD_FindSource;
            if (!isNull _source) then
            {
                _sourceAmount = [_source] call A3PL_FD_SourceAmount;
                if (_sourceAmount >= 5) then
                {
                    player globalChat "START";
                    if (_veh animationPhase "ft_lever_8" > 0.9 && _veh animationPhase "ft_lever_11" > 0.9 && _veh animationPhase "FT_Pump_Switch" > 0.9) then
                    {
                        _water = _veh getVariable ["water",0];
                        if (_water < 1800) then
                        {
                            _veh setVariable ["water",_water + 5,true];
                            _veh animate ["Water_Gauge1",(_water + 5) / 1800];
                        };
                        if (typeOf _source == "A3PL_Pierce_Pumper") then
                        {
                            _source setVariable ["water",_water - 5,true];
                            _source animate ["Water_Gauge1",(_water - 5) / 1800];
                        };
                    };
                };
            };
        };
        uiSleep 1;
    };

    A3PL_FD_EngineLoopRunning = nil;

}, false] call Server_Setup_Compile;

['A3PL_FD_FindAdapterCap', {

    private ["_end","_selectionNames","_veh","_foundCap","_found"];
    _end = param [0,objNull];
    _veh = param [1,objNull];
    _memToFindEnd = param [2,""];
    _foundCap = "";
    if (isNull _veh) exitwith {_foundcap;};

    if (_memToFindEnd != "") exitwith
    {
        private ["_selectionPosition","_foundEnd"];
        _foundEnd = objNull;
        _selectionPosition = _veh modelToWorld (_veh selectionPosition _memToFindEnd);
        {
            if ((typeOf _x IN ["A3PL_FD_HoseEnd1","A3PL_FD_HoseEnd2"]) && ((_selectionPosition distance _x) < 0.1)) exitwith
            {
                _foundEnd = _x;
            };
        } foreach (attachedObjects _veh);
        _foundEnd;
    };

    _selectionNames = ["inlet_r","inlet_ds","inlet_ps","outlet_ds","outlet_ps","outlet_1","outlet_2","outlet_3","outlet_4"];
    {
        _selectionPosition = _veh modelToWorld (_veh selectionPosition _x);
        if ((_end distance _selectionPosition) < 0.1) exitwith
        {
            _found = _x;
        };
    } foreach _selectionNames;

    if (isNil "_found") exitwith {_foundCap;};

    switch (_found) do
    {
        case ("inlet_r"): {_foundCap = "inlet_r_cap"};
        case ("inlet_ds"): {_foundCap = "inlet_ds_cap"};
        case ("inlet_ps"): {_foundCap = "inlet_ps_cap"};
        case ("outlet_ds"): {_foundCap = "outlet_ds_cap"};
        case ("outlet_ps"): {_foundCap = "outlet_ps_cap"};
        case ("outlet_1"): {_foundCap = "outlet_1_cap"};
        case ("outlet_2"): {_foundCap = "outlet_2_cap"};
        case ("outlet_3"): {_foundCap = "outlet_3_cap"};
        case ("outlet_4"): {_foundCap = "outlet_4_cap"};
    };

    _foundCap

}, false] call Server_Setup_Compile;

['A3PL_FD_FindHose', {

    private ["_obj","_ropes"];
    _obj = param [0,objNull];
    _hose = objNull;

    _ropes = ropes _obj;
    if (count _ropes == 0) then
    {
        _obj = ropeAttachedTo _obj;
        _ropes = ropes _obj;
        if (count _ropes != 0) then
        {
            _hose = _ropes select 0;
        };
    } else
    {
        _hose = _ropes select 0;
    };

    _hose

}, false] call Server_Setup_Compile;

['A3PL_FD_FindOtherEnd', {

    private ["_oEnd","_end"];
    _end = param [0,objNull];
    _oEnd = objNull;

    _oEnd = ropeAttachedTo _end;

    if (isNull _oEnd OR _oEnd == _end) then
    {
        private ["_ropeAttached"];
        _ropeAttached = ropeAttachedObjects _end;
        if (count _ropeAttached != 0) then
        {
            _oEnd = _ropeAttached select 0;
        };
    };

    _oEnd

}, false] call Server_Setup_Compile;

['A3PL_FD_FindSource', {

    private ["_end","_latestObject","_source","_otherEnd","_adapter","_hydrants","_hydrant","_m"];
    _end = param [0,objNull];
    _getAdapter = param [1,false];
    _latestObject = _end;
    _source = objNull;

    while {!isNull _latestObject} do
    {
        _m = true;
        _otherEnd = [_latestObject] call A3PL_FD_FindOtherEnd;
        if (isNull _otherEnd) exitwith {};
        _attachedTo = [_otherEnd] call A3PL_Lib_FindAttached;

        if ((typeOf _attachedTo) == "A3PL_FD_HoseEnd1_Float") exitwith
        {
            private ["_hydrants","_adapter","_hydrant"];
            _latestObject = objNull;
            _adapter = _attachedTo;
            if (isNull _adapter) exitwith {};
            _hydrants = nearestObjects [_adapter, ["Land_A3PL_FireHydrant"], 1];
            if (count _hydrants < 1) exitwith {};
            _hydrant = _hydrants select 0;

            if (typeOf _hydrant == "Land_A3PL_FireHydrant") then
            {
                _latestObject = _hydrant;
            };
        };

        if ((typeOf _attachedTo) IN ["A3PL_Pierce_Pumper","A3PL_Tanker_Trailer"]) exitwith
        {
            _latestObject = _attachedTo;
        };

        if ((typeOf _attachedTo) == "A3PL_FD_yAdapter") then
        {
            _otherEnd = (attachedTo _otherEnd) getVariable ["inlet",objNull];
            _m = false;
        };

        if ((typeOf _attachedTo) IN ["A3PL_FD_HoseEnd1","A3PL_FD_HoseEnd2"]) then
        {
            _otherEnd = _attachedTo;
        } else
        {
            if (_m) then
            {
                _otherEnd = objNull;
            };
        };
        _latestObject = _otherEnd;
    };

    player globalchat format ["Other End: %1",_latestObject];

    if (_getAdapter) exitwith
    {
        _source = _otherEnd; _source;
    };

    if (typeOf _latestObject in ["Land_A3PL_FireHydrant","A3PL_Pierce_Pumper","A3PL_Tanker_Trailer"]) then
    {
        _source = _latestObject;
    } else
    {
        _source = objNull;
    };

    _source

}, false] call Server_Setup_Compile;

['A3PL_FD_GasDeployHose', {

    private ["_adapter1","_adapter2","_rope"];
    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    if (Player_ItemClass != "FD_Hose") exitwith {["Você não está segurando uma mangueira",Color_Red] call A3PL_HUD_Notification;};
    _lengths = param [0,objNull];
    [player,objNull,Player_ItemClass] remoteExec ["Server_Inventory_Drop", 2];

    deleteVehicle Player_Item;
    Player_Item = objNull;
    Player_ItemClass = "";

    _adapter2 = createVehicle ["A3PL_GasHose",(player modelToWorld [0,5,0.5]), [], 0, "CAN_COLLIDE"];
    _adapter1 = createVehicle ["A3PL_FD_HoseEnd1",(player modelToWorld [0,0,0.5]), [], 0, "CAN_COLLIDE"];
    _adapter2 allowDamage false;
    _adapter1 allowDamage false;

    _rope = ropeCreate [_adapter1, [0,0.03,0.00], _adapter2, [0,0.14,0.00], 30];

}, false] call Server_Setup_Compile;

['A3PL_FD_GrabHose', {

    private ["_end","_hose","_otherEnd","_ropeLength","_attachedTo","_nozzleClass","_connectedMem"];
    _end = param [0,objNull];
    _nozzleClass = "A3PL_High_Pressure";

    if(!([] call Caue_Player_AntiSpam)) exitWith {};

    if (!isNull Player_Item) exitwith { _format = format["Você já está segurando um objeto"]; [_format, Color_Red] call A3PL_HUD_Notification; };
    if (!(typeOf _end IN ["A3PL_FD_HoseEnd1","A3PL_FD_HoseEnd2"])) exitwith {["Você não está interagindo com o adaptador typeOf correto (reporte isso)",Color_Red] call A3PL_HUD_Notification;};
    if (isPlayer (attachedTo _end)) exitwith {["Outro jogador está segurando essa mangueira, você não pode pegá-la",Color_Red] call A3PL_HUD_Notification;};

    _otherEnd = [_end] call A3PL_FD_FindOtherEnd;
    if (!local _end) exitwith
    {
        [_end,player] remoteExec ["A3PL_Lib_ChangeLocality", 2];["A mangueira não é sua - pedido enviado para mudar localidade - por favor, tente novamente",Color_yellow] call A3PL_HUD_Notification;
        if (!local _otherEnd && !isNull _otherend) then {[_otherEnd,player] remoteExec ["A3PL_Lib_ChangeLocality",2];};
    };

    if (isPlayer (attachedTo _otherEnd)) exitwith {["Outro jogador está segurando essa mangueira, você não pode pegá-la",Color_Red] call A3PL_HUD_Notification;};

    _attachedTo = attachedTo _end;
    if (typeOf _attachedTo == "A3PL_FD_yAdapter") then
    {
        if (_end == _attachedTo getVariable ["inlet",objNull]) then
        {
            _attachedTo setVariable ["inlet",objNull,true];
        };
    };

    _connectedMem = [_end,(attachedTo _end)] call A3PL_FD_FindAdapterCap;
    if (_connectedMem != "") then {(attachedTo _end) animate [_connectedMem,0]};

    _end attachTo [player,[0,0,0],"RightHand"];
    Player_Item = _end;

    _hose = [_end] call A3PL_FD_FindHose;
    _ropeLength = ropeLength _hose - 0.25;
    _ropeLength = _ropeLength - 2;

    player setvariable ["pressure","high",false];
    missionNamespace setVariable ["A3PL_FD_FiredCount",0];
    A3PL_FD_PlayerFiredIndex = player addEventHandler ["Fired",{[(param [0,objNull])] call A3PL_FD_WaterFiredEH;}];
    while {(attachedTo _end == player) && (!isNull _end)} do
    {
        if (!(vehicle player == player)) exitwith {detach _end};
        if ((_end distance _otherEnd) > _ropeLength) exitwith {detach _end; ["A mangueira caiu porque você não pode carregá-la além do comprimento!",Color_Red] call A3PL_HUD_Notification;};
        if (currentWeapon player == "A3PL_High_Pressure") then
        {
            private ["_hasMag","_shouldMag","_bullets","_shouldBullets","_source"];
            _hasMag = (handgunMagazine player) select 0;
            if (isNil "_hasMag") then {_hasMag = ""};

            switch (player getVariable ["pressure","high"]) do
            {
                case ("high"): {_shouldMag = "A3PL_High_Pressure_Water_Mag"};
                case ("medium"): {_shouldMag = "A3PL_Medium_Pressure_Water_Mag"};
                case ("low"): {_shouldMag = "A3PL_Low_Pressure_Water_Mag"};
            };

            if (_hasMag != _shouldMag) then
            {
                player addMagazine _shouldMag;
                player addWeapon _nozzleClass;
            };

            _source = [_end] call A3PL_FD_FindSource;
            _bullets = player ammo _nozzleClass;
            if (!isNull _source) then
            {
                if (typeOf _source == "A3PL_Pierce_Pumper") then
                {
                    _shouldBullets = [_source,[_end,true] call A3PL_FD_FindSource] call A3PL_FD_SourceAmount;
                } else
                {
                    _shouldBullets = [_source] call A3PL_FD_SourceAmount;
                };

                hintSilent format ["GALÕES DE ÁGUA À RESTANTES %1",_shouldBullets];
                if (((_bullets - _shouldBullets > 10) OR (_bullets - _shouldBullets < -10)) OR (_shouldBullets == 0 && _bullets != 0)) then
                {
                    player setAmmo [_nozzleClass,_shouldBullets];
                };
            } else
            {
                if (_bullets != 0) then
                {
                    player setAmmo [_nozzleClass,0];
                };
            };
        };
        sleep 0.1;
    };

    player removeEventHandler ["Fired",A3PL_FD_PlayerFiredIndex];
    A3PL_FD_PlayerFiredIndex = nil;
    player setAmmo [_nozzleClass,0];
    player setvariable ["pressure",nil,false];
    Player_Item = objNull;
    player globalChat "FD Hose Loop-Ended";

}, false] call Server_Setup_Compile;

['A3PL_FD_HandleFireAxe', {

    private ["_intersect","_nameintersect"];

    _intersect = missionNameSpace getVariable ["player_objintersect",objNull];
    _nameIntersect = missionNameSpace getVariable ["player_nameintersect",""];

    if ((player distance (_intersect modelToWorld (_intersect selectionPosition _nameIntersect)) < 2) && (_nameIntersect IN ["door_bankvault","door_1","door_2","door_3","door_4","door_5","door_6","door_7","door_8","door_9","door_10","door_11","door_12","door_13","door_14","door_15","door_16","door_17","door_18","door_19","door_20","door_21","door_22","door_23","door_24","door_25","door_26","door_27","door_28","door_29","door_30","door_31","door_32","door_33","door_34","door_35","door_36","door_37","door_38","door_39","door_40","door_41","door_42","door_43","door_44","door_45","door_46","door_47","door_48","door_49","door_50","storagedoor1","storagedoor2","storagedoor3","sdstoragedoor3","sdstoragedoor6","door_1_button","door_2_button","door_3_button","door_4_button","door_5_button","door_6_button","door_7_button","door_8_button","door_9_button","door_10_button","door_11_button","door_12_button","door_13_button","door_14_button","door_15_button","door_16_button","door_17_button","door_18_button","door_19_button","door_20_button","door_21_button","door_22_button","door_23_button","door_24_button","door_25_button","door_26_button","door_27_button","door_28_button","door_29_button","door_30_button","door_1_button2","door_2_button2","door_3_button2","door_4_button2","door_5_button2","door_6_button2","door_7_button2","door_8_button2","door_9_button2","door_10_button2","door_11_button2","door_12_button2","door_13_button2","door_14_button2","door_15_button2","door_16_button2","door_17_button2","door_18_button2","door_19_button2","door_20_button2","door_21_button2","door_22_button2","door_23_button2","door_24_button2","door_25_button2","door_26_button2","door_27_button2","door_28_button2","door_29_button2","door_30_button2","door_8_button1","door_8_button2"])) then
    {
        private ["_var"];
        if (_nameIntersect IN ["door_1_button","door_2_button","door_3_button","door_4_button","door_5_button","door_6_button","door_7_button","door_8_button","door_9_button","door_10_button","door_11_button","door_12_button","door_13_button","door_14_button","door_15_button","door_16_button","door_17_button","door_18_button","door_19_button","door_20_button","door_21_button","door_22_button","door_23_button","door_24_button","door_25_button","door_26_button","door_27_button","door_28_button","door_29_button","door_30_button","door_1_button2","door_2_button2","door_3_button2","door_4_button2","door_5_button2","door_6_button2","door_7_button2","door_8_button2","door_9_button2","door_10_button2","door_11_button2","door_12_button2","door_13_button2","door_14_button2","door_15_button2","door_16_button2","door_17_button2","door_18_button2","door_19_button2","door_20_button2","door_21_button2","door_22_button2","door_23_button2","door_24_button2","door_25_button2","door_26_button2","door_27_button2","door_28_button2","door_29_button2","door_30_button2","door_8_button1","door_8_button2"]) then {[] call Caue_Intersect_HandleDoors;};
        _var = format ["damage_%1",_nameintersect];
        if (((_intersect getVariable [_var,0]) + 0.2) > 1) exitwith
        {
            _intersect animate [_nameIntersect,1];
            _intersect setvariable [_var,0,false];
            if (_nameIntersect in ["storagedoor1","storagedoor2","storagedoor3"]) then {[] spawn {_intersect = cursorobject;_intersect animateSource ["storagedoor",1];sleep 60;_intersect animateSource ["storagedoor",0];};};
            if (_nameIntersect == "door_bankvault") then {[] spawn {_intersect = cursorobject;_intersect animateSource ["door_bankvault",1];sleep 20;_intersect animateSource ["door_bankvault",0];};};
            if (_nameIntersect == "sdstoragedoor3") then {[] spawn {_intersect = cursorobject;_intersect animateSource ["StorageDoor",1];sleep 60;_intersect animateSource ["StorageDoor",0];};};
            if (_nameIntersect == "sdstoragedoor6") then {[] spawn {_intersect = cursorobject;_intersect animateSource ["StorageDoor2",1];sleep 60;_intersect animateSource ["StorageDoor2",0];};};
        };
        _intersect setVariable [_var,(_intersect getVariable [_var,0]) + 0.2,false];
    };

}, false] call Server_Setup_Compile;

['A3PL_FD_HandleJaws', {

    private ["_intersect","_nameintersect"];

    _intersect = missionNameSpace getVariable ["player_objintersect",objNull];
    _nameIntersect = missionNameSpace getVariable ["player_nameintersect",""];

    if ((player distance (_intersect modelToWorld (_intersect selectionPosition _nameIntersect)) < 2) && (_nameIntersect IN ["glass2","door_lf","door_lf2","door_lf3","door_lf4","door_lf5","door_lf6"])) exitwith
    {
        if ((round random 10) > 6) then
            {
                ["Você tentou usar a jaws of life nesta porta, você foi bem sucedido e o motorista foi ejetado",Color_Green] call A3PL_HUD_Notification;
                moveOut (driver _intersect);
            } else
            {
                ["Você tentou usar a jaws of life nesta porta, a porta não abriu",Color_Red] call A3PL_HUD_Notification;
            };
    };


    if ((player distance (_intersect modelToWorld (_intersect selectionPosition _nameIntersect)) < 2) && (_nameIntersect IN ["glass3","glass4","glass5","door_lb","door_rb","door_rf","door_lb2","door_lb3","door_lb4","door_lb5","door_lb6","door_rb2","door_rb3","door_rb4","door_rb5","door_rb6","door_rf2","door_rf3","door_rf4","door_rf5","door_rf6"])) exitwith
    {
        if ((round random 10) > 6) then
        {
            ["Você tentou usar a jaws of life nesta porta, você foi bem sucedido e os passageiros foi ejetado",Color_Green] call A3PL_HUD_Notification;
            {
                moveOut _x;
            } foreach (crew _intersect);
        } else
        {
            ["Você tentou usar a jaws of life nesta porta, a porta não abriu",Color_Red] call A3PL_HUD_Notification;
        };
    };

    if ((player distance (_intersect modelToWorld (_intersect selectionPosition _nameIntersect)) < 10)) exitwith
    {
        if ((round random 10) > 6) then
        {
            ["Você tentou usar a jaws of life nesta porta, você foi bem sucedido e os passageiros foi ejetado",Color_Green] call A3PL_HUD_Notification;
            {
                moveOut _x;
            } foreach (crew _intersect);
        } else
        {
            ["Você tentou usar a jaws of life nesta porta, a porta não abriu",Color_Red] call A3PL_HUD_Notification;
        };
    };

}, false] call Server_Setup_Compile;

['A3PL_FD_LadderHeavyLoop', {

    private ["_veh","_sourceAmount","_inlet","_ammoWaterGun","_setZero","_otherEnd"];
    _veh = param [0,objNull];
    if (typeOf _veh != "A3PL_Pierce_Heavy_Ladder") exitwith {};

    if (missionNameSpace getVariable ["A3PL_FD_LadderHeavyLoopRunning",false]) exitwith {};
    A3PL_FD_LadderHeavyLoopRunning = true;

    missionNamespace setVariable ["A3PL_FD_FiredCount",0];
    _veh addEventHandler ["Fired",{[(param [0,objNull])] call A3PL_FD_WaterFiredEH;}];

    while {(player IN _veh) && (call A3PL_Lib_ReturnTurret == 1)} do
    {
        sleep 1;
        if ((!(player IN _veh)) OR (!(call A3PL_Lib_ReturnTurret == 1))) exitwith {};
        _inlet = [objNull,_veh,"inlet_r"] call A3PL_FD_FindAdapterCap;
        _setZero = false;
        _ammoWaterGun = player ammo "A3PL_High_Pressure";

        if ((!isNull _inlet) && (_veh animationPhase "FT_Pump_Switch" > 0.5)) then
        {
            _source = [_inlet] call A3PL_FD_FindSource;
            if (!isNull _source) then
            {
                _otherEnd = [_inlet,true] call A3PL_FD_FindSource;
                _sourceAmount = [_source,_otherEnd] call A3PL_FD_SourceAmount;
                hintSilent format ["GALÕES DE ÁGUA À RESTANTES %1",_sourceAmount];
                if (_sourceAmount != 0 && ((_ammoWaterGun - _sourceAmount > 10) OR (_ammoWaterGun - _sourceAmount < -10))) then
                {
                    _veh setVehicleAmmoDef (0.001 * _sourceAmount);
                } else
                {
                    if (_sourceAmount == 0) then {_setZero = true;};
                };
            } else
            {
                _setZero = true;
            };
        } else
        {
            _setZero = true;
        };

        if (_setZero && (_ammoWaterGun != 0)) then
        {
            _veh setVehicleAmmoDef 0;
        };
    };

    _veh removeAllEventHandlers "Fired";
    A3PL_FD_LadderHeavyLoopRunning = nil;

}, false] call Server_Setup_compile;

['A3PL_FD_MaskOff', {

    if (goggles player != "A3PL_FD_Mask") exitwith {["Você não está usando a máscara de oxigênio",Color_Red] call A3PL_HUD_Notification;};
    removegoggles player;

    ["fd_mask",1] call Caue_Inventory_Add;
    ["Você tirou sua máscara de oxigênio, agora está no seu inventário",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_compile;

['A3PL_FD_MaskOn', {

    private ["_mask"];
    _mask = missionNameSpace getVariable ["player_item",objNull];
    if (isNull _mask OR player_itemClass != "fd_mask") exitwith {["Você não está segurando uma máscara",Color_Red] call A3PL_HUD_Notification;};

    ["fd_mask",-1] call Caue_Inventory_Add;

    removegoggles player;
    _mask attachto [player,[-0.12,-0.15,-0.73],"RightHand"];
    player playaction "gesture_maskon";
    [_mask] spawn
    {
        disableSerialization;
        private ["_mask","_overlay","_currentOverlay"];
        _mask = param [0,objNull];

        sleep 2.5;
        deleteVehicle _mask;
        player_item = objNull; player_itemClass = "";
        player addgoggles "A3PL_FD_Mask";
        ["\A3PL_Common\HUD\mask\mask_normal.paa"] call A3PL_HUD_SetOverlay;

        player setvariable ["Overlay_Dirt",0,false];
        _overlay = "\A3PL_Common\HUD\mask\mask_normal.paa";
        _currentOverlay = "\A3PL_Common\HUD\mask\mask_normal.paa";
        while {goggles player == "A3PL_FD_Mask"} do
        {
            sleep 1;
            _dirtLevel = player getVariable ["Overlay_Dirt",0];
            if (_dirtLevel < 50) then {_overlay = "\A3PL_Common\HUD\mask\mask_normal.paa";};
            if (_dirtLevel >= 50) then { _overlay = "\A3PL_Common\HUD\mask\mask_dirt1.paa"; };
            if (_dirtLevel >= 100) then { _overlay = "\A3PL_Common\HUD\mask\mask_dirt2.paa"; };
            player setvariable ["Overlay_Dirt",_dirtLevel + 1,false];

            if (_currentOverlay != _overlay) then
            {
                _currentOverlay = _overlay;
                [_overlay] call A3PL_HUD_SetOverlay;
            };
        };
        [""] call A3PL_HUD_SetOverlay;
    };

}, false] call Server_Setup_compile;

['A3PL_FD_RollHose', {

    private ["_end","_hose","_ropes"];
    _end = param [0,objNull];

    if(!([] call Caue_Player_AntiSpam)) exitWith {};

    if (!(typeOf _end IN ["A3PL_FD_HoseEnd1","A3PL_FD_HoseEnd2","A3PL_GasHose"])) exitwith {["Você não está interagindo com o adaptador typeOf correto (reporte isso)",Color_Red] call A3PL_HUD_Notification;};

    _ropes = ropes _end;

    _hose = [_end] call A3PL_FD_FindHose;

    deleteVehicle (ropeAttachedTo _end);
    {
        deleteVehicle _x;
    } foreach (ropeAttachedObjects _end);

    deleteVehicle _end;

    ["fd_hose",1] call Caue_Inventory_Add;
    ["Você enrolou a mangueira, ela foi adicionada ao seu inventário",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_compile;

//TODO: Fix this pile of shit.
['A3PL_FD_SetLadderNumber', {

    private ["_veh"];
    _veh = _this select 0;
    _type_1 = _this select 1;
    _type_2 = _this select 2;

    _TruckNumber = {(typeOf _x == _type_1) OR (typeOf _x == _type_2)} count vehicles;
    _Number1 = 0;
    _Number2 = 0;
    _Number3 = _TruckNumber;
    while {_Number3 > 9} do {_Number3 = _Number3 - 10; _Number2 = _Number2 + 1; if (_Number2 > 9) then { _Number1 = _Number1 + 1; _Number2 = 0};};
    if (_Number1 < 1) then {_Number1 = 0;};
    if (_Number2 < 1) then {_Number2 = 0;};
    if (_Number3 < 1) then {_Number3 = 0;};
    _TruckNumber1 = format ["\A3PL_FD\textures\Truck_Numbers\%1.paa", _Number1];
    _TruckNumber2 = format ["\A3PL_FD\textures\Truck_Numbers\%1.paa", _Number2];
    _TruckNumber3 = format ["\A3PL_FD\textures\Truck_Numbers\%1.paa", _Number3];
    _veh setObjectTextureGlobal [8, _TruckNumber2 ];
    _veh setObjectTextureGlobal [9, _TruckNumber3 ];

}, false] call Server_Setup_compile;

['A3PL_FD_SetPumperNumber', {

    private ["_veh"];
    _veh = _this select 0;
    _type_1 = _this select 1;

    _TruckNumber = {(typeOf _x == _type_1)} count vehicles;
    _Number1 = 0;
    _Number2 = 0;
    _Number3 = _TruckNumber;
    while {_Number3 > 9} do {_Number3 = _Number3 - 10; _Number2 = _Number2 + 1; if (_Number2 > 9) then { _Number1 = _Number1 + 1; _Number2 = 0};};
    if (_Number1 < 1) then {_Number1 = 0;};
    if (_Number2 < 1) then {_Number2 = 0;};
    if (_Number3 < 1) then {_Number3 = 0;};
    _TruckNumber1 = format ["\A3PL_FD\textures\Truck_Numbers\%1.paa", _Number1];
    _TruckNumber2 = format ["\A3PL_FD\textures\Truck_Numbers\%1.paa", _Number2];
    _TruckNumber3 = format ["\A3PL_FD\textures\Truck_Numbers\%1.paa", _Number3];
    _veh setObjectTextureGlobal [8, _TruckNumber2 ];
    _veh setObjectTextureGlobal [9, _TruckNumber3 ];

}, false] call Server_Setup_compile;

['A3PL_FD_SourceAmount', {

    private ["_source","_amount","_line","_end"];
    _source = param [0,objNull];
    _end = param [1,objNull];
    _amount = 0;

    if (isNull _source) exitwith {_amount;};

    switch (typeOf _source) do
    {
        case ("Land_A3PL_FireHydrant"):
        {
            private ["_wrench"];

            _wrench = (nearestObjects [_source, ["A3PL_FD_HydrantWrench_F"], 1]) select 0;
            if (!isNil "_wrench") then
            {
                if (_wrench animationSourcePhase "WrenchRotation" > 0.5) then
                {
                    _amount = 1000;
                };
            };
        };

        case ("A3PL_Pierce_Pumper"):
        {
            if (_source animationPhase "ft_lever_7" < 0.5) exitwith {};
            _line = [_end,_source] call A3PL_FD_FindAdapterCap;
            if (_line == "outlet_ds_cap" && (_source animationPhase "ft_lever_10" > 0.5)) then
            {
                _amount = _source getVariable ["water",0];
            };
            if (_line == "outlet_ps_cap" && (_source animationPhase "ft_lever_1" > 0.5)) then
            {
                _amount = _source getVariable ["water",0];
            };
        };
    };

    _amount

}, false] call Server_Setup_compile;

['A3PL_FD_SwipeMask', {

    player playaction "gesture_headswipe";
    player setvariable ["Overlay_Dirt",0,false];

}, false] call Server_Setup_compile;

['A3PL_FD_WaterFiredEH', {

    private ["_inlet","_source","_veh","_water"];
    _veh = param [0,objNull];

    if ((_veh == player) && (currentWeapon player != "A3PL_High_Pressure")) exitwith {};

    if (typeOf _veh == "A3PL_Pierce_Heavy_Ladder") then
    {
        _inlet = [objNull,_veh,"inlet_r"] call A3PL_FD_FindAdapterCap;
    } else
    {
        _inlet = [] call A3PL_Lib_AttachedFirst;
    };

    if ((isNull _inlet) OR (!(typeOf _inlet IN ["A3PL_FD_HoseEnd1","A3PL_FD_HoseEnd2"]))) exitwith {};

    _source = [_inlet] call A3PL_FD_FindSource;
    if (typeOf _source != "A3PL_Pierce_Pumper") exitwith {};

    _firedCount = missionNamespace getVariable ["A3PL_FD_FiredCount",0];
    _firedCount = _firedCount + 1;
    if (_firedCount >= 10) then
    {
        _water = _source getVariable ["water",0];
        if (_water >= 5) then
        {
            _source setVariable ["water",_water - 10,true];
            _source animate ["Water_Gauge1",((_water - 10) / 500)];
        };
        _firedCount = 0;
    };
    missionNamespace setVariable ["A3PL_FD_FiredCount",_firedCount];

}, false] call Server_Setup_compile;

['A3PL_FD_WrenchRotate', {

    private ["_wrench"];
    _wrench = param [0,objNull];

    if (_wrench animationSourcePhase "WrenchRotation" < 0.5) then
    {
        _wrench animateSource ["WrenchRotation",1];
    } else
    {
        _wrench animateSource ["WrenchRotation",0];
    };

    call A3PL_FD_ConnectAnimation;

}, false] call Server_Setup_compile;
