['Caue_Config_GetItem', {

    params [
        ["_class",""],
        ["_search",""]
    ];

    if (_class isEqualTo "") exitWith {false};

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _class) then {_config = _x;};
    } forEach Config_Items;

    if ((count _config) isEqualTo 0) exitWith {false};

    switch (_search) do {
        case "name": {
            _return = _config select 1;
            if (_return isEqualTo "inh") then {_return = getText (configFile >> "CfgVehicles" >> (_config select 3) >> "displayName");};
        };
        case "weight": {_return = _config select 2;};
        case "class": {_return = _config select 3;};
        case "dir": {_return = _config select 4;};
        case "canPickup": {_return = _config select 5;};
        case "simulation": {_return = _config select 6;};
        case "fnc": {_return = _config select 7;};
        case "icon": {_return = _config select 8;};
        default {_return = _config;};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetFood', {

    params [
        ["_class",""],
        ["_search",""]
    ];

    if (_class isEqualTo "") exitWith {0};

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _class) then {_config = _x;};
    } forEach Config_Foods;

    switch (_search) do {
        case "quality": {_return = _config select 1;};
        default {_return = _config;};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetDrink', {

    params [
        ["_class",""],
        ["_search",""]
    ];

    if (_class isEqualTo "") exitWith {0};

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _class) then {_config = _x;};
    } forEach Config_Drinks;

    switch (_search) do {
        case "quality": {_return = _config select 1;};
        default {_return = _config;};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetLicense', {

    params [
        ["_class",""],
        ["_search",""]
    ];

    if (_class isEqualTo "") exitWith {""};

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _class) then {_config = _x;};
    } forEach Config_Licenses;

    _return = switch (_search) do {
        case "name": {_config select 1};
        case "short": {_config select 2};
        default {_config};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetJob', {

    params [
        ["_class",""],
        ["_search",""]
    ];

    if (_class isEqualTo "") exitWith {""};

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _class) then {_config = _x;};
    } forEach Config_Jobs;

    _return = switch (_search) do {
        case "name": {_config select 1;};
        default {_config;};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetFactory', {

    params [
        ["_class",""],
        ["_factory",""],
        ["_search",""]
    ];

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _factory) then {_config = [] + _x;};
    } forEach Config_Factories;

    if (_class == "all") exitwith {_return = _config; _return deleteAt 0; _return deleteAt 0; _return;};
    if (_class == "pos") exitwith {_return = _config select 1; _return;};

    _config deleteAt 0;
    _config deleteAt 0;
    {
        if ((_x select 0) == _class) then {_config = _x};
    } forEach _config;

    switch (_search) do {
        case "id": {_return = _config select 0;};
        case "name": {_return = _config select 1;};
        case "class": {_return = _config select 2;};
        case "type": {_return = _config select 3;};
        case "time": {_return = _config select 4;};
        case "required": {_return = _config select 5;};
        case "output": {_return = _config select 6;};
        default {_return = false;};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetPlayerFactory', {

    params [
        ["_class",""],
        ["_search",""]
    ];

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _class) then {_config = _x;};
    } forEach (player getVariable ["player_factories",[]]);

    switch (_search) do {
        case "craftID": {_return = _config select 0;};
        case "classname": {_return = _config select 1;};
        case "required": {_return = _config select 2;};
        case "type": {_return = _config select 3;};
        case "classtype": {_return = _config select 4;};
        case "id": {_return = _config select 5;};
        case "amount": {_return = _config select 6;};
        case "finish": {_return = _config select 7;};
        default {_return = false;};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetFactoryStorage', {

    params [
        ["_class",""],
        ["_search",""],
        ["_player",player]
    ];

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _class) then {_config = _x;};
    } forEach (_player getVariable ["player_fStorage",[]]);

    if ((count _config) isEqualTo 0) exitwith {_return = false; _return;};

    switch (_search) do {
        case "type": {_return = _config select 0;};
        case "items": {_return = _config select 1;};
        default {_return = false;};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetShop', {

    params [
        ["_class",""],
        ["_itemClass",""],
        ["_search",""]
    ];

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _class) exitwith {
            if (_itemClass == "pos") then {
                _config = _x select 2;
            } else {
                _config = _x select 1;
            };
        };
    } forEach Config_Shops_Items;

    if (_search == "") exitwith {
        _return = _config;
        _return
    };

}, false] call Server_Setup_Compile;

