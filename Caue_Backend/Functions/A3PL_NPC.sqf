/*
    Client
*/
['A3PL_NPC_LeaveJob', {

    _job = player getVariable ["job","unemployed"];
    [player,"unemployed"] remoteExec ["Server_NPC_RequestJob", 2];
    ["Solicitação enviada ao servidor para uma mudança de emprego para desempregado", Color_Yellow] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_NPC_ReqJobUniform', {
    _passedJob = param [0];
    _job = player getVariable ["job","unemployed"];

    if ((missionnamespace getvariable ["JobUniformTimer",time]) > time) exitwith {
        [format ["Não faça spam, tente novamente em %1 segundo(s)",round (JobUniformTimer - time)], Color_Yellow] call A3PL_HUD_Notification;
    };

    if (_passedJob == _job) then {

        if (_job isEqualTo "mcfisher") then {
            player adduniform "A3PL_mcFishers_Uniform_uniform";
            player addheadgear "A3PL_mcFishers_cap";
        } else {
            player adduniform "A3PL_TacoHell_Uniform_Uniform";
            player addheadgear "A3PL_TacoHell_cap";
        };

        JobUniformTimer = time + 300;
    } else {
        [format ["Você não trabalha aqui..."], Color_Yellow] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['A3PL_NPC_Start', {

    disableSerialization;
    private ["_idNPC","_npcText","_npcOptions","_npcActions","_display","_ctrl","_xCoor","_yCoor","_wCoor","_hCoor"];
    _idNPC = param [0,""];

    {
        if ((_x select 0) == _idNPC) exitwith
        {
            _npcText = text (_x select 1);
            _npcOptions = _x select 2;
            _npcActions = _x select 3;
        };
    } foreach Config_NPC_Text;

    if (isNil "_npcText") exitwith {};

    createDialog "Dialog_NPC";
    _display = findDisplay 27;

    A3PL_NPC_Cam = "camera" camCreate (getpos player);
    A3PL_NPC_Cam attachto [player,[0,0.37,1.6]];
    A3PL_NPC_Cam CamSetTarget (ASLToAGL (eyePos player));
    A3PL_NPC_Cam cameraEffect ["INTERNAL", "BACK", "A3PL_NPC_RT"];
    A3PL_NPC_Cam camCommit 0;

    _ctrl = _display displayCtrl 1100;
    _ctrl ctrlSetStructuredText _npcText;

    _xCoor = 0.453594 * safezoneW + safezoneX;
    _yCoor = 0.566;
    _wCoor = 0.221719 * safezoneW;
    _hCoor = 0.022 * safezoneH;

    {
        _ctrl = _display ctrlCreate ["RscButton",-1];
        _ctrl ctrlSetPosition [_xCoor,(_yCoor * safezoneH + safezoneY),_wCoor,_hCoor];
        _ctrl ctrlSetText _x;
        _ctrl buttonSetAction format ["[] spawn {%1}",("closeDialog 0; sleep 0.01;" + (_npcActions select _forEachIndex))];
        _ctrl ctrlCommit 0;
        _yCoor = _yCoor + 0.022;
    } foreach _npcOptions;

}, false] call Server_Setup_Compile;

['A3PL_NPC_TakeJob', {

    params [
        ["_job",""]
    ];

    if (_job isEqualTo "") exitwith {};

    private _toManyStaff = false;
    if (_job in ["police", "fifr"]) then {
        _playersOnline = count allPlayers;

        if (_job isEqualTo "police") then {
            _allowedCopsPercent = _playersOnline * ((100-25)/100);
            _allowedCops = round (_playersOnline - (_playersOnline - _allowedCopsPercent));
            _copsOnline = count(["police"] call A3PL_Lib_FactionPlayers);

            if (_copsOnline >= _allowedCops) exitWith {
                _toManyStaff = true;
            };
        };

        if (_job isEqualTo "fifr") then {
            _allowedFIFRPercent = _playersOnline * ((100-20)/100);
            _allowedFIFR = round (_playersOnline - (_playersOnline - _allowedFIFRPercent));
            _fifrOnline = count(["fifr"] call A3PL_Lib_FactionPlayers);

            if (_fifrOnline >= _allowedFIFR) exitWith {
                _toManyStaff = true;
            };
        };
    };

    if (_toManyStaff) exitWith {
        [format ["Desculpe a mudança atual para %1 está cheio",([_job,"name"] call Caue_Config_GetJob)], Color_Red] call A3PL_HUD_Notification;
    };

    [player,_job] remoteExec ["Server_NPC_RequestJob",2];

    [format ["Solicitação enviada ao servidor para uma mudança de emprego para %1",([_job,"name"] call Caue_Config_GetJob)], Color_Yellow] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_NPC_TakeJobResponse', {

    private ["_job","_text"];
    _response = param [0,-1];
    _job = param [1,""];

    if (_response == -1) exitwith {["System Error: No response specified in TakeJobResponse, report this error", Color_Red] call A3PL_HUD_Notification;};

    switch (_response) do
    {
        case 1: {_text = [format ["Servidor mudou seu trabalho para: %1",([_job,"name"] call Caue_Config_GetJob)],Color_Green];};
        default {_text = "Unspecified response in TakeJobResponse, report this error"};
    };

    if (isNil "_text") exitwith {[format ["System: Error in _text inside TakeJobResponse, report this error"], Color_Red] call A3PL_HUD_Notification;};

    _text call A3PL_HUD_Notification;

    if (_job == "") exitwith {};
    switch (_job) do {
        case "mcfisher": {["mcfishers_accepted"] call A3PL_NPC_Start;};
        case "fisherman": {["fisherman_accepted"] call A3PL_NPC_Start;};
        case "police": {["police_accepted"] call A3PL_NPC_Start;};
        case "fifr": {["fifr_accepted"] call A3PL_NPC_Start;};
        case "auctioneer": {["auct_accepted"] call A3PL_NPC_Start;};
        case "farmer": {["farmer_accepted"] call A3PL_NPC_Start;};
        case "roadworker": {["roadworker_accepted"] call A3PL_NPC_Start;};
        case "wildcat": {["wildcat_accepted"] call A3PL_NPC_Start;};
        case "tacohell": {["tacohell_accepted"] call A3PL_NPC_Start;};
        case "oil": {["oil_accepted"] call A3PL_NPC_Start;};
        default {};
    };

}, false] call Server_Setup_Compile;
/*
    Server
*/
['Server_NPC_RequestJob', {

    private ["_player","_job"];

    _player = param [0,ObjNull];
    _job = param [1,""];
    if (isNull _player) exitwith {};
    if (_job == "") exitwith {};

    _player setVariable ["job",_job,true];

    [1,_job] remoteExec ["A3PL_NPC_TakeJobResponse",_player];

    if (backpack _player != "A3PL_LR") then {
        if (_job IN ["fifr","police"]) then {
            removeBackpackGlobal _player;
            _player addBackpackGlobal "A3PL_LR";
        };
    };

    if (_job == "faa") then
    {
        _player setposATL [2664.96,5200.17,0.0273218];
        if (backpack _player != "tf_anarc164") then
        {
            removeBackpackGlobal _player;
            _player addBackpackGlobal "tf_anarc164";
        };
    };

}, true] call Server_Setup_Compile;
