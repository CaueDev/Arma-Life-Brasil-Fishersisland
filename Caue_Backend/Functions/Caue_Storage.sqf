/*
    Client
*/
['Caue_Storage_Open', {

    if (player_objintersect getVariable ["inUse",false]) exitWith {["Esta garagem está em uso!",Color_Red] call A3PL_HUD_Notification;};

    disableSerialization;
    closeDialog 0;
    createDialog "Caue_Storage";

    private _display = findDisplay 98123;
    private _ctrlFilter = _display displayCtrl 25;
    private _ctrlList = _display displayCtrl 26;
    private _ctrlGroupFooter = _display displayCtrl 27;
    private _ctrlButtonRetrieve = _ctrlGroupFooter controlsGroupCtrl 1;
    _ctrlButtonRetrieve ctrlAddEventHandler ["ButtonClick", {[] call Caue_Storage_Retrieve}];
    [_ctrlFilter,_ctrlList] call BIS_fnc_initListNBoxSorting;

    private _type = player_objintersect getVariable ["type","car"];

    if !(player_objintersect IN A3PL_Jobroadworker_Impounds) then {
        player_objintersect setVariable ["inUse",true,true];
    };

    [] spawn {
        private _garage = player_objintersect;
        waitUntil {sleep 0.1; isNull findDisplay 98123};
        sleep 2;
        _garage setVariable ["inUse",false,true];
    };

    if (player_objintersect IN A3PL_Jobroadworker_Impounds) then {
        [player,true,"kappa"] remoteExec ["Server_Storage_ReturnVehicles",2];
    } else {
        [player,false,_type] remoteExec ["Server_Storage_ReturnVehicles",2];
    };

}, false] call Server_Setup_Compile;

['Caue_Storage_Receive', {

    disableSerialization;
    params [
        ["_vehicles",[]]
    ];

    if ((count _vehicles) isEqualTo 0) exitWith {};

    private _display = findDisplay 98123;
    private _ctrlList = _display displayCtrl 26;

    {
        _x params [
            ["_plate",""],
            ["_class",""]
        ];

        private _name = getText(configFile >> "CfgVehicles" >> _class >> "displayName");

        private _index = _ctrlList lnbAddRow [_name];
        _ctrlList lnbSetData [[_index, 0],(str _x)];
    } forEach _vehicles;
    _ctrlList lnbSetCurSelRow 0

}, false] call Server_Setup_Compile;

