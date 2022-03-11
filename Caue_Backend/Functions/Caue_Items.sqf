['Caue_Items_Eat', {

    private _classname = Player_ItemClass;

    if (_classname isEqualTo "") exitwith {["Não é possível verificar a classe do item que você está tentando comer",Color_Red] call A3PL_HUD_Notification;};

    private _quality = [_classname, "quality"] call Caue_Config_GetFood;

    if (missionNamespace getVariable ["Player_isEating",false]) exitwith {["Você já está comendo alguma coisa",Color_Red] call A3PL_HUD_Notification;};
    if !([_classname,1] call Caue_Inventory_Has) exitwith {["Você tentou comer algo que você não tem?",Color_Red] call A3PL_HUD_Notification;};

    Player_isEating = true;

    closeDialog 0;

    player playActionNow "gesture_eat";

    [_classname, -1] call Caue_Inventory_Add;

    player setVariable ["Player_Hunger",((player getVariable ["Player_Hunger",100]) + _quality),true];
    [] call Caue_Lib_VerifyHunger;

    [format["Você comeu um(a) %1 e satisfez %2%3 da sua fome",[_classname,"name"] call Caue_Config_GetItem,_quality,"%"],Color_Green] call A3PL_HUD_Notification;

    private _hunger = player getVariable ["Player_Hunger",100];
    if (_hunger > 50) then {HungerWarning1 = Nil;};
    if (_hunger > 20) then {HungerWarning2 = Nil;};
    if (_hunger > 10) then {HungerWarning3 = Nil;};

    [] spawn {
        sleep 3;
        [false] call Caue_Inventory_PutBack;
        Player_isEating = Nil;
    };

}, false] call Server_Setup_Compile;

['Caue_Items_Drink', {

    private _classname = Player_ItemClass;

    if (_classname isEqualTo "") exitwith {["Não é possível verificar a classe do item que você está tentando beber",Color_Red] call A3PL_HUD_Notification;};

    private _quality = [_classname, "quality"] call Caue_Config_GetDrink;

    if (missionNamespace getVariable ["Player_isDrinking",false]) exitwith {["Você já está bebendo alguma coisa",Color_Red] call A3PL_HUD_Notification;};
    if !([_classname,1] call Caue_Inventory_Has) exitwith {["Você tentou beber algo que você não tem?",Color_Red] call A3PL_HUD_Notification;};

    Player_isDrinking = true;

    closeDialog 0;

    [_classname,-1] call Caue_Inventory_Add;

    player playAction "Gesture_drink";
    Player_Item attachTo [player, [-0.03,0,0.1], 'LeftHand'];
    sleep 3;
    Player_Item setVectorDirAndUp [[0,0,-1],[0,-1,0]];
    sleep 3;
    Player_Item setVectorDirAndUp [[0,1,0],[0,0,1]];
    sleep 4.5;

    [false] call Caue_Inventory_PutBack;

    player setVariable ["Player_Thirst",((player getVariable ["Player_Thirst",100]) + _quality),true];
    [] call Caue_Lib_VerifyThirst;

    [format["System: Você bebeu um(a) %1 e satisfez %2%3 da sua sede", [_classname, "name"] call Caue_Config_GetItem, _quality,"%"],Color_Green] call A3PL_HUD_Notification;

    private _thirst = player getVariable ["Player_Thirst",100];
    if (_thirst > 50) then { ThirstWarning1 = Nil; };
    if (_thirst > 20) then { ThirstWarning2 = Nil; };
    if (_thirst > 10) then { ThirstWarning3 = Nil; };

    Player_IsDrinking = nil;

}, false] call Server_Setup_Compile;

['Caue_Items_IgniteRocket', {

    params [
        ["_rocket",objNull]
    ];

    if (isNull _rocket) exitWith {};

    if ((isPlayer (attachedTo _rocket)) && (!((attachedTo _rocket) isKindOf "Car"))) exitwith {["Parece que este foguete está ligado a um jogador",Color_Red] call A3PL_HUD_Notification;};
    if (!local _rocket) exitwith {["Parece que este foguete não é seu, pegue e coloque novamente para consertar isso",Color_Red] call A3PL_HUD_Notification;};
    if ((_rocket animationSourcePhase "fuse") > 0) exitwith {};

    private _color = _rocket getVariable ["class","rocket_blue"];

    _rocket setVariable ["inUse",true,true];
    _rocket animateSource ["fuse",2];
    uiSleep 4;
    [_rocket,_color] remoteExec ["Caue_Items_RemoteRocket",-2];
    _rocket setVelocity [(-20 + (random 40)),(-20 + (random 40)),(50 + random 50)];
    uiSleep 3;
    deleteVehicle _rocket;

}, false] call Server_Setup_Compile;

