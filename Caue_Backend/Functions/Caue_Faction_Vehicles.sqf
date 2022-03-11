/*
	Client
*/
["Caue_FactionVehicles_Open", {

	disableSerialization;
	params [
		["_shopType", ""]
	];

	createDialog "Dialog_Shop";
    private _display = findDisplay 20;

    private _control = _display displayCtrl 1600;
    _control ctrlAddEventHandler ["ButtonDown",format["['%1','prev'] spawn Caue_FactionVehicles_Switch;",_shopType]];
    _control = _display displayCtrl 1601;
    _control ctrlAddEventHandler ["ButtonDown",format["['%1','next'] spawn Caue_FactionVehicles_Switch;",_shopType]];
    _control = _display displayCtrl 1602;
	_control ctrlSetText "Retirar";
    _control ctrlAddEventHandler ["ButtonDown",format["['%1'] call Caue_FactionVehicles_Request;",_shopType]];
	_control = _display displayCtrl 1603;
	_control ctrlSetText "Devolver";
    _control ctrlAddEventHandler ["ButtonDown",format["['%1'] call Caue_FactionVehicles_GiveBack;",_shopType]];

    _control = _display displayCtrl 1900;
    _control sliderSetRange [-180, 180];
    _control sliderSetPosition 0;
    _control ctrlAddEventHandler ["SliderPosChanged", {SHOP_ITEMPREVIEW setDir (param [1,180]);}];

    _control = _display displayCtrl 1400;
    _control ctrlSetFade 1;
    _control ctrlCommit 0;
    _control = _display displayCtrl 1000;
    _control ctrlSetFade 1;
    _control ctrlCommit 0;

    SHOP_CAMERA = "camera" camCreate [0,0,0];
    SHOP_CAMERA camSetPos (positionCameraToWorld [0,0,0]);
    SHOP_CAMERA camSetRelPos [0,0,0];
    SHOP_CAMERA cameraEffect ["internal","BACK"];
    SHOP_CAMERA camCommit 0;

    CAUE_SHOP_ITEMINDEX = -1;
    [_shopType,"next"] spawn Caue_FactionVehicles_Switch;

    [SHOP_CAMERA] spawn {
        disableSerialization;
		waitUntil {isNull (findDisplay 20)};
        deleteVehicle SHOP_ITEMPREVIEW;
        {deleteVehicle _x;} foreach _this;
        SHOP_ITEMPREVIEW = nil;
        player cameraEffect ["terminate","BACK"];
    };

}, false] call Server_Setup_Compile;

["Caue_FactionVehicles_Switch", {

	disableSerialization;
	params [
		["_shopType", ""],
		["_command", "next"]
	];

	private _shop = switch (_shopType) do {
		case "fifr": {"Shop_FIFR_Vehicle_Vendor";};
		case "uscg": {"Shop_USCG_Car_Vendor";};
		case "police": {"Shop_SD_Vehicles_Vendor";};
		case "uscg_b": {"Shop_USCG_Boat_Vendor";};
		case "uscg_h": {"Shop_USCG_Plane_Vendor";};
		case "dmv": {"Shop_DMV_Vehicles_Vendor";};
		case "faa": {"Shop_FAA_Vehicles_Vendor";};
		case "doj": {"Shop_DOJ_Vehicles_Vendor";};
	};

	private _allItems = [_shop] call Caue_Config_GetShop;
	private _posConfig = [_shop, "pos"] call Caue_Config_GetShop;

	private _pos = [0,0,0];

	if ((typeName _posConfig) == "CODE") then {_pos = call _posConfig;};
    if ((typeName _posConfig) == "OBJECT") then {_pos = getposASL _posConfig;};

	private _allItemsCount = (count _allItems) - 1;
	private _index = 0;

	if (_command isEqualTo "next") then {
		_index = CAUE_SHOP_ITEMINDEX + 1;
		if (_index > _allItemsCount) then {_index = 0;};
	} else {
		_index = CAUE_SHOP_ITEMINDEX - 1;
		if (_index < 0) then {_index = _allItemsCount;};
	};

	private _stock = switch (_shopType) do {
		case "fifr": {FIFR_VEHICLE_STOCK;};
		case "uscg": {USCG_VEHICLE_STOCK;};
		case "police": {POLICE_VEHICLE_STOCK;};
		case "uscg_b": {USCG_BOAT_STOCK;};
		case "uscg_h": {USCG_HELI_STOCK;};
		case "dmv": {DMV_VEHICLE_STOCK;};
		case "faa": {FAA_VEHICLE_STOCK;};
		case "doj": {DOJ_VEHICLE_STOCK;};
	};

    private _item = _allItems select _index;
    private _itemClass = _item select 1;
	private _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");

	private _display = findDisplay 20;
	private _control = _display displayCtrl 1100;
	_control ctrlSetStructuredText parseText format ["<t align='center'>Veiculo: %1 <br/> Disponiveis: %2</t>",_itemName,_stock select _index];

	if !(isNil "SHOP_ITEMPREVIEW") then {deleteVehicle SHOP_ITEMPREVIEW;sleep 0.05;};

	SHOP_ITEMPREVIEW = _itemClass createVehicleLocal [_pos select 0, _pos select 1, (_pos select 2)+0.9];
	SHOP_ITEMPREVIEW allowDamage false;

	SHOP_CAMERA camSetTarget SHOP_ITEMPREVIEW;
	SHOP_CAMERA camSetRelPos [6,7,0.3];
	SHOP_CAMERA camCommit 0;

	_control = _display displayCtrl 1400;
	_control ctrlSetFade 1;
	_control ctrlCommit 0;
	_control = _display displayCtrl 1000;
	_control ctrlSetFade 1;
	_control ctrlCommit 0;

    CAUE_SHOP_ITEMINDEX = _index;

}, false] call Server_Setup_Compile;