['Caue_Config_GetShopClothing', {

    params [
        ["_class","",[""]],
        ["_search","",[""]]
    ];

    private _config = [];
    private _return = "";

    if ((_class isEqualTo "") || (_search isEqualTo "")) exitWith {false};

    {
        if ((_x select 0) == _class) exitWith {_config = _x;};
    } forEach Config_Shop_Clothing;

    if ((count _config) isEqualTo 0) exitwith {false};

    _return = call {
        if (_search isEqualTo "name") exitwith {_config select 0;};
        if (_search isEqualTo "items") exitwith {_config select 1;};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetOre', {

    params [
        ["_class",""],
        ["_search",""]
    ];

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _class) then {_config = _x;};
    } forEach Config_Resources_Ores;

    _return = switch (_search) do {
        case "minArea": {_config select 1};
        case "maxArea": {_config select 2};
        case "min": {_config select 3};
        case "max": {_config select 4};
        case "itemclass": {_config select 5};
        case "amount": {_config select 6};
        case "name": {_config select 7};
        default {false};
    };

    _return

}, false] call Server_Setup_Compile;





['A3PL_Config_GetBusinessItem', {

    private ["_class", "_search", "_config", "_return"];
    _class = param [0,""];
    _search = param [1,""];
    _config = [];
    _return = "";

    {
        if ((_x select 0) == _class) then {
            _config = _x;
        };
    } forEach Config_Business_Items;

    if (count _config == 0) exitwith {_return = false; _return;};

    switch (_search) do {
        case "class": { _return = _config select 0; };
        case "type": { _return = _config select 1; };
        case "min": { _return = _config select 2; };
        case "max": { _return = _config select 3; };
        case "bmin": { _return = _config select 4; };
        case "bmax": { _return = _config select 5; };
        default { _return = false; };
    };

    _return

}, false] call Server_Setup_Compile;








['Caue_Config_GetGarageRepair', {

    params [
        ["_class",""],
        ["_search",""]
    ];

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _class) then {_config = [] + _x;};
    } forEach Config_Garage_Repair;

    if ((count _config) isEqualTo 0) exitwith {false};

    _return = switch (_search) do {
        case "id": {_config select 0};
        case "title": {_config select 1};
        default {false};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetGaragePaint', {

    params [
        ["_class",""],
        ["_type",""],
        ["_search",""]
    ];

    private _typeOf = format["%1_Textures",_type];
    private _config = [];
    private _return = "";

    {
        _config = _config + [[(configName _x),(getArray (configFile >> "CfgVehicles" >> _typeOf >> "Skins" >> (configName _x) >> "Texture_Path")),(getText (configFile >> "CfgVehicles" >> _typeOf >> "Skins" >> (configName _x) >> "Name")),(getArray (configFile >> "CfgVehicles" >> _typeOf >> "Skins" >> (configName _x) >> "Allowed_GUID"))]];
    } forEach ("true" configClasses (configFile >> "CfgVehicles" >> _typeOf >> "Skins"));

    if (_class == "all") exitwith {_return = _config; _return;};

    {
        if ((_x select 0) == _class) then {_config = _x};
    } forEach _config;

    _return = switch (_search) do {
        case "id": {_config select 0};
        case "file": {_config select 1};
        case "title": {_config select 2};
        case "allowed": {_config select 3};
        default {false};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Config_GetGarageUpgrade', {

    params [
        ["_class",""],
        ["_typeOf",""],
        ["_search",""]
    ];

    private _config = [];
    private _return = "";

    {
        if ((_x select 0) == _typeOf) then {_config = [] + _x;};
    } forEach Config_Garage_Upgrade;

    if (_class == "all") exitwith {_return = _config; _return deleteAt 0; _return;};

    _config deleteAt 0;
    {
        if ((_x select 0) == _class) then {_config = _x};
    } forEach _config;

    _return = switch (_search) do {
        case "id": {_config select 0};
        case "type": {_config select 1};
        case "class": {_config select 2};
        case "title": {_config select 3};
        case "desc": {_config select 4};
        case "camTarget": {_config select 5};
        case "camOffset": {_config select 6};
        case "price": {_config select 7};
        case "required": {_config select 8};
        default {false};
    };

    _return

}, false] call Server_Setup_Compile;
