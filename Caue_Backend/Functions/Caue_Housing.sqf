/*
    Client
*/
['Caue_Housing_Init', {

    if (isServer) then {};

    private _house = player getVariable ["house",objNull];

    if !(isNull _house) then {
        private _marker = createMarkerLocal [format["house_%1",round (random 1000)],visiblePosition _house];
        _marker setMarkerTypeLocal "mil_triangle";
        _marker setMarkerAlphaLocal 1;
        _marker setMarkerColorLocal "ColorGreen";
        _marker setMarkerTextLocal "Minha Casa";
    };

    HouseReady = true;

}, false] call Server_Setup_Compile;

['Caue_Housing_OpenBuyMenu', {

    params [
        ["_obj",objNull]
    ];

    if (isNull _obj) exitwith {};

    private _houses = nearestObjects [player,["Land_Home1g_DED_Home1g_01_F","Land_Home2b_DED_Home2b_01_F","Land_Home3r_DED_Home3r_01_F","Land_Home4w_DED_Home4w_01_F","Land_Home5y_DED_Home5y_01_F","Land_Home6b_DED_Home6b_01_F","Land_Mansion01","Land_A3PL_Ranch1","Land_A3PL_Ranch2","Land_A3PL_Ranch3","Land_A3PL_ModernHouse1","Land_A3PL_ModernHouse2","Land_A3PL_ModernHouse3","Land_A3PL_BostonHouse","Land_A3PL_Shed2","Land_A3PL_Shed3","Land_A3PL_Shed4"],20];
    if ((count _houses) < 1) exitwith {["Não é possível encontrar casas nas proximidades (Informe um admin)",Color_red] call A3PL_HUD_Notification;};
    if (!isNil {(_houses select 0) getVariable ["owner",nil]}) exitwith {["Esta casa já tem dono",Color_Red] call A3PL_HUD_Notification;};

    private _house = _houses select 0;

    private _price = [_house] call Caue_Housing_GetPrice;
    private _tax = round(_price - (_price * ((100 - (server getVariable ["PROPERTY_TAX",0]))/100)));
    _price = _price + _tax;

    if (["Comprar Casa",format["Esta casa custa $%1 você deseja comprar?",([_price] call Caue_Lib_NumberText)],"Sim","Não"] call Caue_Hud_Prompt) then {
        [_house,_price,_tax] call Caue_Housing_Buy;
    } else {
        closeDialog 0;
    };

}, false] call Server_Setup_Compile;

['Caue_Housing_OpenSellMenu', {

    params [
        ["_obj",objNull]
    ];

    if (isNull _obj) exitwith {};

    private _houses = nearestObjects [player,["Land_Home1g_DED_Home1g_01_F","Land_Home2b_DED_Home2b_01_F","Land_Home3r_DED_Home3r_01_F","Land_Home4w_DED_Home4w_01_F","Land_Home5y_DED_Home5y_01_F","Land_Home6b_DED_Home6b_01_F","Land_Mansion01","Land_A3PL_Ranch1","Land_A3PL_Ranch2","Land_A3PL_Ranch3","Land_A3PL_ModernHouse1","Land_A3PL_ModernHouse2","Land_A3PL_ModernHouse3","Land_A3PL_BostonHouse","Land_A3PL_Shed2","Land_A3PL_Shed3","Land_A3PL_Shed4"],20];
    if ((count _houses) < 1) exitwith {["System: Can't find house nearby (Inform an admin this house is not working properly)",Color_red] call A3PL_HUD_Notification;};
    if (isNil {(_houses select 0) getVariable ["owner",nil]}) exitwith {["Esta casa não tem dono",Color_Red] call A3PL_HUD_Notification;};

    private _house = _houses select 0;

    private _price = [_house] call Caue_Housing_GetPrice;

    if (["Vender Casa",format["Esta casa vale $%1 você deseja vender?",([_price] call Caue_Lib_NumberText)],"Sim","Não"] call Caue_Hud_Prompt) then {
        [_house,_price] call Caue_Housing_Sell;
    } else {
        closeDialog 0;
    };

}, false] call Server_Setup_Compile;

