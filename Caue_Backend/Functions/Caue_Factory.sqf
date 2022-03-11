/*
    Client
*/
['Caue_Factory_Open', {

    disableSerialization;
    params [
        ["_type",""]
    ];

    if !(isNull Player_Item) then {[] call Caue_Inventory_PutBack;};

    closeDialog 0;
    createDialog "Dialog_Factory";

    [] spawn Caue_Factory_DialogLoop;
    [_type] spawn Caue_Factory_ObjectPreview;
    [_type] spawn {
        disableSerialization;
        params [["_type",""]];
        private _display = findDisplay 45;
        while {!isNull _display} do {
            [_type] call Caue_Factory_Refresh;
            uiSleep 0.5;
        };
    };

    private _display = findDisplay 45;

    Factory_CraftAmount = 1;
    private _control = _display displayCtrl 1526;
    _control ctrlAddEventHandler ["keyUp",{
        private _editamount = round(parseNumber(ctrlText 1526));
        if (_editamount < 1) then {
            Factory_CraftAmount = 1;
        } else {
            Factory_CraftAmount = _editamount;
        };
        [1500,false] call Caue_Factory_SetRecipe;
    }];

    private _control = _display displayCtrl 1600;
    _control buttonSetAction "[] spawn Caue_Factory_Craft";
    _control = _display displayCtrl 1603;
    _control buttonSetAction "[] spawn Caue_Factory_Collect";
    _control = _display displayCtrl 1601;
    _control buttonSetAction "[] spawn Caue_Factory_Add";
    _control = _display displayCtrl 1100;
    _control CtrlSetText _type;
    _control = _display displayCtrl 1502;
    _control ctrlAddEventHandler ["LBSelChanged",{}];
    _control = _display displayCtrl 1500;
    _control ctrlAddEventHandler ["LBSelChanged",{[1500] call Caue_Factory_SetRecipe;}];

    private _recipes = ["all",_type] call Caue_Config_GetFactory;
    private _class = "";
    private _name = "";
    private _classType = "";
    {
        _x params [["_id",""]];
        _class = [_id,_type,"class"] call Caue_Config_GetFactory;
        _name = [_id,_type,"name"] call Caue_Config_GetFactory;
        _classType = [_id,_type,"type"] call Caue_Config_GetFactory;

        if (_name == "inh") then {_name = [_class,_classType,"name"] call Caue_Factory_Inheritance;};

        private _i = _control lbAdd _name;
        _control lbSetData [_i,_id];
    } forEach _recipes;
    _control lbSetCurSel 0;

    [_type] call Caue_Factory_Refresh;

}, false] call Server_Setup_Compile;

['Caue_Factory_Refresh', {

    disableSerialization;
    params [
        ["_type",""]
    ];

    private _display = findDisplay 45;
    if (isNull _display) exitwith {};

    private _control = _display displayCtrl 1502;
    private _storage = [_type] call Caue_Factory_GetStorage;
    private _inventory = player getVariable ["player_inventory",[]];

    if ((typeName _storage) == "BOOL") then {_storage = []};

    private _lbArray = [];
    {
        _x params [
            "_id",
            "_amount"
        ];

        private _isFactory = _id splitString "_";
        if ((_isFactory select 0) == "f") then {_isFactory = true;} else {_isFactory = false;};

        private _name = "";
        private _class = "";
        private _classType = "";
        if (_isFactory) then {
            _name = [_id,_type,"name"] call Caue_Config_GetFactory;
            _class = [_id,_type,"class"] call Caue_Config_GetFactory;
            _classType = [_id,_type,"type"] call Caue_Config_GetFactory;
            if (_name == "inh") then {_name = [_class,_classType,"name"] call Caue_Factory_Inheritance;};
        } else {
            _name = [_id,"name"] call Caue_Config_GetItem;
        };

        _lbArray pushback [format["%1 (%2x)",_name,_amount],_id];
    } foreach _storage;

    lbClear _control;
    {
        private _i = _control lbAdd (_x select 0);
        _control lbSetPicture [_i,""];
        _control lbSetData [_i,(_x select 1)];
    } foreach _lbArray;

    _lbArray = [];
    _control = _display displayCtrl 1503;
    {
        _x params [
            "_id",
            "_amount"
        ];
        _lbArray pushback [format ["%1 (%2x)",([_id,"name"] call Caue_Config_GetItem),_amount],_id];
    } foreach _inventory;

    lbClear _control;
    {
        private _i = _control lbAdd (_x select 0);
        _control lbSetData [_i,(_x select 1)];
    } foreach _lbArray;

    private _i = _control lbAdd format ["Dinheiro (%1x)",(player getvariable ["getjobplayerguy",0])];
    _control lbSetData [_i,"taxidriver"];

    private _near = nearestObjects [player,[],20];
    {
        if (!isNil {_x getVariable ["ainv",nil]}) then {_near deleteAt _forEachIndex;};
    } foreach _near;

    {
        if (!isNil {_x getVariable ["class",nil]}) then {
            if ((_x getVariable ["owner",""]) == (getPlayerUID player)) then {
                private _id = _x getVariable ["class",""];
                private _amount = 1;
                private _i = _control lbAdd format ["%1 (%2x)",([_id,"name"] call Caue_Config_GetItem),_amount];
                _control lbSetData [_i,format ["OBJ_%1",_x]];
            };
        };
    } foreach _near;

    [1500,false] call Caue_Factory_SetRecipe;

}, false] call Server_Setup_Compile;

