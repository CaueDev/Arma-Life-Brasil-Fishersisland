['A3PL_USCG_WaterCannon', {

    private ["_veh","_waterCannonEffect"];
    _veh = _this select 0;
    _waterCannonEffect = "#particlesource" createVehicleLocal (getPos _veh);
    _waterCannonEffect setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 3, (_veh selectionPosition "usti hlavne"), [0, 0, 0], 1, 25, 10, 0.01, [0.5, 2, 6], [ [0.55, 0.65, 1.00, 0.01], [0.55, 0.65, 1.00, 0.05], [0.30, 0.35, 0.40, 0.01], [0.00, 0.00, 0.00, 0.00]  ], [0], 0, 0,"","", _veh, 0, true, 0.03, [[0,0,0,0]] ];
    _waterCannonEffect setParticleRandom [0.5, [0.0, 0.0, 0.0], [0.2, 0.2, 0.2], 0.3, 0.1, [0, 0, 0, 0], 0, 0];
    _waterCannonEffect setParticleCircle [0, [0, 0, 0]];
    _waterCannonEffect setDropInterval 0.001;
    _waterCannonEffect attachTo [_veh, [0,0,0],"usti hlavne"];

    [_waterCannonEffect,_veh] spawn
    {
        private ["_waterCannonEffect","_veh","_z"];
        _waterCannonEffect = _this select 0;
        _veh = _this select 1;
        sleep 0.3;
        while {_veh animationPhase "extPump" > 0.1} do
        {
            sleep 0.1;
            _pressure = 8;
            if (_veh animationPhase "extPressure" > 0.4) then {_pressure = 15; };
            if (_veh animationPhase "extPressure" > 0.6) then {_pressure = 30; };
            _z = (_veh animationPhase "maingun") * 14;
            _vel =
            [
                (sin (direction (commander _veh)) * _pressure),
                (cos (direction (commander _veh)) * _pressure),
                _z
            ];

            if (isNull (commander _veh)) exitwith {if (local _veh) then {_veh animate ["extPump",0]};};

            _waterCannonEffect setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 3, (_veh selectionPosition "usti hlavne"), _vel, 1, 25, 10, 0.01, [0.5, 2, 6], [ [0.55, 0.65, 1.00, 0.01], [0.55, 0.65, 1.00, 0.05], [0.30, 0.35, 0.40, 0.01], [0.00, 0.00, 0.00, 0.00]  ], [0], 0, 0,"","", _veh, 0, true, 0.03, [[0,0,0,0]] ];
        };
        deleteVehicle _waterCannonEffect;
    };

}, false] call Server_Setup_Compile;
