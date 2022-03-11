['Caue_Clothing_Open', {

    if !(isNull (findDisplay 8000510)) exitWith {};

    params [["_shop","",[""]]];

    if (_shop isEqualTo "") exitWith {};

    Shop_Info = _shop;

    closeDialog 0;
    createDialog "Caue_Clothing";

    private _display = findDisplay 8000510;

    private _ctrlTree = _display displayCtrl 4;
    _ctrlTree ctrlAddEventHandler ["TreeSelChanged", {
        params [
            ["_ctrlTree", controlNull, [controlNull]],
            ["_treeSelectionPath", [], [[]]]
        ];

        private _display = ctrlParent _ctrlTree;

        private _tvData = _ctrlTree tvData _treeSelectionPath;
        if (_tvData isEqualTo "") exitWith {};

        private _data = parseSimpleArray _tvData;
        _data params [
            ["_class", "", [""]],
            ["_name", "", [""]],
            ["_buy", 0, [0]],
            ["_type", "", [""]]
        ];

        Clothing_Macaco setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];
        if (_type isEqualTo "headgear") then {Clothing_Macaco addHeadgear _class;};
        if (_type isEqualTo "goggles") then {Clothing_Macaco addGoggles _class;};
        if (_type isEqualTo "uniform") then {Clothing_Macaco addUniform _class;};
        if (_type isEqualTo "vest") then {Clothing_Macaco addVest _class;};
        if (_type isEqualTo "backpack") then {Clothing_Macaco addBackpack _class;};

        private _ctrlTextName = _display displayCtrl 5;
        _ctrlTextName ctrlSetText _name;

        private _ctrlTextPrice = _display displayCtrl 6;
        _ctrlTextPrice ctrlSetText str _buy;
    }];

    private _ctrlButtonPurchase = _display displayCtrl 8;
    _ctrlButtonPurchase ctrlAddEventHandler ["ButtonClick", {[Shop_Info] spawn Caue_Clothing_Buy;}];

    private _ctrlButtonRefresh = _display displayCtrl 3;
    _ctrlButtonRefresh ctrlAddEventHandler ["ButtonClick", {
        params [["_ctrl", controlNull, [controlNull]]];
        private _display = ctrlParent _ctrl;

        (_display displayCtrl 2) ctrlSetText "";
    }];

    private _ctrlCombo = _display displayCtrl 7;
    lbClear _ctrlCombo;
    _ctrlCombo lbAdd "Roupas";
    _ctrlCombo lbAdd "Chapéus";
    _ctrlCombo lbAdd "Óculos";
    _ctrlCombo lbAdd "Coletes";
    _ctrlCombo lbAdd "Mochilas";
    _ctrlCombo lbSetCurSel 0;

    Clothing_Macaco = "C_man_polo_2_F" createVehicleLocal ([nil, ["water"]] call BIS_fnc_randomPos);
    Clothing_Macaco enableSimulation false;
    Clothing_Macaco setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];

    Clothing_Camera = "CAMERA" camCreate (getPos Clothing_Macaco);
    showCinemaBorder false;
    Clothing_Camera cameraEffect ["Internal", "Back"];
    Clothing_Camera camSetTarget (Clothing_Macaco modelToWorld [0,0,1]);
    Clothing_Camera camSetPos (Clothing_Macaco modelToWorld [1,4,2]);
    Clothing_Camera camSetFOV .33;
    Clothing_Camera camSetFocus [50, 0];
    Clothing_Camera camCommit 0;

    while {!(isNull Clothing_Macaco)} do {
        uisleep 0.05;
        Clothing_Macaco setdir ((getdir Clothing_Macaco) + 5);
    };

}, false] call Server_Setup_Compile;

['Caue_Clothing_Filter', {

    disableSerialization;
    params [
        "",
        ["_selection",0,[0]]
    ];

    if (isNull (findDisplay 8000510)) exitWith {};

    private _display = findDisplay 8000510;
    private _ctrlTree = _display displayCtrl 4;
    tvClear _ctrlTree;

    private _type = switch (_selection) do {
        case 0: {"uniform"};
        case 1: {"headgear"};
        case 2: {"goggles"};
        case 3: {"vest"};
        case 4: {"backpack"};
    };

    private _itemsArray = [];
    {
        if ((_x select 0) isEqualTo _type) then {_itemsArray pushBack _x;}
    } forEach ([Shop_Info,"items"] call Caue_Config_GetShopClothing);

    {
        _x params [
            ["_type", "", [""]],
            ["_class", "", [""]],
            ["_buy", -1, [-1]],
            ["_condition", "", [""]]
        ];

        if (call compile _condition) then {
            private _defaultConfig = switch (true) do {
                case (isClass (configFile >> "CfgVehicles" >> _class)): {configFile >> "CfgVehicles" >> _class};
                case (isClass (configFile >> "CfgWeapons" >> _class)): {configFile >> "CfgWeapons" >> _class};
                case (isClass (configFile >> "CfgGlasses" >> _class)): {configFile >> "CfgGlasses" >> _class};
                default {configNull};
            };

            private _picture = getText (_defaultConfig >> "picture");
            private _displayName = getText (_defaultConfig >> "displayName");

            private _index = _ctrlTree tvAdd [[], _displayName];
            _ctrlTree tvSetData [[_index], str([_class,_displayName,_buy,_type])];
            _ctrlTree tvSetPicture [[_index], _picture];

            private _dlc = _defaultConfig >> "dlc";
            if (isText _dlc) then {
                private _logo = getText (configFile >> "CfgMods" >> getText _dlc >> "logo");
                _ctrlTree tvSetPictureRight [[_index], _logo];
                _ctrlTree tvSetTooltip [[_index], format ["Este item faz parte da DLC: %1.",getText _dlc]];
            };
        };
    } forEach _itemsArray;

}, false] call Server_Setup_Compile;

['Caue_Clothing_Buy', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_shop","",[""]]
    ];

    if (_shop isEqualTo "") exitWith {};

    private _display = findDisplay 8000510;
    private _ctrlTree = _display displayCtrl 4;
    private _selected = tvCurSel _ctrlTree;
    if ((count _selected) < 1) exitwith {["Selecione um item.",Color_Red] call A3PL_HUD_Notification;};

    private _listData = parseSimpleArray(_ctrlTree tvData _selected);
    if (_listData isEqualTo "") exitwith {};
    if ((count _listData) < 4) exitwith {};

    _listData params [
        ["_class", "", [""]],
        ["_name", "", [""]],
        ["_buy", 0, [0]],
        ["_type", "", [""]]
    ];

    if ((player getVariable ["getjobplayerguy",0]) < _buy) exitwith {["Você não tem dinheiro para comprar esta quantia.",Color_Red] call A3PL_HUD_Notification;};

    private _cash = player getVariable ["getjobplayerguy",0];
    player setVariable ["getjobplayerguy",((player getVariable ["getjobplayerguy",0]) - _buy),true];
    waitUntil {!((player getVariable ["getjobplayerguy",0]) isEqualTo _cash)};

    [_class,_type] spawn Caue_Shop_Crate;
    [format["Você comprou %1 por $%2",_name,[_buy] call Caue_Lib_NumberText],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;
