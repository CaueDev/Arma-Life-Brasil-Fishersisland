/*
    Client
*/
['Caue_Robbery_Placeables', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};
    if !([] call Caue_Lib_InputAccess) exitWith {};
    if !(isNil "Robbery_Object") exitWith {["Você ja esta roubando um objeto",Color_Red] call A3PL_HUD_Notification;};

    params [["_obj",objNull]];

    if (isNull _obj) exitWith {};

    private _classname = _obj getVariable ["class",nil];
    if (isNil "_classname") exitwith {["Não é possível pegar, objeto não contém nenhuma classe", Color_Red] call A3PL_HUD_Notification;};

    Robbery_Object = _obj;
    private _code = {player distance Robbery_Object < 3};

    if ([30,"Roubando objeto...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default",_code] call Caue_HUD_Progress) then {
        if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};
        [_obj,player] remoteExec ["A3PL_Lib_ChangeLocality",2];
        _obj setVariable ["owner",(getPlayerUID player),true];
    } else {
        ["Cancelado",Color_Red] call A3PL_HUD_Notification;
    };

    Robbery_Object = nil;

}, false] call Server_Setup_Compile;

["Caue_Robbery_ItemsDrop", {

    params [
        ["_unit",objNull]
    ];

    if (isNull _unit) exitWith {};

    private _pos = _unit modelToWorld[0,1,0];
    _pos = [(_pos select 0),(_pos select 1),((getPosATL _unit) select 2)];
    private _items = _unit getVariable ["player_inventory",[]];
    if ((count _items) > 0) then {
        private _obj = "Land_Sleeping_bag_folded_F" createVehicle _pos;
        [_obj,true,false] remoteExec ["Server_Vehicle_EnableSimulation",2];
        {_x disableCollisionWith _obj;} forEach allPlayers;
        _obj setPos _pos;
        _unit setVariable ["player_inventory",[],true];
        if ((_unit getVariable ["getjobplayerguy",0]) > 0) then {
            _items pushBack (["taxidriver",(_unit getVariable ["getjobplayerguy",0])]);
            _unit setVariable ["getjobplayerguy",0,true];
        };
        _obj setVariable ["vitems",_items,true];
    };

}, false] call Server_Setup_Compile;

["Caue_Robbery_ItemsOpen", {

    params [
        ["_obj",objNull]
    ];

    if (isNull _obj) exitwith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};
    if !([] call Caue_Lib_InputAccess) exitWith {closeDialog 0;};

    Caue_RobberyItems = _obj;
    _obj setVariable ["boxinuse",(getPlayerUID player),true];

    [Caue_Robbery_ItemsChange,Caue_Robbery_ItemsUpdate] spawn Caue_HUD_Trunk;

}, false] call Server_Setup_Compile;

['Caue_Robbery_ItemsUpdate', {

    params [
        ["_display",displayNull]
    ];

    private _items = Caue_RobberyItems getVariable ["vitems",[]];

    private _ctrlProgressMyInventory = _display displayCtrl 35;
    private _ctrlTextMyInventory = _display displayCtrl 47;
    private _ctrlProgressVehicleInventory = _display displayCtrl 42;
    private _ctrlTextVehicleInventory = _display displayCtrl 43;
    private _ctrlControlsGroupFooter = _display displayCtrl 46;
    private _ctrlButtonStore = _ctrlControlsGroupFooter controlsGroupCtrl 50;
    _ctrlButtonStore ctrlShow false;

    private _vehicleVirtualInventorySpace = 1;
    private _vehicleInventoryUsedSpace = 1;
    private _myVirtualInventoryUsedSpace = [player] call Caue_Inventory_TotalWeight;
    private _myVirtualInventorySpace = (player getVariable ["MaxWeight",100]);

    _ctrlTextMyInventory ctrlSetText format ["%1 / %2", _myVirtualInventoryUsedSpace, _myVirtualInventorySpace];
    _ctrlTextVehicleInventory ctrlSetText format ["%1 / %2", _vehicleInventoryUsedSpace, _vehicleVirtualInventorySpace];

    _ctrlProgressMyInventory progressSetPosition (_myVirtualInventoryUsedSpace / _myVirtualInventorySpace);
    _ctrlProgressVehicleInventory progressSetPosition (_vehicleInventoryUsedSpace / _vehicleVirtualInventorySpace);

    private _ctrlListMyInventory = _display displayCtrl 37;
    private _ctrlListVehicleInventory = _display displayCtrl 45;

    private _myInventory = player getVariable ["player_inventory",[]];
    private _vehicleInventory = Caue_RobberyItems getVariable ["vitems",[]];

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

                private _index = _ctrl lnbAddRow ["", _name, str _totalWeight, str _quantity];
                _ctrl lnbSetPicture [[_index, 0], _iconPath];
                _ctrl lnbSetData [[_index, 0], _itemclass];
            };
        } forEach _data;
    };

}, false] call Server_Setup_Compile;

