/*
    Client
*/
['A3PL_IE_Open', {

    disableSerialization;

    closeDialog 0;
    createDialog "Dialog_IE";

    private _display = findDisplay 48;
    private _control = _display displayCtrl 1500;

    _control ctrlAddEventHandler ["LBSelChanged",{_this call A3PL_IE_LbChanged;}];

    (_display displayCtrl 1600) ctrlAddEventHandler ["ButtonDown",{[true] spawn A3PL_IE_addShipment;}];
    (_display displayCtrl 1601) ctrlAddEventHandler ["ButtonDown",{[false] spawn A3PL_IE_addShipment;}];
    (_display displayCtrl 1603) ctrlAddEventHandler ["ButtonDown",{[] spawn A3PL_IE_collectShipment;}];

    _display displayAddEventHandler ["unload",{A3PL_IE_PriceArray = nil;}];

    _control = _display displayCtrl 1402;
    _control ctrlAddEventHandler ["KeyUp",{[] call A3PL_IE_UpdateTotal;}];

    [] call A3PL_IE_RefreshShipments;

}, false] call Server_Setup_Compile;

['A3PL_IE_RefreshShipments', {

    disableSerialization;
    params [
        ["_deletedItem",objNull],
        ["_deletedAmount",0]
    ];

    private _display = findDisplay 48;
    private _control = _display displayCtrl 1501;

    lbClear _control;
    {
        _itemName = [(_x select 0),"name"] call Caue_Config_GetItem;
        _amount = _x select 1;
        _status = _x select 2;

        if (_status) then {
            _index = _control lbAdd format ["%1x %2 (Chegou)",_amount,_itemName];
            _control lbSetData [_index,"import"];
        } else {
            _index = _control lbAdd format ["%1x %2 (Chegando no próximo navio)",_amount,_itemName];
            _control lbSetData [_index,"import"];
        };
    } forEach (player getVariable ["player_importing",[]]);

    {
        _itemName = [(_x select 0),"name"] call Caue_Config_GetItem;
        _amount = _x select 1;
        _status = _x select 2;

        if (isNil "Server_IE_ShipOutbound") then {
            _index = _control lbAdd format ["%1x %2 (Exportando no próximo navio)",_amount,_itemName];
            _control lbSetData [_index,"export"];
        } else {
            _index = _control lbAdd format ["%1x %2 (Exportado)",_amount,_itemName];
            _control lbSetData [_index,"export"];
        };
    } forEach (player getVariable ["player_exporting",[]]);

    _control = _display displayCtrl 1500;
    lbClear _control;
    {
        private ["_item","_index","_objects","_amount"];
        _item = _x select 0;

        if ([_item,"canPickup"] call Caue_Config_GetItem) then {
            _amount = [_item] call Caue_Inventory_Return;
            if (_deletedItem isEqualType "") then {
                if (_item == _deletedItem) then {
                    _amount = _amount - _deletedAmount;
                };
            };
            _index = _control lbAdd (format ["%1 (Inventario: %2x)",[_item,"name"] call Caue_Config_GetItem,_amount]);
        } else {
            _objects = nearestObjects [player,[([_item,"class"] call Caue_Config_GetItem)],10,true];
            _objects = _objects - [_deletedItem];
            _index = _control lbAdd (format ["%1 (Perto: %2x)",[_item,"name"] call Caue_Config_GetItem,count _objects]);
        };
        _control lbSetData [_index,_item];
    } forEach Server_IE_Prices;

}, false] call Server_Setup_Compile;

['A3PL_IE_LbChanged', {

    disableSerialization;
    params [
        ["_LBControl",displayNull],
        ["_LBIndex",0]
    ];

    private _display = findDisplay 48;

    {
        if ((_x select 0) == (_LBControl lbData _LBIndex)) exitWith {A3PL_IE_PriceArray = _x;};
    } forEach Server_IE_Prices;

    if (isNil "A3PL_IE_PriceArray") exitwith {};

    (_display displayCtrl 1400) ctrlSetText format ["$%1",(A3PL_IE_PriceArray select 1)];
    (_display displayCtrl 1401) ctrlSetText format ["$%1",(A3PL_IE_PriceArray select 2)];

    [] call A3PL_IE_UpdateTotal;

}, false] call Server_Setup_Compile;