['Caue_Housing_Buy', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_house",objNull],
        ["_price",0],
        ["_tax",0]
    ];

    if ((isNull _house) || (_price isEqualTo 0)) exitWith {};

    if ((player getVariable ["getrankplayerguy",0]) < _price) exitwith {["Você não tem dinheiro suficiente na sua conta bancária para comprar esta casa",Color_Red] call A3PL_HUD_Notification;};
    if (!isNil {_house getVariable ["owner",nil]}) exitwith {["Esta casa já é de alguem",Color_Red] call A3PL_HUD_Notification;};
    if (!isNil {player getVariable ["house",nil]}) exitwith {["Você já possui uma casa",Color_Red] call A3PL_HUD_Notification;};

    [_house,player,true,_price,_tax] remoteExec ["Server_Housing_AssignHouse",2];
    closeDialog 0;
    [format ["Você comprou esta casa por $%1, dos quais $%2 foram impostos", ([_price] call Caue_Lib_NumberText), ([_tax] call Caue_Lib_NumberText)],Color_Green] call A3PL_HUD_Notification;

    [_house] spawn {
        params [["_house",objNull]];
        sleep 3;
        _marker = createMarkerLocal [format["house_%1",round(random 1000)],visiblePosition _house];
        _marker setMarkerTypeLocal "mil_triangle";
        _marker setMarkerAlphaLocal 1;
        _marker setMarkerColorLocal "ColorGreen";
        _marker setMarkerTextLocal "Minha Casa";
    };

}, false] call Server_Setup_Compile;

['Caue_Housing_Sell', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_house",objNull],
        ["_price",0]
    ];

    if ((isNull _house) || (_price isEqualTo 0)) exitWith {};

    if (isNil {_house getVariable ["owner",nil]}) exitwith {["Esta casa não tem dono",Color_Red] call A3PL_HUD_Notification;};
    if (isNil {player getVariable ["house",nil]}) exitwith {["Você não possui uma casa",Color_Red] call A3PL_HUD_Notification;};
    if !(((_house getVariable ["owner", []]) select 0) isEqualTo (getPlayerUID player)) exitWith {["Esta casa não é sua!",Color_Red] call A3PL_HUD_Notification;};

    [_house,player,true,_price] remoteExec ["Server_Housing_RemoveHouse",2];
    closeDialog 0;
    [format["Você vendeu esta casa por $%1",([_price] call Caue_Lib_NumberText)],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Housing_LoadFurniture', {

    params [
        ["_house",objNull],
        ["_pItems",[]]
    ];

    private _objects = [];
    {
        _x params [
            "_classname",
            "_class",
            "_pos",
            "_dir"
        ];
        _pos = _house modelToWorld _pos;

        _obj = createVehicle [_classname,_pos,[],0,"CAN_COLLIDE"];
        _obj setDir _dir;
        _obj setPosATL _pos;
        _obj setVariable ["owner",(getPlayerUID player),true];
        _obj setVariable ["class",_class,true];

        if !([_class,"simulation"] call Caue_Config_GetItem) then {_objects pushBack _obj;};
    } forEach _pitems;

    sleep 0.5;

    [_objects] remoteExec ["Server_Housing_LoadItemsSimulation",2];

}, false] call Server_Setup_Compile;