["Caue_FactionVehicles_Request", {

	disableSerialization;
	params [
		["_shopType", ""]
	];

	private _shop = switch (_shopType) do {
		case "fifr": {"Shop_FIFR_Vehicle_Vendor";};
		case "uscg": {"Shop_USCG_Car_Vendor";};
		case "police": {"Shop_SD_Vehicles_Vendor";};
		case "uscg_b": {"Shop_USCG_Boat_Vendor";};
		case "uscg_h": {"Shop_USCG_Plane_Vendor";};
		case "dmv": {"Shop_DMV_Vehicles_Vendor";};
		case "faa": {"Shop_FAA_Vehicles_Vendor";};
		case "doj": {"Shop_DOJ_Vehicles_Vendor";};
	};

	private _stock = switch (_shopType) do {
		case "fifr": {FIFR_VEHICLE_STOCK;};
		case "uscg": {USCG_VEHICLE_STOCK;};
		case "police": {POLICE_VEHICLE_STOCK;};
		case "uscg_b": {USCG_BOAT_STOCK;};
		case "uscg_h": {USCG_HELI_STOCK;};
		case "dmv": {DMV_VEHICLE_STOCK;};
		case "faa": {FAA_VEHICLE_STOCK;};
		case "doj": {DOJ_VEHICLE_STOCK;};
	};

	private _allItems = [_shop] call Caue_Config_GetShop;
	private _index = CAUE_SHOP_ITEMINDEX;
	private _item = _allItems select _index;
    private _itemClass = _item select 1;
	private _requirement = _item select 4;

	if !(call compile _requirement) exitWith {["Você não tem permissão para pegar este veiculos",Color_Red] call A3PL_HUD_Notification;};

	private _shopStock = _stock select _index;
	private _hasStock = true;
	if ((_shopStock - 1) < 0) then {_hasStock = false;};

	private _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");

	if (!_hasStock) exitWith {[format["Desculpe, não há mais %1's na garagem de veículos da facção!",_itemName],Color_Red] call A3PL_HUD_Notification;};

	[_shopType,_index,"dec"] remoteExec ["Server_FactionVehicles_Update",2];

	[player,_itemClass,_shopType,_index,cursorObject] remoteExec ["Server_FactionVehicles_Create",2];
	[format["Você retirou um %1 da garagem de veículos da facção!",_itemName],Color_Green] call A3PL_HUD_Notification;

	closeDialog 0;

}, false] call Server_Setup_Compile;

["Caue_FactionVehicles_GiveBack", {

	disableSerialization;
	params [
		["_shopType", "fifr", [""]]
	];

	private _shop = switch (_shopType) do {
		case "fifr": {"Shop_FIFR_Vehicle_Vendor";};
		case "uscg": {"Shop_USCG_Car_Vendor";};
		case "police": {"Shop_SD_Vehicles_Vendor";};
		case "uscg_b": {"Shop_USCG_Boat_Vendor";};
		case "uscg_h": {"Shop_USCG_Plane_Vendor";};
		case "dmv": {"Shop_DMV_Vehicles_Vendor";};
		case "faa": {"Shop_FAA_Vehicles_Vendor";};
		case "doj": {"Shop_DOJ_Vehicles_Vendor";};
	};

	private _allItems = [_shop] call Caue_Config_GetShop;
	private _index = CAUE_SHOP_ITEMINDEX;
	private _item = _allItems select _index;
    private _itemClass = _item select 1;

	private _vehicles = nearestObjects [player,[_itemClass],15];
	private _vehicle = objNull;
	if (count _vehicles < 1) exitwith {["Não consegue encontrar o seu veículo por perto! Por favor, mova-o para mais perto para devolver!"] call A3PL_HUD_Notification;};
	{
		if (((_x getVariable ["owner",[]]) select 0) == (getPlayerUID player)) exitwith {_vehicle = _x;};
	} foreach _vehicles;
	if (isNull _vehicle) exitwith {["Não consegue encontrar o seu veículo por perto! Por favor, mova-o para mais perto para devolver! (Somente o proprietário do veículo pode devolver)"] call A3PL_HUD_Notification;};

	if ((fuel _vehicle) < 0.9) exitWith {["Encha o tanque do veiculo antes de devolver!",Color_Red] call A3PL_HUD_Notification;};

	[_vehicle] remoteExec ["Server_Vehicle_Sell",2];

	private _itemName = getText (configFile >> "CfgVehicles" >> _itemClass >> "displayName");
	[format["Você devolveu um %1",_itemName],Color_Green] call A3PL_HUD_Notification;

	[_shopType,_index,"inc"] remoteExec ["Server_FactionVehicles_Update",2];
	closeDialog 0;

}, false] call Server_Setup_Compile;

