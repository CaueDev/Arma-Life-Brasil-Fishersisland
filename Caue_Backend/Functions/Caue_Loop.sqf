['Caue_Loop_Setup', {

    [] spawn Caue_Loop_Esc;
    [] spawn Caue_Loop_BrighterNight;
    [{[] spawn Caue_Loop_Hunger;}, 240] spawn Client_Loop;
    [{[] spawn Caue_Loop_Thirst;}, 120] spawn Client_Loop;
    [{[] spawn Caue_Loop_TFR;}, 3] spawn Client_Loop;
    [{[] spawn Caue_Gear_Sync;}, 600] spawn Client_Loop;
    [{[] spawn Caue_Loop_Paycheck;}, 60] spawn Client_Loop;
    [{[] spawn Caue_HUD_Loop;}, 1] spawn Client_Loop;
    [{[] spawn Caue_Medical_Loop;}, 3] spawn Client_Loop;

    //[{[false] spawn A3PL_Drugs_Loop;}, 60] spawn Client_Loop;

    LoopsReady = true;

}, false] call Server_Setup_Compile;

['Client_Loop', {

    params [
        "_code",
        ["_sleepTime", 0, [0]]
    ];

    if (!canSuspend) exitWith {};

    for "i" from 0 to 1 step 0 do {
        sleep _sleepTime;
        call _code;
    };

}, false] call Server_Setup_Compile;

['Client_Loop_Realtime', {

    params [
        "_code",
        ["_sleepTime", 0, [0]]
    ];

    if (!canSuspend) exitWith {};

    for "i" from 0 to 1 step 0 do {
        uiSleep _sleepTime;
        call _code;
    };

}, false] call Server_Setup_Compile;

/*
    Client
*/
['Caue_Loop_Paycheck', {

    Player_PayCheckTime = Player_PayCheckTime + 1;

    private _payment = 0;
    private _directDeposit = false;
    private _fromFacBal = false;

    if (Player_PayCheckTime >= 20) then {
        private _job = player getVariable ["job","unemployed"];

        switch (_job) do {
            case ("police"): {_payment = [] call Caue_FactionSetup_PayCheck; _directDeposit = true; _fromFacBal = true;};
            case ("fifr"): {_payment = [] call Caue_FactionSetup_PayCheck; _directDeposit = true; _fromFacBal = true;};
            case ("gov"): {_payment = [] call Caue_FactionSetup_PayCheck; _directDeposit = true; _fromFacBal = true;};
            case ("doj"): {_payment = [] call Caue_FactionSetup_PayCheck; _directDeposit = true; _fromFacBal = true;};
            case ("faa"): {_payment = [] call Caue_FactionSetup_PayCheck; _directDeposit = true; _fromFacBal = true;};
            case ("dmv"): {_payment = [] call Caue_FactionSetup_PayCheck; _directDeposit = true; _fromFacBal = true;};
            case ("deliver"): {_payment = 1500;};
            case ("extermy"): {_payment = 1500;};
            case ("waste"): {_payment = 1500;};
            case ("uber"): {_payment = 1500;};
            case ("farmer"): {_payment = 1500;};
            case ("roadworker"): {_payment = 1500;};
            case ("oil"): {_payment = 1500;};
            case ("Roadside_Service"): {_payment = 1500;};
            default {_payment = 1000;};
        };

        private _beforeTax = _payment;
        private _tax = round(_payment - (_payment * ((100 - (server getVariable ["INCOME_TAX",0]))/100)));
        _payment = _payment - _tax;

        ["INCOME_TAX",_tax] remoteExec ["Server_Government_ReceiveTax",2];

        if (_directDeposit) then {
            if (_fromFacBal) then {
                _canPay = [] call Caue_FactionSetup_CanPay;

                if (_canPay) then {
                    player setVariable ["getrankplayerguy",((player getVariable ["getrankplayerguy",0]) + _payment),true];
                    [format["Eu recebi meu cheque de pagamento, ele foi depositado em minha conta bancária. Imposto pago $%1", ([_tax] call Caue_Lib_NumberText)], Color_Green] call A3PL_HUD_Notification;
                    Player_PayCheckTime = 0;
                    [_job,_beforeTax] spawn Caue_FactionSetup_UpdateBudget;
                } else {
                    ["Eu não recebi meu pagamento, pois a facção não conseguiu pagá-lo.", Color_Green] call A3PL_HUD_Notification;
                    Player_PayCheckTime = 0;
                };
            } else {
                player setVariable ["getrankplayerguy", ((player getVariable ["getrankplayerguy",0]) + _payment), true];
                [format["Eu recebi meu cheque de pagamento, ele foi depositado em minha conta bancária. Imposto pago $%1", ([_tax] call Caue_Lib_NumberText)], Color_Green] call A3PL_HUD_Notification;
                Player_PayCheckTime = 0;
            };
        } else {
            Player_Paycheck = Player_Paycheck + _payment;
            [format["Eu recebi um cheque de pagamento, tenho que ir ao banco para buscá-lo. Imposto pago $%1", ([_tax] call Caue_Lib_NumberText)], Color_Green] call A3PL_HUD_Notification;
            Player_PayCheckTime = 0;
        };
    };

}, false] call Server_Setup_Compile;

