/*
    Animations Menu
*/
['Caue_Animations_Open', {

    disableSerialization;

    closeDialog 0;
    createDialog "Caue_Animations";

    private _display = findDisplay 3040;
    private _ctrlTitle = _display displayCtrl 3921;
    private _ctrlTree = _display displayCtrl 3044;
    private _ctrlButton1 = _display displayCtrl 3045;
    private _ctrlButton2 = _display displayCtrl 3046;
    private _ctrlSearch = _display displayCtrl 3043;

    _ctrlTitle ctrlSetText "Animações";
    _ctrlButton1 ctrlSetText "Fazer";
    _ctrlButton2 ctrlSetText "Parar";

    tvClear _ctrlTree;
    {
        _x params [
            ["_name",""],
            ["_class",""],
            ["_type",""]
        ];

        private _index = _ctrlTree tvAdd [[],_name];
        _ctrlTree tvSetData [[_index], str([_class,_type])];
    } forEach Config_Animations;

    _ctrlButton1 ctrlAddEventHandler ["ButtonClick", {
        if !([] call Caue_Player_AntiSpam) exitWith {};

        private _display = findDisplay 3040;
        private _ctrlTree = _display displayCtrl 3044;

        private _selected = tvCurSel _ctrlTree;
        if ((count _selected) < 1) exitwith {["Selecione uma animação.",Color_Red] call A3PL_HUD_Notification;};

        private _listData = parseSimpleArray (_ctrlTree tvData _selected);
        if (_listData isEqualTo "") exitwith {};
        if ((count _listData) < 2) exitwith {};

        _listData params [
            ["_class",""],
            ["_type",""]
        ];

        closeDialog 0;

        if (_type isEqualTo "play") exitWith {player playMoveNow _class;};
        if (_type isEqualTo "switch") exitWith {[player,_class] remoteExec ["A3PL_Lib_SyncAnim",-2];};
        if (_type isEqualTo "action") exitWith {player playActionNow _class;};
    }];

    _ctrlButton2 ctrlAddEventHandler ["ButtonClick", {
        if !([] call Caue_Player_AntiSpam) exitWith {};
        player switchMove "";
        closeDialog 0;
    }];

    _ctrlSearch ctrlAddEventHandler ["ButtonClick", {
        params [["_ctrl",controlNull,[controlNull]]];
        private _display = ctrlParent _ctrl;

        (_display displayCtrl 3042) ctrlSetText "";
    }];

}, false] call Server_Setup_Compile;

/*
    Guitar
*/
['Caue_Animations_OpenGuitar', {

    disableSerialization;

    closeDialog 0;
    createDialog "Caue_Animations";

    private _display = findDisplay 3040;
    private _ctrlTitle = _display displayCtrl 3921;
    private _ctrlTree = _display displayCtrl 3044;
    private _ctrlButton1 = _display displayCtrl 3045;
    private _ctrlButton2 = _display displayCtrl 3046;
    private _ctrlSearch = _display displayCtrl 3043;

    _ctrlTitle ctrlSetText "Musicas";
    _ctrlButton1 ctrlSetText "Tocar";
    _ctrlButton2 ctrlSetText "Parar";

    tvClear _ctrlTree;
    {
        _x params [
            ["_name",""],
            ["_class",""]
        ];

        private _index = _ctrlTree tvAdd [[],_name];
        _ctrlTree tvSetData [[_index], str([_class])];
    } forEach Config_GuitarSongs;

    _ctrlButton1 ctrlAddEventHandler ["ButtonClick", {
        if !([] call Caue_Player_AntiSpam) exitWith {};

        private _display = findDisplay 3040;
        private _ctrlTree = _display displayCtrl 3044;

        private _selected = tvCurSel _ctrlTree;
        if ((count _selected) < 1) exitwith {["Selecione uma musica.",Color_Red] call A3PL_HUD_Notification;};

        private _listData = parseSimpleArray (_ctrlTree tvData _selected);
        if (_listData isEqualTo "") exitwith {};
        if ((count _listData) < 1) exitwith {};

        _listData params [
            ["_class",""]
        ];

        closeDialog 0;

        [_class] call Caue_Animations_PlayGuitar;
    }];

    _ctrlButton2 ctrlAddEventHandler ["ButtonClick", {
        if !([] call Caue_Player_AntiSpam) exitWith {};
        [] call Caue_Animations_StopGuitar;
        closeDialog 0;
    }];

    _ctrlSearch ctrlAddEventHandler ["ButtonClick", {
        params [["_ctrl",controlNull,[controlNull]]];
        private _display = ctrlParent _ctrl;

        (_display displayCtrl 3042) ctrlSetText "";
    }];

}, false] call Server_Setup_Compile;

