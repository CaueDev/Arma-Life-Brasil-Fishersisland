['A3PL_Fire_RemoveFires', {

    [] remoteExec ["Server_Fire_RemoveFires", 2];

}, false] call Server_Setup_Compile;

['A3PL_Fire_StartFire', {

    private ["_position"];
    _position = param [0,[]];
    _dir = windDir;
    if (count _position < 3) exitwith {};
    [_position,_dir] remoteExec ["Server_Fire_StartFire", 2];

    [] spawn {
        uiSleep 15;
        playSound3D ["A3PL_Common\effects\FireCall.ogg", _current, true, _current, 50, 1, 100];
        [_current] spawn {
            Params ["_siren"];
            uiSleep 25;
            _building = (nearestObjects [_siren, ["Land_A3PL_Firestation"], 14]) select 0;
            _building animateSource ["garagedoor", 1];
            _building animateSource ["garagedoor1", 1];
            _building animateSource ["garagedoor2", 1];
        };
    };

}, false] call Server_Setup_Compile;

['Server_Fire_AddFireParticles', {

    private ["_fireObject","_r1","_r2","_r3","_source1","_source2"];
    _fireObject = param [0,[]];
    if (isNull _fireObject) exitwith {};

    _r1 = random 10; if (_r1 <= 2) then {_r1 = true} else {_r1 = false};
    _r2 = random 10; if (_r2 <= 0.7) then {_r2 = true} else {_r2 = false};
    _r3 = random 10; if (_r3 <= 0.7) then {_r3 = true} else {_r3 = false};

    _source1 = createVehicle ["#particleSource",getposATL _fireObject, [], 0, "CAN_COLLIDE"];
    _source1 setparticleclass "MediumDestructionFire";
    _source1 attachTo [_fireObject,[0,0,0]];

    if (_r1) exitwith
    {
        _source2 = createVehicle ["#particleSource",getposATL _fireObject, [], 0, "CAN_COLLIDE"];
        _source2 setparticleclass "MediumDestructionSmoke";
        _source2 attachTo [_fireObject,[0,0,0]];
    };

    if (_r2) exitwith
    {
        _source2 = createVehicle ["#particleSource",getposATL _fireObject, [], 0, "CAN_COLLIDE"];
        _source2 setparticleclass "BigDestructionSmoke";
        _source2 attachTo [_fireObject,[0,0,0]];
    };

    if (_r3) exitwith
    {
        _source2 = createVehicle ["#particleSource",getposATL _fireObject, [], 0, "CAN_COLLIDE"];
        _source2 setparticleclass "HouseDestrSmokeLongSmall";
        _source2 attachTo [_fireObject,[0,0,0]];
    };

}, true] call Server_Setup_Compile;

['Server_Fire_FireLoop', {

    if !(missionNamespace getVariable ["FireActive",false]) exitwith {};

    private ["_latestFire","_fireObject","_latestFireDir","_newDir","_spread","_dist","_position","_correctSurface","_loopIndex","_fireArray"];
    {
        _loopIndex = _forEachIndex;
        _fireArray = _x;

        _spreadArray = [];

        if (count _fireArray > 0) then {_spreadArray pushback (_fireArray select (count _fireArray - 1));};
        if (count _fireArray > 1) then {_spreadArray pushback (_fireArray select (count _fireArray - 2));};
        if (count _fireArray > 2) then {_spreadArray pushback (_fireArray select (count _fireArray - 3));};

        {
            _spread = floor random 10; if (_spread < 5) then {_spread = true;} else {_spread = false};
            if (_spread) then
            {
                _latestFire = _x;

                _latestFireDir = getDir _latestFire;

                _newDir = (_latestFireDir - 40) + random 80;
                _dist = 2 + random 2;
                _position = [_latestFire, _dist, _newDir] call BIS_fnc_relPos;

                _correctSurface = (surfaceType _position) IN ["#cype_grass","#cype_forest"];

                if (_correctSurface && (!isOnRoad _position)) then
                {
                    _fireobject = createVehicle ["A3PL_Fireobject",_position, [], 0, "CAN_COLLIDE"];
                    _fireobject addEventhandler ["HandleDamage",{[param [0,objNull],param [4,""]] spawn Server_Fire_HandleDamage;}];
                    _fireObject setDir _newDir;
                    [_fireObject] call Server_Fire_AddFireParticles;

                    _fireArray pushback _fireObject;
                    Server_TerrainFires set [_loopIndex,_fireArray];
                };
            };
        } foreach _spreadArray;
    } foreach Server_TerrainFires;

}, true] call Server_Setup_Compile;

['Server_Fire_HandleDamage', {

    private ["_fireObject","_loopIndex","_dmg"];
    _fireObject = param [0,objNull];
    _projectile = param [1,""];

    if (_projectile IN ["A3PL_High_Pressure_Water_Ball","A3PL_Low_Pressure_Water_Ball","A3PL_High_Pressure_Foam_Ball","A3PL_Medium_Pressure_Foam_Ball","A3PL_Low_Pressure_Foam_Ball"]) then
    {
        _newDmg = (_fireObject getVariable ["dmg",0]) + 0.1;
        if (_newDmg >= 1) then
        {
            [_fireObject] call Server_Fire_Killed;
        } else
        {
            _fireObject setVariable ["dmg",_newDmg,false];
        };
    };

    _dmg = 0;
    _dmg

}, true] call Server_Setup_Compile;

['Server_Fire_Killed', {

    private ["_fireObject","_loopIndex","_f"];
    _fireObject = param [0,objNull];

    _f = false;
    {
        deleteVehicle _x;
    } foreach (attachedObjects _fireObject);

    {
        _loopIndex = _forEachIndex;
        _fireArray = _x;
        {
            if (_fireObject == _x) exitwith
            {
                if (count _fireArray < 2) then
                {
                    Server_TerrainFires deleteAt _loopIndex;
                } else
                {
                    Server_TerrainFires set [_loopIndex,_fireArray-[_x]];
                };
            };
        } foreach _x;
    } foreach Server_TerrainFires;

    deleteVehicle _fireObject;

}, true] call Server_Setup_Compile;

['Server_Fire_RemoveFires', {

    {
        private ["_x"];
        {
            private ["_x"];
            {
                private ["_x"];
                deleteVehicle _x;
            } foreach attachedObjects _x;
            deleteVehicle _x;
        } foreach _x;
    } foreach (missionNameSpace getVariable ["Server_TerrainFires",[]]);
    Server_TerrainFires = [];

}, true] call Server_Setup_Compile;

['Server_Fire_StartFire', {

    FireActive = true;

    private ["_position","_fireObject","_dir"];
    _position = param [0,[]];
    _dir = param [1,random 360];
    if (count _position < 3) exitwith {};

    _fireobject = createVehicle ["A3PL_FireObject",_position, [], 0, "CAN_COLLIDE"];
    _fireobject addEventhandler ["HandleDamage",{[param [0,objNull],param [4,""]] spawn Server_Fire_HandleDamage;}];
    _fireObject setDir _dir;
    [_fireObject] call Server_Fire_AddFireParticles;
    Server_TerrainFires pushBack [_fireObject];

}, true] call Server_Setup_Compile;
