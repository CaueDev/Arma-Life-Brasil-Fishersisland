['A3PL_Pickup_Ladder', {

    private ["_Ladder"];
    _Ladder = _this select 0;
    _Ladder attachTo [player,  [0, 1, 0]];
    sleep 2;
    _Ladder setdir 180;
    Ladderkeydown =
    {
        _Ladder = nearestObject [player, "A3PL_Ladder"];
        _key = _this select 1;
        _return = false;

        switch _key do
        {
            case 201:
            {
                _val = _Ladder animationPhase "Ladder";
                _valu = _val + 0.01;
                if (_valu >= 1) then {_valu = 1};
                _Ladder animate ["Ladder",_valu];
                _return = true;
            };
            case 209:
            {
                _val = _Ladder animationPhase "Ladder";
                _valu = _val - 0.01;
                if (_valu <= 0) then {_valu = 0};
                _Ladder animate ["Ladder",_valu];
                _return = true;
            };
        };
        _return;
    };

    waituntil {!(IsNull (findDisplay 46))};
    _Ladderkeys = (FindDisplay 46) DisplayAddEventHandler ["keydown","_this call Ladderkeydown"];

    waitUntil {attachedTo _Ladder != player};
    (finddisplay 46) displayremoveeventhandler ["keydown",_Ladderkeys];

}, false] call Server_Setup_Compile;