['Caue_Robbery_ItemsChange', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};
    if ((count (Caue_RobberyItems getVariable ["vitems",[]])) isEqualTo 0) exitWith {deleteVehicle Caue_RobberyItems; closeDialog 0;};

    params [
        ["_display",displayNull],
        ["_add",true]
    ];

    if (!_add) exitWith {};
    if (isNull Caue_RobberyItems) exitwith {["A caixa de armazenamento não está disponível"] call A3PL_HUD_Notification;};
    if !((Caue_RobberyItems getVariable ["boxinuse",""]) isEqualTo (getPlayerUID player)) exitWith {closeDialog 0; ["Outra pessoa já está usando a caixa"] call A3PL_HUD_Notification;};

    private _ctrlListSelfInventory = _display displayCtrl 37;
    private _ctrlListContainerInventory = _display displayCtrl 45;
    private _ctrlList = [_ctrlListSelfInventory,_ctrlListContainerInventory] select _add;
    private _selRow = lnbCurSelRow _ctrlList;
    private _itemClassname = _ctrlList lnbData [_selRow, 0];
    private _amount = round(parseNumber(ctrlText(_display displayCtrl 39)));

    if (_amount < 1) exitWith {["Por favor insira um número válido",Color_Red] call A3PL_HUD_Notification;};
    if (_itemClassname isEqualTo "") exitWith {["Você não selecionou um item válido na lista",Color_Red] call A3PL_HUD_Notification;};

    private _storage = Caue_RobberyItems getVariable ["vitems",[]];
    private _inventory = player getVariable ["player_inventory",[]];

    if (_add) then {
        if (_amount > ((_storage select _selRow) select 1)) exitwith {["Não tem essa quantia",Color_Red] call A3PL_HUD_Notification;};
        if (([player,[[_itemClassname,_amount]]] call Caue_Inventory_TotalWeight) > (player getVariable ["MaxWeight",100])) exitWith {["Você não pode pegar este item porque excederia o limite que você pode carregar!",Color_Red] call A3PL_HUD_Notification;};
        if (_itemClassname isEqualTo "taxidriver") then {
            Caue_RobberyItems setVariable ["vitems",([_storage, _itemClassname, -(_amount),false] call BIS_fnc_addToPairs),true];
            player setVariable ["getjobplayerguy",((player getVariable ["getjobplayerguy",0]) + _amount),true];
        } else {
            Caue_RobberyItems setVariable ["vitems",([_storage, _itemClassname, -(_amount),false] call BIS_fnc_addToPairs),true];
            player setVariable ["player_inventory",([_inventory, _itemClassname, _amount,false] call BIS_fnc_addToPairs),true];
        };
        [Caue_RobberyItems] call Caue_Housing_VirtualVerify;
        player playMove 'AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown';
        [(getPlayerUID player),"RobberyPickup",[_itemClassname,_amount]] remoteExec ["Caue_Log_Misc",2];
    };

    if ((count (Caue_RobberyItems getVariable ["vitems",[]])) isEqualTo 0) exitWith {deleteVehicle Caue_RobberyItems;};

    [_display] spawn Caue_Robbery_ItemsUpdate;

}, false] call Server_Setup_Compile;