['Caue_Housing_GetPrice', {

    params [["_house",objNull]];

    private _price = 0;
    switch (typeOf _house) do {
        case ("Land_Home1g_DED_Home1g_01_F"): {_price = 100000;};
        case ("Land_Home2b_DED_Home2b_01_F"): {_price = 100000;};
        case ("Land_Home3r_DED_Home3r_01_F"): {_price = 150000;};
        case ("Land_Home4w_DED_Home4w_01_F"): {_price = 100000;};
        case ("Land_Home5y_DED_Home5y_01_F"): {_price = 120000;};
        case ("Land_Home6b_DED_Home6b_01_F"): {_price = 150000;};
        case ("Land_Mansion01"): {_price = 200000;};
        case ("Land_A3PL_Ranch1"): {_price = 75000;};
        case ("Land_A3PL_Ranch2"): {_price = 75000;};
        case ("Land_A3PL_Ranch3"): {_price = 75000;};
        case ("Land_A3PL_ModernHouse1"): {_price = 300000;};
        case ("Land_A3PL_ModernHouse2"): {_price = 200000;};
        case ("Land_A3PL_ModernHouse3"): {_price = 400000;};
        case ("Land_A3PL_BostonHouse"): {_price = 50000;};
        case ("Land_A3PL_Shed3"): {_price = 30000;};
        case ("Land_A3PL_Shed4"): {_price = 10000;};
        case ("Land_A3PL_Shed2"): {_price = 15000;};
    };

    _price;

}, false] call Server_Setup_Compile;

['Caue_Housing_VirtualOpen', {

    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    disableSerialization;
    params [
        ["_box",objNull]
    ];

    if (isNull _box) exitwith {["A caixa de armazenamento não está disponível"] call A3PL_HUD_Notification;};

    Housing_StorageBox = _box;
    Housing_StorageBox setVariable ["boxinuse",(getPlayerUID player),true];

    [Caue_Housing_VirtualChange,Caue_Housing_VirtualUpdate] spawn Caue_HUD_Trunk;

}, false] call Server_Setup_Compile;

['Caue_Housing_VirtualUpdate', {

    params [
        ["_display",displayNull]
    ];

    private _house = Housing_StorageBox getVariable ["house",objNull];

    /* Controls */
    private _ctrlProgressMyInventory = _display displayCtrl 35;
    private _ctrlTextMyInventory = _display displayCtrl 47;
    private _ctrlProgressVehicleInventory = _display displayCtrl 42;
    private _ctrlTextVehicleInventory = _display displayCtrl 43;

    /* Inventory information */
    private _vehicleVirtualInventorySpace = 1;
    private _vehicleInventoryUsedSpace = 1;
    private _myVirtualInventoryUsedSpace = [player] call Caue_Inventory_TotalWeight;
    private _myVirtualInventorySpace = (player getVariable ["MaxWeight",100]);

    /* Set text */
    _ctrlTextMyInventory ctrlSetText format ["%1 / %2", _myVirtualInventoryUsedSpace, _myVirtualInventorySpace];
    _ctrlTextVehicleInventory ctrlSetText format ["%1 / %2", _vehicleInventoryUsedSpace, _vehicleVirtualInventorySpace];

    /* Set progress positions */
    _ctrlProgressMyInventory progressSetPosition (_myVirtualInventoryUsedSpace / _myVirtualInventorySpace);
    _ctrlProgressVehicleInventory progressSetPosition (_vehicleInventoryUsedSpace / _vehicleVirtualInventorySpace);

    /* Controls Lists */
    private _ctrlListMyInventory = _display displayCtrl 37;
    private _ctrlListVehicleInventory = _display displayCtrl 45;

    private _myInventory = player getVariable ["player_inventory",[]];
    private _vehicleInventory = _house getVariable ["vitems",[]];

    /* Lists Setup */
    for "_i" from 0 to 1 do {
        private _added = [];
        private _arr = [[_ctrlListMyInventory, _myInventory], [_ctrlListVehicleInventory, _vehicleInventory]] select _i;

        _arr params [["_ctrl", controlNull, [controlNull]], ["_data", [], [[]]]];

        lnbClear _ctrl;
        {
            private _itemclass = _x select 0;
            private _quantity = _x select 1;
            if !(_itemclass in _added) then {
                _added pushBack _itemclass;

                private _name = [_itemclass,"name"] call Caue_Config_GetItem;
                private _weight = [_itemclass,"weight"] call Caue_Config_GetItem;
                private _totalWeight = _quantity * _weight;
                private _iconPath = "";

                /* Add into list and set picture and data */
                private _index = _ctrl lnbAddRow ["", _name, str _totalWeight, str _quantity];
                _ctrl lnbSetPicture [[_index, 0], _iconPath];
                _ctrl lnbSetData [[_index, 0], _itemclass];
            };
        } forEach _data;
    };

}, false] call Server_Setup_Compile;