['Caue_Factory_DialogLoop', {

    disableSerialization;

    private _display = findDisplay 45;
    if (isNull _display) exitwith {};

    private _type = ctrlText (_display displayCtrl 1100);

    private _craftID = "rola";
    {
        _x params ["_id"];
        if (([_id, "type"] call Caue_Config_GetPlayerFactory) == _type) exitwith {_craftID = _id;};
    } forEach (player getVariable ["player_factories",[]]);

    if (_craftID isEqualTo "rola") exitwith {};

    private _id = [_craftID, "id"] call Caue_Config_GetPlayerFactory;
    private _duration = [_id,_type,"time"] call Caue_Config_GetFactory;
    private _craftamount = [_craftID, "amount"] call Caue_Config_GetPlayerFactory;
    private _timeEnd = [_craftID, "finish"] call Caue_Config_GetPlayerFactory;
    private _name = [_id,_type,"name"] call Caue_Config_GetFactory;

    if (_name == "inh") then {
        _name = [([_id,_type,"class"] call Caue_Config_GetFactory),([_id,_type,"type"] call Caue_Config_GetFactory),"name"] call Caue_Factory_Inheritance;
    };

    _duration = _duration * _craftamount;

    private _secLeft = 0;
    while {!isNull _display} do {
        _secLeft = -(diag_ticktime) + _timeEnd;
        (_display displayCtrl 1105) progressSetPosition (1-(_secLeft / _duration));
        if (_secLeft < 0) then {_secLeft = 0};
        (_display displayCtrl 1104) ctrlSetStructuredText parseText format ["<t size='0.92'>Criando: %1<br/>%2 segundos restantes</t>",_name,ceil _secLeft];
        uiSleep 0.1;
        if (_secLeft <= 0) exitwith {};
    };

}, false] call Server_Setup_Compile;

['Caue_Factory_ObjectPreview', {

    disableSerialization;
    params [["_factory",""]];

    private _display = findDisplay 45;

    private _logic = "logic" createvehicleLocal [0,0,0];
    _logic setposATL (["pos",_factory] call Caue_Config_GetFactory);
    private _cam = "camera" camCreate [0,0,0];
    FACTORYCAMERA = _cam;
    FACTORYLOGIC = _logic;
    _cam camSetTarget _logic;
    _cam camCommit 0;
    _cam cameraEffect ["internal", "BACK"];
    _cam attachto [_logic, [0,5,2]];
    private _dir = random 359;
    private _interval = 0.1;

    while {!isNull _display} do {
        _dir = _dir + _interval;
        _logic setDir _dir;
        uiSleep 0.01;
    };

    {deleteVehicle _x;} foreach (attachedObjects (missionNameSpace getVariable ["FACTORY_OBJPRV",objNull]));

    deleteVehicle (missionNameSpace getVariable ["FACTORY_OBJPRV",objNull]);
    FACTORYCAMERA = nil;
    FACTORYLOGIC = nil;
    camDestroy _cam;
    deleteVehicle _logic;
    player cameraEffect ["terminate", "BACK"];

}, false] call Server_Setup_Compile;

