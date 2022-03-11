/*
    Client
*/
['Caue_Shop_Open', {

    disableSerialization;
    params [
        ["_shop",""]
    ];

    private _posConfig = [_shop,"pos"] call Caue_Config_GetShop;
    private _pos = [];

    if ((typeName _posConfig) == "CODE") then {_pos = call _posConfig;};
    if ((typeName _posConfig) == "OBJECT") then {_pos = getposASL _posConfig;};

    closeDialog 0;
    createDialog "Dialog_Shop";
    private _display = findDisplay 20;

    private _control = _display displayCtrl 1600;
    _control ctrlAddEventHandler ["ButtonDown",format ["['%1','prev'] spawn Caue_Shop_ItemSwitch;",_shop]];
    _control = _display displayCtrl 1601;
    _control ctrlAddEventHandler ["ButtonDown",format ["['%1','next'] spawn Caue_Shop_ItemSwitch;",_shop]];
    _control = _display displayCtrl 1602;
    _control ctrlAddEventHandler ["ButtonDown",format ["['%1'] spawn Caue_Shop_Buy;",_shop]];
    _control = _display displayCtrl 1603;
    _control ctrlAddEventHandler ["ButtonDown",format ["['%1'] spawn Caue_Shop_Sell;",_shop]];

    _control = _display displayCtrl 1900;
    _control sliderSetRange [-180, 180];
    _control sliderSetPosition 0;
    _control ctrlAddEventHandler ["SliderPosChanged",{SHOP_ITEMPREVIEW setDir (param [1,180]);}];

    _control = _display displayCtrl 1400;
    _control ctrlSetFade 1;
    _control ctrlCommit 0;
    _control = _display displayCtrl 1000;
    _control ctrlSetFade 1;
    _control ctrlCommit 0;

    SHOP_CAMERA = "camera" camCreate [0,0,0];
    SHOP_CAMERA camSetPos (positionCameraToWorld [0,0,0]);
    SHOP_CAMERA camSetRelPos [0,0,0];
    SHOP_CAMERA cameraEffect ["internal", "BACK"];
    SHOP_CAMERA camCommit 0;

    SHOP_ITEMINDEX = -1;
    [_shop,"next"] spawn Caue_Shop_ItemSwitch;

    [SHOP_CAMERA] spawn {
        disableSerialization;
        waitUntil {isNull (findDisplay 20)};
        sleep 0.15;
        deleteVehicle SHOP_ITEMPREVIEW;
        {deleteVehicle _x;} foreach _this;
        SHOP_ITEMPREVIEW = nil;
        player cameraEffect ["terminate", "BACK"];
    };

}, false] call Server_Setup_Compile;

