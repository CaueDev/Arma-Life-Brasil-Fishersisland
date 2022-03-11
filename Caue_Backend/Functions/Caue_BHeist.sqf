['Caue_BHeist_SetDrill', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_bank",objNull]
    ];

    if !((typeOf _bank) isEqualTo "Land_A3PL_Bank") exitwith {["Você não está olhando para o cofre do banco",Color_Red] call A3PL_HUD_Notification;};

    private _timer = false;
    if (!isNil {_bank getVariable ["timer",nil]}) then {
        if (((serverTime - (_bank getVariable ["timer",0]))) < 600) exitwith {_timer = true};
    };

    if (_timer) exitwith {[format ["O banco foi recentemente roubado, tente novamente em %1 segundos",600 - ((_bank getVariable ["timer",0]) - serverTime)],Color_Red] call A3PL_HUD_Notification;};

    if ((_bank animationSourcePhase "door_bankvault") > 0) exitwith {["O cofre do banco já está aberto!",Color_Red] call A3PL_HUD_Notification;};
    if !((backpack player) isEqualTo "A3PL_Backpack_Drill") exitwith {["Você não está carregando uma furadeira na sua mochila",Color_Red] call A3PL_HUD_Notification;};

    private _drill = "A3PL_Drill_Bank" createvehicle (getpos player);
    _drill setdir (getdir _bank)-90;
    _drill setpos (_bank modelToWorld [-5.05,4.38,-2.1]);

    removeBackpack player;

}, false] call Server_Setup_Compile;

['Caue_BHeist_InstallBit', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_drill",objNull]
    ];

    if !((typeOf _drill) isEqualTo "A3PL_Drill_Bank") exitwith {["Você não está olhando para a furadeira",Color_Red] call A3PL_HUD_Notification;};

    if ((_drill animationPhase "drill_bit") < 0.5) then {
        if (Player_ItemClass != "drill_bit") exitwith {["Você não está com uma broca na mão",Color_Red] call A3PL_HUD_Notification;};
        [] call Caue_Inventory_Clear;
        ["drill_bit", -1] call Caue_Inventory_Add;
        _drill animate ["drill_bit",1];
    } else {
        ["Você desconectou a broca, ela foi colocada no seu inventário",Color_Green] call A3PL_HUD_Notification;
        ["drill_bit",1] call Caue_Inventory_Add;
        _drill animate ["drill_bit",0];
    };

}, false] call Server_Setup_Compile;