['Caue_Factory_Craft', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    disableSerialization;

    private _display = findDisplay 45;
    private _type = ctrlText (_display displayCtrl 1100);

    private _var = player getVariable ["player_factories",[]];
    private _alreadyCrafting = false;
    {
        _x params ["_id"];
        if (([_id, "type"] call Caue_Config_GetPlayerFactory) == _type) exitwith {_alreadyCrafting = true;};
    } foreach _var;

    if (_alreadyCrafting) exitwith {["Você já está criando algo aqui, por favor aguarde!",Color_Red] call A3PL_HUD_Notification;};

    private _control = _display displayCtrl 1500;
    if ((lbCurSel _control) < 0) exitwith {["Você não selecionou nenhum item para criar",Color_Red] call A3PL_HUD_Notification;};

    private _id = _control lbData (lbCurSel _control);
    private _required = [_id,_type,"required"] call Caue_Config_GetFactory;
    if ((isNil "_required") || ((count _required) < 1)) exitwith {};

    private _craftamount = Factory_CraftAmount;

    private _failed = false;
    {
        _x params [
            "_id",
            "_amount"
        ];

        _amount = _amount * _craftamount;

        if !([_id,_amount,_type] call Caue_Factory_Has) exitwith {_failed = true;};
    } foreach _required;

    if (_failed) exitwith {["Você não tem os materiais necessários para criar esta quantia",Color_Red] call A3PL_HUD_Notification;};

    private _sec = [_id,_type,"time"] call Caue_Config_GetFactory;
    private _classType = [_id,_type,"type"] call Caue_Config_GetFactory;
    private _classname = [_id,_type,"class"] call Caue_Config_GetFactory;
    private _craftID = round(random 10000);

    _var = player getVariable ["Player_Factories",[]];
    _var pushback [_craftID,_classname,_required,_type,_classType,_id,_craftamount,(diag_ticktime + (_sec * _craftamount))];
    player setVariable ["Player_Factories",_var,false];

    [] spawn Caue_Factory_DialogLoop;

    [_craftID,_sec,_craftamount] spawn {
        params [
            ["_craftID",0],
            ["_sec",0],
            ["_craftamount",1]
        ];

        private _type = [_craftID, "type"] call Caue_Config_GetPlayerFactory;
        private _classtype = [_craftID, "classtype"] call Caue_Config_GetPlayerFactory;
        private _classname = [_craftID, "classname"] call Caue_Config_GetPlayerFactory;
        private _id = [_craftID, "id"] call Caue_Config_GetPlayerFactory;
        private _name = [_id,_type,"name"] call Caue_Config_GetFactory;
        if (_name == "inh") then {_name = [_classname,_classType,"name"] call Caue_Factory_Inheritance;};

        uiSleep (_sec * _craftamount);
        [format["x%3 %1 foi criada na sua %2",_name,_type,_craftamount],Color_Green] call A3PL_HUD_Notification;

        private _antidupe = str(round(random 10000));
        player setVariable [_antidupe,false,true];

        [player,_type,_id,_antidupe,_craftamount] remoteExec ["Server_Factory_Finalise",2];

        [(getPlayerUID player),_type,"craft",format["(x%1) %2",_craftamount,_name]] remoteExec ["Caue_Log_Factory",2];

        waitUntil {player getVariable _antidupe};
        player setVariable [_antidupe,nil,true];

        private _var = player getVariable ["player_factories",[]];
        {
            if ((_x select 0) == _craftID) exitwith {_var deleteAt _forEachIndex;};
        } foreach _var;
    };

}, false] call Server_Setup_Compile;

['Caue_Factory_Add', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    private _display = findDisplay 45;
    private _control = _display displayCtrl 1503;
    private _type = ctrlText (_display displayCtrl 1100);
    private _id = _control lbData (lbCurSel _control);
    private _control = _display displayCtrl 1400;
    private _amount = round(parseNumber(ctrlText _control));

    if (_amount < 1) exitwith {["Por favor, insira um valor válido para adicionar",Color_Red] call A3PL_HUD_Notification;};

    private _typeOf = "fail";
    private _splitted = _id splitString "_";
    if ((_splitted select 0) == "OBJ") then {
        _typeOf = "";
        _typeOf = toArray _id;
        _typeOf deleteAt 0;_typeOf deleteAt 0;_typeOf deleteAt 0;_typeOf deleteAt 0;
        _typeOf = toString _typeOf;
    };

    private _obj = objNull;
    if !(_typeOf isEqualTo "fail") then {
        _obj = [_typeOf] call A3PL_Lib_vehStringToObj;
    };

    if (isNull _obj) then {
        [player,_type,[_id,_amount]] remoteExec ["Server_Factory_Add",2];
        [(getPlayerUID player),_type,"put",format["(x%1) %2",_amount,([_id,"name"] call Caue_Config_GetItem)]] remoteExec ["Caue_Log_Factory",2];
    } else {
        if (isNull _obj) exitwith {};
        private _id = _obj getVariable ["class","fail"];
        if (_id isEqualTo "fail") exitwith {};
        [player,_type,[_id,1],true,_obj] remoteExec ["Server_Factory_Add",2];
        [(getPlayerUID player),_type,"put",format["(x%1) %2",1,([_id,"name"] call Caue_Config_GetItem)]] remoteExec ["Caue_Log_Factory",2];
    };

}, false] call Server_Setup_Compile;

