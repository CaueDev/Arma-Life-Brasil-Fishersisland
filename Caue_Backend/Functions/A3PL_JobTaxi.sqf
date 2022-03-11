['A3PL_JobTaxi_FareLoop', {

    private ["_veh","_tDistance","_tFare","_tTimeStationary","_tTime","_pos","_cpos","_fareArray","_sleepAmount"];
    private ["_tFareInitial","_tFareMiles","_tFare60sec","_tFare60SecStat"];
    _veh = param [0,objNull];
    _sleepAmount = 6;
    _tDistance = 0;
    _tTimeStationary = 0;
    _tTime = 0;
    _tFare = 0;
    _pos = getpos _veh;
    while {player == (driver _veh)} do
    {
        sleep 1;
        if (_veh getVariable ["fare_reset",false]) then
        {
            _tDistance = 0;
            _tTimeStationary = 0;
            _tTime = 0;
            {
                _veh setObjectTextureGlobal [_x,"\a3pl_cars\common\textures\numbers\0.paa"];
            } foreach [15,14,13,12,11,10];

            _veh setVariable ["fare_reset", false];
        };
        if (_veh getVariable ["fare_running", false]) then
        {
            _fareArray = _veh getVariable ["fare",[25,10,10,5]];
            _cPos = getpos _veh;
            _distance = _cPos distance2D _pos;
            _tDistance = _tDistance + _distance;

            _tTime = _tTime + 1;

            if ((_cPos distance2D _pos) < 3) then {_tTimeStationary = _tTimeStationary + 1;};

            _tFareInitial = _fareArray select 0;
            _tFareMiles = (_tDistance / 0.2) * (_fareArray select 1);
            _tFare60sec = (_tTime / 60) * (_fareArray select 2);
            _tFare60SecStat = (_tTimeStationary / 60) * (_fareArray select 3);
            _tFare = round (_tFareInitial + _tFareMiles + _tFare60sec + _tFare60SecStat);

            _tfare = format ["%1",_tfare];
            {
                if (((count _tfare) - _forEachIndex) <= 0) exitwith {};
                _veh setObjectTexture [_x,format ["\a3pl_cars\common\textures\numbers\%1.paa",(_tfare select [((count _tfare - 1) - _forEachIndex),1])]];
            } foreach [15,14,13,12,11,10];

            if (_sleepAmount > 5) then
            {
                _textures = getObjectTextures _veh;
                {
                    _veh setObjectTextureGlobal [_x,_textures select _x];
                } foreach [15,14,13,12,11,10];
                _sleepAmount = 0;
            };

            _pos = getpos _veh;
            _sleepAmount = _sleepAmount + 1;

        };
    };

}, false] call Server_Setup_Compile;

['A3PL_JobTaxi_FarePause', {

    private ["_veh"];
    _veh = param [0,objNull];
    _veh setVariable ["fare_running",false];

}, false] call Server_Setup_Compile;

['A3PL_JobTaxi_FareReset', {

    private ["_veh"];
    _veh = param [0,objNull];
    _veh setVariable ["fare_reset",true,false];
    _veh setVariable ["fare_running",false];

}, false] call Server_Setup_Compile;

['A3PL_JobTaxi_FareStart', {

    private ["_veh"];
    _veh = param [0,objNull];
    if (isNil {_veh getVariable ["fare",nil]}) exitwith {["Por favor, configure os preços da tarifa para este táxi",Color_Red] call A3PL_HUD_Notification;};
    _veh setVariable ["fare_running",true];

}, false] call Server_Setup_Compile;

['A3PL_JobTaxi_SetFare', {

    private ["_newFareArray","_display","_invalidInput","_veh","_rate"];
    _display = findDisplay 29;
    _veh = vehicle player;
    if (isNull _display) exitwith {};
    if ((typeOf _veh) != "A3PL_CVPI_Taxi") exitwith {["Você não está dentro de um táxi"] call A3PL_HUD_Notification;};
    if ((driver _veh) != player) exitwith {["Apenas o motorista do veículo pode alterar as tarifas",Color_Red] call A3PL_HUD_Notification;};

    _newFareArray = [];
    _invalidInput = false;
    {
        _ctrl = _display displayCtrl _x;
        _rate = parseNumber ctrlText _ctrl;
        if (_rate < 0) exitwith {_invalidInput = true;};
        _newFareArray pushback _rate;
    } foreach [1400,1401,1402,1403];
    if (_invalidInput) exitwith {["Um dos números que você inseriu é inválido, verifique suas taxas de tarifa e tente novamente"] call A3PL_HUD_Notification;};

    _rate = format ["%1",(_newFareArray select 1)];
    if (count _rate > 2) exitwith {["Sua taxa por 1/5 milha é maior que 99, abaixe-a",Color_Red] call A3PL_HUD_Notification;};
    if (count _rate == 1) then {_rate = format ["0%1",_rate];};
    {
        _veh setObjectTextureGlobal [_x,format ["\a3pl_cars\common\textures\numbers\%1.paa",_rate select [_forEachIndex,1]]];
    } foreach [8,9];

    _srate = _newFareArray select 2;
    _60srate = _newFareArray select 3;
    _extrasplus = _srate + _60srate;
    _extras = format ["%1",_extrasplus];
    if (_extrasplus > 1000) exitWith {["Sua tarifa por 60 segundos não pode ser maior que 1000, abaixe-a",Color_Red] call A3PL_HUD_Notification;};
    if (count _extras == 1) then {_extras = format ["0%1",_extras];};
    {
        _veh setObjectTextureGlobal [_x,format ["\a3pl_cars\common\textures\numbers\%1.paa",_extras select [_forEachIndex,1]]];
    } foreach [16,17,18];


    _veh setVariable ["fare",_newFareArray,true];
    ["As novas taxas do táxi foram definidas",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_JobTaxi_SetupFare', {

    disableSerialization;
    private ["_veh","_control","_display"];
    _veh = vehicle player;
    createDialog "Dialog_TaxiMeter";
    _display = findDisplay 29;

    {
        _control = _display displayCtrl (1400+_forEachIndex);
        _control ctrlSetText format ["%1",_x];
    } foreach (_veh getVariable ["fare",[25,10,10,5]]);

    _control = _display displayCtrl 1600;
    _control ctrlAddEventHandler ["buttonDown",{[] call A3PL_JobTaxi_SetFare;}];

}, false] call Server_Setup_Compile;