['Caue_Storage_Retrieve', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    disableSerialization;
    private _display = findDisplay 98123;
    private _ctrlList = _display displayCtrl 26;

    private _intersect = cursorObject;
    if (isNull _intersect) exitwith {closeDialog 0;["Você não está olhando para uma garagem", Color_Red] call A3PL_HUD_Notification;};
    if (_intersect animationPhase "StorageDoor1" > 0.1) exitwith {closeDialog 0; ["Parece que essa garagem está em uso", Color_Red] call A3PL_HUD_Notification;};

    private _selRow = lnbCurSelRow _ctrlList;
    if (_selRow isEqualTo -1) exitWith {["Você não selecionou nada", Color_Red] call A3PL_HUD_Notification;};

    private _data = _ctrlList lnbData [_selRow,0];
    _data = parseSimpleArray _data;

    private _plate = _data select 0;
    private _class = _data select 1;

    private _spawnPos = _intersect getVariable ["positionSpawn",nil];

    if ((_intersect isKindOf "Land_Home1g_DED_Home1g_01_F") || ((typeOf _intersect) IN ["Land_A3PL_Ranch1","Land_A3PL_Ranch2","Land_A3PL_Ranch3","Land_A3PL_Sheriffpd"])) then {
        private _dir = getDir _intersect;
        switch (typeOf _intersect) do {
            case ("Land_Home1g_DED_Home1g_01_F"): {_spawnPos = _intersect modelToWorld [4.2,1.5,-3.2];_spawnPos = [_spawnPos select 0,_spawnPos select 1,_spawnPos select 2,_dir];};
            case ("Land_Home2b_DED_Home2b_01_F"): {_spawnPos = _intersect modelToWorld [-4.42236,-1.39868,-3.26778];_spawnPos = [_spawnPos select 0,_spawnPos select 1,_spawnPos select 2,_dir];};
            case ("Land_Home3r_DED_Home3r_01_F"): {_spawnPos = _intersect modelToWorld [-3,-1,-4];_spawnPos = [_spawnPos select 0,_spawnPos select 1,_spawnPos select 2,_dir];};
            case ("Land_Home4w_DED_Home4w_01_F"): {_spawnPos = _intersect modelToWorld [4.3,-1,-3];_spawnPos = [_spawnPos select 0,_spawnPos select 1,_spawnPos select 2,_dir];};
            case ("Land_Home5y_DED_Home5y_01_F"): {_spawnPos = _intersect modelToWorld [4.3,-1,-3];_spawnPos = [_spawnPos select 0,_spawnPos select 1,_spawnPos select 2,_dir];};
            case ("Land_Home6b_DED_Home6b_01_F"): {_spawnPos = _intersect modelToWorld [3,-1,-4];_spawnPos = [_spawnPos select 0,_spawnPos select 1,_spawnPos select 2,_dir];};
            case ("Land_A3PL_Ranch1"): {_spawnPos = _intersect modelToWorld [1,6.5,-2]; _dir = _dir - 90;_spawnPos = [_spawnPos select 0,_spawnPos select 1,_spawnPos select 2,_dir];};
            case ("Land_A3PL_Ranch2"): {_spawnPos = _intersect modelToWorld [1,6.5,-2]; _dir = _dir - 90;_spawnPos = [_spawnPos select 0,_spawnPos select 1,_spawnPos select 2,_dir];};
            case ("Land_A3PL_Ranch3"): {_spawnPos = _intersect modelToWorld [1,6.5,-2]; _dir = _dir - 90;_spawnPos = [_spawnPos select 0,_spawnPos select 1,_spawnPos select 2,_dir];};
            case ("Land_A3PL_Sheriffpd"): {
                if (player_NameIntersect == "sdstoragedoor3") then {_pos = _intersect selectionPosition "SDStorageDoor_pos";_spawnPos = _intersect modelToWorld _pos;_intersect animateSource ["StorageDoor",1];};
                if (player_NameIntersect == "sdstoragedoor6") then {_pos = _intersect selectionPosition "SDStorageDoor2_pos";_spawnPos = _intersect modelToWorld _pos;_intersect animateSource ["StorageDoor2",1];};
                _spawnPos = ASLToATL _spawnPos;
                _dir = _dir + 90;
                _spawnPos = [(_spawnPos select 0) + 1,(_spawnPos select 1) + 0.5,((_spawnPos select 2)-5),_dir];;
            };
            default {_spawnPos = [_spawnPos select 0,_spawnPos select 1,_spawnPos select 2,_dir];};
        };
    };

    if !(isNil "_spawnPos") then {
        private _type = _intersect getVariable ["type","car"];
        if (_type isEqualTo "plane") then {
            private _hangar = getMarkerPos "hangar4";
            private _near = nearestObjects [_hangar,["car","plane"],10];

            if ((count _near) isEqualTo 0) exitwith {
                [_class,player,_plate,[_hangar select 0,_hangar select 1,2,154]] remoteExec ["Server_Storage_Retrieve",2];
                ["Sua aeronave vai spawnar no hangar 4",Color_Green] call A3PL_HUD_Notification;
            };
            private _hangar = getMarkerPos "hangar3";
            private _near = nearestObjects [_hangar,["car","plane"],10];
            if ((count _near) isEqualTo 0) exitwith {
                [_class,player,_plate,[_hangar select 0,_hangar select 1,2,154]] remoteExec ["Server_Storage_Retrieve", 2];
                ["Sua aeronave vai spawnar no hangar 3",Color_Green] call A3PL_HUD_Notification;
            };
            private _hangar = getMarkerPos "hangar2";
            private _near = nearestObjects [_hangar,["car","plane"],10];
            if ((count _near) isEqualTo 0) exitwith {
                [_class,player,_plate,[_hangar select 0,_hangar select 1,2,154]] remoteExec ["Server_Storage_Retrieve", 2];
                ["Sua aeronave vai spawnar no hangar 2",Color_Green] call A3PL_HUD_Notification;
            };
            private _hangar = getMarkerPos "hangar1";
            private _near = nearestObjects [_hangar,["car","plane"],10];
            if ((count _near) isEqualTo 0) exitwith {
                [_class,player,_plate,[_hangar select 0,_hangar select 1,2,154]] remoteExec ["Server_Storage_Retrieve", 2];
                ["Sua aeronave vai spawnar no hangar 1",Color_Green] call A3PL_HUD_Notification;
            };
            ["Não é possível spawnar seu avião: todos os hangares estão bloqueados",Color_Red] call A3PL_HUD_Notification;
        } else {
            if ((typeOf _intersect == "A3PL_CarInfo") && ((vehicleVarName _intersect) IN ["Shop_ImpoundRetrieve1","Shop_ImpoundRetrieve2","Shop_ImpoundRetrieve3","Shop_ImpoundRetrieve4"])) then {
                if (2000 > (player getVariable ["getjobplayerguy",0])) then {
                    if (2000 > (player getVariable ["getrankplayerguy",0])) exitwith{["Você não tem dinheiro suficiente para pagar a taxa de retirada de $2.000",Color_Red] call A3PL_HUD_Notification;};
                    player setVariable ["getrankplayerguy",((player getVariable ["getrankplayerguy",0]) - 2000),true];
                    ["Foi cobrado uma taxa de $2.000",Color_Red] call A3PL_HUD_Notification;
                } else {
                    player setVariable ["getjobplayerguy",((player getVariable ["getjobplayerguy",0]) - 2000),true];
                    ["Foi cobrado uma taxa de $2.000",Color_Red] call A3PL_HUD_Notification;
                };
            };
            [_class,player,_plate,_spawnPos] remoteExec ["Server_Storage_Retrieve",2];
        };
    } else {
        [_class,player,_plate,_intersect] remoteExec ["Server_Storage_Retrieve",2];
    };

    closeDialog 0;
    ["Solicitação enviada ao servidor para retirar seu veículo. Por favor, espere.", Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Storage_Store', {

    params [
        ["_type","car"]
    ];

    private _intersect = player_objIntersect;

    if (isNull _intersect) exitwith {};

    private _types = switch (_type) do {
        case ("plane"): {["Plane","Helicopter"];};
        case ("car"): {["Car","Ship"];};
    };

    private _near = nearestObjects [_intersect,_types,15];
    if ((count _near) isEqualTo 0) exitwith {["Nenhum veículo por perto",Color_Red] call A3PL_HUD_Notification;};

    ["Solicitação enviada ao servidor para guardar seu veículo mais próximo",Color_Green] call A3PL_HUD_Notification;

    if ((typeOf _intersect) IN ["Land_A3PL_storage"]) then {
        [player,_intersect] remoteExec ["Server_Storage_Store",2];
    } else {
        [player,_intersect] remoteExec ["Server_Storage_StorePos",2];
    };

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Storage_ReturnVehicles', {

    params [
        ["_player",objNull],
        ["_impound",false],
        ["_type",""]
    ];

    if ((isNull _player) || (_type isEqualTo "")) exitWith {};

    private _uid = getPlayerUID _player;

    private _vehicles = "";
    if (_impound) then {
        _vehicles = [format["Storage_ReturnVehicles2:%1",_uid],2,true] call Server_Database_Async;
    } else {
        _vehicles = [format["Storage_ReturnVehicles1:%1:%2",_uid,_type],2,true] call Server_Database_Async;
    };

    private _return = [];
    {
        _return pushback [(_x select 0),(_x select 1)];
    } forEach _vehicles;

    [_return] remoteExec ["Caue_Storage_Receive",_player];

}, true] call Server_Setup_Compile;