['Caue_Factory_Collect', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    private _display = findDisplay 45;
    private _control = _display displayCtrl 1502;
    private _type = ctrlText (_display displayCtrl 1100);

    if ((lbCurSel _control) < 0) exitwith {["Você não selecionou nada!",Color_Red] call A3PL_HUD_Notification;};

    private _id = _control lbData (lbCurSel _control);

    private _isCrafting = false;
    {
        if ((_x select 3) == _type) exitwith {_isCrafting = true;};
    } foreach (player getVariable ["player_factories",[]]);

    if (_isCrafting) exitwith {["Você não pode retirar itens do armazenamento se estiver criando algo!"] call A3PL_HUD_Notification;};

    _control = _display displayCtrl 1400;
    private _amount = round(parseNumber(ctrlText _control));
    if (_amount < 1) exitwith {["Por favor, insira um valor válido para coletar",Color_Red] call A3PL_HUD_Notification;};
    if !([_id,_amount,_type] call Caue_Factory_Has) exitwith {["Você não tem esse valor desse item para coletar",Color_Red] call A3PL_HUD_Notification;};
    private _fail = false;
    if ([_id,"canPickup"] call Caue_Config_GetItem) then {
        if (([player,[[_id,_amount]]] call Caue_Inventory_TotalWeight) > (player getVariable ["MaxWeight",100])) then {_fail = true;};
    } else {
        _amount = 1;
    };

    if (_fail) exitWith {["Você não pode pegar este item porque excederia o limite que você pode carregar!",Color_Red] call A3PL_HUD_Notification;};

    [player,_type,[_id,_amount]] remoteExec ["Server_Factory_Collect",2];
    [(getPlayerUID player),_type,"take",format["(x%1) %2",_amount,([_id,"name"] call Caue_Config_GetItem)]] remoteExec ["Caue_Log_Factory",2];

    [_type] spawn {
        params [["_type",""]];
        uiSleep 2;
        [_type] call Caue_Factory_Refresh;
    };

}, false] call Server_Setup_Compile;

['Caue_Factory_SetRecipe', {

    disableSerialization;
    params [
        ["_ctrlID",1500],
        ["_preview",true]
    ];

    private _display = findDisplay 45;

    private _type = ctrlText (_display displayCtrl 1100);
    private _control = _display displayCtrl _ctrlID;

    if ((lbCurSel _control) < 0) exitwith {};

    private _id = _control lbData (lbCurSel _control);
    private _required = [_id,_type,"required"] call Caue_Config_GetFactory;
    private _classType = [_id,_type,"type"] call Caue_Config_GetFactory;

    if (_preview) then {
        [_type,_id] spawn Caue_Factory_ObjectPreviewSpawn;
        Factory_CraftAmount = 1;
        ctrlSetText [1526,"1"];
    };

    _control = _display displayCtrl 1501;
    private _lbArray = [];
    {
        _x params [
            "_id",
            "_amount"
        ];

        _amount = _amount * Factory_CraftAmount;

        private _name = format["%1x %2",_amount,([_id,"name"] call Caue_Config_GetItem)];

        if ([_id,_amount,_type] call Caue_Factory_Has) then {
            _lbArray pushback [_name,_id,true];
        } else {
            _lbArray pushback [_name,_id,false];
        };
    } forEach _required;

    lbClear _control;
    {
        private _i = _control lbAdd (_x select 0);
        _control lbSetData [_i,(_x select 1)];
        if (_x select 2) then {_control lbSetColor [_i,[0, 1, 0, 1]];} else {_control lbSetColor [_i,[1, 0, 0, 1]];};
    } foreach _lbArray;

    private _desc = "";
    switch (_classType) do {
        case ("car"): {_desc = "Carro"};
        case ("weapon"): {_desc = "Arma"};
        case ("mag"): {_desc = "Munição"};
        default {_desc = "Não Definido"};
    };

    _control = _display displayCtrl 1103;
    _control ctrlSetStructuredText parseText format ["Descrição do Item: %1",_desc];

}, false] call Server_Setup_Compile;