['Caue_Robbery_PatDownAction', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {};
    if !([] call Caue_Lib_InputAccess) exitWith {};

    params [
        ["_target",objNull],
        ["_money",false]
    ];

    if (isNull _target) exitWith {};
    if !(isPlayer _target) exitWith {};
    if !((animationState _target) IN ["A3PL_HandsupToKneel","A3PL_HandsupKneelGetCuffed","A3PL_Cuff","a3pl_handsupkneelcuffed","a3pl_handsupkneelkicked","A3PL_CuffKickDown","a3pl_idletohandsup","a3pl_kneeltohandsup","a3pl_handsuptokneel","A3PL_HandsupKneel"]) exitWith {hint "oi";};
    if !(isNil "Robbery_PatdownTarget") exitWith {};

    if (!((player getVariable ["job","unemployed"]) IN ["police","dmv"]) && ((count(["police"] call A3PL_Lib_FactionPlayers)) < 2)) exitwith {["É preciso haver no mínimo 2 policiais on-line para assaltar!",Color_Red] call A3PL_HUD_Notification;};

    Robbery_PatdownTarget = _target;
    Robbery_PatdownTarget setVariable ["patdownplayer",(getPlayerUID player),true];

    private _code = {
        if (player distance Robbery_PatdownTarget > 5) exitWith {false;};
        if !((Robbery_PatdownTarget getVariable ["patdownplayer",""]) isEqualTo (getPlayerUID player)) exitWith {false;};
        true;
    };

    playSound3D ["cauedev.github.io\sounds\crime\patdown.ogg", player, false, getPos player, 3, 1, 15];
    if ([10,"Revistando...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default",_code] call Caue_HUD_Progress) then {
        [_money] remoteExecCall ["Caue_Robbery_PatDown",_target];
        {[player,_x] spawn Caue_Keys_Add;} forEach (_target getVariable ["keys",[]]);
    } else {
        ["Cancelado",Color_Red] call A3PL_HUD_Notification;
    };

    Robbery_PatdownTarget = nil;

}, false] call Server_Setup_Compile;

