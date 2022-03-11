['Server_Database_Setup', {

    params [
        ["_database", "", [""]],
        ["_protocol", "", [""]],
        ["_protocol_options", "", [""]]
    ];

    private _extDBNotLoaded = "";

    private _return = false;

    if (isNil {uiNamespace getVariable "extDBCustomID"}) then {
        private _extDBCustomID = str(round(random(9999)));
        extDBCustomID = compileFinal _extDBCustomID;
        uiNamespace setVariable ["extDBCustomID", _extDBCustomID];
        try {
            private _result = "extDB3" callExtension format ["9:ADD_DATABASE:%1:%1", _database];
            if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
            _result = "extDB3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%1:%2:%3:%4", _database, _protocol, (call extDBCustomID), _protocol_options];
            if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        } catch {
            diag_log _exception;
            private _extDBNotLoaded = [true, _exception];
        };
        if (_extDBNotLoaded isEqualType []) exitWith {false};
        "extDB3" callExtension "9:LOCK";
        diag_log "extDB3: Connected to Database";
        _return = true;

    } else {
        private _extDBCustomID = uiNamespace getVariable "extDBCustomID";
        extDBCustomID = compileFinal _extDBCustomID;
        diag_log "extDB3: Still Connected to Database";

        _return = true;
    };

    _return;

}, true] call Server_Setup_Compile;

['Server_Database_ASync', {

    private ["_queryStmt","_mode","_multiarr","_queryResult","_key","_return","_loop"];

    _queryStmt = [_this,0,"",[""]] call BIS_fnc_param;
    _mode = [_this,1,1,[0]] call BIS_fnc_param;
    _multiarr = [_this,2,false,[false]] call BIS_fnc_param;

    _key = "extDB3" callExtension format ["%1:%2:%3",_mode,(call extDBCustomID),_queryStmt];

    if (_mode isEqualTo 1) exitWith {true};

    _key = call compile format ["%1",_key];
    _key = (_key select 1);
    _queryResult = "extDB3" callExtension format ["4:%1", _key];

    //Make sure the data is received
    if (_queryResult isEqualTo "[3]") then {
        for "_i" from 0 to 1 step 0 do {
            if (!(_queryResult isEqualTo "[3]")) exitWith {};
            _queryResult = "extDB3" callExtension format ["4:%1", _key];
        };
    };

    if (_queryResult isEqualTo "[5]") then {
        _loop = true;
        for "_i" from 0 to 1 step 0 do { // extDB3 returned that result is Multi-Part Message
            _queryResult = "";
            for "_i" from 0 to 1 step 0 do {
                _pipe = "extDB3" callExtension format ["5:%1", _key];
                if (_pipe isEqualTo "") exitWith { _loop = false; };
                _queryResult = _queryResult + _pipe;
            };
        if (!_loop) exitWith {};
        };
    };

    _queryResult = call compile _queryResult;
    if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["extDB3: Protocol Error: %1", _queryResult]; []};

    _return = (_queryResult select 1);

    if (!_multiarr && count _return > 0) then {
        _return = (_return select 0);
    };

    _return;

}, true] call Server_Setup_Compile;

['Server_Database_Array', {

    private["_array"];
    _array = param [0,[]];
    _array = str _array;
    _array = toArray(_array);

    for "_i" from 0 to (count _array)-1 do
    {
        _sel = _array select _i;
        if((_i != 0 && _i != ((count _array)-1))) then
        {
            if(_sel == 34) then
            {
                _array set[_i,96];
            };
        };
    };

    toString(_array);

}, true] call Server_Setup_Compile;

['Server_Database_ToArray', {

    private["_array"];
    _array = [_this,0,"",[""]] call BIS_fnc_param;
    if(_array == "") exitWith {[]};
    _array = toArray(_array);

    for "_i" from 0 to (count _array)-1 do
    {
        _sel = _array select _i;
        if(_sel == 96) then
        {
            _array set[_i,39];
        };
    };

    _array = toString(_array);
    _array = call compile format["%1", _array];
    _array;

}, true] call Server_Setup_Compile;

['Server_Database_NumberSafe', {

    private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];

    _number = [_this,0,0,[0]] call bis_fnc_param;
    _mod = [_this,1,3,[0]] call bis_fnc_param;

    _digits = _number call bis_fnc_numberDigits;
    _digitsCount = count _digits - 1;

    _modBase = _digitsCount % _mod;
    _numberText = "";

    {
        _numberText = _numberText + str _x;
        if ((_foreachindex - _modBase) % (_mod) isEqualTo 0 && !(_foreachindex isEqualTo _digitsCount)) then {_numberText = _numberText + "";};
    } forEach _digits;

    _numberText

}, true] call Server_Setup_Compile;