['Caue_Animations_PlayGuitar', {

    params [
        ["_name",""],
        ["_distance",50]
    ];

    [player,"gitaraPlay"] remoteExec ["A3PL_Lib_SyncAnim",-2];

    if !(isNil "guitar_soundsource") then {deleteVehicle guitar_soundsource;};

    guitar_soundsource = "Land_HelipadEmpty_F" createVehicle (position player);
    guitar_soundsource attachTo [player,[0,0,0]];
    [guitar_soundsource,[_name,_distance,1]] remoteExec ["say3D",-2];

}, false] call Server_Setup_Compile;

['Caue_Animations_StopGuitar', {

    if (isNil "guitar_soundsource") exitWith {};

    deleteVehicle guitar_soundsource;
    player switchMove "";

}, false] call Server_Setup_Compile;

/*
    Cigs
*/
['Caue_Animations_TakeCig', {

    params ["_player"];

    [_player,"murshun_cigs_cigpack"] call Caue_Animations_RemoveItemFromMag;
    playSound "murshun_cigs_unwrap";
    _player addItem "murshun_cigs_cig0";

}, false] call Server_Setup_Compile;

['Caue_Animations_StartCig', {

    params ["_unit"];

    if !([_unit] call Caue_Animations_UseItem) exitWith {};
    if !(local _unit) exitWith {};

    private _cigTime = 0;
    private _goggles = goggles _unit;

    if !(_goggles IN Config_CigsArray) exitWith {};

    private _gogglesCurrent = _goggles;

    private _states = Config_CigsStatesArray select {_x select 0 == _goggles};
    {
        _x params ["_cigState","_cigStateTime",["_cigStateNext", ""]];
        _cigTime = _cigStateTime;
    } forEach _states;

    if (_unit getVariable ["murshun_cigs_cigLitUp",false]) exitWith {};
    _unit setVariable ["murshun_cigs_cigLitUp",true,false];

    [_unit] spawn Caue_Animations_CigsAnim;

    sleep (3.5 + random 2);
    [_unit] remoteExec ["Caue_Animations_Smoke",-2];
    sleep (1 + random 1);
    [_unit] remoteExec ["Caue_Animations_Smoke",-2];

    while ({_gogglesCurrent in Config_CigsArray && (_unit getVariable ["murshun_cigs_cigLitUp",false]) && _cigTime <= 330}) do {
        private _gogglesCurrent = goggles _unit;
        private _gogglesNew = "";

        private _states = Config_CigsStatesArray select {_x select 0 == _gogglesCurrent};

        {
            _x params ["_cigState", "_cigStateTime", ["_cigStateNext", ""]];
            _statesNew = Config_CigsStatesArray select {_x select 0 == _cigStateNext};

            {
                _x params ["_cigState", "_cigStateTime", ["_cigStateNext", ""]];
                if (_cigTime >= _cigStateTime) then {
                    _gogglesNew = _cigState;
                };
            } forEach _statesNew;
        } forEach _states;

        if (_gogglesNew != "") then {
            removeGoggles _unit;
            _unit addGoggles _gogglesNew;
            _gogglesCurrent = _gogglesNew;
        };

        _time = (5.5 + random 2);

        _cigTime = _cigTime + _time;

        [_unit] remoteExec ["Caue_Animations_Smoke",-2];
        _fatigue = getFatigue _unit;
        _unit setFatigue _fatigue + 0.01;

        sleep _time;

        if (_gogglesCurrent != goggles _unit) exitWith {};
    };

    _unit setVariable ["murshun_cigs_cigLitUp",false,false];
    if (_cigTime >= 330) then {
        removeGoggles _unit;
    };

}, false] call Server_Setup_Compile;