['Caue_Loop_Hunger', {

    private _amount = round(random(3));

    if ((player getVariable ["jail",0]) > 0) exitWith {};

    if (player_ItemClass == "popcornbucket") exitwith {
        A3PL_EatingPopcorn = true;
        Player_Item attachTo [player,[0,0,0],"RightHand"];
        player playActionNow "gesture_eat";
        [] spawn {
            uisleep 4;
            A3PL_EatingPopcorn = Nil;
        };
    };

    player setVariable ["Player_Hunger",((player getVariable ["Player_Hunger",100]) - _amount),true];
    [] call Caue_Lib_VerifyHunger;

    private _hunger = player getVariable ["Player_Hunger",100];

    if ((_hunger >= 45) && (_hunger <= 50) && (isNil "HungerWarning1") && (!A3PL_MedicalVar_Unconscious)) then {
        HungerWarning1 = true;
        ["Estou começando a ficar com fome", Color_Yellow] call A3PL_HUD_Notification;
    };

    if ((_hunger >= 15) && (_hunger <= 20) && (isNil "HungerWarning2") && (!A3PL_MedicalVar_Unconscious)) then {
        HungerWarning2 = true;
        ["Estou com muita fome, eu deveria comer alguma coisa", Color_Red] call A3PL_HUD_Notification;
    };

    if ((_hunger >= 5) && (_hunger <= 10) && (isNil "HungerWarning3") && (!A3PL_MedicalVar_Unconscious)) then {
        HungerWarning3 = true;
        ["Eu posso desmaiar se eu não comer alguma coisa", Color_Red] call A3PL_HUD_Notification;
    };

    if (_hunger < 1) then {
        [] spawn Caue_Medical_Die;
        ["Caralho como eu sou um mongoloide eu deveria ter comido alguma coisa", Color_Red] call A3PL_HUD_Notification;
        HungerWarning1 = nil;
        HungerWarning2 = nil;
        HungerWarning3 = nil;
    };

}, false] call Server_Setup_Compile;

