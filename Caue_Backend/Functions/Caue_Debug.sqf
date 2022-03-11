/*
    Client
*/
['Caue_Debug_Open', {

    if !(isNull (uiNamespace getVariable ["Caue_Debug",displayNull])) exitWith {};

    closeDialog 0;
    createDialog "Caue_Debug";

    private _display = uiNamespace getVariable ["Caue_Debug",displayNull];
    private _buttonCloseMenu = _display displayCtrl 9999621;
    private _buttonLocalExecute = _display displayCtrl 9999626;
    private _buttonLocalExecutePerformance = _display displayCtrl 9999636;
    private _buttonSelPlayerExecute = _display displayCtrl 9999623;
    private _buttonServerExecute = _display displayCtrl 9999624;
    private _buttonGlobalExecute = _display displayCtrl 9999625;
    private _ctrlButtonConfig = _display displayCtrl 9999650;
    private _ctrlButtonAnims = _display displayCtrl 9999651;
    private _ctrlButtonFncViewer = _display displayCtrl 9999652;
    private _ctrlButtonSplendid = _display displayCtrl 9999653;

    {_x ctrlEnable false;} forEach [_buttonSelPlayerExecute,_buttonServerExecute,_buttonGlobalExecute,_buttonLocalExecutePerformance];

    /* Exec Functions */
    _buttonCloseMenu ctrlAddEventHandler ["ButtonClick", {closeDialog 0;}];
    _buttonLocalExecute ctrlSetEventHandler ["ButtonClick", "[_this select 0, 'LOCAL'] call Caue_Debug_Exec;"];
    _buttonLocalExecutePerformance ctrlSetEventHandler ["ButtonClick", "[_this select 0, 'PERFORMANCE'] call Caue_Debug_Exec;"];
    _buttonSelPlayerExecute ctrlSetEventHandler ["ButtonClick", "[_this select 0, 'PLAYER'] spawn Caue_Debug_Exec;"];
    _buttonServerExecute ctrlSetEventHandler ["ButtonClick", "[_this select 0, 'SERVER'] call Caue_Debug_Exec;"];
    _buttonGlobalExecute ctrlSetEventHandler ["ButtonClick", "[_this select 0, 'GLOBAL'] call Caue_Debug_Exec;"];

    /* Arma Functions */
    private _ctrlButtonConfig = _display displayCtrl 9999650;
    private _ctrlButtonAnims = _display displayCtrl 9999651;
    private _ctrlButtonFncViewer = _display displayCtrl 9999652;
    private _ctrlButtonSplendid = _display displayCtrl 9999653;
    _ctrlButtonConfig ctrlSetEventHandler ["ButtonClick", "[] call BIS_fnc_configViewer"];
    _ctrlButtonAnims ctrlSetEventHandler ["ButtonClick", "[] call BIS_fnc_animViewer"];
    _ctrlButtonFncViewer ctrlSetEventHandler ["ButtonClick", "[] call BIS_fnc_help"];
    _ctrlButtonSplendid ctrlSetEventHandler ["ButtonClick", "[] call BIS_fnc_camera"];

    /* Checkbox */
    private _safetyCheckbox = _display displayCtrl 9999627;
    _safetyCheckbox ctrlAddEventHandler ["CheckedChanged", {
        _this params [
            ["_ctrl", controlNull, [controlNull]],
            ["_checkedState", 0, [0]]
        ];

        private _display = ctrlParent _ctrl;
        private _buttonLocalExecute = _display displayCtrl 9999626;
        private _buttonLocalExecutePerformance = _display displayCtrl 9999636;
        private _buttonSelPlayerExecute = _display displayCtrl 9999623;
        private _buttonServerExecute = _display displayCtrl 9999624;
        private _buttonGlobalExecute = _display displayCtrl 9999625;

        {_x ctrlEnable (_checkedState isEqualTo 1);} forEach [_buttonLocalExecutePerformance,_buttonSelPlayerExecute,_buttonServerExecute,_buttonGlobalExecute];
    }];

    /* Players */
    private _ctrlTreePlayers = _display displayCtrl 9999635;
    tvClear _ctrlTreePlayers;
    {
        private _index = _ctrlTreePlayers tvAdd [[], _x];
        private _sideAestetics = [
            ["a3\ui_f\Data\Map\Markers\nato\b_unknown.paa", WEST],
            ["a3\ui_f\Data\Map\Markers\nato\n_unknown.paa", INDEPENDENT],
            ["a3\ui_f\Data\Map\Markers\nato\c_unknown.paa", CIVILIAN]
        ] select _forEachIndex;

        _sideAestetics params [
            ["_picturePath", "", [""]],
            ["_side", sideUnknown, [sideUnknown]]
        ];

        _ctrlTreePlayers tvSetData [[_index], ""];
        _ctrlTreePlayers tvSetPicture [[_index], _picturePath];
        _ctrlTreePlayers tvSetPictureColor [[_index], [_side] call BIS_fnc_sideColor];
    } forEach ["Policiais","Medicos","Civis"];
    {
        private _jobIndex = switch (_x getVariable ["job","none"]) do {
            case "police": {[0,west]};
            case "fifr": {[1,independent]};
            default {[2,civilian]};
        };

        private _index = _ctrlTreePlayers tvAdd [[(_jobIndex select 0)], format["%1 (%2)",(_x getVariable ["name","error"]),(name _x)]];
        _ctrlTreePlayers tvSetData [[(_jobIndex select 0), _index], (getPlayerUID _x)];
        _ctrlTreePlayers tvSetPicture [[(_jobIndex select 0), _index], "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"];
        _ctrlTreePlayers tvSetPictureColor [[(_jobIndex select 0), _index], [(_jobIndex select 1)] call BIS_fnc_sideColor];
    } forEach allPlayers;
    tvExpandAll _ctrlTreePlayers;

    /* Load Saved Scripts */
    private _buttonSaveScript = _display displayCtrl 9999649;
    private _buttonDeleteScript = _display displayCtrl 9999648;
    private _ctrlTreeScripts = _display displayCtrl 9999638;

    _buttonSaveScript ctrlAddEventHandler ["ButtonClick", {
        private _display = uiNamespace getVariable ["Caue_Debug",displayNull];
        private _ctrlTreeScripts = _display displayCtrl 9999638;
        private _ctrlEditScripts = _display displayCtrl 9999647;
        private _input = _display displayCtrl 9999622;
        private _inputText = ctrlText _input;
        private _editText = ctrlText _ctrlEditScripts;

        if (_inputText isEqualTo "") exitWith {hint "escreva um script primeiro doente";};
        if (_editText isEqualTo "") exitWith {hint "coloque um nome no script";};

        private _toSave = [_editText,_inputText];

        private _savedBefore = profileNamespace getVariable ["Caue_Debug_SavedScripts",[]];
        _savedBefore pushBack _toSave;
        profileNamespace setVariable ["Caue_Debug_SavedScripts",_savedBefore];
        saveProfileNamespace;

        tvClear _ctrlTreeScripts;
        {
            private _index = _ctrlTreeScripts tvAdd [[], (_x select 0)];
            _ctrlTreeScripts tvSetData [[_index], (_x select 1)];
            _ctrlTreeScripts tvSetPicture [[_index], "\cauedev.github.io\textures\icons\staff.paa"];
        } forEach (profileNamespace getVariable ["Caue_Debug_SavedScripts",[]]);
    }];
    _buttonDeleteScript ctrlAddEventHandler ["ButtonClick", {
        private _display = uiNamespace getVariable ["Caue_Debug",displayNull];
        private _ctrlTreeScripts = _display displayCtrl 9999638;
        private _input = _display displayCtrl 9999622;

        if ((count(tvCurSel _ctrlTreeScripts)) < 1) exitWith {hint "selecione um script";};

        private _script = (tvCurSel _ctrlTreeScripts) select 0;
        private _savedScripts = profileNamespace getVariable ["Caue_Debug_SavedScripts",[]];
        _savedScripts deleteAt _script;
        profileNamespace setVariable ["Caue_Debug_SavedScripts",_savedScripts];
        saveProfileNamespace;

        tvClear _ctrlTreeScripts;
        {
            private _index = _ctrlTreeScripts tvAdd [[], (_x select 0)];
            _ctrlTreeScripts tvSetData [[_index], (_x select 1)];
            _ctrlTreeScripts tvSetPicture [[_index], "\cauedev.github.io\textures\icons\staff.paa"];
        } forEach (profileNamespace getVariable ["Caue_Debug_SavedScripts",[]]);
    }];
    _ctrlTreeScripts ctrlAddEventHandler ["TreeDblClick",{
        private _display = uiNamespace getVariable ["Caue_Debug",displayNull];
        private _ctrlTreeScripts = _display displayCtrl 9999638;
        private _input = _display displayCtrl 9999622;

        if ((count(tvCurSel _ctrlTreeScripts)) < 1) exitWith {hint "selecione um script";};

        _input ctrlSetText (_ctrlTreeScripts tvData (tvCurSel _ctrlTreeScripts));
    }];

    tvClear _ctrlTreeScripts;
    {
        private _index = _ctrlTreeScripts tvAdd [[], (_x select 0)];
        _ctrlTreeScripts tvSetData [[_index], (_x select 1)];
        _ctrlTreeScripts tvSetPicture [[_index], "\cauedev.github.io\textures\icons\staff.paa"];
    } forEach (profileNamespace getVariable ["Caue_Debug_SavedScripts",[]]);

    /* Ative Scripts */
    ["CLIENT"] call Caue_Debug_ActiveScripts;

    /* Timer Loop */
    Caue_Debug_EFHandle = addMissionEventHandler ["EachFrame", {
        if (isNull (uiNamespace getVariable ["Caue_Debug",displayNull])) exitWith {removeMissionEventHandler ["EachFrame",Caue_Debug_EFHandle]; Caue_Debug_EFHandle = nil; saveProfileNamespace;};
        private _display = uiNamespace getVariable ["Caue_Debug",displayNull];

        private _inputField0 = _display displayCtrl 9999622;
        private _input0 = ctrlText _inputField0;
        profileNamespace setVariable ["Caue_Debug_expressionLast0",_input0];

        private _inputField1 = _display displayCtrl 9999628;
        private _outputField1 = _display displayCtrl 9999629;
        private _input1 = ctrlText _inputField1;
        profileNamespace setVariable ["Caue_Debug_expressionLast1",_input1];
        if !(_input1 isEqualTo "") then {
            private _input1Return = call compile _input1;
            _outputField1 ctrlSetText format ["%1", _input1Return];
        } else {
            _outputField1 ctrlSetText "";
        };

        private _inputField2 = _display displayCtrl 9999630;
        private _outputField2 = _display displayCtrl 9999631;
        private _input2 = ctrlText _inputField2;
        profileNamespace setVariable ["Caue_Debug_expressionLast2",_input2];
        if !(_input2 isEqualTo "") then {
            private _input2Return = call compile _input2;
            _outputField2 ctrlSetText format ["%1", _input2Return];
        } else {
            _outputField2 ctrlSetText "";
        };

        private _inputField3 = _display displayCtrl 9999632;
        private _outputField3 = _display displayCtrl 9999633;
        private _input3 = ctrlText _inputField3;
        profileNamespace setVariable ["Caue_Debug_expressionLast3",_input3];
        if !(_input3 isEqualTo "") then {
            private _input3Return = call compile _input3;
            _outputField3 ctrlSetText format ["%1", _input3Return];
        } else {
            _outputField3 ctrlSetText "";
        };
    }];

    {
        disableSerialization;
        private _input = _display displayCtrl _x;
        private _value = profileNamespace getVariable ["Caue_Debug_expressionLast" + str _forEachIndex, ""];
        _input ctrlSetText _value;
    } forEach [9999622,9999628,9999630,9999632];

}, false, true] call Server_Setup_Compile;