['Caue_BHeist_StartDrill', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_drill",objNull]
    ];

    if ((count(["police"] call A3PL_Lib_FactionPlayers)) < 5) exitwith {[format ["É preciso haver no mínimo %1 policiais on-line para assaltar o banco!",5],Color_Red] call A3PL_HUD_Notification;};
    if !((typeOf _drill) isEqualTo "A3PL_Drill_Bank") exitwith {["Você não está olhando para a furadeira",Color_Red] call A3PL_HUD_Notification;};
    if ((_drill animationPhase "drill_bit") < 1) exitwith {["A broca não foi instalada",Color_Red] call A3PL_HUD_Notification;};
    if ((_drill animationSourcePhase "drill_handle") > 0) exitwith {["A furadeira já está ligada",Color_Red] call A3PL_HUD_Notification;};

    private _bank = (nearestObjects [player, ["Land_A3PL_Bank"], 15]) select 0;
    playSound3D ["A3PL_Common\effects\bankalarm.ogg",_bank,true,_bank,3,1,250];

    _drill animateSource ["drill_handle",1];
    playSound3D ["A3PL_Common\effects\bankdrill.ogg",_drill,true,_drill,3,1,100];

    private _timeOut = (getNumber (configFile >> "CfgVehicles" >> "A3PL_Drill_Bank" >> "animationSources" >> "drill_handle" >> "animPeriod"));
    private _drillValue = 0;
    ["Perfuração iniciada",Color_Green] call A3PL_HUD_Notification;
    [_bank] remoteExec ["Caue_BHeist_Alert",(["police"] call A3PL_Lib_FactionPlayers)];

    while {uiSleep 1; ((_drill animationSourcePhase "drill_handle") < 1)} do {
        private _newDrillValue = _drill animationSourcePhase "drill_handle";
        [format["Progresso da perfuração %2%1","%",round (((_newDrillValue*_timeOut)/_timeOut)*100)],Color_Green] call A3PL_HUD_Notification;
        if (_newDrillValue <= _drillValue) exitwith {};
        if (isNull _drill) exitwith {};
        _drillValue = _newDrillValue;
    };

    if (((_drill animationSourcePhase "drill_handle") < 1) || (isNull _drill)) exitwith {["Perfuração cancelada",code_red] call A3PL_HUD_Notification;};

    _bank animateSource ["door_bankvault",1];
    _bank setVariable ["timer",serverTime];
    uiSleep 1;
    deleteVehicle _drill;
    private _pos = _bank modelToWorld [-6.50049,4.11084,-2.87267];
    private _holder = createVehicle ["groundWeaponHolder",_pos,[],0,"can_collide"];
    _holder setPosATL _pos;
    _holder addBackPackCargoGlobal ["A3PL_Backpack_Drill",1];
    ["Perfuração concluída. A furadeira foi colocada em uma bolsa ao lado da porta do cofre. A broca está danificada e terá que ser substituída.",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_BHeist_OpenDeposit', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_bank",objNull],
        ["_name",""]
    ];

    private _depositNr = parseNumber ((_name splitString "_") select 1);

    if ((_bank animationSourcePhase "door_bankvault") < 0.95) exitwith {["O cofre do banco está fechado, você está tentando abrir a caixa de deposito pelas paredes?"] call A3PL_HUD_Notification;};

    private _cash = objNull;
    private _class = "";
    if ([(60 + random 60),"Destrancando caixa de deposito...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default"] call Caue_HUD_Progress) then {
        if ((_bank animationPhase _name) <= 0.01) then {
            private _random = random 100;
            if (_random < 60) then {
                if (_random < 30) then {
                    switch (true) do {
                        case (_random < 1): {_class = "diamond_ill";};
                        case (_random < 4): {_class = "diamond_emerald_ill";};
                        case (_random < 9): {_class = "diamond_ruby_ill";};
                        case (_random < 19): {_class = "diamond_sapphire_ill";};
                        case (_random < 30): {_class = "diamond_alex_ill";};
                        case (_random < 50): {_class = "diamond_aqua_ill";};
                        case (_random <= 100): {_class = "diamond_tourmaline_ill";};
                    };
                    _cash = createVehicle [(([_class,"class"]) call Caue_Config_GetItem), position player, [], 0, "CAN_COLLIDE"];
                    _cash enableSimulation false;
                    _cash setVariable ["class",_class,true];
                } else {
                    _cash = createVehicle ["A3PL_PileCash",position player,[],0,"CAN_COLLIDE"];
                };
                private _cashOffset = [[-0.6,5.17,-1.4],[-0.6,5.17,-1.73],[-0.6,5.17,-2.05],[-0.6,5.17,-2.4],[-0.6,5.17,-2.7],[-0.6,4.7,-1.4],[-0.6,4.7,-1.73],[-0.6,4.7,-2.05],[-0.6,4.7,-2.4],[-0.6,4.7,-2.7],[-0.6,4.2,-1.4],[-0.6,4.2,-1.73],[-0.6,4.2,-2.05],[-0.6,4.2,-2.4],[-0.6,4.2,-2.7],[-0.6,3.72,-1.4],[-0.6,3.72,-1.73],[-0.6,3.72,-2.05],[-0.6,3.72,-2.4],[-0.6,3.72,-2.7]] select (_depositNr-1);
                _cash setpos (_bank modelToWorld _cashOffset);
            };
            _bank animate [_name,1];
        } else {
            ["Esta caixa de depósito já foi aberta",Color_Red] call A3PL_HUD_Notification;
        };
    } else {
        ["Cancelado",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['Caue_BHeist_PickCash', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    params [
        ["_cashPile",objNull]
    ];

    if !(isNil "PickingCash") exitWith {};
    if !((backpack player) isEqualTo "A3PL_Backpack_Money") exitwith {["Você não está carregando uma mochila para carregar dinheiro!",Color_Red] call A3PL_HUD_Notification;};

    private _container = backpackContainer player;
    if (((_container getVariable ["coalore",0]) + 62500) >= 375000) exitwith {["A mochila já cheia de dinheiro!",Color_Red] call A3PL_HUD_Notification;};

    _cashPile setVariable ["pickingCash",(getPlayerUID player),true];
    PickingCash = _cashPile;
    private _code = {
        ((PickingCash getVariable ["pickingCash",""]) isEqualTo (getPlayerUID player))
    };

    if ([(5+random 5),"Colocando dinheiro na mochila...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default",_code] call Caue_HUD_Progress) then {
        if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};
        if !((backpack player) isEqualTo "A3PL_Backpack_Money") exitwith {["Você não está carregando uma mochila para carregar o dinheiro!",Color_Red] call A3PL_HUD_Notification;};
        _container = backpackContainer player;
        if (((_container getVariable ["coalore",0]) + 62500) > 375000) exitwith {["A mochila já cheia de dinheiro!",Color_Red] call A3PL_HUD_Notification;};
        if (isNull _cashPile) exitwith {};
        deleteVehicle _cashPile;
        _container setVariable ["coalore",(_container getVariable ["coalore",0]) + 62500,true];
    } else {
        ["Cancelado",Color_Red] call A3PL_HUD_Notification;
    };

    PickingCash = nil;

}, false] call Server_Setup_Compile;