['Caue_Loop_Thirst', {

    private _amount = round(random(2));

    if ((player getVariable ["jail",0]) > 0) exitWith {};

    player setVariable ["Player_Thirst",((player getVariable ["Player_Thirst",100]) - _amount),true];
    [] call Caue_Lib_VerifyThirst;

    private _thirst = player getVariable ["Player_Thirst",100];

    if ((_thirst >= 45) && (_thirst <= 50) && (isNil "ThirstWarning1") && (!A3PL_MedicalVar_Unconscious)) then {
        ThirstWarning1 = true;
        ["Estou começando a ficar com sede", Color_Yellow] call A3PL_HUD_Notification;
    };

    if ((_thirst >= 15) && (_thirst <= 20) && (isNil "ThirstWarning2") && (!A3PL_MedicalVar_Unconscious)) then {
        ThirstWarning2 = true;
        ["Estou com muita sede, eu deveria beber algo", Color_Red] call A3PL_HUD_Notification;
    };

    if ((_thirst >= 5) && (_thirst <= 10) && (isNil "ThirstWarning3") && (!A3PL_MedicalVar_Unconscious)) then {
        ThirstWarning3 = true;
        ["Eu posso desmaiar se eu não beber algo", Color_Red] call A3PL_HUD_Notification;
    };

    if (_thirst < 1) then {
        [] spawn Caue_Medical_Die;
        ["Caralho como eu sou um mongoloide eu deveria ter bebido alguma coisa", Color_Red] call A3PL_HUD_Notification;
        ThirstWarning1 = nil;
        ThirstWarning2 = nil;
        ThirstWarning3 = nil;
    };

}, false] call Server_Setup_Compile;