['Caue_Debug_Exec', {

    if (isNull (uiNamespace getVariable ["Caue_Debug",displayNull])) exitWith {};

    params [
        ["_control", controlNull, [controlNull]],
        ["_event", "", [""]]
    ];

    private _display = ctrlParent _control;

    private _ctrlEditInput = _display displayCtrl 9999622;
    private _input = ctrlText _ctrlEditInput;

    /* Remove double slash comments from string */
    private _strings = [];
    private _start = -1;

    while {
        _start = _input find "//";
        _start > -1
    } do {
        _input select [0, _start] call {
            private _badQuotes = _this call {
                private _qtsGood = [];
                private _qtsInfo = [];
                private _arr = toArray _this;

                {
                    _qtsGood pushBack (count _arr - count (_arr - [_x]) % 2 == 0);
                    _qtsInfo pushBack [_this find toString [_x], _x];

                    true
                } count [34, 39];

                if (_qtsGood isEqualTo [true, true]) exitWith {
                    0
                };

                _qtsInfo sort true;
                _qtsInfo select 0 select 1
            };

            if (_badQuotes > 0) exitWith {
                private _last = _input select [_start] find toString [_badQuotes];

                if (_last < 0) exitWith {
                    _strings = [_input];
                    _input = "";
                };

                _last = _start + _last + 1;
                _strings pushBack (_input select [0, _last]);

                _input = _input select [_last]
            };

            _strings pushBack _this;

            _input = _input select [_start];

            private _end = _input find toString [10];

            if (_end < 0) exitWith {
                _input = ""
            };

            _input = _input select [_end + 1]
        }
    };

    _input = (_strings joinString "") + _input;

    private _ctrlTextReturn = _display displayCtrl 9999637;
    switch _event do {
        case "LOCAL": {
            private _return = "";
            _return = call compile _input;
            _ctrlTextReturn ctrlSetText format ["%1",_return];
        };
        case "PERFORMANCE": {
            private _return = [_input, 0, 10000, _display] call BIS_fnc_codePerformance;

            _return params [
                ["_duration", 0, [0]],
                ["_cycles", 0, [0]]
            ];

            _ctrlTextReturn ctrlSetText format ["%1 ms / %2 cycles", _duration, _cycles];
        };
        case "PLAYER": {
            private _playersListbox = _display displayCtrl 9999635;
            private _uid = _playersListbox tvData (tvCurSel _playersListbox);

            if (_uid isEqualTo "") exitWith {hint "Selecione alguem";};

            private _unit = [_uid] call Caue_Lib_UIDToObject;
            if (isNull _unit) exitWith {hint "_unit isNull";};

            if !(["Confirmação",format["Executar em %1 (%2)?",(_unit getVariable ["name","error"]),name _unit],"SIM","NÃO",_display] call Caue_HUD_Prompt) exitWith {};

            [_input,"PLAYER",_unit] remoteExec ["Caue_Debug_ExecRequest",2];
        };
        case "SERVER": {
            [_input,"SERVER"] remoteExec ["Caue_Debug_ExecRequest",2];
        };
        case "GLOBAL": {
            [_input,"GLOBAL"] remoteExec ["Caue_Debug_ExecRequest",2];
        };
    };

}, false, true] call Server_Setup_Compile;

