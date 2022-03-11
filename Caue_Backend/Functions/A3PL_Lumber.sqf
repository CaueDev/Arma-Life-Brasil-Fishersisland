['A3PL_Lumber_Fireaxe', {

    private ["_tree","_hp"];
    _tree = player_objintersect;
    if (typeOf _tree != "Land_A3PL_Tree3") exitwith {};
    if ((player distance2D _tree) > 6) exitwith {["Você está muito longe da árvore para cortá-la"] call A3PL_HUD_Notification;};

    _hp = _tree getVariable ["hp",100];
    _hp = _hp - 5;
    if (_hp <= 0) then {
        _pos = getPos _tree;
        _tree setDammage 1;
        [_tree] spawn
        {
            _tree = param [0,objNull];
            _pos = getPos _tree;
            sleep 3.2;
            for "_i" from 0 to (round random 4) do
            {
                _log = createVehicle ["A3PL_WoodenLog", _pos, [], 3, "CAN_COLLIDE"];
                _log setVariable ["class","log",true];
                _log setVariable ["owner",getPlayerUID player,true];
            };
            deleteVehicle _tree;
            private _trees = count nearestObjects [(getMarkerPos "LumberJack_Rectangle"), ["Land_A3PL_Tree3"], 190, true];
            if (_trees isEqualTo 1) then {
                uiSleep 300;
                [] remoteExecCall ["Server_Lumber_TreeRespawn",2]
            };
        };
    } else {
        _tree setVariable ["hp",_hp,true];
        playSound3D [format["cauedev.github.io\sounds\wood\woodchop%1.ogg",(1 + (round(random 4)))], player, false, getPos player, 50, 1, 15];
    };

}, false] call Server_Setup_Compile;

['Server_Lumber_TreeRespawn', {

    private ["_randPos","_trees","_tree"];
    _trees = count nearestObjects [(getMarkerPos "LumberJack_Rectangle"), ["Land_A3PL_Tree3"], 190, true];

    for "_i" from 1 to (50-_trees) do
    {
        _randPos = ["LumberJack_Rectangle"] call CBA_fnc_randPosArea;
        _tree = createVehicle ["Land_A3PL_Tree3", _randPos, [], 0, "CAN_COLLIDE"];
        _tree setDir (random 360);
    };

}, true] call Server_Setup_Compile;
