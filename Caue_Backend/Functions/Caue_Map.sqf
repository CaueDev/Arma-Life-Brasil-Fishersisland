['Caue_Map_Player', {

    sleep 0.5;
    if (visibleMap) then {
        private _marker = createMarkerLocal ["player_marker",visiblePosition player];
        _marker setMarkerSizeLocal [1.5,1.5];
        _marker setMarkerColorLocal "ColorOpfor";
        _marker setMarkerTypeLocal "Loc_ViewTower";
        _marker setMarkerAlphaLocal 1;
        _marker setMarkerTextLocal "Você";
        _marker setMarkerDirLocal (getDir player);

        while {visibleMap} do {
            _marker setMarkerPosLocal (visiblePosition player);
            _marker setMarkerDirLocal (getDir player);
            if (!visibleMap) exitWith {};
            sleep 0.02;
        };

        deleteMarkerLocal _marker;
    };

}, false] call Server_Setup_Compile;

['Caue_Map_Ores', {

    private _markers = [];

    sleep 0.5;
    if (visibleMap) then {
        {
            _x params [
                "_pos",
                "_amount"
            ];

            private _marker = createMarkerLocal [format["%1_marker",round(random 5000)],_pos];
            _marker setMarkerShapeLocal "ELLIPSE";
            _marker setMarkerSizeLocal [100,100];
            _marker setMarkerColorLocal "ColorBlue";
            _marker setMarkerTypeLocal "Mil_dot";
            _marker setMarkerAlphaLocal 0.5;
            _markers pushBack [_marker];

            private _marker = createMarkerLocal [format["%1_marker",round(random 5000)],_pos];
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerColorLocal "ColorBlue";
            _marker setMarkerTypeLocal "Mil_dot";
            _marker setMarkerTextLocal format ["OIL: %1 gallons",([_pos] call A3PL_JobOil_CheckAmountOil)];
            _markers pushBack [_marker];
        } forEach (missionNameSpace getVariable ["Server_JobWildCat_Oil",[]]);

        {
            _x params [
                "_name",
                "_pos",
                "_amount"
            ];

            private _marker = createMarkerLocal [format["%1_marker",round(random 5000)],_pos];
            _marker setMarkerShapeLocal "ELLIPSE";
            _marker setMarkerSizeLocal [100,100];
            _marker setMarkerColorLocal "ColorYellow";
            _marker setMarkerTypeLocal "Mil_dot";
            _marker setMarkerAlphaLocal 0.85;
            _markers pushBack [_marker];

            private _marker = createMarkerLocal [format["%1_marker",round(random 5000)],_pos];
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerColorLocal "ColorYellow";
            _marker setMarkerTypeLocal "Mil_dot";
            _marker setMarkerTextLocal format ["Resource: %1 (%2 left)",_name,_amount];
            _markers pushBack [_marker];
        } forEach (missionNameSpace getVariable ["Server_JobWildCat_Res",[]]);

        waitUntil {!visibleMap};

        {deleteMarkerLocal (_x select 0);} forEach _markers;
        _markers = [];
    };

}, false] call Server_Setup_Compile;

['Caue_Map_Players', {

    private _players = [];

    sleep 0.5;
    if (visibleMap) then {
        {
            private _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
            _marker setMarkerColorLocal "ColorYellow";
            _marker setMarkerTypeLocal "Mil_dot";
            _marker setMarkerAlphaLocal 1;
            _marker setMarkerTextLocal format["(%1) %2", _x getVariable["name","ERROR"], name _x];
            _players pushback [_marker,_x];
        } foreach allPlayers;

        while {visibleMap} do {
            {
                private _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit) then {
                    (_x select 0) setMarkerPosLocal (visiblePosition _unit);
                };
            } forEach _players;
            if (!visibleMap) exitWith {};
            sleep 0.02;
        };

        {deleteMarkerLocal (_x select 0);} forEach _players;
    };

}, false] call Server_Setup_Compile;

['Caue_Map_Waste', {

    private ["_bins","_markers"];
    _bins = [];
    _markers = [];

    sleep 0.5;
    if (visibleMap) then {
        {_bins pushback _x;} forEach nearestObjects [player,["A3PL_WheelieBin"],35500];

        {
            _marker = createMarkerLocal [format ["%1_marker",_x],getPos _x];
            _marker setMarkerColorLocal "ColorRed";
            _marker setMarkerTypeLocal "Mil_dot";
            _marker setMarkerTextLocal "Lixeira";
            _markers pushBack [_marker,_x];
        } forEach _bins;

        waitUntil {!visibleMap};

        {deleteMarkerLocal (_x select 0);} forEach _markers;
        _markers = [];
        _bins = [];
    };

}, false] call Server_Setup_Compile;

['Caue_Map_Police', {

    private ["_cops","_markers"];
    _cops = [];
    _markers = [];

    sleep 0.5;
    if (visibleMap) then {

        {
            if (((_x getVariable ["job","unemployed"]) isEqualTo "police") && ("ItemGPS" in assignedItems _x)) then {_cops pushBack _x;};
        } forEach allPlayers;

        {
            if !(_x isEqualTo player) then {
                _marker = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
                _marker setMarkerColorLocal "ColorIndependent";
                _marker setMarkerTypeLocal "Mil_dot";
                _marker setMarkerTextLocal format ["%1", _x getVariable ["name",name _x]];
                _markers pushback [_marker,_x];
            };
        } forEach _cops;

        while {visibleMap} do {
            {
                private ["_unit"];
                _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit) then {
                    (_x select 0) setMarkerPosLocal (visiblePosition _unit);
                };
            } forEach _markers;
            if (!visibleMap) exitWith {};
            sleep 0.02;
        };

        {deleteMarkerLocal (_x select 0);} forEach _markers;
        _markers = [];
        _vehicles = [];

    };

}, false] call Server_Setup_Compile;