['A3PL_IE_UpdateTotal', {

    disableSerialization;

    private _display = findDisplay 48;
    private _control = _display displayCtrl 1403;
    private _amount = round(parseNumber(ctrlText (_display displayCtrl 1402)));

    if (isNil "A3PL_IE_PriceArray") exitwith {};
    if (_amount < 1) exitWith {_control ctrlSetText "$0/$0"};

    private _importPrice = A3PL_IE_PriceArray select 1;
    private _exportPrice = A3PL_IE_PriceArray select 2;

    private _tax = round(_importPrice - (_importPrice * ((100 - (server getVariable ["IMPORT_TAX",0]))/100)));
    private _importPrice = _importPrice + _tax;

    _control ctrlSetText (format ["$%1/$%2",_amount*_importPrice,_amount*_exportPrice]);

}, false] call Server_Setup_Compile;

['A3PL_IE_AddShipment', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    disableSerialization;
    params [["_import",true]];

    private _display = findDisplay 48;

    private _control = _display displayCtrl 1500;
    {
        if ((_x select 0) == (_control lbData (lbCurSel _control))) exitwith {A3PL_IE_PriceArray = _x;};
    } foreach Server_IE_Prices;

    private _item = A3PL_IE_PriceArray select 0;
    private _itemName = [_item,"name"] call Caue_Config_GetItem;
    private _importPrice = A3PL_IE_PriceArray select 1;
    private _exportPrice = A3PL_IE_PriceArray select 2;
    private _amount = round(parseNumber(ctrlText(_display displayCtrl 1402)));

    if (_amount < 1) exitwith {["Por favor insira um número válido",Color_Red] call A3PL_HUD_Notification;};

    if (_import) then {
        if (!isNil "Server_IE_ShipImbound") exitwith {["Você não pode encomendar remessas enquanto o cargueiro estiver a caminho, por favor, espere um pouco",Color_Red] call A3PL_HUD_Notification;};

        private _totalPrice = _importPrice * _amount;
        private _tax = round(_totalPrice - (_totalPrice * ((100 - (server getVariable ["IMPORT_TAX",0]))/100)));
        private _totalPrice = _totalPrice + _tax;

        if (_totalPrice > (player getVariable ["getjobplayerguy",0])) exitwith {[format["Você não tem dinheiro suficiente para importar %1 %2 por $%3", _amount, _itemName, _totalPrice]] call A3PL_HUD_Notification;};

        player setVariable ["getjobplayerguy",(player getVariable ["getjobplayerguy",0]) - _totalPrice,true];
        private _importing = (player getVariable ["player_importing",[]]) + [[_item,_amount,false]];
        player setVariable ["player_importing",_importing,true];
        profileNamespace setVariable ["player_importing",_importing];
        saveProfileNamespace;

        [false] spawn Caue_Gear_Sync;
        ["IMPORT_TAX",_tax] remoteExec ["Server_Government_ReceiveTax",2];

        [format["Você adicionou uma remessa de importação e pagou: $%3, dos quais $%4 foram impostos para %1 %2",_amount, _itemName, _totalPrice, _tax],Color_Green] call A3PL_HUD_Notification;
        [(getPlayerUID player),"IE","import",_itemName,_amount,_totalPrice,(player getVariable ["getjobplayerguy",0])] remoteExec ["Caue_Log_Shop",2];
    } else {
        if (!isNil "Server_IE_ShipOutbound") exitwith {["Você não pode pedir remessas enquanto o cargueiro já estiver saindo, espere um pouco",Color_Red] call A3PL_HUD_Notification;};

        private _itemCheck = false;
        private _objectItem = objNull;
        if ([_item,"canPickup"] call Caue_Config_GetItem) then {
            if ([_item,_amount] call Caue_Inventory_Has) exitwith {_itemCheck = true;};
        } else {
            _amount = 1;
            private _class = [_item,"class"] call Caue_Config_GetItem;
            private _objects = nearestObjects [player,[_class],10,true];
            if ((count _objects) isEqualTo 0) exitwith {};
            {
                if ((local _x) && ((_x getVariable ["class",""]) == _item)) exitwith {_itemCheck = true; _objectItem = _x;};
            } forEach _objects;
        };

        if (!_itemCheck) exitwith {["Você não tem o valor desse item para exportar"] call A3PL_HUD_Notification;};

        if (isNull _objectItem) then {
            [_item,-(_amount)] call Caue_Inventory_Add;
        } else {
            deleteVehicle _objectItem;
        };

        private _exporting = (player getVariable ["player_exporting",[]]) + [[_item,_amount,false,(_exportPrice * _amount)]];
        player setVariable ["player_exporting",_exporting,true];
        profileNamespace setVariable ["player_exporting",_exporting];
        saveProfileNamespace;

        [format["Você adicionou uma remessa de exportação (%2x %3), você receberá $%1 quando o navio deixar as águas de Fishers Island",(_exportPrice * _amount),_amount,[_item,"name"] call Caue_Config_GetItem],Color_Green] call A3PL_HUD_Notification;
        [(getPlayerUID player),"IE","export",([_item,"name"] call Caue_Config_GetItem),_amount,(_exportPrice * _amount),((player getVariable ["getrankplayerguy",0]) + (_exportPrice * _amount))] remoteExec ["Caue_Log_Shop",2];
    };

    if (_import) then {
        [] call A3PL_IE_RefreshShipments;
    } else {
        if (isNull _objectItem) then {
            [_item,_amount] call A3PL_IE_RefreshShipments;
        } else {
            [_objectItem,1] call A3PL_IE_RefreshShipments;
        };
    };

}, false] call Server_Setup_Compile;

