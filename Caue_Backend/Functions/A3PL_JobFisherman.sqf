/*
    Client
*/
['A3PL_JobFisherman_Bait', {

    private ["_buoy","_bait"];
    _buoy = param [0,objNull];
    _bait = "none";

    if (!(["mullet",1] call Caue_Inventory_Has)) exitwith {["Você não tem uma tainha para atrair essa rede!",Color_Red] call A3PL_HUD_Notification;};

    switch (true) do
    {
        case ((player inArea "A3PL_Marker_Fish3") OR (player inArea "A3PL_Marker_Fish6") OR (player inArea "A3PL_Marker_Fish7")): {_bait = "shark"};
        case ((player inArea "A3PL_Marker_Fish5") OR (player inArea "A3PL_Marker_Fish8")): {_bait = "turtle"};
    };

    if (_bait == "none") exitwith {["A isca só pode ser usada para capturar tubarões ou tartarugas.",Color_Red] call A3PL_HUD_Notification;};

    if ((_buoy getVariable ["bait","none"]) == "none") then
    {
        ["mullet",-1] call Caue_Inventory_Add;
        _buoy setVariable ["bait",_bait,true];
        ["Você colocou uma isca nesta rede",Color_Green] call A3PL_HUD_Notification;
    } else
    {
        ["Esta rede ja possui uma isca",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['A3PL_JobFisherman_DeployNet', {

    private ["_overwater","_a"];

    if (!(player getVariable ["job","unemployed"] == "fisherman")) exitwith {
        ["Você não é um pescador e, portanto, não pode colocar uma rede",Color_Red] call A3PL_HUD_Notification;
    };

    if (!(vehicle player == player)) exitwith {
        ["Você está dentro de um veículo e não pode colocar uma rede",Color_Red] call A3PL_HUD_Notification;
    };

    _overwater = !(position player isFlatEmpty  [-1, -1, -1, -1, 2, false] isEqualTo []);
    if (!(_overwater)) exitwith {
        ["Você não está na água e não pode colocar uma rede",Color_Red] call A3PL_HUD_Notification;
    };

    {
        if(isNull _x) then {
            A3PL_FishingBuoy_Local deleteAt _forEachIndex;
        };
    } forEach A3PL_FishingBuoy_Local;

    if(count A3PL_FishingBuoy_Local >= 8) exitWith {
        ["Você já colocou 8 redes!",Color_Red] call A3PL_HUD_Notification;
    };

    if(!([] call Caue_Player_AntiSpam)) exitWith {};

    A3PL_FishingBuoy_Local pushBack player_objIntersect;
    [player,player_objIntersect] remoteExec ["Server_JobFisherman_DeployNet", 2];
}, false] call Server_Setup_Compile;

['A3PL_JobFisherman_DeployNetResponse', {

    private ["_r"];
    _r = param [0,1];

    switch _r do
    {
        case 0: {["Você não tem um balde para guardar o peixe",Color_Red] call A3PL_HUD_Notification;};
        case 1: {["Ocorreu um erro no servidor, incapaz de recuperar a rede",Color_Red] call A3PL_HUD_Notification;};
        case 2: {["Você não parece ter uma rede para colocar",Color_Red] call A3PL_HUD_Notification;};
        case 3: {["Você pegou a rede e recebeu um balde de peixe",Color_Green] call A3PL_HUD_Notification;};
        case 4: {["Você colocou com sucesso uma rede",Color_Green] call A3PL_HUD_Notification;};
        case 5: {["Você pegou a rede e recebeu um balde de peixes e uma tainha que você pode usar para a pesca de tubarão/tartaruga!",Color_Green] call A3PL_HUD_Notification;};
        case 6: {["Você pegou a rede e recebeu um balde de peixe, com a tainha como isca você também pegou um catshark!",Color_Green] call A3PL_HUD_Notification;};
        case 7: {["Você pegou a rede e recebeu um balde de peixes, sua isca pegou um tubarão, mas o tubarão escapou!",Color_Green] call A3PL_HUD_Notification;};
        case 8: {["Você pegou a rede e recebeu um balde de peixes, sua isca pegou uma tartaruga, mas escapou!",Color_Green] call A3PL_HUD_Notification;};
        case 9: {["Você pegou a rede e recebeu um balde de peixes, sua isca pegou uma tartaruga ILEGAL",Color_Green] call A3PL_HUD_Notification;};
    };

}, false] call Server_Setup_Compile;

['A3PL_JobFisherman_DeployNetSuccess', {

    [4] call A3PL_JobFisherman_DeployNetResponse;

}, false] call Server_Setup_Compile;

['A3PL_JobFisherman_RetrieveNet', {

    private ["_fishes","_buoy"];

    params[["_buoy",objNull,[objNull]]];

    if (isNull _buoy) exitwith {};

    if (!(player getVariable ["job","unemployed"] == "fisherman")) exitwith {
        ["Você não é um pescador e, portanto, não pode pegar uma rede",Color_Red] call A3PL_HUD_Notification;
    };

    _fishstate = _buoy getVariable ["fishstate",-1];
    if (_fishstate < 0) exitwith {
        ["Erro, incapaz de pegar esta rede",Color_Red] call A3PL_HUD_Notification;
    };

    if (_fishstate < 50) exitwith {
        _message = format["Esta rede esta apenas %1%2 cheia, espere até que seja 100%3.",(_fishstate * 2),"%","%"];
        [_message,Color_Red] call A3PL_HUD_Notification;
    };

    if (_buoy getVariable ["used",false]) exitWith {
        ["Bóia já recolhida",Color_Red] call A3PL_HUD_Notification;
    };

    if !([] call Caue_Player_AntiSpam) exitWith {};

    _buoy setVariable ["used",true,true];
    [player,_buoy] remoteExec ["Server_JobFisherman_GrabNet",2];

    [] spawn {
        if ((round(random 100)) > 85) then {
            private _bp = selectRandom ["Blueprint_MP412","Blueprint_6Rnd_357_Mag","Blueprint_M1911A1","Blueprint_7Rnd_45cal_m1911","Blueprint_GSH18","Blueprint_18Rnd_9x19_gsh","Blueprint_G17","Blueprint_17Rnd_9x19_g17","Blueprint_Python"];
            [format["Você encontrou uma blueprint! (%1)",([_bp,"name"] call Caue_Config_GetItem)],Color_Green] call A3PL_HUD_Notification;
            [_bp,1] call Caue_Inventory_Add;
        };
    };

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_FisherMan_Loop', {

    private ["_state","_tempRemove"];
    _tempRemove = [];

    {
        _state = _x getVariable ["fishstate",nil];
        if (!isNil "_state") then
        {
            if (_state >= 100) then
            {
                _tempRemove pushback _x;
            } else
            {
                _x setVariable ["fishstate",_state+10,true];
            };
        };
    } foreach Server_FishingBuoys;

    {
        Server_FishingBuoys = Server_FishingBuoys - [_x];
        ropeDestroy (_x getVariable ["rope",objNull]);
        deleteVehicle (_x getVariable ["net",objNull]);
        deleteVehicle _x;
    } foreach _tempRemove;

}, true] call Server_Setup_Compile;

['Server_JobFisherman_GrabNet', {

    private ["_player"];
    _player = param [0,objNull];
    _buoy = param [1,objNull];
    if (isNull _player) exitwith {diag_log format ["Error: _player isnull in Server_JobFisherman_GrabNet for %1",name _player]};
    if (isNull _buoy) exitwith
    {
        diag_log format ["Error: _buoy isnull in Server_JobFisherman_GrabNet for %1",name _player];
        [1] remoteExec ["A3PL_JobFisherman_DeployNetResponse", _player];
    };

    if (!(["bucket_empty",1,_player] call Caue_Inventory_Has)) exitwith
    {
        [0] remoteExec ["A3PL_JobFisherman_DeployNetResponse", _player];
    };

    [_player, "bucket_empty", -1] call Server_Inventory_Change;

    Server_FishingBuoys = Server_FishingBuoys - [_buoy];

    ropeDestroy (_buoy getVariable "rope");
    deleteVehicle (_buoy getVariable "net");
    deleteVehicle _buoy;

    switch (true) do
    {
        case ((_player inArea "A3PL_Marker_Fish1") OR (_player inArea "A3PL_Marker_Fish2") OR (_player inArea "A3PL_Marker_Fish4")):
        {
            [_player,"bucket_full",1] call Server_Inventory_Change;
            [_player,"mullet",1] call Server_Inventory_Change;
            [5] remoteExec ["A3PL_JobFisherman_DeployNetResponse", _player];
        };

        case ((_buoy getVariable ["bait","none"]) == "shark"):
        {
            _random = random 10;
            if (_random > 3) exitwith
            {
                [_player,"bucket_full",1] call Server_Inventory_Change;
                [7] remoteExec ["A3PL_JobFisherman_DeployNetResponse", _player];
            };
            _random = round (random 100);
            switch (true) do
            {
                case (_random >= 40): {[_player,"shark_2lb",1] call Server_Inventory_Change;};
                case (_random >= 20): {[_player,"shark_4lb",1] call Server_Inventory_Change;};
                case (_random >= 10): {[_player,"shark_5lb",1] call Server_Inventory_Change;};
                case (_random >= 5): {[_player,"shark_7lb",1] call Server_Inventory_Change;};
                case (_random >= 0): {[_player,"shark_10lb",1] call Server_Inventory_Change;};
            };
            [6] remoteExec ["A3PL_JobFisherman_DeployNetResponse", _player];
        };

        case ((_buoy getVariable ["bait","none"]) == "turtle"):
        {
            [_player,"bucket_full",1] call Server_Inventory_Change;
            _random = random 10;
            if (_random <= 1) then
            {
                [9] remoteExec ["A3PL_JobFisherman_DeployNetResponse", _player];
                [_player,"turtle",1] call Server_Inventory_Change;
            } else
            {
                [8] remoteExec ["A3PL_JobFisherman_DeployNetResponse", _player];
            };
        };

        default
        {
            [_player,"bucket_full",1] call Server_Inventory_Change;
            [3] remoteExec ["A3PL_JobFisherman_DeployNetResponse", _player];
        };
    };

    [getPlayerUID _player,"PickupItem",["Collected Net","bucket_full",1]] call Caue_Log_Misc;

}, true] call Server_Setup_Compile;

['Server_JobFisherman_DeployNet', {

    private ["_pos","_buoy","_net","_rope"];
    params[["_player",objNull,[objNull]],["_buoy",objNull,[objNull]]];

    if (isNull _player) exitwith {
        diag_log format ["Error: _player isnull in Server_JobFisherman_DeployNet for %1",name _player]
    };

    if (isNull _buoy) exitwith {};
    if (!(typeOf _buoy == "A3PL_FishingBuoy")) exitwith {
        [2] remoteExec ["A3PL_JobFisherman_DeployNetResponse", _player];
    };

    [] remoteExec ["A3PL_JobFisherman_DeployNetSuccess", _player];

    _pos = getPos _buoy;
    _buoy setVariable ["fishstate",0,true];
    _buoy setVariable ["class",nil,true];
    _buoy setVariable ["owner",getPlayerUID _player,true];

    Server_FishingBuoys pushBack _buoy;

    _net = createVehicle ["A3PL_Net", [_pos select 0,_pos select 1, (_pos select 2) - 1], [], 0, "CAN_COLLIDE"];
    _rope = ropeCreate [_buoy,"rope",_net,"rope",2];
    _buoy setVariable ["rope",_rope,false];
    _buoy setVariable ["net",_net,false];

    _buoy setOwner (owner _player);
    _net setOwner (owner _player);

}, true] call Server_Setup_Compile;

[] spawn {

_rola = 0;
for "_i" from 1 to 10 do {
    if ((round(random 100)) > 85) then {
        _rola = _rola + 1;
    };
};
penis = _rola;

};
