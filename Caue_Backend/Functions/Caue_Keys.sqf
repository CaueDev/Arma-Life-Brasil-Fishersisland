/*
    Client
*/
['Caue_Keys_GiveBack', {

    sleep 5;

    private _keys = [];
    {
    	if ((getPlayerUID player) IN (_x getVariable ["keyAccess",[]])) then {
    		_keys pushBack _x;
    	};
    } forEach (allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship" + allMissionObjects "Motorcycle");

    player setVariable ["keys",_keys,true];

}, false] call Server_Setup_Compile;

['Caue_Keys_Open', {

    disableSerialization;
    params [["_target",objNull]];

    if (isNull _target) exitWith {};

    Keys_Target = _target;

    closeDialog 0;
    createDialog "Caue_Animations";

    private _display = findDisplay 3040;
    private _ctrlTitle = _display displayCtrl 3921;
    private _ctrlTree = _display displayCtrl 3044;
    private _ctrlButton1 = _display displayCtrl 3045;
    private _ctrlButton2 = _display displayCtrl 3046;
    private _ctrlSearch = _display displayCtrl 3043;

    _ctrlTitle ctrlSetText "Chaves";
    _ctrlButton1 ctrlSetText "Dar";
    _ctrlButton2 ctrlSetText "Fechar";

    private _keys = player getVariable ["keys",[]];
    {
        if (isNull _x) then {_keys deleteAt _forEachIndex;};
    } forEach _keys;

    player setVariable ["keys",_keys,true];

    tvClear _ctrlTree;
    {
        private _name = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
        private _index = _ctrlTree tvAdd [[],_name];
        _ctrlTree tvSetData [[_index],(str _forEachIndex)];
    } forEach (player getVariable ["keys",[]]);

    _ctrlButton1 ctrlAddEventHandler ["ButtonClick", {
        if !([] call Caue_Player_AntiSpam) exitWith {};

        if (isNil "Keys_Target") exitWith {closeDialog 0;};

        private _display = findDisplay 3040;
        private _ctrlTree = _display displayCtrl 3044;

        private _selected = tvCurSel _ctrlTree;
        if ((count _selected) < 1) exitwith {["Selecione um veiculo.",Color_Red] call A3PL_HUD_Notification;};

        private _data = _ctrlTree tvData _selected;
        private _vehicle = (player getVariable ["keys",[]]) select (parseNumber _data);

        private _vehName = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

        [Keys_Target,_vehicle] spawn Caue_Keys_Add;

        [format["Voce deu as chaves de %1",_vehName],Color_Green] call A3PL_HUD_Notification;
        [format["Voce recebeu as chaves de %1",_vehName],Color_Green] remoteExec ["A3PL_HUD_Notification",Keys_Target];

        closeDialog 0;
    }];

    _ctrlButton2 ctrlAddEventHandler ["ButtonClick", {
        if !([] call Caue_Player_AntiSpam) exitWith {};
        closeDialog 0;
    }];

    _ctrlSearch ctrlAddEventHandler ["ButtonClick", {
        params [["_ctrl",controlNull,[controlNull]]];
        private _display = ctrlParent _ctrl;

        (_display displayCtrl 3042) ctrlSetText "";
    }];

}, false] call Server_Setup_Compile;

['Caue_Keys_Add', {

    params [
        ["_player",objNull],
        ["_veh",objNull]
    ];

    if ((isNull _player) || (isNull _veh)) exitWith {};

    private _playerKeys = _player getVariable ["keys",[]];
    _playerKeys pushBackUnique _veh;

    private _vehKeys = _veh getVariable ["keyAccess",[]];
    _vehKeys pushBackUnique (getPlayerUID _player);

    _player setVariable ["keys",_playerKeys,true];
    _veh setVariable ["keyAccess",_vehKeys,true];

}, false] call Server_Setup_Compile;