/*
	Server
*/
["Server_FactionVehicles_Init", {

	if (!canSuspend) exitWith {};

	private _fVStock = ["FactionVehicles_Fetch", 2, true] call Server_Database_Async;
	{
		private _compile = formatText ['%1 = %2;',(_x select 1),([(_x select 0)] call Server_Database_ToArray)];
		call compile str(_compile);
		publicVariable (_x select 1);
	} forEach _fVStock;

}, true] call Server_Setup_Compile;

["Server_FactionVehicles_Update", {

	if (!canSuspend) exitWith {};

	params [
		["_shopType", ""],
		["_index", 0],
		["_type", "inc"]
	];

	private _stock = switch (_shopType) do {
		case "fifr": {FIFR_VEHICLE_STOCK;};
		case "uscg": {USCG_VEHICLE_STOCK;};
		case "police": {POLICE_VEHICLE_STOCK;};
		case "uscg_h": {USCG_HELI_STOCK;};
		case "uscg_b": {USCG_BOAT_STOCK;};
		case "dmv": {DMV_VEHICLE_STOCK;};
		case "faa": {FAA_VEHICLE_STOCK;};
		case "doj": {DOJ_VEHICLE_STOCK;};
	};

	private _stockVar = switch (_shopType) do {
		case "fifr": {"FIFR_VEHICLE_STOCK";};
		case "uscg": {"USCG_VEHICLE_STOCK";};
		case "police": {"POLICE_VEHICLE_STOCK";};
		case "uscg_h": {"USCG_HELI_STOCK";};
		case "uscg_b": {"USCG_BOAT_STOCK";};
		case "dmv": {"DMV_VEHICLE_STOCK";};
		case "faa": {"FAA_VEHICLE_STOCK";};
		case "doj": {"DOJ_VEHICLE_STOCK";};
	};

	private _value = _stock select _index;

	if (_type isEqualTo "inc") then {
		_stock set [_index,(_value + 1)];
	} else {
		private _tmp = _value - 1;
		if (_tmp < 0) then {_tmp = 0;};
		_stock set [_index,_tmp];
	};

	[format["FactionVehicles_Update:%1:%2",([_stock] call Server_Database_Array),_shopType],1] call Server_Database_Async;

	private _compile = formatText ['%1 = %2;', _stockVar, _stock];
	call compile str(_compile);
	publicVariable _stockVar;

}, true] call Server_Setup_Compile;

["Server_FactionVehicles_Create", {

	if (!canSuspend) exitWith {};

	params [
		["_player", objNull, [objNull]],
		["_class", "", [""]],
		["_fType", "", [""]],
		["_fIndex", 0, [0]],
		["_garage",objNull]
	];

	private _posvar = _garage getVariable ["positionSpawn",[]];
	private _pos = [];
	private _dir = 0;
	if ((count _posvar) isEqualTo 0) then {
		if (_class isKindOf "Ship") then {
			_pos = [_player, 2, 30, 12, 2, 0, 0] call BIS_fnc_findSafePos;
			_pos set [2, 28];
		} else {
			_pos = (getpos _player) findEmptyPosition [2,25,_class];
		};
	} else {
		_pos = [_posvar select 0,_posvar select 1,_posvar select 2];
		_dir = _posvar select 3;
	};

	private _lp = [_player,_class,"deprecated",false] call Server_Vehicle_Buy;
	private _veh = [_class,_pos,_lp,_player] call Server_Vehicle_Spawn;
	_veh allowDamage false;
	_veh setDir _dir;

	[_veh] spawn {
		uisleep 5;
		(_this select 0) allowDamage true;
	};

	[_veh,_lp] spawn Caue_Vehicle_SaveColor;

}, true] call Server_Setup_Compile;