['Caue_Housing_VirtualChange', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    params [
        ["_display",displayNull],
        ["_add",true]
    ];

    private _house = Housing_StorageBox getVariable ["house",objNull];

    if (isNull (missionNamespace getVariable ["Housing_StorageBox",objNull])) exitwith {["A caixa de armazenamento não está disponível"] call A3PL_HUD_Notification;};
    if !((Housing_StorageBox getVariable ["boxinuse",""]) isEqualTo (getPlayerUID player)) exitWith {closeDialog 0; ["Outra pessoa já está usando a caixa"] call A3PL_HUD_Notification;};

    private _ctrlListSelfInventory = _display displayCtrl 37;
    private _ctrlListContainerInventory = _display displayCtrl 45;
    private _ctrlList = [_ctrlListSelfInventory,_ctrlListContainerInventory] select _add;
    private _selRow = lnbCurSelRow _ctrlList;
    private _itemClassname = _ctrlList lnbData [_selRow, 0];
    private _amount = round(parseNumber(ctrlText(_display displayCtrl 39)));

    if (_amount < 1) exitWith {["Por favor insira um número válido",Color_Red] call A3PL_HUD_Notification;};
    if (_itemClassname isEqualTo "") exitWith {["Você não selecionou um item válido na lista",Color_Red] call A3PL_HUD_Notification;};

    private _storage = _house getVariable ["vitems",[]];
    private _inventory = player getVariable ["player_inventory",[]];

    if (_add) then {
        if (_amount > ((_storage select _selRow) select 1)) exitwith {["Você não tem essa quantia",Color_Red] call A3PL_HUD_Notification;};
        if (([player,[[_itemClassname,_amount]]] call Caue_Inventory_TotalWeight) > (player getVariable ["MaxWeight",100])) exitWith {["Você não pode pegar este item porque excederia o limite que você pode carregar!",Color_Red] call A3PL_HUD_Notification;};
        _house setVariable ["vitems",([_storage, _itemClassname, -(_amount),false] call BIS_fnc_addToPairs),true];
        player setVariable ["player_inventory",([_inventory, _itemClassname, _amount,false] call BIS_fnc_addToPairs),true];
        [_house] call Caue_Housing_VirtualVerify;
    } else {
        if (_amount > ((_inventory select _selRow) select 1)) exitwith {["Você não tem essa quantia",Color_Red] call A3PL_HUD_Notification;};
        _house setVariable ["vitems",([_storage, _itemClassname, _amount,false] call BIS_fnc_addToPairs),true];
        player setVariable ["player_inventory",([_inventory, _itemClassname, -(_amount),false] call BIS_fnc_addToPairs),true];
        [] call Caue_Inventory_Verify;
    };

    [_display] spawn Caue_Housing_VirtualUpdate;
    player playMove 'AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown';

}, false] call Server_Setup_Compile;