['Caue_Items_RemoteRocket', {

    params [
        ["_rocket",objNull],
        ["_color","rocket_blue"]
    ];

    if (isNull _rocket) exitWith {};

    private _i = 0;
    private _pos = getPos _rocket;
    waitUntil {_i = _i + 1; if (_i > 100) exitwith {true}; if (!isNull _rocket) then {_pos = getpos _rocket;}; sleep 0.1; isNull _rocket};
    if (_i > 100) exitwith {};

    private _sparks = [];
    for "_ii" from 0 to 15 do {
        private _s = "#particlesource" createVehicleLocal _pos;
        _sparks pushback _s;
    };

    private _r = 0;
    private _g = 0;
    private _b = 1;
    switch (_color) do {
        case "rocket_blue": {_r = 0.02; _g = 0; _b =1};
        case "rocket_red": {_r = 1; _g = 0; _b = 0.02};
        case "rocket_green": {_r = 0.02; _g = 1; _b = 0};
        case "rocket_yellow": {_r = 0.95; _g = 0.95; _b = 0.05};
    };

    private _lP = "#lightpoint" createVehiclelocal _pos;
    _lP setLightBrightness 30;
    _lP setLightDayLight true;
    _lP setLightAmbient [_r,_g,_b];
    _lP setLightColor [_r,_g,_b];

    private _logic = "Logic" createVehiclelocal _pos;
    _logic say3D [(["firework1","firework2","firework3"] call BIS_fnc_selectRandom),1500,1];

    {
        private _vel = [(-10 + random 20),(-10 + random 20),(-10 + random 20)];
        _x setParticleCircle [0, [0, 0, 30]];
        _x setParticleRandom [0.5, [0, 0, 0], [0, 0, 0], 0, 0.5, [_r,_g,_b, 1], 1, 0];
        _x setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], _vel, 0, 70, 0, 0, [0.5,1], [[_r,_g,_b, 1],[_r,_g,_b, 0.5]], [0.08], 1, 0, "", "",_x];
        _x setDropInterval 0.01;
    } forEach _sparks;

    uisleep 1;

    private _pS = "#particlesource" createVehicleLocal [(_pos select 0),(_pos select 1),((_pos select 2) + random 10)];
    private _xx = [-7,7] call BIS_fnc_selectRandom;
    private _yy = [-5,7] call BIS_fnc_selectRandom;
    private _zz = [-8,5] call BIS_fnc_selectRandom;
    _pS setParticleCircle [0, [_xx, _yy, _zz]];
    _pS setParticleRandom [0, [0, 0, 0], [_xx, _yy, _zz], 0, 0.5, [_r,_g,_b, 1], 1, 0];
    _pS setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 1.5, [0, 0, 0], [_xx, _yy, _zz], 0, 50, 0, 0, [0.5,1], [[_r, _g,_b, 1],[_r, _g, _b, 0.5]], [0.08], 1, 0, "", "",_pS];
    _pS setDropInterval 0.0005;

    uiSleep 1;

    deleteVehicle _pS;
    {deleteVehicle _x;} forEach _sparks;
    uiSleep 3;
    deleteVehicle _lP;
    deleteVehicle _logic;

}, false] call Server_Setup_Compile;

['Caue_Items_GrabPopcorn', {

    if (["popcornbucket",1] call Caue_Inventory_Has) then {
        ["Você já tem um balde de pipoca",Color_Red] call A3PL_HUD_Notification;
    } else {
        [player,"popcornbucket",1] remoteExec ["Server_Inventory_Change", 2];
        ["Solicitação enviada para obter pipoca, ela deve aparecer no seu inventário",Color_Green] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['Caue_Items_ThrowPopcornClient', {

    if !(player_itemclass == "popcornbucket") exitwith {["Você não tem um balde de pipoca",Color_Red] call A3PL_HUD_Notification;};

    private _remoteExecuteList = [];
    {
        if (player distance _x < 5) then {_remoteExecuteList pushback _x;};
    } foreach allPlayers;

    [player] remoteExec ["Caue_Items_ThrowPopcorn",_remoteExecuteList];
    player playaction "Gesture_throw";

}, false] call Server_Setup_Compile;

['Caue_Items_ThrowPopcorn', {

    if (isDedicated) exitwith {};

    params [
        ["_player",objNull]
    ];

    if ((isNull _player) || (!isPlayer _player)) exitwith {};

    private _popcorn = [];
    for "_i" from 0 to 15 do {
        private _v = "A3PL_Popcorn" createVehicleLocal (getPos _player);
        _v attachTo [_player,[0,0,0],"RightHand"];
        _popcorn pushback _v;
    };

    private _playerVelocity = velocity _player;
    private _playerDir = eyeDirection _player;
    private _playerDir = (_playerDir select 0) atan2 (_playerDir select 1);
    {
        private _dir = (_playerDir-20) + random 40;
        detach _x;
        _x setVelocity [((_playerVelocity select 0) + (sin _dir * 5)), ((_playerVelocity select 1) + (cos _dir * 5)), ((_playerVelocity select 2) + (2+random 3))];
    } forEach _popcorn;

    uiSleep 5;

    {deleteVehicle _x;} foreach _popcorn;

}, false] call Server_Setup_Compile;