['Caue_Debug_ActiveScripts', {

    params [
        ["_type", "", [""]]
    ];

    if (_type isEqualTo "") exitWith {};

    switch (_type) do {
        case "CLIENT": {
            private _display = uiNamespace getVariable ["Caue_Debug",displayNull];
            private _activescripts = _display displayCtrl 9999657;
            private _activesqfscripts = _display displayCtrl 9999656;
            private _activesqsscripts = _display displayCtrl 9999655;
            private _activefsmscripts = _display displayCtrl 9999658;
            private _build = _display displayCtrl 9999659;

            _activescripts ctrlSetText str((diag_activeScripts select 0)+(diag_activeScripts select 1)+(diag_activeScripts select 2)+(diag_activeScripts select 3));
            _activesqfscripts ctrlSetText str(count diag_activeSQFScripts);
            _activesqsscripts ctrlSetText str(count diag_activeSQSScripts);
            _activefsmscripts ctrlSetText str(diag_activeScripts select 3);
            _build ctrlSetText format["Version: %1 | Mods: %2 | OS: %3 %4",(productVersion select 2),str(productVersion select 5),(productVersion select 6),(productVersion select 7)];
        };
        case "PLAYER": {
        };
        case "SERVER": {
        };
    };

}, false, true] call Server_Setup_Compile;

/*
    Server
*/
['Caue_Debug_ExecRequest', {

    params [
        ["_code", "", [""]],
        ["_targets", "", [""]],
        ["_targetObject", objNull, [objNull]]
    ];

    if (_code isEqualTo "") exitWith {};
    if (_targets isEqualTo "") exitWith {};

    _code = compile _code;

    /* Switch target */
    switch (_targets) do {
        case "PLAYER": {
            if (isNull _targetObject) exitWith {};

            [[],_code] remoteExec ["call",_targetObject];
        };
        case "GLOBAL": {
            [[],_code] remoteExec ["call",-2];
        };
        case "SERVER": {
            [[],_code] remoteExec ["call",2];
        };
    };

}, true, true] call Server_Setup_Compile;