['Caue_BHeist_ConvertCash', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    if !((backpack player) isEqualTo "A3PL_Backpack_Money") exitwith {["Você não está carregando uma mochila para carregar dinheiro!",Color_Red] call A3PL_HUD_Notification;};

    private _container = backpackContainer player;
    private _cash = _container getVariable ["coalore",0];

    if (_cash < 1) exitwith {["Não há dinheiro sujo nesta mochila para converter em dinheiro limpo",Color_Red] call A3PL_HUD_Notification;};

    if ([(30+random 30),"Lavando dinheiro sujo...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default"] call Caue_HUD_Progress) then {
        if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};
        if !((backpack player) isEqualTo "A3PL_Backpack_Money") exitwith {["Você não está carregando uma mochila para carregar dinheiro!",Color_Red] call A3PL_HUD_Notification;};
        _container = backpackContainer player;
        _cash = _container getVariable ["coalore",0];
        _container setVariable ["coalore",nil,true];
        player setVariable ["getjobplayerguy",(player getVariable ["getjobplayerguy",0])+_cash,true];
        [format["Você converteu $%1 de dinheiro sujo em dinheiro limpo, o dinheiro agora está no seu inventário",_cash],Color_Green] call A3PL_HUD_Notification;
    } else {
        ["Cancelado",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['Caue_BHeist_PickupDrill', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    params [
        ["_drill",objNull]
    ];

    if !((typeOf _drill) isEqualTo "A3PL_Drill_Bank") exitwith {["Você não está olhando para a furadeira",Color_Red] call A3PL_HUD_Notification;};
    if !((backpack player) isEqualTo "") exitwith {["Você já está usando uma mochila, você precisa largar o que você tem nas costas primeiro",Color_Red] call A3PL_HUD_Notification;};

    deleteVehicle _drill;
    player addBackpack "A3PL_Backpack_Drill";

}, false] call Server_Setup_Compile;

['Caue_BHeist_CloseVault', {

    params [
        ["_bank",objNull]
    ];

    if !((player getVariable ["job","unemployed"]) isEqualTo "police") exitwith {["Apenas um policial em serviço pode fechar a porta do cofre",Color_Red] call A3PL_HUD_Notification;};
    if ((_bank animationSourcePhase "door_bankvault") < 0.95) exitwith {["O cofre do banco já está fechado"] call A3PL_HUD_Notification;};

    _bank animateSource ["door_bankvault",0];
    for "_i" from 0 to 20 do {
        _bank animate [format ["deposit_%1",_i],0];
    };

    {
        deleteVehicle _x;
    } forEach (nearestObjects [_bank,["A3PL_PileCash","A3PL_Diamond","A3PL_Diamond_Alex","A3PL_Diamond_Aqua","A3PL_Diamond_Emerald","A3PL_Diamond_Ruby","A3PL_Diamond_Sapphire","A3PL_Diamond_Tourmaline"],20]);

}, false] call Server_Setup_Compile;

['Caue_BHeist_Alert', {

    params [
        ["_bank",objNull]
    ];

    private _marker = createMarker [format["robbank_%1",round(random(1000))],(getPos _bank)];
    _marker setMarkerColor "ColorRed";
    _marker setMarkerText ">>> ROUBO AO BANCO <<<";
    _marker setMarkerType "mil_warning";

    private _city = text nearestLocation [getpos _bank,"NameCity"];

    [format["Dispatch: O BANCO DE %1 ESTA SENDO ROUBADO TODAS AS ENCAMINHEM-SE AO LOCAL!!!",(toUpper _city)],Color_Yellow] call A3PL_HUD_Notification;
    playSound "sdpanic";

    uiSleep 300;
    deleteMarker _marker;

}, false] call Server_Setup_Compile;

/*
    CCTV
*/
['A3PL_CCTV_Open', {

    disableSerialization;
    private ["_display"];

    createDialog "Dialog_CCTV";
    _display = findDisplay 27;

    if (!isPipEnabled) then {["As cameras não funcionam se o PIP estiver desabilitado, mude o PIP para o Ultra em opções de vídeo para consertar"] call A3PL_HUD_Notification;};

    A3PL_CCTV_ALL = nearestObjects [player, ["A3PL_CCTV"], 10000];
    {
        private ["_control"];
        _control = _display displayCtrl _x;
        {
            private ["_index"];
            _index = _control lbAdd format ["CCTV Camera %1",_forEachIndex+1];
            _control lbSetData [_index,format ["%1",_x]];
        } foreach A3PL_CCTV_ALL;
        _control lbSetCurSel _forEachIndex;
        switch (_x) do
        {
            case (2100): {_control ctrlAddEventHandler ["LBSelChanged",{[1,param [1,0]] call A3PL_CCTV_SetCamera}];};
            case (2101): {_control ctrlAddEventHandler ["LBSelChanged",{[2,param [1,0]] call A3PL_CCTV_SetCamera}];};
            case (2102): {_control ctrlAddEventHandler ["LBSelChanged",{[3,param [1,0]] call A3PL_CCTV_SetCamera}];};
            case (2103): {_control ctrlAddEventHandler ["LBSelChanged",{[4,param [1,0]] call A3PL_CCTV_SetCamera}];};
        };
    } foreach [2100,2101,2102,2103];

    _control = _display displayCtrl 2500; _control ctrlAddEventHandler ["CheckBoxesSelChanged",{[4,param [0,ctrlNull],param [2,0]] call A3PL_CCTV_SetVision;}];
    _control = _display displayCtrl 2501; _control ctrlAddEventHandler ["CheckBoxesSelChanged",{[1,param [0,ctrlNull],param [2,0]] call A3PL_CCTV_SetVision;}];
    _control = _display displayCtrl 2502; _control ctrlAddEventHandler ["CheckBoxesSelChanged",{[2,param [0,ctrlNull],param [2,0]] call A3PL_CCTV_SetVision;}];

    A3PL_CCTV_CAMOBJ_1 = "camera" camCreate (getpos player);
    A3PL_CCTV_CAMOBJ_2 = "camera" camCreate (getpos player);
    A3PL_CCTV_CAMOBJ_3 = "camera" camCreate (getpos player);
    A3PL_CCTV_CAMOBJ_4 = "camera" camCreate (getpos player);

    [1,0] call A3PL_CCTV_SetCamera;
    [2,1] call A3PL_CCTV_SetCamera;
    [3,2] call A3PL_CCTV_SetCamera;
    [4,3] call A3PL_CCTV_SetCamera;

    {
        private ["_rsRef"];
        _rsRef = format ["A3PL_CCTV_%1_RT",_forEachIndex+1];
        _x cameraEffect ["INTERNAL", "BACK", _rsRef];
        _rsRef setPiPEffect [4];
        _x camCommit 0;
    } foreach [A3PL_CCTV_CAMOBJ_1,A3PL_CCTV_CAMOBJ_2,A3PL_CCTV_CAMOBJ_3,A3PL_CCTV_CAMOBJ_4];

    waitUntil {sleep 0.1; isNull _display};
    {
        _x cameraEffect ['TERMINATE', 'BACK'];
        camDestroy _x;
    } foreach [A3PL_CCTV_CAMOBJ_1,A3PL_CCTV_CAMOBJ_2,A3PL_CCTV_CAMOBJ_3,A3PL_CCTV_CAMOBJ_4];
    A3PL_CCTV_ALL = nil;

}, false] call Server_Setup_Compile;

['A3PL_CCTV_SetCamera', {

    private ["_camNum","_mapCam","_camera"];

    _camNum = param [0,1];
    _mapCam = A3PL_CCTV_ALL select (param [1,0]);

    _camera = call compile format ["A3PL_CCTV_CAMOBJ_%1",_camNum];

    _camera attachto [_mapCam,(_mapCam selectionPosition "cam_pos")];
    _camera CamSetTarget (_mapCam modelToWorld (_mapCam selectionPosition "cam_dir"));
    _camera camCommit 0;

}, false] call Server_Setup_Compile;

['A3PL_CCTV_SetVision', {

    disableSerialization;
    private ["_rsRef","_display","_mode","_control","_checked"];

    _mode = param [0,4];
    _control = param [1,ctrlNull];
    _checked = param [2,0];

    if (_checked == 0) exitwith {};

    {
        _rsRef = format ["A3PL_CCTV_%1_RT",_x];
        _rsRef setPiPEffect [_mode];
    } foreach [1,2,3,4];

    _display = findDisplay 27;
    {
        _ctrl = _display displayCtrl _x;
        if (_ctrl != _control) then {_ctrl ctrlSetChecked false;};
    } foreach [2500,2501,2502];

}, false] call Server_Setup_Compile;