['Caue_Robbery_PatDown', {

    if !([] call Caue_Anticheat_LagSwitch) exitWith {};

    params [
        ["_money",false]
    ];

    private _safeItems = ["ItemMap","ItemCompass","ItemWatch","Binocular"];
    private _weps = [];
    private _all = [];

    private _pwItems = primaryWeaponItems player;
    private _swItems = secondaryWeaponItems player;
    private _hgitems = handGunItems player;
    private _assItems = assignedItems player;
    private _invItems = items player;
    private _weapons = weapons player;

    {
    	private _temp = _x;
    	{
    		if (!(_x in _weapons) && !(_x in _safeItems)) then {_all pushBack _x;};
    	} forEach _temp;
    } forEach [_assItems,_invItems];

    private _mags = magazinesAmmoFull player;
    {player removeMagazine _x} foreach (magazines player);

    if !((primaryWeapon player) isEqualTo "") then {
    	_weps pushBack (primaryWeapon player);
    	player removeWeapon (primaryWeapon player);
    };

    if !((secondaryWeapon player) isEqualTo "") then {
    	_weps pushBack (secondaryWeapon player);
    	player removeWeapon (secondaryWeapon player);
    };

    if !((handgunWeapon player) isEqualTo "") then {
    	_weps pushBack (handgunWeapon player);
    	player removeWeapon (handgunWeapon player);
    };

    {
    	private _items = _x;
    	{
    		player unassignItem _x;
    		player removeItem _x;
    	} forEach _items;
    } forEach [_hgItems, _pwItems, _swItems, _all];

    {
    	if (!(_x in _safeItems)) then {
    		player removeItem _x;
    		_weps pushBack _x;
    	};
    } forEach (weapons player);

    private _holder = createVehicle ["GroundWeaponHolder",getPosATL player,[],0,"CAN_COLLIDE"];

    {
    	_holder addWeaponCargoGlobal [_x,1];
    } forEach _weps;

    {
    	_holder addMagazineCargoGlobal [_x select 0,1];
    } forEach _mags;

    {
    	private _items = _x;
    	{
    		_holder addItemCargoGlobal [_x,1];
    	} forEach _items;
    } forEach [_hgItems,_pwItems,_swItems,_all];

    [player] call Caue_Robbery_ItemsDrop;

    ["Voce foi revistado!",Color_Yellow] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Robbery_Shop', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {};
    if !([] call Caue_Lib_InputAccess) exitWith {};

    params [["_shop",objNull]];

    if !(isNil "Robbery_Shop") exitWith {};
    if ((count(["police"] call A3PL_Lib_FactionPlayers)) < 2) exitwith {[format["É preciso haver no mínimo %1 policiais on-line para roubar!",2],Color_Red] call A3PL_HUD_Notification;};
    if ((player distance _shop) > 20) exitwith {["Voce precisa estar mais perto para roubar esta loja!",Color_Red] call A3PL_HUD_Notification;};
    if !((vehicle player) isEqualTo player) exitWith {["Saia do veiculo!",Color_Red] call A3PL_HUD_Notification;};
    if !((server getVariable ["RobberyShopActive",""]) isEqualTo "") exitWith {["Uma loja ja esta sendo roubada",Color_Red] call A3PL_HUD_Notification;};

    if ((currentWeapon player) isEqualTo "") exitWith {["Você não pode roubar ninguém sem o equipamento adequado, pegue uma arma primeiro!",Color_Red] call A3PL_HUD_Notification;};
    if ((currentWeapon player) IN ["Rangefinder","Binocular","A3PL_FireAxe","A3PL_Pickaxe","A3PL_Shovel"]) exitWith {["Você não pode roubar ninguém sem o equipamento adequado, pegue uma arma primeiro!",Color_Red] call A3PL_HUD_Notification;};

    private _cash = 8000 + round(random 10000);

    server setVariable ["RobberyShopActive",(getPlayerUID player),true];
    [_shop,"AmovPercMstpSsurWnonDnon"] remoteExec ["A3PL_Lib_SyncAnim",-2];
    playSound3D ["cauedev.github.io\sounds\alarms\robAlarm.ogg",_shop,true,_shop,3,1,250];

    [player,_shop] remoteExec ["Caue_Robbery_ShopPolice",(["police"] call A3PL_Lib_FactionPlayers)];

    Caue_InterruptedDisabled = true;
    Robbery_Shop = _shop;
    private _code = {
        ((player distance Robbery_Shop) < 7.1) && ((server getVariable ["RobberyShopActive",""]) isEqualTo (getPlayerUID player))
    };

    if ([300,"Roubando a loja, fique dentro de 7 metros","","",_code] call Caue_HUD_Progress) then {
        playSound3D ["cauedev.github.io\sounds\alarms\robAlarm.ogg",_shop,true,_shop,3,1,250];
        [format["Uma loja acabou de ser roubada: a quantia roubada foi de $%1! Se você viu os ladrões, entre em contato com a polícia!",([_cash] call Caue_Lib_NumberText)],Color_Yellow] remoteExec ["A3PL_HUD_Notification",-2];
        player setVariable ["getjobplayerguy",((player getVariable ["getjobplayerguy",0]) + _cash),true];
        if ((round(random 100)) < 33) then {
    		sleep 25;
    		if !((vehicle player) isEqualTo player) then {
    			private _getawayVeh = (vehicle player) getVariable["owner",[]] select 1;
    			private _carType = getText(configFile >> "CfgVehicles" >> (typeOf (vehicle player)) >> "displayName");
    			_police = ["police"]call A3PL_Lib_FactionPlayers;
    			[format["Dispatch: Suspeito visto pela última vez em um(a) %1 com a placa %2",_carType, _getawayVeh],Color_Yellow] remoteExec ["A3PL_HUD_Notification",(["police"] call A3PL_Lib_FactionPlayers)];
    		};
    	};
    } else {
        ["Cancelado!",Color_Red] call A3PL_HUD_Notification;
    };

    [_shop,""] remoteExec ["A3PL_Lib_SyncAnim",-2];
    Robbery_Shop = nil;
    Caue_InterruptedDisabled = nil;
    server setVariable ["RobberyShopActive","",true];

}, false] call Server_Setup_Compile;

['Caue_Robbery_ShopPolice', {

    params [
        ["_player",objNull],
        ["_shop",objNull]
    ];

    if ((isNull _player) || (isNull _shop)) exitWith {};

    private _marker = createMarker [format["robshopmarker_%1",round(random(1000))],(getPos _shop)];
    _marker setMarkerColor "ColorRed";
    _marker setMarkerText ">>> Roubo em andamento <<<";
    _marker setMarkerType "mil_warning";

    ["Dispatch: Roubo em andamento",Color_Yellow] call A3PL_HUD_Notification;
    playSound "sdpanic";

    uiSleep 150;
    deleteMarker _marker;

}, false] call Server_Setup_Compile;