['Caue_Shop_ItemSwitch', {

    disableSerialization;

    params [
        ["_shop",""],
        ["_index",""]
    ];

    private _display = findDisplay 20;
    private _allItems = [_shop] call Caue_Config_GetShop;
    private _posConfig = [_shop,"pos"] call Caue_Config_GetShop;

    private _pos = [];
    if ((typeName _posConfig) == "CODE") then {_pos = call _posConfig;};
    if ((typeName _posConfig) == "OBJECT") then {_pos = getposASL _posConfig;};

    private _allItemsCount = (count _allItems) - 1;

    if ((typeName _index) == "STRING") then {
        if (_index == "next") exitwith {
            _index = SHOP_ITEMINDEX + 1;
            if (_index > _allItemsCount) then {_index = 0;};
        };
        if (_index == "prev") then {
            _index = SHOP_ITEMINDEX - 1;
            if (_index < 0) then {_index = _allItemsCount;};
        };
    };

    private _item = _allItems select _index;
    private _itemType = _item select 0;
    private _itemClass = _item select 1;
    private _itemBuy = _item select 2;
    private _itemSell = _item select 3;
    private _type = "item";
    private _itemName = "";
    private _itemObjectClass = "";
    private _type = "";

    switch (_itemType) do {
        case ("aitem"): { _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName"); _itemObjectClass = _itemClass; _type = "wh"; };
        case ("item"): {
            _itemName = [_itemClass,"name"] call Caue_Config_GetItem;
            _itemObjectClass = [_itemClass,"class"] call Caue_Config_GetItem;
            if (((_itemClass splitString "_") select 0) == "furn") then {_type = "furn";};
        };
        case ("backpack"): { _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName"); _itemObjectClass = _itemClass; _type = "wh"; };
        case ("uniform"): { _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName"); _itemObjectClass = _itemClass; _type = "wh"; };
        case ("vest"): { _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName"); _itemObjectClass = _itemClass; _type = "wh"; };
        case ("headgear"): { _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName"); _itemObjectClass = _itemClass; _type = "wh"; };
        case ("vehicle"): { _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName"); _itemObjectClass = _itemClass; _type = "vh"; };
        case ("weapon"): { _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName"); _itemObjectClass = _itemClass; _type = "wh"; };
        case ("magazine"): { _itemName = getText (configFile >> "CfgMagazines" >> _itemClass >> "displayName"); _itemObjectClass = _itemClass; _type = "wh"; };
        case ("goggles"): { _itemName = getText (configFile >> "CfgGlasses" >> _itemClass >> "displayName"); _itemObjectClass = _itemClass; _type = "wh"; };
    };

    private _buyTax = 0;
    private _sellTax = 0;
    private _control = _display displayCtrl 1100;
    if (_shop IN Config_Shops_StockSystem) then {
        private _stock = (server getVariable [_shop,[]]) select _index;
        if (isNil "_stock") exitwith {["Erro ao recuperar o valor do estoque, reabra a loja"] call A3PL_HUD_Notification;};
        _buyTax = round(_itemBuy - (_itemBuy * ((100 - (server getVariable ["SALES_TAX",0]))/100)));
        _sellTax = round(_itemSell - (_itemSell * ((100 - (server getVariable ["SALES_TAX",0]))/100)));
        _control ctrlSetStructuredText parseText format ["<t align='center'>Item: %1 | Estoque: %4<br/>Preço de compra: $%2<br/>Preço de venda: $%3</t>",_itemName, (_itemBuy + _buyTax), (_itemSell - _sellTax), _stock];
    } else {
        _buyTax = round(_itemBuy - (_itemBuy * ((100 - (server getVariable ["SALES_TAX",0]))/100)));
        _sellTax = round(_itemSell - (_itemSell * ((100 - (server getVariable ["SALES_TAX",0]))/100)));
        _control ctrlSetStructuredText parseText format ["<t align='center'>Item: %1 | Estoque: Ilimitado<br/>Preço de compra: $%2<br/>Preço de venda: $%3</t>",_itemName, (_itemBuy + _buyTax), (_itemSell - _sellTax)];
    };

    if !(isNil "SHOP_ITEMPREVIEW") then {deleteVehicle SHOP_ITEMPREVIEW;sleep 0.05;};

    switch (_type) do {
        case ("wh"): {
            SHOP_ITEMPREVIEW = "groundWeaponHolder" createVehicleLocal (getpos Player);
            switch (_itemType) do {
                case ("weapon"): {SHOP_ITEMPREVIEW addWeaponCargo [_itemClass,1];};
                case ("backpack"): {SHOP_ITEMPREVIEW addBackPackCargo [_itemClass,1];};
                case ("magazine"): {SHOP_ITEMPREVIEW addMagazineCargo [_itemClass,1];};
                case ("aitem"): {SHOP_ITEMPREVIEW addItemCargo [_itemClass,1];};
                case ("weaponitem"): {SHOP_ITEMPREVIEW addItemCargo [_itemClass,1];};
                case ("secweaponitem"): {SHOP_ITEMPREVIEW addItemCargo [_itemClass,1];};
                case ("uniform"): {SHOP_ITEMPREVIEW addItemCargo [_itemClass,1];};
                case ("vest"): {SHOP_ITEMPREVIEW addItemCargo [_itemClass,1];};
                case ("headgear"): {SHOP_ITEMPREVIEW addItemCargo [_itemClass,1];};
                case ("goggles"): {SHOP_ITEMPREVIEW addItemCargo [_itemClass,1];};
            };
        };
        default {
            SHOP_ITEMPREVIEW = _itemObjectClass createVehicleLocal [_pos select 0,_pos select 1,(_pos select 2)+0.9];
            SHOP_ITEMPREVIEW allowDamage false;
        };
    };

    switch (_itemClass) do {
        case ("A3PL_Jaws"): { SHOP_ITEMPREVIEW setposATL [_pos select 0,_pos select 1,(_pos select 2)+1.2]; };
        default { SHOP_ITEMPREVIEW setposATL [_pos select 0,_pos select 1,(_pos select 2)+0.9]; };
    };

    if ((typeName _posConfig) == "OBJECT") then { SHOP_ITEMPREVIEW setDir (getDir _posConfig); };

    switch (_type) do {
        case ("vh"): {
            SHOP_CAMERA camSetTarget SHOP_ITEMPREVIEW;
            SHOP_CAMERA camSetRelPos [6,7,0.3];
            SHOP_CAMERA camCommit 0;
        };
        case ("furn"): {
            SHOP_ITEMPREVIEW enableSimulation false;
            SHOP_CAMERA camSetTarget SHOP_ITEMPREVIEW;
            SHOP_CAMERA camSetRelPos [2,3,1];
            SHOP_CAMERA camCommit 0;
        };
        default {
            SHOP_ITEMPREVIEW enableSimulation false;
            SHOP_CAMERA camSetTarget SHOP_ITEMPREVIEW;
            SHOP_CAMERA camSetRelPos [-0.9,0.15,0.3];
            SHOP_CAMERA camCommit 0;
        };
    };

    if (_itemType IN ["item"]) then {
        _control = _display displayCtrl 1400;
        _control ctrlSetText "1";
        _control ctrlSetFade 0;
        _control ctrlCommit 0;
        _control = _display displayCtrl 1000;
        _control ctrlSetFade 0;
        _control ctrlCommit 0;
    } else {
        _control = _display displayCtrl 1400;
        _control ctrlSetFade 1;
        _control ctrlCommit 0;
        _control = _display displayCtrl 1000;
        _control ctrlSetFade 1;
        _control ctrlCommit 0;
    };

    SHOP_ITEMINDEX = _index;

}, false] call Server_Setup_Compile;

['Caue_Shop_Buy', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    params [
        ["_shop",""]
    ];

    private _shopObject = cursorobject;
    private _display = findDisplay 20;
    private _allItems = [_shop] call Caue_Config_GetShop;
    private _item = _allItems select SHOP_ITEMINDEX;
    private _index = SHOP_ITEMINDEX;
    private _itemType = _item select 0;
    private _itemClass = _item select 1;
    private _itemBuy = _item select 2;
    private _requirement = _item select 4;

    if !(call compile _requirement) exitWith {["Você não tem permissão para comprar este item",Color_Red] call A3PL_HUD_Notification;};

    private _amount = 1;
    if (_itemType IN ["item"]) then {
        _amount = round(parseNumber(ctrlText(_display displayCtrl 1400)));
    };
    if (_amount < 1) exitwith {["Por favor insira uma quantia válida",Color_Red] call A3PL_HUD_Notification;};

    private _stockCheck = true;
    if (_shop IN Config_Shops_StockSystem) then {
        if (((server getVariable [_shop,[]]) select _index) < _amount) then {_stockCheck = false;};
    };

    if (!_stockCheck) exitwith {["Não há estoque suficiente disponível para comprar este item!",Color_Red] call A3PL_HUD_Notification;};

    private _totalPrice = _itemBuy*_amount;
    private _tax = round(_totalPrice - (_totalPrice * ((100 - (server getVariable ["SALES_TAX",0]))/100)));
    _totalPrice = _totalPrice + _tax;

    if !((player getVariable ["getjobplayerguy",0]) >= _totalPrice) exitWith {["Você não tem dinheiro suficiente para comprar este item",Color_Red] call A3PL_HUD_Notification;};

    if (_shop IN Config_Shops_StockSystem) then {[_shop,_index,_amount] call Caue_ShopStock_Decrease;};

    private _fail = false;
    private _itemName = "DESCONHECIDO";
    switch (_itemType) do {
        case ("item"): {
            if ([_itemClass,"canPickup"] call Caue_Config_GetItem) then {
                if (([player,[[_itemClass,_amount]]] call Caue_Inventory_TotalWeight) > (player getVariable ["MaxWeight",100])) exitwith {["Você não pode comprar este item porque excederia o limite que você pode carregar!",Color_Red] call A3PL_HUD_Notification; _fail = true;};
                [_itemClass,_amount] call Caue_Inventory_Add;
            } else {
                private _veh = createVehicle [([_itemClass,"class"] call Caue_Config_GetItem), getposATL player, [], 0, "CAN_COLLIDE"];
                if !([_itemClass,"simulation"] call Caue_Config_GetItem) then {[_veh] remoteExec ["Server_Vehicle_EnableSimulation",2];};
                _veh setVariable ["class",_itemClass,true];
                _veh setVariable ["owner",(getPlayerUID player),true];
            };
            _itemName = [_itemClass,"name"] call Caue_Config_GetItem;
        };
        case ("backpack"): {[_itemClass,"backpack",1] spawn Caue_Shop_Crate; _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");};
        case ("uniform"): {[_itemClass,"uniform",1] spawn Caue_Shop_Crate; _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName");};
        case ("vest"): {[_itemClass,"vest",1] spawn Caue_Shop_Crate;  _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName");};
        case ("headgear"): {[_itemClass,"headgear",1] spawn Caue_Shop_Crate; _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName");};
        case ("aitem"): {[_itemClass,"item",1] spawn Caue_Shop_Crate; _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName");};
        case ("weapon"): {[_itemClass,"weapon",1] spawn Caue_Shop_Crate; _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName");};
        case ("magazine"): {[_itemClass,"magazine",1] spawn Caue_Shop_Crate; _itemName = getText (configFile >> "CfgMagazines" >> _itemClass >> "displayName");};
        case ("goggles"): {[_itemClass,"goggles",1] spawn Caue_Shop_Crate; _itemName = getText (configFile >> "CfgGlasses" >> _itemClass >> "displayName");};
        case ("vehicle"): {
            if (_itemClass IN Config_Vehicle_Cars) then {
                [player,[_itemClass,1],"","car"] remoteExec ["Server_Factory_Create",2];
            } else {
                [player,[_itemClass,1],"","plane"] remoteExec ["Server_Factory_Create",2];
            };
            _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");
        };
        case ("plane"): {[player,[_itemClass,1],"","plane"] remoteExec ["Server_Factory_Create", 2]; _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");};
    };

    if (_fail) exitWith {};

    player setVariable ["getjobplayerguy",(player getVariable ["getjobplayerguy",0]) - _totalPrice,true];
    [format ["Você comprou %4 %1 por $%2, agora você tem $%3",_itemName,_totalPrice,(player getVariable ["getjobplayerguy",0]),_amount],Color_Green] call A3PL_HUD_Notification;
    [(getPlayerUID player),_shop,"buy",_itemName,_amount,_totalPrice,(player getVariable ["getjobplayerguy",0])] remoteExec ["Caue_Log_Shop",2];
    ["SALES_TAX",_tax] remoteExec ["Server_Government_ReceiveTax", 2];

    [_shop,_index] spawn Caue_Shop_ItemSwitch;

}, false] call Server_Setup_Compile;

['Caue_Shop_Sell', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    params [
        ["_shop",""]
    ];

    private _display = findDisplay 20;
    private _allItems = [_shop] call Caue_Config_GetShop;
    private _item = _allItems select SHOP_ITEMINDEX;
    private _index = SHOP_ITEMINDEX;
    private _itemType = _item select 0;
    private _itemClass = _item select 1;
    private _itemSell = _item select 3;

    private _amount = 1;
    if (_itemType IN ["item"]) then {
        _amount = round(parseNumber(ctrlText (_display displayCtrl 1400)));
    };
    if (_amount < 1) exitwith {["Por favor insira uma quantia válida",Color_Red] call A3PL_HUD_Notification;};

    private _isAbove = false;
    if (_shop IN Config_Shops_StockSystem) then {
        private _stockVar = server getVariable [_shop,[]];
        private _newStock = (_stockVar select _index) + _amount;
        if (_newStock > 1000) then {_isAbove = true;};
    };
    if (_isAbove) exitwith {["Não é possível vender essa quantidade de item porque a loja não está comprando mais estoque desse item! (estoque máximo 1000)",Color_Red] call A3PL_HUD_Notification;};

    if (_itemClass == "bucket_full") exitwith {["Infelizmente este vendedor não está querendo comprar baldes de peixe! mas você pode processá-los em peixe cru na fábrica de alimentos!",Color_Red] call A3PL_HUD_Notification;};
    if (_itemClass == "net") exitwith {["Infelizmente este vendedor não está querendo comprar redes!",Color_Red] call A3PL_HUD_Notification;};
    if (_itemClass == "bucket_empty") exitwith {["Infelizmente este vendedor não está procurando comprar baldes vazios!",Color_Red] call A3PL_HUD_Notification;};

    private _itemName = "DESCONHECIDO";
    private _has = false;
    switch (_itemType) do {
        case ("item"): {
            if ([_itemClass,_amount] call Caue_Inventory_Has) then {
                [_itemClass,-(_amount)] call Caue_Inventory_Add;
                _has = true;
            } else {
                if !([_itemClass,"canPickup"] call Caue_Config_GetItem) then {
                    private _near = nearestObjects [player,[([_itemClass,"class"] call Caue_Config_GetItem)],5,true];
                    if ((count _near) < _amount) exitWith {["Não é possível vender essa quantidade de item (items muito longe?)!",Color_Red] call A3PL_HUD_Notification;};
                    private _nearcount = 0;
                    {
                        if (_nearcount isEqualTo _amount) exitWith {};
                        if ((_x getVariable "class") == _itemClass) then {
                            _nearcount = _nearcount + 1;
                            deleteVehicle _x;
                            _has = true;
                        };
                    } foreach _near;
                };
            };
            _itemName = [_itemClass,"name"] call Caue_Config_GetItem;
        };

        case ("backpack"): {
            if ((backpack player) == _itemClass) then {
                removeBackpack player;
                _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");
                _has = true;
            };
        };

        case ("vehicle"): {
            private _vehicles = nearestObjects [player,[_itemClass],15];
            private _vehicle = objNull;
            if ((count _vehicles) < 1) exitwith {["Não consegue encontrar o seu veículo por perto! Por favor, mova-o para mais perto da loja para vender!"] call A3PL_HUD_Notification;};
            {
                if (((_x getVariable ["owner",[]]) select 0) == (getPlayerUID player)) exitwith {_vehicle = _x;};
            } foreach _vehicles;
            if (isNull _vehicle) exitwith {["Não consegue encontrar o seu veículo por perto! Por favor, mova-o para mais perto da loja para vender! (Somente o proprietário do veículo pode vendê-lo)"] call A3PL_HUD_Notification;};
            _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");
            [_vehicle] remoteExec ["Server_Vehicle_Sell",2];
            _has = true;
        };

        case ("weapon"): {
            if ((handgunWeapon player) isEqualTo _itemClass) exitwith {
                player removeWeapon _itemClass;
                _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName");
                _has = true;
            };
            if (_itemClass IN (weapons player)) then {
                player removeWeapon _itemClass;
                _itemName = getText (configFile >> "CfgWeapons" >> _itemClass >> "displayName");
                _has = true;
            };
        };

        case ("magazine"): {
            if (_itemClass IN (magazines player)) exitwith {
                player removeMagazine _itemClass;
                _itemName = getText (configFile >> "CfgMagazines" >> _itemClass >> "displayName");
                _has = true;
            };
        };
    };

    if (!_has) exitwith {["Você não tem esse item para vender",Color_Red] call A3PL_HUD_Notification;};

    if (_shop IN Config_Shops_StockSystem) then {[_shop,_index,_amount] call Caue_ShopStock_Add;};

    private _totalSaleValue = _itemSell * _amount;
    private _sellTax = round(_totalSaleValue - (_totalSaleValue * ((100 - (server getVariable ["SALES_TAX",0]))/100)));
    ["SALES_TAX",_sellTax] remoteExec ["Server_Government_ReceiveTax",2];

    _totalSaleValue = _totalSaleValue - _sellTax;

    player setVariable ["getjobplayerguy",((player getVariable ["getjobplayerguy",0]) + _totalSaleValue),true];
    [format["Você vendeu %4 %1 por $%2, agora você tem $%3", _itemName, _totalSaleValue,(player getVariable ["getjobplayerguy",0]),_amount],Color_Green] call A3PL_HUD_Notification;
    [(getPlayerUID player),_shop,"sell",_itemName,_amount,_totalSaleValue,(player getVariable ["getjobplayerguy",0])] remoteExec ["Caue_Log_Shop",2];

    [_shop,_index] spawn Caue_Shop_ItemSwitch;

}, false] call Server_Setup_Compile;

['Caue_Shop_Crate', {

    params [
        ["_class","",[""]],
        ["_type","",[""]],
        ["_amount",1,[1]]
    ];

    if (isNil "shopholder") then {
        shopholder = "plp_ct_WoodBoxLightMedium" createVehicleLocal ([nil, ["water"]] call BIS_fnc_randomPos);
    };

    player disableCollisionWith shopholder;
    shopholder setPosATL (getPosATL player);

    if (_type isEqualTo "weapon") exitWith { shopholder addWeaponCargoGlobal [_class,_amount]; };
    if (_type isEqualTo "magazine") exitWith { shopholder addMagazineCargoGlobal [_class,_amount]; };
    if (_type IN ["headgear","goggles","uniform","vest","item"]) exitWith { shopholder addItemCargoGlobal [_class,_amount]; };
    if (_type isEqualTo "backpack") exitWith { shopholder addBackpackCargoGlobal [_class,_amount]; };

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Shop_BlackMarketNear', {

    private _near = nearestObjects [ship_blackmarket,["man"],35];
    private _nearPlayers = [];
    {
        if ((alive _x) && (isPlayer _x)) then {_nearPlayers pushback _x;};
    } foreach _near;

    private _nearVeh = nearestObjects [ship_blackmarket,["Ship"],70];
    _nearVeh = _nearVeh - [ship_blackMarket];
    {
        if ((count (crew _x)) >= 1) then {_nearPlayers pushback _x;};
    } foreach _nearVeh;

    if ((count _nearPlayers) > 0) then {
        Driver_BlackMarket disableAI "ALL";
        Ship_BlackMarket disableAI "ALL";
        Ship_BlackMarket setVelocity [0,0,0];
        Ship_BlackMarket enableSimulationGlobal false;
    } else {
        Ship_BlackMarket enableAI "ALL";
        Driver_BlackMarket enableAI "ALL";
        Ship_BlackMarket enableSimulationGlobal true;
    };

}, true] call Server_Setup_Compile;

['Server_Shop_BlackMarketPos', {

    private _crateArray = attachedObjects ship_blackmarket;
    private _r = round (random 1);
    private _modelPos = [];

    private _nearPlayers = nearestObjects [ship_blackmarket,["C_man_1"],30];
    {
        if !(isPlayer _x) then {_nearPlayers = _nearPlayers - [_x];};
    } foreach _nearPlayers;

    if ((count _nearPlayers) > 0) exitwith {};

    private _x = 0;
    private _y = 0;
    if (_r == 1) then {
        _x = round(random 14000);
        _y = round(random 4000);
    } else {
        _x = round(random 14000);
        _y = (round(random 5100)) + 9600;
    };

    ship_blackmarket setposASL [_x,_y,((getposASL ship_blackmarket) select 2)];

    Driver_BlackMarket move ([Ship_BlackMarket, 3500, random 360] call BIS_fnc_relPos);

}, true] call Server_Setup_Compile;