['Caue_Animations_StopCig', {

    params ["_player"];
    _player setVariable ["murshun_cigs_cigLitUp",false,false];

}, false] call Server_Setup_Compile;

['Caue_Animations_RemoveItemFromMag', {

    params ["_player","_mag"];

    private _matchesMags = magazinesAmmo _player select {_x select 0 == _mag};

    _player removeMagazineGlobal _mag;

    private _oldMag = _matchesMags select 0;

    if ((_oldMag select 1) > 1) then {
        _player addMagazine [_mag, (_oldMag select 1) - 1];
    };

}, false] call Server_Setup_Compile;

['Caue_Animations_UseItem', {

    params ["_unit"];

    if (!("murshun_cigs_matches" in (magazines _unit)) && !("murshun_cigs_lighter" in (magazines _unit))) exitWith {
        hint "Voce nao tem como acender o cigarro";
        false
    };

    if ("murshun_cigs_lighter" in (magazines _unit)) exitWith {
        [_unit,"murshun_cigs_lighter"] call Caue_Animations_RemoveItemFromMag;
        [_unit,["murshun_cigs_lighter_01",10,1]] remoteExec ["say3D",-2];
        true
    };

    if ("murshun_cigs_matches" in (magazines _player)) exitWith {
        [_unit,"murshun_cigs_matches"] call Caue_Animations_RemoveItemFromMag;
        [_unit,["murshun_cigs_matches_01",10,1]] remoteExec ["say3D",-2];
        true
    };

}, false] call Server_Setup_Compile;

['Caue_Animations_CigsAnim', {

    params ["_unit"];

    if !((vehicle _unit) isEqualTo _unit) exitWith {};

    private _animation = animationState _unit;

    if (stance _unit == "STAND" && isClass (configFile >> "CfgPatches" >> "ewk_cigs")) then {
        [_unit,"EWK_CIGS_SMOKING_ERC_CTS"] remoteExec ["A3PL_Lib_SyncAnim",-2];
        private _time = time;
        while {time < _time + 3} do {
            sleep (1/60);
        };
    } else {
        private _time = time;
        while {time < _time + 3} do {
            _unit playActionNow "Gear";
            sleep (1/60);
        };
    };

    [_unit,_animation] remoteExec ["A3PL_Lib_SyncAnim",-2];

}, false] call Server_Setup_Compile;

['Caue_Animations_Smoke', {

    params ["_unit"];

    private _source = "logic" createVehicleLocal (getpos _unit);
    private _fog = "#particlesource" createVehicleLocal getpos _source;
    _fog setParticleParams ["\A3\data_f\cl_basic",
    "",
    "Billboard",
    0.5,
    2,
    [0,0,0],
    [0, 0.1, -0.1],
    1, 1.2, 1, 0.1,
    [0.1, 0.2,0.1],
    [[0.2,0.2,0.2, 0.3], [0,0,0, 0.01], [1,1,1, 0]],
    [500],
    1,
    0.04,
    "",
    "",
    _source];
    _fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
    _fog setDropInterval 0.005;

    _source attachTo [_unit,[0,0.06,0],"head"];
    sleep 0.4;

    deleteVehicle _source;

}, false] call Server_Setup_Compile;