['Caue_Housing_VirtualVerify', {

    params [
        ["_house",objNull]
    ];

    private _change = false;
    {
        if ((_x select 1) < 1) then {
            _index = _forEachIndex;
            (_house getVariable "vitems") set [_index, "REMOVE"];
            _change = true;
        };
    } forEach (_house getVariable "vitems");

    if (_change) then {
        _house setVariable ["vitems", ((_house getVariable "vitems") - ["REMOVE"]), true];
    };

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Housing_Initialize', {

    private _houses = ["House_Init",2,true] call Server_Database_Async;
    {
        _x params [
            "_uid",
            "_pos"
        ];
        _pos = call compile _pos;

        private _near = nearestObjects [_pos,["Land_Home1g_DED_Home1g_01_F","Land_Home2b_DED_Home2b_01_F","Land_Home3r_DED_Home3r_01_F","Land_Home4w_DED_Home4w_01_F","Land_Home5y_DED_Home5y_01_F","Land_Home6b_DED_Home6b_01_F","Land_Mansion01","Land_A3PL_Ranch1","Land_A3PL_Ranch2","Land_A3PL_Ranch3","Land_A3PL_ModernHouse1","Land_A3PL_ModernHouse2","Land_A3PL_ModernHouse3","Land_A3PL_BostonHouse","Land_A3PL_Shed2","Land_A3PL_Shed3","Land_A3PL_Shed4"],10,true];

        if ((count _near) isEqualTo 0) exitwith {[format["House_InitDelete:%1",_pos],1] spawn Server_Database_Async;};

        _near = _near select 0;
        if !([_pos,(getPosATL _near)] call BIS_fnc_areEqual) then {[format["House_InitUpdate:%1:%2",(getPosATL _near),_pos],1] spawn Server_Database_Async;};

        private _signs = nearestObjects [_pos,["Land_A3PL_EstateSign"],25,true];
        if ((count _signs) > 0) then {(_signs select 0) setObjectTextureGlobal [0,"\A3PL_Objects\Street\estate_sign\house_rented_co.paa"];};

        _near setVariable ["owner",[_uid],true];

        Server_HouseList pushback _near;
    } forEach _houses;

}, true] call Server_Setup_Compile;

['Server_Housing_AssignHouse', {

    params [
        ["_object",objNull],
        ["_player",objNull],
        ["_takeMoney",true],
        ["_price",0],
        ["_tax",0]
    ];

    private _uid = getPlayerUID _player;
    _object setVariable ["owner",[_uid],true];

    if (_takeMoney) then {
        ["PROPERTY_TAX",_tax] spawn Server_Government_ReceiveTax;
        _player setVariable ["getrankplayerguy",((_player getVariable["getrankplayerguy",0]) - _price),true];
    };

    if !(_object IN Server_HouseList) then {
        Server_HouseList pushback _object;
    };

    _pos = getPosATL _object;
    [format["House_Assign:%1:%2",_uid,_pos],1] spawn Server_Database_Async;

    _player setVariable ["house",_object,true];

    _signs = nearestObjects [_object,["Land_A3PL_EstateSign"],20];
    if ((count _signs) > 0) then {(_signs select 0) setObjectTextureGlobal [0,"\A3PL_Objects\Street\estate_sign\house_rented_co.paa"];};

}, true] call Server_Setup_Compile;

['Server_Housing_RemoveHouse', {

    params [
        ["_object",objNull],
        ["_player",objNull],
        ["_giveMoney",true],
        ["_price",0]
    ];

    private _uid = getPlayerUID _player;
    _object setVariable ["owner",nil,true];

    if (_giveMoney) then {
        _player setVariable ["getrankplayerguy",((_player getVariable["getrankplayerguy", 0]) + _price),true];
    };

    _player setVariable ["house",nil,true];

    [_object] spawn {
        params [["_object",objNull]];

        if (_object IN Server_HouseList) then {
            {
                if (_x isEqualTo _object) exitWith {
                    Server_HouseList deleteAt _forEachIndex;
                };
            } forEach Server_HouseList;
        };
    };

    [format["House_Remove:%1",_uid],1] spawn Server_Database_Async;

    private _signs = nearestObjects [_object,["Land_A3PL_EstateSign"],20];
    if ((count _signs) > 0) then {(_signs select 0) setObjectTextureGlobal [0,"\A3PL_Objects\Street\estate_sign\house_sale_co.paa"];};

}, true] call Server_Setup_Compile;