['Caue_Map_FIFR', {

    private ["_vehicles","_markers","_medics"];
    _markers = [];
    _medics = [];

    sleep 0.5;
    if (visibleMap) then {

        {
            if (((_x getVariable ["job","unemployed"]) isEqualTo "fifr") && ("ItemGPS" in assignedItems _x)) then {_medics pushBack _x;};
        } forEach allPlayers;

        {
            if (_x getVariable "canExecute") then {
                _marker = createMarkerLocal [format["%1_dead_marker",name _x],visiblePosition _x];
                _marker setMarkerColorLocal "ColorRed";
                _marker setMarkerTypeLocal "loc_Hospital";
                _marker setMarkerTextLocal "Pessoa Ferida";
                _markers pushBack [_marker,_x];
            };
        } forEach allPlayers;

        {
            if !(_x isEqualTo player) then {
                _marker = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
                _marker setMarkerColorLocal "ColorIndependent";
                _marker setMarkerTypeLocal "Mil_dot";
                _marker setMarkerTextLocal format ["%1", _x getVariable ["name",name _x]];
                _markers pushback [_marker,_x];
            };
        } forEach _medics;

        while {visibleMap} do {
            {
                private ["_unit"];
                _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit) then {
                    (_x select 0) setMarkerPosLocal (visiblePosition _unit);
                };
            } forEach _markers;
            if (!visibleMap) exitWith {};
            sleep 0.02;
        };

        {deleteMarkerLocal (_x select 0);} forEach _markers;
        _markers = [];
        _vehicles = [];

    };

}, false] call Server_Setup_Compile;

['Caue_Map_FAA', {

    private ["_vehicles","_markers"];
    _vehicles = [];
    _markers = [];

    sleep 0.5;
    if (visibleMap) then {

        {
            if (((typeOf _x) find "_Jayhawk") != -1) then {_vehicles pushback _x;};
            if (((typeOf _x) find "_Goose") != -1) then {_vehicles pushback _x;};
            if (((typeOf _x) find "_Cessna172") != -1) then {_vehicles pushback _x;};
        } foreach vehicles;

        {
            _marker = createMarkerLocal [format["unit_%1",round (random 1000)],visiblePosition _x];
            _marker setMarkerColorLocal "ColorYellow";
            _marker setMarkerTypeLocal "Mil_dot";
            _marker setMarkerTextLocal format["AERONAVE #%1", _forEachIndex];
            _markers pushback [_marker,_x];
        } forEach _vehicles;

        while {visibleMap} do {
            {
                private ["_unit"];
                _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit) then {
                    (_x select 0) setMarkerPosLocal (visiblePosition _unit);
                };
            } forEach _markers;
            if (!visibleMap) exitWith {};
            sleep 0.02;
        };

        {deleteMarkerLocal (_x select 0);} forEach _markers;
        _markers = [];
        _vehicles = [];

    };

}, false] call Server_Setup_Compile;

['Caue_Map_Prisoners', {

    private _prisoners = [];

    sleep 0.5;
    if (visibleMap) then {
        {
            if ((_x getVariable ["jail",0]) > 0) then {
                private _marker = createMarkerLocal [format["Prisoner_%1",round (random 1000)],visiblePosition _x];
                _marker setMarkerColorLocal "ColorYellow";
                _marker setMarkerTypeLocal "Mil_dot";
                _marker setMarkerTextLocal format["PRISIONEIRO %1 (tempo restante: %2 min)",(_x getVariable ["name","ERROR"]),(_x getVariable ["jail",0])];
                _prisoners pushback [_marker,_x];
            };
        } foreach allPlayers;

        while {visibleMap} do {
            {
                private _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit) then {
                    (_x select 0) setMarkerPosLocal (visiblePosition _unit);
                };
            } forEach _prisoners;
            if (!visibleMap) exitWith {};
            sleep 0.02;
        };

        {deleteMarkerLocal (_x select 0);} forEach _prisoners;
    };

}, false] call Server_Setup_Compile;

['Caue_Map_Impound', {

    private _markers = [];

    sleep 0.5;
    if (visibleMap) then {
        {
            private _lp = (_x getvariable ["owner",["0","ERROR"]]) select 1;
            private _marker = createMarkerLocal [format["impound_%1",round(random 1000)],visiblePosition _x];
            _marker setMarkerColorLocal "ColorRed";
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerTypeLocal "mil_warning";
            _marker setMarkerTextLocal format["Veículo marcado para apreensão (%1)",_lp];
            _markers pushback [_marker,_x];
        } forEach (server getVariable ["Marked_Impound",[]]);

        while {visibleMap} do {
            {
                private _unit = _x select 1;
                if (!isNil "_unit" && !isNull _unit) then {
                    (_x select 0) setMarkerPosLocal (visiblePosition _unit);
                };
            } forEach _markers;
            if (!visibleMap) exitWith {};
            sleep 0.02;
        };

        {deleteMarkerLocal (_x select 0);} forEach _markers;
    };

}, false] call Server_Setup_Compile;