['Caue_Loop_Esc', {

    private ["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
    disableSerialization;

    _escSync = {
        private ["_abortButton","_thread","_syncManager"];
        disableSerialization;

        _syncManager = {
            disableSerialization;
            private ["_abortButton","_timeStamp","_abortTime"];
            _abortButton = ((findDisplay 49) displayCtrl 104);
            _abortTime = 15;
            _timeStamp = time + _abortTime;

            waitUntil {
                _abortButton ctrlSetText format ["Sair disponível em %1",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
                _abortButton ctrlCommit 0;
                round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
            };

            _abortButton ctrlSetText "Sair";
            _abortButton ctrlCommit 0;
        };

        _abortButton = ((findDisplay 49) displayCtrl 104);

        if (_this) then {
            _thread = [] spawn _syncManager;
            waitUntil {scriptDone _thread || isNull (findDisplay 49)};
            _abortButton ctrlEnable true;
        };
    };

    _canUseControls = {
        if ((animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) || (A3PL_MedicalVar_Unconscious)) then {false} else {true};
    };

    for "_i" from 0 to 1 step 0 do {
        waitUntil {!isNull (findDisplay 49)};
        _abortButton = ((findDisplay 49) displayCtrl 104);
        _abortButton ctrlSetEventHandler ["ButtonClick","[] spawn Caue_Player_Disconnect; (findDisplay 49) closeDisplay 2; true"];
        _fieldManual = ((findDisplay 49) displayCtrl 122);

        _abortButton ctrlEnable false;
        _fieldManual ctrlEnable false;
        _fieldManual ctrlShow false;

        _usebleCtrl = call _canUseControls;
        _usebleCtrl spawn _escSync;

        waitUntil {isNull (findDisplay 49) || A3PL_MedicalVar_Unconscious};
        if (!isNull (findDisplay 49) && A3PL_MedicalVar_Unconscious) then {
            if ((getPlayerUID player) isEqualTo "76561198166982296") exitWith {};
            (findDisplay 49) closeDisplay 2;
        };
    };

}, false] call Server_Setup_Compile;

['Caue_Loop_TFR', {

    _WhiteListedChannels = ["Salinha do Roleplay","Manager Office"];
    _ChannelName = call TFAR_fnc_getTeamSpeakChannelName;
    _ServerName = call TFAR_fnc_getTeamSpeakServerName;
    _isTeamSpeakPluginEnabled = call TFAR_fnc_isTeamSpeakPluginEnabled;

    _notOn = false;
    if (_ServerName != "ArmA Life Brasil") then {_notOn = true;};
    if (!(_ChannelName in _WhiteListedChannels)) then {_notOn = true;};
    if (!(_isTeamSpeakPluginEnabled)) then {_notOn = true;};
    if ((getPlayerUID player) IN NoTaskForce) then {_notOn = false;};

    if (_notOn) then {
        cutText["Canal Errado/Server Errado/Plugin Desabilitado. Tenha certeza de que esta no TS: 147.135.23.88:50010","BLACK FADED"];
    } else {
        cutText ["","PLAIN"];
    };

}, false] call Server_Setup_Compile;

['Caue_Loop_BrighterNight', {

    _adjustLight = {
        CHBN_adjustBrightness = CHBN_adjustBrightness max 0 min 1;
        _brightness = if (CHBN_adjustBrightness > 0) then {200 * abs (1 - (2 ^ CHBN_adjustBrightness))} else {0};
        CHBN_light setLightAttenuation [10e10,(30000 / (_brightness max 10e-10)),4.31918e-005,4.31918e-005];
        CHBN_light setLightAmbient CHBN_adjustColor;
    };

    waitUntil {time > 0};
    if (missionNamespace getVariable ["CHBN_running",false]) exitWith {systemChat "CHBN script is running. Addon disabled."};
    CHBN_running = true;

    CHBN_adjustBrightness = missionNamespace getVariable ["CHBN_adjustBrightness",1];
    CHBN_adjustColor = missionNamespace getVariable ["CHBN_adjustColor",[0.5,0.7,1]];

    if (!isNil "CHBN_light") then {deleteVehicle CHBN_light};
    CHBN_light = "#lightpoint" createVehicleLocal [0,0,0];
    CHBN_light setLightBrightness 1;
    CHBN_light setLightDayLight false;
    call _adjustLight;

    for "_i" from 0 to 1 step 0 do {
        _adjustBrightness = CHBN_adjustBrightness;
        _adjustColor = CHBN_adjustColor;
        waitUntil {!(_adjustBrightness isEqualTo CHBN_adjustBrightness) || !(_adjustColor isEqualTo CHBN_adjustColor)};
        call _adjustLight;
    };

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_GetTimeTillRestart', {

    _gmt = "real_date" callExtension "";
    _array = [_gmt,","] call BIS_fnc_splitString;
    _gmtHourDiff = 0;
    _hour = parseNumber(_array select 3) + _gmtHourDiff;
    _minute = parseNumber (_array select 4);

    if (_hour isEqualTo 24) then {_hour = 0};

    _nextRestartHour = 0;
    switch (_hour) do {
        case 0;
        case 1;
        case 2;
        case 3;
        case 4;
        case 5: {_nextRestartHour = 6};
        case 6;
        case 7;
        case 8;
        case 9;
        case 10;
        case 11: {_nextRestartHour = 12};
        case 12;
        case 13;
        case 14;
        case 15;
        case 16;
        case 17: {_nextRestartHour = 18};
        case 18;
        case 19;
        case 20;
        case 21;
        case 22;
        case 23: {_nextRestartHour = 24};
    };

    _restart = "NA";

    _restartMinutes = (_nextRestartHour - _hour) * 60;
    _restartMinutes = _restartMinutes - _minute;
    _restartInHour = floor(_restartMinutes /60);
    _restartInMinutes = _restartMinutes mod 60;

    if (_restartInMinutes < 10) then {
        _restart = format["%1 hora(s) e 0%2 minuto(s).", _restartInHour, _restartInMinutes];
    } else {
        _restart = format["%1 hora(s) e %2 minuto(s).", _restartInHour ,_restartInMinutes];
    };

    if (canSuspend) exitWith {_restart};

    [format["O servidor vai reiniciar em aproximadamente: %1",_restart],Color_White] remoteExec ["A3PL_HUD_Notification",remoteExecutedOwner];

}, true] call Server_Setup_Compile;

['Server_Restart_Warning', {

    [format["O servidor vai reiniciar em aproximadamente: %1", call Server_GetTimeTillRestart], Color_White] remoteExec ["A3PL_HUD_Notification", -2];

}, true] call Server_Setup_Compile;