['Server_Housing_LoadItems', {

    params [
        ["_player",objNull],
        ["_house",objNull],
        ["_uid",""]
    ];

    if (isNull _player) exitWith {};

    if (_house getVariable ["furn_loaded",false]) exitwith {};
    _house setVariable ["furn_loaded",true,false];

    private _query = [format["House_LoadFurniture:%1",(getPosATL _house)],2] call Server_Database_Async;
    _query params [
        "_furnitures",
        "_pitems",
        "_vitems"
    ];
    _furnitures = [_furnitures] call Server_Database_ToArray;
    _pitems = [_pitems] call Server_Database_ToArray;
    _vitems = [_vitems] call Server_Database_ToArray;

    _house setVariable ["pitems",_pitems,true];
    _house setVariable ["vitems",_vitems,true];

    [_house,_furnitures] remoteExec ["Caue_Housing_LoadFurniture",(owner _player)];

}, true] call Server_Setup_Compile;

['Server_Housing_LoadItemsSimulation', {

    params [
        ["_objects",[]]
    ];

    {
        _x enableSimulationGlobal false;
    } forEach _objects;

}, true] call Server_Setup_Compile;

['Server_Housing_SaveItems', {

    params [
        ["_player",objNull],
        ["_uid",""],
        ["_delete",true]
    ];

    private _house = _player getVariable ["house",objNull];
    private _items = nearestObjects [_house,[],20];
    private _box = _house getVariable ["box",objNull];

    if !(isNull _box) then {
        [_box] spawn Server_Housing_SaveBox;
    };

    _house setVariable ["furn_loaded",false,false];

    private _itemsToSave = [];
    {
        if (!isNil {_x getVariable "class"}) then {
            if ((_x getVariable "owner") isEqualTo _uid) then {_itemsToSave pushback _x;};
        };
    } forEach _items;

    private _furnitures = [];
    {
        _furnitures pushback [(typeOf _x),(_x getVariable "class"),(_house worldToModel (getposATL _x)),getDir _x];
        if (_delete) then {deleteVehicle _x;};
    } forEach _itemsToSave;

    private _pitems = _house getVariable ["pitems",[]];
    private _vitems = _house getVariable ["vitems",[]];

    [format["House_SaveFurniture:%1:%2:%3:%4",([_furnitures] call Server_Database_Array),([_pitems] call Server_Database_Array),([_vitems] call Server_Database_Array),(getPosATL _house)],1] spawn Server_Database_Async;

}, true] call Server_Setup_Compile;

['Server_Housing_LoadBox', {

    params [
        ["_player",objNull],
        ["_house",objNull]
    ];

    private _pos = getPosATL _player;

    if (!isNil {_house getVariable "box_spawned"}) exitwith {};

    _house setVariable ["box_spawned",true,false];

    private _pitems = _house getVariable ["pitems",[]];
    if (_pitems isEqualTo []) then {
        _pitems = [[],[],[],[]];
    };

    private _box = createVehicle ["plp_ct_FootlockerBrown",_pos,[],0,"CAN_COLLIDE"];
    clearItemCargoGlobal _box;
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;

    _box setVariable ["house",_house,true];
    _house setVariable ["box",_box,true];

    private _weapons = _pitems select 0;
    private _magazines = _pitems select 1;
    private _actualitems = _pitems select 2;
    private _backpacks = _pitems select 3;

    {_box addWeaponCargoGlobal [_x,1]} foreach _weapons;
    {_box addMagazineCargoGlobal [_x,1]} foreach _magazines;
    {_box addItemCargoGlobal [_x,1]} foreach _actualitems;
    {_box addBackpackCargoGlobal [_x,1]} foreach _backpacks;

}, true] call Server_Setup_Compile;

['Server_Housing_SaveBox', {

    params [
        ["_box",objNull]
    ];

    if (isNull _box) exitWith {};

    private _house = _box getVariable ["house",objNull];

    if (isNull _house) exitWith {};

    private _pos = getPosATL _house;

    _house setVariable ["pitems",[weaponCargo _box, magazineCargo _box, itemCargo _box, backpackCargo _box],true];

    _box setVariable ["house",objNull,true];
    deleteVehicle _box;

    _house setVariable ["box_spawned",nil,false];
    _house setVariable ["box",objNull,false];

}, true] call Server_Setup_Compile;