['A3PL_IE_CollectShipment', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    disableSerialization;

    private _display = findDisplay 48;
    private _control = _display displayCtrl 1501;

    private _lbIndex = lbCurSel _control;
    if (_lbIndex < 0) exitwith {["Você não tem uma remessa selecionada"] call A3PL_HUD_Notification;};
    if ((_control lbData _lbIndex) == "import") then {
        private _importArray = player getVariable ["player_importing",[]];
        private _currentItemArray = _importArray select _lbIndex;
        private _item = _currentItemArray select 0;
        CollectShipment_Amount = _currentItemArray select 1;
        private _arrived = _currentItemArray select 2;

        if (!_arrived) exitwith {["Esta remessa ainda não chegou",Color_Red] call A3PL_HUD_Notification;};

        if ([_item,"canPickup"] call Caue_Config_GetItem) then {
            _importArray deleteAt _lbIndex;
            [_item,CollectShipment_Amount] call Caue_Inventory_Add;
        } else {
            private _class = [_item,"class"] call Caue_Config_GetItem;
            private _veh = createVehicle [_class, getposATL player, [], 4, ""];
            _veh setVariable ["class",_item,true];
            _veh setVariable ["owner",(getPlayerUID player),true];

            private _currentImportAmount = CollectShipment_Amount;

            if (_currentImportAmount > 1) then {
                _importItem set [1,(_currentImportAmount - 1)];
                _importArray set [_lbIndex,_importItem];
                CollectShipment_Amount = 1;
            } else {
                _importArray deleteAt _lbIndex;
            };
        };

        player setVariable ["player_importing",_importArray,true];
        profileNamespace setVariable ["player_importing",_importArray];
        saveProfileNamespace;

        [] call A3PL_IE_RefreshShipments;

        [format ["Você coletou com sucesso %1 %2(s)",CollectShipment_Amount,([_item,"name"] call Caue_Config_GetItem)],Color_Green] call A3PL_HUD_Notification;
    } else {
        ["Incapaz de recuperar porque esta é uma remessa de exportação, o dinheiro será automaticamente transferido para sua conta bancária",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['A3PL_IE_ShipArrived', {

    ["O cargueiro chegou no porto de Stoney Creek, ele partirá novamente em breve.",Color_Green] call A3PL_HUD_Notification;

    private _importing = player getVariable ["player_importing",[]];
    if ((count _importing) < 1) exitwith {};

    private _shipment = 1;
    ["Suas remessas devem estar neste navio, a lista de remessa é a seguinte:",Color_Green] call A3PL_HUD_Notification;
    {
        if !(_x select 2) then {
            private _item = [_x select 0,"name"] call Caue_Config_GetItem;
            private _amount = _x select 1;
            [format["Cargueiro #%1 chegou contendo %2x %3",_shipment,_amount,_item],Color_Green] call A3PL_HUD_Notification;
            _shipment = _shipment + 1;
            _importing set [_forEachIndex,[_x select 0,_amount,true]];
        };
    } forEach _importing;

    player setVariable ["player_importing",_importing,true];
    profileNamespace setVariable ["player_importing",_importing];
    saveProfileNamespace;

}, false] call Server_Setup_Compile;

['A3PL_IE_ShipLeft', {

    ["O cargueiro deixou as águas de Fishers Island, ele voltará novamente em breve.",Color_Green] call A3PL_HUD_Notification;

    private _exporting = player getVariable ["player_exporting",[]];
    if ((count _exporting) < 1) exitwith {};

    private _addMoney = 0;
    ["Suas remessas foram exportadas, seus produtos exportados são os seguintes:",Color_Green] call A3PL_HUD_Notification;
    {
        private _item = _x select 0;
        private _itemName = [_item,"name"] call Caue_Config_GetItem;
        private _amount = _x select 1;
        private _price = _x select 3;

        {
            if ((_x select 0) == _item) exitwith {_itemPrice = _x select 2;};
        } forEach Server_IE_Prices;

        [format["Cargueiro #%1 exportado contendo %2x %3 - totalizando $%4",_forEachIndex,_amount,_itemName,([_price] call Caue_Lib_NumberText)],Color_Green] call A3PL_HUD_Notification;
        _addMoney = _addMoney + _price;
    } foreach _exporting;

    private _tax = round(_addMoney - (_addMoney * ((100 - (server getVariable ["IMPORT_TAX",0]))/100)));
    private _addMoney = _addMoney - _tax;

    ["IMPORT_TAX",_tax] remoteExec ["Server_Government_ReceiveTax",2];

    player setVariable ["player_exporting",[],true];
    profileNamespace setVariable ["player_exporting",[]];
    saveProfileNamespace;
    player setVariable ["getrankplayerguy",(player getVariable ["getrankplayerguy",0]) + _addMoney,true];

    [false] spawn Caue_Gear_Sync;
    [format["Um total de $%1 foi transferido para sua conta bancária. Taxa $%2",([_addMoney] call Caue_Lib_NumberText),([_tax] call Caue_Lib_NumberText)],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_IE_Init', {

    Server_IE_Prices = ["IEInit",2,true] call Server_Database_Async;
    publicVariable "Server_IE_Prices";

}, true] call Server_Setup_Compile;

['Server_IE_ShipImport', {

    if (!isNil "Server_IE_Running") exitwith {};
    Server_IE_Running = true;

    private _ship = createVehicle ["A3PL_Container_Ship", [4166.04,8137.21,5], [], 100, "CAN_COLLIDE"];
    _ship allowDamage false;
    private _targetPos = [3763,7715,0];
    _ship setDir (_ship getRelDir _targetPos);
    private _driver = (createGroup civilian) createUnit ["C_man_p_beggar_F",[4166.04,8137.21,5], [], 0, ""];
    _driver moveInDriver _ship;
    _driver allowDamage false;
    _ship move _targetPos;
    _ship setBehaviour "CARELESS";
    private _container = 0;
    private _cArray = [];

    {
        private _playerUID = getPlayerUID _x;
        {
            if !(_x select 2) then {
                _container = _container + 1;
                if (_container > 72) exitwith {};
                _ship animateSource [format["c%1",_container],1];
                _cArray pushback [_playerUID,(_x select 0),(_x select 1)];
            };
        } forEach (_x getVariable ["player_importing",[]]);
        if (_container > 72) exitWith {};
    } forEach allPlayers;

    _ship setVariable ["containerItems",_cArray,true];
    //[_cArray] call Server_IE_PriceChange;

    private _timeOut = 0;
    private _timeOutLimit = 300;

    ["O cargueiro entrou nas águas de Fishers Island, e chegará ao porto de Stoney Creek em breve", Color_Green] remoteExec ["A3PL_HUD_Notification",-2];

    Server_IE_ShipImbound = true;
    publicVariable "Server_IE_ShipImbound";

    while {(_ship distance2D [3689.27,7647.33]) > 50} do {
        uiSleep 3;
        _timeOut = _timeOut + 3;
        if (_timeOut > _timeOutLimit) exitwith {true;}
    };

    if (_timeOut > _timeOutLimit) then {
        _ship deleteVehicleCrew (driver _ship);
        deleteVehicle _ship;
        ["O cargueiro se perdeu e não chegou ao porto de Stoney Creek a tempo, todos os contêineres que chegariam estarão no próximo cargueiro",Color_Yellow] remoteExec ["A3PL_HUD_Notification",-2];
        Server_IE_Running = nil;
    } else {
        _ship setVelocity [0,0,0];
        _ship setDir 233.276;
        _ship setPosASL [3691.86,7648.34,-1.91811];

        [] remoteExec ["A3PL_IE_ShipArrived",-2];

        private _crane1 = objNull;
        private _crane2 = objNull;

        [_ship,_crane1,_crane2] spawn {
            params [
                ["_ship",objNull],
                ["_crane1",objNull],
                ["_crane2",objNull]
            ];

            private _wait = 0;
            while {uiSleep 2; _wait < 600} do {
                _wait = _wait + 2;
                if ((_ship distance2D [3691.86,7648.34]) > 5) then {
                    _ship setDir 233.276;
                    _ship setPosASL [3691.86,7648.34,-1.91811]
                };
                _ship setVelocity [0,0,0];
            };

            [_ship] spawn Server_IE_ShipExport;

            {
                deleteVehicle _x;
            } foreach (nearestObjects [_crane1,["A3PL_Container_Hook","A3PL_FD_HoseEnd1"],20]);

            {
                deleteVehicle _x;
            } foreach (nearestObjects [_crane2,["A3PL_Container_Hook","A3PL_FD_HoseEnd1"],20]);

            deleteVehicle _crane1;
            deleteVehicle _crane2;
        };
    };

    Server_IE_ShipImbound = nil;
    publicVariable "Server_IE_ShipImbound";

}, true] call Server_Setup_Compile;

['Server_IE_ShipExport', {

    params [["_ship",objNull]];

    _ship setDir (getDir _ship + 180);
    _ship move [4166.04,8137.21,5];

    for "_i" from 1 to 72 do {
        private _cAnim = format["c%1",_i];
        if ((_ship animationSourcePhase _cAnim) > 0.1) then {
            _ship animateSource [_cAnim,0];
        };
    };

    private _container = 0;
    private _cArray = [];
    {
        private _playerUID = getPlayerUID _x;
        {
            _container = _container + 1;
            if (_container > 72) exitwith {};
            _ship animateSource [format["c%1",_container],1];
            _cArray pushback [_playerUID,(_x select 0),(_x select 1)];
        } forEach (_x getVariable ["player_exporting",[]]);
        if (_container > 72) exitwith {};
    } forEach allPlayers;

    _ship setVariable ["containerItems",_cArray];
    //[_cArray,false] call Server_IE_PriceChange;

    Server_IE_ShipOutbound = true;
    publicVariable "Server_IE_ShipOutbound";

    ["O cargueiro está saindo do porto de Stoney Creek",Color_Green] remoteExec ["A3PL_HUD_Notification",-2];

    private _timeOut = 0;
    private _timeOutLimit = 600;
    while {(_ship distance2D [4166.04,8137.21,5]) > 35} do {
        uiSleep 2;
        _timeOut = _timeOut + 2;
        if (_timeOut > _timeOutLimit) exitwith {true;}
    };

    [] remoteExec ["A3PL_IE_ShipLeft",-2];
    _ship deleteVehicleCrew (driver _ship);
    deleteVehicle _ship;

    Server_IE_ShipOutbound = nil;
    publicVariable "Server_IE_ShipOutbound";
    Server_IE_Running = nil;

}, true] call Server_Setup_Compile;

['Server_IE_PriceChange', {

    params [
        ["_cArray",[]],
        ["_import",true]
    ];

    private _itemArray = [];
    {
        _itemArray = [_itemArray,(_x select 1),(_x select 2),false] call BIS_fnc_addToPairs;
    } forEach _cArray;

    {
        _x params [
            "_item",
            "_amount"
        ];

        _itemIndex = -1;
        _ieArray = [];

        {
            if ((_x select 0) == _item) exitwith {
                _ieArray = _x;
                _itemIndex = _forEachIndex;
            };
        } forEach Server_IE_Prices;

        if (_itemIndex isEqualTo -1) exitwith {};

        _ieArray params [
            "_class",
            "_currentBuyPrice",
            "_currentSellPrice"
        ];

        Server_IE_Prices set [_itemIndex,_ieArray];

        [format["IEPriceChange:%1:%2:%3",_currentBuyPrice,_currentSellPrice,_class],1] spawn Server_Database_Async;
    } forEach _itemArray;

    publicVariable "Server_IE_Prices";

}, true] call Server_Setup_Compile;

/*
    Crane
*/
['A3PL_IE_CraneGetIn', {

    private ["_hook","_crane","_rope1","_rope2","_rope3","_craneEH","_connector"];
    _crane = param [0,objNull];
    _crane allowDamage false;
    if (typeOf _crane != "A3PL_MobileCrane") exitwith {["System: Error initializing IE_MobileCraneInit -> Cannot determine crane",Color_Red] call A3PL_HUD_Notification};

    _hook = createVehicle ["A3PL_Container_Hook", (_crane modelToWorld [-33,-8,0]), [], 0, "CAN_COLLIDE"];
    _connector = "A3PL_FD_HoseEnd1" createVehicle [0,0,0];
    _connector attachTo [_crane, [0, 0, 0], "Cable_1_Start"];
    _rope1 = ropeCreate [_connector, [0,0,0], _hook, (_hook selectionPosition "Cable_1_End"), 25];
    _rope2 = ropeCreate [_connector, [0,0,0], _hook, (_hook selectionPosition "Cable_2_End"), 25];
    _rope3 = ropeCreate [_connector, [0,0,0], _hook, (_hook selectionPosition "Cable_3_End"), 25];

    A3PL_IE_CraneHook = _hook;
    A3PL_IE_CraneConnector = _connector;
    _CraneEH = (FindDisplay 46) DisplayAddEventHandler ["keydown",{_this call A3PL_IE_CraneKeyHandler}];

    waitUntil
    {
        sleep 1;
        _pos = getpos _crane;
        if ((!(_pos inArea [[3690.18,7623.31,0], 43, 7, 143.098, true, 0])) && (!(_pos inArea [[3646.97,7671.58,0], 46, 7, 323.149, true, 0]))) then
        {
            [] spawn A3PL_IE_CraneReset;
        };
        vehicle player == player
    };

    (findDisplay 46) displayRemoveEventhandler ["keydown",_CraneEH];
    ropeDestroy _rope1;
    ropeDestroy _rope2;
    ropeDestroy _rope3;
    deleteVehicle _hook;
    deleteVehicle _connector;

}, false] call Server_Setup_Compile;

['A3PL_IE_CraneKeyHandler', {

    private ["_return","_key","_ropes","_rope1","_rope2","_rope3","_veh"];
    _key = param [1,0];
    _return = false;
    _veh = vehicle player;
    if (typeOf _veh != "A3PL_MobileCrane") exitwith {false;};
    _ropes = ropes A3PL_IE_CraneConnector;
    _rope1 = _ropes select 0;
    _rope2 = _ropes select 1;
    _rope3 = _ropes select 2;

    switch (_key) do
    {
        case 201:
        {
            _val = _veh animationSourcePhase "Turntable";
            _veh animateSource ["Turntable",(_val + 0.0006)];
            _return = true;
        };

        case 209:
        {
            _val = _veh animationSourcePhase "Turntable";
            _veh animateSource ["Turntable",(_val - 0.0006)];
            _return = true;
        };

        case 199:
        {
            _val = _veh animationSourcePhase "Boom";
            _valu = _val + 0.005;
            if (_valu >= 1) then {_valu = 1};
            _veh animateSource ["Boom",_valu];
            _return = true;
        };

        case 207:
        {
            _val = _veh animationSourcePhase "Boom";
            _valu = _val - 0.005;
            if (_valu <= 0) then {_valu = 0};
            _veh animateSource ["Boom",_valu];
            _return = true;
        };

        case 211:
        {
            _val = ropeLength _rope1;
            _valu = _val + 0.06;
            if (_valu >= 50) then {_valu = 50};
            ropeUnwind [_rope1, 30, _valu];
            ropeUnwind [_rope2, 30, _valu];
            ropeUnwind [_rope3, 30, _valu];
            _return = true;
        };

        case 210:
        {
            _val = ropeLength _rope1;
            _valu = _val - 0.06;
            if (_valu <= 0) then {_valu = 0};
            ropeUnwind [_rope1, 30, _valu];
            ropeUnwind [_rope2, 30, _valu];
            ropeUnwind [_rope3, 30, _valu];
            _return = true;
        };

        case 51:
        {
            _val = A3PL_IE_CraneHook animationSourcePhase "Spin";
            _valu = _val + 0.006;
            A3PL_IE_CraneHook animateSource ["Spin",_valu];
            _return = true;
        };

        case 52:
        {
            _val = A3PL_IE_CraneHook animationSourcePhase "Spin";
            _valu = _val - 0.006;
            A3PL_IE_CraneHook animateSource ["Spin",_valu];
            _return = true;
        };

        case 57:
        {
            [] call A3PL_IE_CranePickup;
        };
    };

    _return

}, false] call Server_Setup_Compile;

['A3PL_IE_CranePickup', {

    private ["_crane","_hook","_ship","_hookPos","_cAnim","_container","_cIndex"];
    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    _crane = param [0,objNull];
    _hook = A3PL_IE_CraneHook;
    _ship = (getpos _hook) nearestObject "A3PL_Container_Ship";
    _hookPos = _hook modelToWorld (_hook selectionPosition "spin");

    if ((_hook animationPhase "container") > 0.9) exitwith
    {
        if ((_hookPos inArea [[3690.18,7623.31,0], 43, 7, 143.098, true, 6]) OR (_hookPos inArea [[3646.97,7671.58,0], 46, 7, 323.149, true, 6])) then
        {
            _hook animate ["container",0];

            [] spawn
            {
                ["System: You unloaded a container and earned $100",Color_Green] call A3PL_HUD_Notification;
                player setVariable ["getjobplayerguy",(player getVariable ["getjobplayerguy",0]) + 100,true];
            };
        } else
        {
            ["System: Please drop the container off on the dock"] call A3PL_HUD_Notification;
        };
    };

    if (isNull _ship) exitwith {["System: Cannot find a ship nearby to grab a container from"] call A3PL_HUD_Notification;};

    for "_i" from 1 to 72 do
    {
        _cAnim = format ["c%1",_i];
        if ((_hookPos distance (_ship modelToWorld (_ship selectionPosition _cAnim))) < 5) exitwith {_container = _cAnim; _cIndex = _i;};
    };

    if (isNil "_container") exitwith {["System: The hook is not near a container to grab - #1"] call A3PL_HUD_Notification;};
    if ((_ship animationSourcePhase _container) < 0.9) exitwith {["System: The hook is not near a container to grab - #2"] call A3PL_HUD_Notification;};

    _ship animateSource [_container,0];
    _hook animate ["container",1];
    _hook setObjectTextureGlobal [0,(getObjectTextures _ship) select _cIndex];
    ["System: You succesfully picked up a container, now drop it off on the dock to get paid",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_IE_CraneReset', {

    private ["_ropes","_crane","_hook","_connector","_rope1","_rope2","_rope3"];
    _crane = param [0,vehicle player];

    if (typeOf _crane != "A3PL_MobileCrane") exitwith {["System: Error initializing IE_MobileCraneInit in IE_CraneReset -> Cannot determine crane",Color_Red] call A3PL_HUD_Notification};
    if ((_crane distance2d [3690.18,7623.31,0]) < (_crane distance2d [3650.09,7673.1,0])) then
    {
        _crane setDir 53.0977;
        _crane setposATL [3673.65,7609.55,38];
    } else
    {
        _crane setDir 233.149;
        _crane setposATL [3614.14,7646.33,26];
    };
    A3Pl_IE_CraneHook setpos (_crane modelToWorld [-31.3594,-8.99023,-11.6366]);
    uiSleep 0.5;

    ["System: The crane has been reset",Color_Red] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;