['Caue_Factory_ObjectPreviewSpawn', {

    disableSerialization;
    params [
        ["_factory",""],
        ["_id",""]
    ];

    private _class = [_id,_factory,"class"] call Caue_Config_GetFactory;
    private _itemType = [_id,_factory,"type"] call Caue_Config_GetFactory;
    private _pos = ["pos",_factory] call Caue_Config_GetFactory;
    private _display = findDisplay 45;
    private _camera = missionNameSpace getVariable ["FACTORYCAMERA",objNull];
    private _logic = missionNameSpace getVariable ["FACTORYLOGIC",objNull];

    if (isNull _display) exitwith {};

    {deleteVehicle _x;} foreach (attachedObjects (missionNameSpace getVariable ["FACTORY_OBJPRV",objNull]));
    deleteVehicle (missionNameSpace getVariable ["FACTORY_OBJPRV",objNull]);

    sleep 0.01;

    if !([] call Caue_Player_AntiListBoxSpam) exitwith {};

    switch (true) do {
        case (_itemType == "item"): {
            _class = [_class,"class"] call Caue_Config_GetItem;
            FACTORY_OBJPRV = _class createvehicleLocal [0,0,0];
            FACTORY_OBJPRV allowDamage false;
            FACTORY_OBJPRV setPosATL _pos;
            FACTORY_OBJPRV setDir (random 359);
            FACTORY_OBJPRV enableSimulation false;
            _camera attachto [_logic, [0,2,2]];
        };

        case (_itemType IN ["weapon","magazine","aitem","weaponitem","secweaponitem"]): {
            FACTORY_OBJPRV = "groundWeaponHolder" createvehicleLocal [0,0,0];
            switch (_itemType) do {
                case ("weapon"): {FACTORY_OBJPRV addWeaponCargo [_class,1];};
                case ("magazine"): {FACTORY_OBJPRV addMagazineCargo [_class,1];};
                case ("aitem"): {FACTORY_OBJPRV addItemCargo [_class,1];};
                case ("weaponitem"): {FACTORY_OBJPRV addItemCargo [_class,1];};
                case ("secweaponitem"): {FACTORY_OBJPRV addItemCargo [_class,1];};
            };
            FACTORY_OBJPRV setPosATL _pos;
            FACTORY_OBJPRV setDir (random 359);
            _camera attachto [_logic, [0,0.1,1]];
        };

        case (_itemType IN ["car","plane","heli"]): {
            FACTORY_OBJPRV = _class createvehicleLocal [0,0,0];
            FACTORY_OBJPRV allowDamage false;
            FACTORY_OBJPRV setPosATL _pos;
            FACTORY_OBJPRV setDir (random 359);
            _camera attachto [_logic, [0,5,2]];
        };

        case (_itemType IN ["vest","uniform","goggles","headgear","backpack"]): {
            FACTORY_OBJPRV = "C_man_p_beggar_F" createvehicleLocal [0,0,0];
            FACTORY_OBJPRV allowDamage false;
            FACTORY_OBJPRV setPosATL [_pos select 0,_pos select 1,((_pos select 2) - 1)];
            FACTORY_OBJPRV setDir (random 359);
            FACTORY_OBJPRV enableSimulation false;
            FACTORY_OBJPRV addweapon "arifle_AKM_F";

            switch (_itemType) do {
                case ("uniform"): {removeUniform FACTORY_OBJPRV; FACTORY_OBJPRV addUniform _class;};
                case ("vest"): {removeVest FACTORY_OBJPRV; FACTORY_OBJPRV addVest _class;};
                case ("headgear"): {removeHeadGear FACTORY_OBJPRV; FACTORY_OBJPRV addHeadGear _class;};
                case ("backpack"): {removeBackPack FACTORY_OBJPRV; FACTORY_OBJPRV addBackPack _class;};
                case ("goggles"): {removeGoggles FACTORY_OBJPRV; FACTORY_OBJPRV addGoggles _class;};
                case ("weapon"): {removeAllWeapons FACTORY_OBJPRV; FACTORY_OBJPRV addWeapon _class;};
            };
            _camera attachto [_logic, [0,2,2]];
        };
    };

}, false] call Server_Setup_Compile;