['Server_Storage_Retrieve', {

    params [
        ["_class",""],
        ["_player",objNull],
        ["_plate",""],
        "_storage"
    ];

    if (_storage isEqualType []) exitwith {[_class,_player,_plate,_storage] call Server_Storage_RetrievePos;};
    if (_storage animationPhase "StorageDoor1" > 0.1) exitwith {["Solicitação de retirada negada: garagem em uso",Color_Red] remoteExec ["A3PL_HUD_Notification",_player];};

    private _db = [format["Storage_RetrieveSelect:%1",_plate],2,false] call Server_Database_Async;
    [format["Storage_RetrieveUpdate:%1",_plate],1] spawn Server_Database_Async;

    ["Tentando spawnar seu veículo, você tem 30 segundos para retirar o veículo",Color_Green] remoteExec ["A3PL_HUD_Notification",_player];

    private _veh = [_class,_storage,_plate,_player] call Server_Vehicle_Spawn;
    _veh setDir (getDir _storage);

    if !((count _db) isEqualTo 0) then {
        _veh setFuel (_db select 0);
        private _texture = [(_db select 1), "\\", "\"] call CBA_fnc_replace;
        _veh setObjectTextureGlobal [0, _texture];
        _anims = [(_db select 2)] call Server_Database_ToArray;
        [_veh,nil,_anims] call BIS_fnc_initVehicle;
    };

    if ((typeOf _veh) IN ["A3PL_MiniExcavator","A3PL_Car_Trailer","A3PL_Tanker_Trailer","A3PL_Lowloader","A3PL_Boat_Trailer","A3PL_Box_Trailer","A3PL_Small_Boat_Trailer","A3PL_Drill_Trailer"]) then {
        _veh allowDamage false;
    };

    _storage animateSource ["storagedoor",1];
    [_player,_storage,_veh,_plate] spawn {
        params [
            ["_player",objNull],
            ["_storage",objNull],
            ["_veh",objNull],
            ["_plate",""]
        ];

        private _t = 0;
        while {(_veh distance _storage) < 8} do {
            uiSleep 1;
            _t = _t + 1;
            if (isNull _veh) exitwith {};
            if (_t > 119) exitwith {
                ["O seu veículo não foi retirado da garagem, e foi guardado de volta",Color_Red] remoteExec ["A3PL_HUD_Notification",_player];
                [format["Storage_RetriveFail:%1",_plate],1] spawn Server_Database_Async;
                [_veh] call Server_Vehicle_Despawn;
            };
        };
        _storage animateSource ["storagedoor",0];
    };

}, true] call Server_Setup_Compile;

['Server_Storage_RetrievePos', {

    params [
        ["_class",""],
        ["_player",objNull],
        ["_plate",""],
        ["_pos",[]]
    ];

    private _dir = 0;
    if ((count _storage) > 3) then {
        _dir = _storage select 3;
        _pos = [_storage select 0,_storage select 1,_storage select 2];
    };

    private _db = [format["Storage_RetrieveSelect:%1",_plate],2,false] call Server_Database_Async;
    [format["Storage_RetrieveUpdate:%1",_plate],1] spawn Server_Database_Async;

    private _veh = [_class,_pos,_plate,_player] call Server_Vehicle_Spawn;
    [_veh] spawn {
        (_this select 0) allowDamage false;
        uiSleep 05;
        (_this select 0) allowDamage true;
    };

    if (_veh isKindOf "Ship") then {
        _veh setPos _pos;
    } else {
        _veh setPosATL _pos;
    };

    if !(isNil "_dir") then {
        _veh setDir _dir;
    };

    if (_veh isKindOf "helicopter") then {
        _veh setOwner (owner _player);
    };

    private _storageclass = nearestObject [_pos,"Land_A3PL_Sheriffpd"];
    if ((typeOf _storageclass) isEqualTo "Land_A3PL_Sheriffpd") then {
        [_player,_storageclass,_veh,_plate] spawn {
            params [
                ["_player",objNull],
                ["_storage",objNull],
                ["_veh",objNull],
                ["_plate",""]
            ];

            private _t = 0;
            while {(_veh distance _storage) < 8} do {
                uiSleep 1;
                _t = _t + 1;
                if (isNull _veh) exitwith {};
                if (_t > 119) exitwith {
                    [format["Storage_RetriveFail:%1",_id],1] spawn Server_Database_Async;
                    [_veh] call Server_Vehicle_Despawn;
                    ["O seu veículo não foi retirado da garagem, e foi guardado de volta",Color_Red] remoteExec ["A3PL_HUD_Notification",_player];
                };
            };
            if (_storage animationSourcePhase "StorageDoor" > 0.5) then {_storage animateSource ["storagedoor",0];};
            if (_storage animationSourcePhase "StorageDoor2" > 0.5) then {_storage animateSource ["StorageDoor2",0];};
        };
    };

    if !((count _db) isEqualTo 0) then {
        _veh setFuel (_db select 0);
        private _texture = [(_db select 1), "\\", "\"] call CBA_fnc_replace;
        _veh setObjectTextureGlobal [0,_texture];
    };

    ["Seu veiculo foi retirado",Color_Green] remoteExec ["A3PL_HUD_Notification",_player];

}, true] call Server_Setup_Compile;

['Server_Storage_Store', {

    params [
        ["_player",objNull],
        ["_storage",objNull]
    ];

    if (isNull _player) exitWith {};

    private _uid = getPlayerUID _player;

    if (_storage animationPhase "StorageDoor1" > 0.1) exitwith {["Garagem ja esta em uso",Color_Red] remoteExec ["Caue_HUD_Notification",_player];};

    private _near = nearestObjects [_storage,["Car","Ship"],9];
    if ((count _near) isEqualTo 0) exitwith {["Nenhum veículo por perto",Color_Red] remoteExec ["Caue_HUD_Notification",_player];};

    private _playerCar = objNull;
    {
        private _var = _x getVariable "owner";
        if (!isNil "_var") then {
            if ((_var select 0) isEqualTo _uid) exitwith {_playerCar = _x;};
        };
    } forEach _near;

    if (isNull _playerCar) exitwith {["Parece que nenhum dos carros próximos pertence a você",Color_Red] remoteExec ["Caue_HUD_Notification",_player];};

    _storage animateSource ["storagedoor",1];

    ["O servidor tentará guardar seu veículo em 2 minutos, por favor, dirija o carro para dentro e saia do veiculo",Color_Green] remoteExec ["Caue_HUD_Notification",_player];

    [_playerCar, _storage, _player] spawn {
        params [
            ["_playerCar",objNull],
            ["_storage",objNull],
            ["_player",objNull]
        ];

        private _t = 0;
        private _fail = false;

        while {(_playerCar distance _storage > 3) || ((_player IN _playerCar) || ((_player distance _storage) < 4.8))} do {
            _t = _t + 1;
            uiSleep 1;
            if (isNull _playerCar) exitwith {_fail = true; ["O veículo já foi guardado?",Color_Red] remoteExec ["Caue_HUD_Notification",_player];};
            if (_t > 119) exitwith {_fail = true; ["Tempo para guardar o veículo excedeu o limite",Color_Red] remoteExec ["Caue_HUD_Notification",_player];};
        };

        if (!_fail) then {["Garagem fechando, seu carro sera guardado quando fechar",Color_Red] remoteExec ["Caue_HUD_Notification",_player];};

        _storage animateSource ["storagedoor",0];
        uiSleep 10;

        if (!_fail) then {
            private _var = _playerCar getVariable "owner";
            private _id = _var select 1;
            private _Path = (getObjectTextures _playerCar) select 0;
            private _Pathformat = format ["%1",_Path];
            private _Texture = [_Pathformat, "\", "\\"] call CBA_fnc_replace;
            private _animMods = ([_playerCar] call BIS_fnc_getVehicleCustomization) select 1;
            private _modsFormat = [_animMods] call Server_Database_Array;
            [format["Storage_Store:%2:%3:%4:%1",_id,(fuel _playerCar),_Texture,_modsFormat],1] spawn Server_Database_Async;
            [_playercar] call Server_Vehicle_Despawn;
        };
    };

}, true] call Server_Setup_Compile;

['Server_Storage_StorePos', {

    params [
        ["_player",objNull],
        ["_storage",objNull]
    ];

    if (isNull _player) exitWith {};

    private _uid = getPlayerUID _player;

    private _near = [];
    private _type = _storage getVariable ["type","car"];
    if (_type IN ["truck","car"]) then {_near = nearestObjects [_player,["LandVehicle"],15];};
    if (_type isEqualTo "boat") then {_near = nearestObjects [_player,["Ship"],30];};
    if (_storage IN [AircraftStore1,AircraftStore2]) then {_near = nearestObjects [_player,["Plane","Helicopter"],40];};

    if ((count _near) isEqualTo 0) exitwith {["Nenhum veículo por perto",Color_Red] remoteExec ["Caue_HUD_Notification",_player];};

    private _playerCar = objNull;
    {
        private _var = _x getVariable ["owner",nil];
        if (!isNil "_var") then {
            if ((_var select 0) isEqualTo _uid) exitwith {_playerCar = _x;};
        };
    } forEach _near;

    if (isNull _playerCar) exitwith {["Parece que nenhum dos carros próximos pertence a você",Color_Red] remoteExec ["Caue_HUD_Notification",_player];};

    [_playerCar,_storage,_player] spawn {
        params [
            ["_playerCar",objNull],
            ["_storage",objNull],
            ["_player",objNull]
        ];

        private _t = 0;
        private _fail = false;

        while {(_playerCar distance _player > 9) || (_player IN _playerCar)} do {
            _t = _t + 1;
            uiSleep 1;
            if (isNull _playerCar) exitwith {_fail = true; ["O veículo já foi guardado?",Color_Red] remoteExec ["Caue_HUD_Notification",_player];};
            if (_t > 119) exitwith {_fail = true; ["Tempo para guardar o veículo excedeu o limite",Color_Red] remoteExec ["Caue_HUD_Notification",_player];};
        };

        if (!_fail) then {
            private _var = _playerCar getVariable "owner";
            private _id = _var select 1;
            private _Path = (getObjectTextures _playerCar) select 0;
            private _Pathformat = format ["%1",_Path];
            private _Texture = [_Pathformat, "\", "\\"] call CBA_fnc_replace;
            private _animMods = ([_playerCar] call BIS_fnc_getVehicleCustomization) select 1;
            private _modsFormat = [_animMods] call Server_Database_Array;
            [format ["Storage_Store:%2:%3:%4:%1",_id,(fuel _playerCar),_Texture,_modsFormat],1] spawn Server_Database_Async;
            [_playercar] call Server_Vehicle_Despawn;
            ["Veiculo guardado",Color_Green] remoteExec ["Caue_HUD_Notification",_player];
        };
    };

}, true] call Server_Setup_Compile;
