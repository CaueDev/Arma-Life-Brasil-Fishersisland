['Caue_Trunk_Open', {

    params [
        ["_box",objNull]
    ];

    if (isNull _box) exitwith {["A caixa de armazenamento não está disponível"] call A3PL_HUD_Notification;};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};
    if !([] call Caue_Player_AntiSpam) exitWith {closeDialog 0;};

    Trunk_StorageBox = _box;
    Trunk_StorageBox setVariable ["boxinuse",(getPlayerUID player),true];

    [Caue_Trunk_Change,Caue_Trunk_Update] spawn Caue_HUD_Trunk;

}, false] call Server_Setup_Compile;

['Caue_Trunk_Update', {

    params [
        ["_display",displayNull]
    ];

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
    private _vehicleInventory = Trunk_StorageBox getVariable ["vitems",[]];

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

['Caue_Trunk_Change', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    params [
        ["_display",displayNull],
        ["_add",true]
    ];

    if (isNull (missionNamespace getVariable ["Trunk_StorageBox",objNull])) exitwith {["A caixa de armazenamento não está disponível"] call A3PL_HUD_Notification;};
    if !((Trunk_StorageBox getVariable ["boxinuse",""]) isEqualTo (getPlayerUID player)) exitWith {closeDialog 0; ["Outra pessoa já está usando a caixa"] call A3PL_HUD_Notification;};

    _box = Trunk_StorageBox;

    private _ctrlListSelfInventory = _display displayCtrl 37;
    private _ctrlListContainerInventory = _display displayCtrl 45;
    private _ctrlList = [_ctrlListSelfInventory,_ctrlListContainerInventory] select _add;
    private _selRow = lnbCurSelRow _ctrlList;
    private _itemClassname = _ctrlList lnbData [_selRow, 0];
    private _amount = round(parseNumber(ctrlText(_display displayCtrl 39)));

    if (_amount < 1) exitWith {["Por favor insira um número válido",Color_Red] call A3PL_HUD_Notification;};
    if (_itemClassname isEqualTo "") exitWith {["Você não selecionou um item válido na lista",Color_Red] call A3PL_HUD_Notification;};

    private _storage = _box getVariable ["vitems",[]];
    private _inventory = player getVariable ["player_inventory",[]];

    if (_add) then {
        if (_amount > ((_storage select _selRow) select 1)) exitwith {["Você não tem essa quantia",Color_Red] call A3PL_HUD_Notification;};
        if (([player,[[_itemClassname,_amount]]] call Caue_Inventory_TotalWeight) > (player getVariable ["MaxWeight",100])) exitWith {["Você não pode pegar este item porque excederia o limite que você pode carregar!",Color_Red] call A3PL_HUD_Notification;};
        _box setVariable ["vitems",([_storage, _itemClassname, -(_amount),false] call BIS_fnc_addToPairs),true];
        player setVariable ["player_inventory",([_inventory, _itemClassname, _amount,false] call BIS_fnc_addToPairs),true];
        [_box] call Caue_Trunk_Verify;
    } else {
        if (_amount > ((_inventory select _selRow) select 1)) exitwith {["Você não tem essa quantia",Color_Red] call A3PL_HUD_Notification;};
        _box setVariable ["vitems",([_storage, _itemClassname, _amount,false] call BIS_fnc_addToPairs),true];
        player setVariable ["player_inventory",([_inventory, _itemClassname, -(_amount),false] call BIS_fnc_addToPairs),true];
        [] call Caue_Inventory_Verify;
    };

    [_display] spawn Caue_Trunk_Update;
    player playMove 'AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown';

}, false] call Server_Setup_Compile;

['Caue_Trunk_Verify', {

    params [
        ["_box",objNull]
    ];

    private _change = false;
    {
        if ((_x select 1) < 1) then {
            _index = _forEachIndex;
            (_box getVariable "vitems") set [_index, "REMOVE"];
            _change = true;
        };
    } forEach (_box getVariable "vitems");

    if (_change) then {
        _box setVariable ["vitems", ((_box getVariable "vitems") - ["REMOVE"]), true];
    };

}, false] call Server_Setup_Compile;