['Caue_Factory_CrateCheck', {

    params [
        ["_crate",objNull]
    ];

    if (isNil {_crate getVariable ["aInv",nil]}) exitwith {
        private _id = _crate getVariable ["class",""];
        private _amount = _crate getVariable ["amount",1];
        private _name = [_id,"name"] call Caue_Config_GetItem;
        [format["Há %1 %2 dentro deste item",_amount,_name],Color_Green] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['Caue_Factory_CrateCollect', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_crate",objNull]
    ];

    private _info = [_crate] call Caue_Factory_CrateInfo;
    private _classtype = _info select 0;
    private _id = _info select 1;
    private _amount = _info select 2;
    private _name = [_id,_classType] call Caue_Factory_CrateName;
    private _owner = _crate getVariable ["owner",""];

    if !(_owner isEqualTo (getPlayerUID player)) exitwith {["Você não possui este item, peça ao dono para vendê-lo em sua loja",Color_Red] call A3PL_HUD_Notification;};

    private _fail = false;
    switch (true) do {
        case (_classType == "item"): {[_id,_amount] call Caue_Inventory_Add;};
        default {
            switch (_classtype) do {
                case ("weapon"): {player addWeapon _id;};
                case ("magazine"): {for "_i" from 1 to _amount do {player addMagazine _id;};};
                case ("mag"): {for "_i" from 1 to _amount do {player addMagazine _id;};};
                case ("uniform"): {player addUniform _id; };
                case ("vest"): {player addVest _id;};
                case ("headgear"): {player addHeadGear _id;};
                case ("backpack"): {player addBackPack _id; [] spawn Caue_Player_Backpack;};
                case ("goggles"): {player addGoggles _id;};
                case ("aitem"): {player addItem _id; player assignItem _id;};
                default {_fail = true;};
            };
        };
    };

    if (_fail) exitwith {};
    deleteVehicle _crate;
    [format["Você coletou %1 %2",_amount,_name],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Factory_CrateInfo', {

    params [
        ["_crate",objNull]
    ];

    private _aInv = _crate getVariable ["ainv",nil];

    if (isNil "_aInv") then {};

    private _classtype = _aInv select 0;
    private _id = _aInv select 1;
    private _amount = _aInv select 2;

    _return = [_classType,_id,_amount];
    _return;

}, false] call Server_Setup_Compile;

['Caue_Factory_CrateName', {

    params [
        ["_id",""],
        ["_classType",""]
    ];

    private _name = "ERROR";
    switch (true) do {
        case (_classType == "item"): {_name = [_id,"name"] call Caue_Config_GetItem;};
        default {
            private _mainClass = "";
            switch (_classtype) do {
                case ("car"): {_mainClass = "cfgVehicles"};
                case ("weapon"): {_mainClass = "CfgWeapons"};
                case ("magazine"): {_mainClass = "cfgMagazines"};
                case ("mag"): {_mainClass = "cfgMagazines"};
                case ("uniform"): {_mainClass = "CfgWeapons"};
                case ("vest"): {_mainClass = "CfgWeapons"};
                case ("headgear"): {_mainClass = "CfgWeapons"};
                case ("backpack"): {_mainClass = "CfgWeapons"};
                case ("goggles"): {_mainClass = "CfgGlasses"};
                case ("aitem"): {_mainClass = "CfgWeapons"};
                default {_mainClass = "cfgVehicles"};
            };

            _name = getText (configFile >> _mainClass >> _id >> "displayName");
        };
    };

    _name;

}, false] call Server_Setup_Compile;

['Caue_Factory_GetStorage', {

    params [
        ["_type",""]
    ];

    private _storage = [_type,"items"] call Caue_Config_GetFactoryStorage;
    if ((typeName _storage) == "BOOL") exitwith {_storage = []; _storage;};

    private _fact = player getVariable ["player_factories",[]];
    private _subtract = [];

    {
        private _craftamount = _x select 6;
        {
            _x params [
                "_class",
                "_amount"
            ];
            _subtract = [_subtract, _class, (_amount * _craftamount), true] call BIS_fnc_addToPairs;
        } foreach (_x select 2);
    } foreach _fact;

    {
        _x params [
            "_class",
            "_amount"
        ];
        _storage = [_storage, _class, -(_amount), true] call BIS_fnc_addToPairs;
    } foreach _subtract;

    {
        if ((_x select 1) < 1) then {_storage deleteAt _forEachIndex;};
    } forEach _storage;

    _storage;

}, false] call Server_Setup_Compile;

['Caue_Factory_Has', {

    params [
        ["_item",""],
        ["_amount",1],
        ["_type",""],
        ["_player",player]
    ];

    private _has = false;
    private _found = false;
    private _storage = _player getVariable ["player_fstorage",[]];

    {
        if ((_x select 0) == _type) then {
            {
                _x params ["_storageItem"];

                private _itemType = "";
                private _isFactory = _storageItem splitString "_";

                if ((_isFactory select 0) == "f") then {_isFactory = true; _itemType = [_storageItem,_type,"type"] call Caue_Config_GetFactory;} else {_isFactory = false;};
                if (_isFactory && (_itemType == "item")) then {_storageItem = [_storageItem,_type,"class"] call Caue_Config_GetFactory;};
                if (_storageItem == _item) exitwith {
                    if ((_x select 1) >= _amount) then {_has = true};
                    _found = true;
                };
            } foreach (_x select 1);
            if (_found) exitwith {};
        };
    } foreach _storage;

    _has;

}, false] call Server_Setup_Compile;

['Caue_Factory_Inheritance', {

    params [
        ["_class",""],
        ["_type",""],
        ["_info",""]
    ];

    private _return = "ERROR";

    if (_type == "item") exitwith {
        switch (_info) do {
            case ("img"): {_return = "";};
            case ("name"): {_return = [_class,"name"] call Caue_Config_GetItem;};
            case ("mainClass"): { _return = _mainClass;};
        };
        if ((typeName _return) == "BOOL") then {_return = "ERROR"};
        _return;
    };

    private _mainClass = "";
    switch (_type) do {
        case ("car"): {_mainClass = "cfgVehicles"};
        case ("weapon"): {_mainClass = "CfgWeapons"};
        case ("magazine"): {_mainClass = "cfgMagazines"};
        case ("mag"): {_mainClass = "cfgMagazines"};
        case ("uniform"): {_mainClass = "CfgWeapons"};
        case ("vest"): {_mainClass = "CfgWeapons"};
        case ("headgear"): {_mainClass = "CfgWeapons"};
        case ("backpack"): {_mainClass = "CfgWeapons"};
        case ("goggles"): {_mainClass = "CfgGlasses"};
        case ("aitem"): {_mainClass = "CfgWeapons"};
        default {_mainClass = "cfgVehicles"};
    };

    switch (_info) do {
        case ("img"): {_return = getText (configFile >> _mainClass >> _class >> "picture")};
        case ("name"): {_return = getText (configFile >> _mainClass >> _class >> "displayName")};
        case ("mainClass"): {_return = _mainClass;};
    };

    _return;

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Factory_Finalise', {

    params [
        ["_player",objNull],
        ["_type",""],
        ["_id",""],
        ["_antidupe",""],
        ["_craftamount",1]
    ];

    private _items = [_type,"items",_player] call Caue_Config_GetFactoryStorage;
    private _storage = _player getVariable ["player_fstorage",[]];
    private _required = [_id,_type,"required"] call Caue_Config_GetFactory;
    private _amount = [_id,_type,"output"] call Caue_Config_GetFactory;

    {
        _x params [
            "_id",
            "_amount"
        ];
        _items = [_items,_id,-(_amount * _craftamount),true] call BIS_fnc_addToPairs;
    } forEach _required;

    {
        if ((_x select 1) < 1) then {_items deleteAt _forEachIndex;};
    } forEach _items;

    private _i = "kappa";
    {
        if ((_x select 0) == _type) exitwith {_i = _forEachIndex;};
    } foreach _storage;

    if (_i isEqualTo "kappa") exitwith {};

    private _newArr = _storage select _i;
    _newArr set [1,_items];

    if ((count _items) isEqualTo 0) then {
        _storage deleteAt _i;
    } else {
        _storage set [_i,_newArr];
    };

    _player setvariable ["player_fStorage",_storage,true];

    if (([_id,_type,"type"] call Caue_Config_GetFactory) == "item") then {
        private _isFactory = _id splitString "_";
        if ((_isFactory select 0) == "f") then {_isFactory = true;} else {_isFactory = false;};
        if (_isFactory) then {_id = [_id,_type,"class"] call Caue_Config_GetFactory;};
    };

    _player setVariable [_antidupe,true,true];
    [_player,_type,[_id,(_amount * _craftamount)],false] call Server_Factory_Add;

}, true] call Server_Setup_Compile;

['Server_Factory_Add', {

    params [
        ["_player",objNull],
        ["_type",""],
        ["_item",["",1]],
        ["_move",true],
        ["_obj",nil]
    ];

    private _fail = false;

    if (_move) then {
        if !(isNil "_obj") then {
            if (isNull _obj) exitwith {_fail = true;};
            deleteVehicle _obj;
        } else {
            private _has = [(_item select 0),(_item select 1),_player] call Caue_Inventory_Has;
            if (!_has) exitwith {_fail = true;};

            private _inventory = _player getVariable ["player_inventory",[]];
            private _class = _item select 0;
            private _amount = _item select 1;

            private _newcash = "fail";
            if (_class == "taxidriver") then {
                _newcash = (_player getVariable ["getjobplayerguy",0]) - _amount;
            } else {
                _inventory = [_inventory, _class, -(_amount), true] call BIS_fnc_addToPairs;
            };

            _player setvariable ["player_inventory",_inventory,true];
            [_player] call Server_Inventory_Verify;
            if !(_newCash isEqualTo "fail") then {_player setvariable ["getjobplayerguy",_newcash,true];};
        };
    };

    if (_fail) exitwith {};

    private _storage = _player getvariable ["player_fStorage",[]];

    private _i = "fail";
    private _newArr = [_type,"items",_player] call Caue_Config_GetFactoryStorage;
    {
        if ((_x select 0) == _type) exitwith {_i = _forEachIndex;};
    } foreach _storage;

    if ((typeName _newArr) != "BOOL") then {
        _newArr = [_newArr, (_item select 0), (_item select 1), true] call BIS_fnc_addToPairs;
        if (_i isEqualTo "fail") exitwith {};
        (_storage select _i) set [1,_newArr];
    } else {
        _storage pushBack [_type,[[(_item select 0),(_item select 1)]]];
    };

    _player setvariable ["player_fstorage",_storage,true];
    [format ["Factory_Update:%1:%2",([_storage] call Server_Database_Array),getPlayerUID _player],1] spawn Server_Database_Async;

}, true] call Server_Setup_Compile;

['Server_Factory_Collect', {

    params [
        ["_player",objNull],
        ["_type",""],
        ["_item",["",1]]
    ];

    private _id = _item select 0;
    private _amount = _item select 1;
    private _storage = _player getVariable ["player_fstorage",[]];
    private _items = [_type,"items",_player] call Caue_Config_GetFactoryStorage;

    if ((typeName _storage) == "BOOL") then {_storage = []};
    if !([_id,_amount,_type,_player] call Caue_Factory_Has) exitwith {};

    private _items = [_items,_id,-(_amount),true] call BIS_fnc_addToPairs;

    {
        if ((_x select 1) < 1) then {_items deleteAt _forEachIndex;};
    } forEach _items;

    private _i = "fail";
    {
        if ((_x select 0) == _type) exitwith {_i = _forEachIndex;};
    } foreach _storage;

    if (_i isEqualTo "fail") exitwith {};

    private _newArr = _storage select _i;
    _newArr set [1,_items];

    if ((count _items) isEqualTo 0) then {
        _storage deleteAt _i;
    } else {
        _storage set [_i,_newArr];
    };

    _player setvariable ["player_fstorage",_storage,true];
    [format ["Factory_Update:%1:%2",([_storage] call Server_Database_Array),getPlayerUID _player],1] spawn Server_Database_Async;

    [_player,_item,_type] call Server_Factory_Create;

}, true] call Server_Setup_Compile;

['Server_Factory_Create', {

    params [
        ["_player",objNull],
        ["_item",["",1]],
        ["_type",""],
        ["_classType",nil]
    ];

    private _id = _item select 0;
    private _amount = _item select 1;

    private _isFactory = _id splitString "_";
    if ((_isFactory select 0) == "f") then {_isFactory = true;} else {_isFactory = false;};

    if (_isFactory) then {
        _classType = [_id,_type,"type"] call Caue_Config_GetFactory;
        _id = [_id,_type,"class"] call Caue_Config_GetFactory;
    } else {
        if (isNil "_classType") then {_classType = "item";};
    };

    switch (true) do {
        case (_classType == "car"): {
            private _lp = [_player,_id,"deprecated",false] call Server_Vehicle_Buy;

            private _pos = [];
            if (_id isKindOf "Ship") then {
                _pos = [_player, 2, 30, 12, 2, 0, 0] call BIS_fnc_findSafePos;
                _pos set [2, 28];
            } else {
                _pos = (getpos _player) findEmptyPosition [2,25,_id];
            };
            if ((count _pos) isEqualTo 0) then {_pos = getpos _player};

            private _veh = [_id,_pos,_lp,_player] call Server_Vehicle_Spawn;

            [_veh,_lp] spawn Caue_Vehicle_SaveColor;
        };

        case (_classType == "plane"): {
            private _lp = [_player,_id,"deprecated",true] call Server_Vehicle_Buy;
        };

        case (_classType == "item"): {
            private _canPickup = [_id,"canPickup"] call Caue_Config_GetItem;
            if (_canPickup) then {
                [_player,_id,_amount] call Server_Inventory_Change;
            } else {
                private _objClass = [_id,"class"] call Caue_Config_GetItem;
                private _obj = createVehicle [_objClass, (getpos _player), [], 0, "CAN_COLLIDE"];
                _obj setVariable ["owner",(getPlayerUID _player),true];
                _obj setVariable ["class",_id,true];
            };
        };

        case (_classType IN ["vest","uniform","goggles","headgear","backpack","weapon","magazine","aitem","weaponitem","secweaponitem"]): {
            private _obj = objNull;
            if (_classType == "uniform") then {
                _obj = createVehicle ["A3PL_Clothing", (getpos _player), [], 0, "CAN_COLLIDE"];
            } else {
                _obj = createVehicle ["A3PL_Crate", (getpos _player), [], 0, "CAN_COLLIDE"];
            };
            _obj setVariable ["owner",(getPlayerUID _player),true];
            _obj setVariable ["class","ainv",true];
            _obj setVariable ["ainv",[_classtype,_id,_amount],true];
        };
    };

}, true] call Server_Setup_Compile;
