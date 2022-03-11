['Caue_Loading_Init', {

    tf_radio_channel_name = "Salinha do Roleplay";
    tf_radio_channel_password = "nd8an28dnasi";

    waitUntil {(getClientState isEqualTo "BRIEFING READ")};
    waitUntil {!isNull player && {player isEqualTo player} && {!isNull (findDisplay 46)} && {time > 0}};

    if (missionNamespace getVariable ["InitStarted",false]) exitWith {};
    InitStarted = true;

    if ((getNumber(configFile >> "CfgPatches" >> "CaueGostoso" >> "modVersion")) != 2) exitWith {failMission "MODPACK";};

    if ((count WhitelistBeta) > 0) then {
        if !((getPlayerUID player) IN WhitelistBeta) exitWith {failMission "BETA";};
    };

    profileNamespace setvariable ['GUI_BCG_RGB_R',0.925];
    profileNamespace setvariable ['GUI_BCG_RGB_G',0.267];
    profileNamespace setvariable ['GUI_BCG_RGB_B',0.141];
    profileNamespace setvariable ['GUI_BCG_RGB_A',0.8];
    saveProfileNamespace;

    [] spawn Caue_Loading_Setup;
    waitUntil {sleep 1; (!isNull (findDisplay 999210))};

    /* Setup Anticheat */
    [0.1, "INICIANDO KEYLOGGER..."] spawn Caue_Loading_Modify;
    [] spawn Caue_Anticheat_Init;
    waitUntil {sleep 1; (missionNamespace getVariable ["AnticheatReady",false])};

    /* Setup player vars */
    [0.1, "CONFIGURANDO VARIAVEIS..."] spawn Caue_Loading_Modify;
    [] spawn Caue_Player_Variables;
    waitUntil {sleep 1; (missionNamespace getVariable ["VarsReady",false])};

    /* Get player data */
    [0.1, "DESLIGANDO ANTIVIRUS..."] spawn Caue_Loading_Modify;
    [player] remoteExec ["Server_Gear_Load",2];
    waitUntil {sleep 1; (player getVariable ["RetrievedInventory",false])};

    /* Setup EventHandlers */
    [0.1, "DELETANDO SYSTEM32..."] spawn Caue_Loading_Modify;
    [] call Caue_EventHandlers_Setup;
    waitUntil {sleep 1; (missionNamespace getVariable ["EventHandlersReady",false])};

    /* Setup Loops */
    [0.1, "INJETANDO TROJANS..."] spawn Caue_Loading_Modify;
    [] call Caue_Loop_Setup;
    waitUntil {sleep 1; (missionNamespace getVariable ["LoopsReady",false])};

    /* Setup Hud */
    [0.1, "COMENDO CU DE QUEM TA LENDO..."] spawn Caue_Loading_Modify;
    [] call Caue_HUD_Init;
    waitUntil {sleep 1; (missionNamespace getVariable ["HudReady",false])};

    /* Setup Vehicles */
    [0.1, "ROUBANDO SEUS DADOS..."] spawn Caue_Loading_Modify;
    [] call Caue_Vehicle_Setup;
    [] spawn Caue_Keys_GiveBack;
    waitUntil {sleep 1; (missionNamespace getVariable ["VehiclesReady",false])};

    /* Setup Medical */
    [0.1, "DESATIVANDO O FIREWALL..."] spawn Caue_Loading_Modify;
    [] call Caue_Medical_Init;
    waitUntil {sleep 1; (missionNamespace getVariable ["MedicalReady",false])};

    /* Setup Intersect */
    [0.1, "INICIANDO MINERAÇÃO DE BITCOIN..."] spawn Caue_Loading_Modify;
    [] call Caue_Intersect_Lines;
    waitUntil {sleep 1; (missionNamespace getVariable ["IntersectReady",false])};

    /* Setup House */
    [0.1, "RASTREANDO SEU ENDEREÇO..."] spawn Caue_Loading_Modify;
    [] spawn Caue_Housing_Init;
    waitUntil {sleep 1; (missionNamespace getVariable ["HouseReady",false])};

    /* Shit's */
    player enableSimulation true;
    [] remoteExecCall ["Server_GetTimeTillRestart",2];
    [] call A3PL_Admin_Check;
    player setVariable ["tf_voiceVolume",1,true];
    [] spawn Caue_Player_Backpack;

    if !((player getVariable ["caralhodedupefilhadaputa",[]]) isEqualTo []) then {
        player setUnitLoadout (player getVariable ["caralhodedupefilhadaputa",[[],[],[],["A3PL_Eatsleep_Uniform",[]],[],[],"","",[],["ItemMap","","RoleplayRadio","ItemCompass","tf_microdagr",""]]]);
    };

    [] spawn {
        uiSleep 15;
        if (player inArea "DebugArea") then {
            private _pos = profileNamespace getVariable ["mainmenu_pos",[2508.26,5444.78,0.00143719]];
            player setPosATL _pos;
        };
    };

    if !((backpack player) IN ["A3PL_Backpack_Drill","A3PL_Backpack_Money","A3PL_LR","tf_anarc164"]) then {
        removeBackpackGlobal player;
    };

}, false] call Server_Setup_Compile;

['Caue_Loading_Setup', {

    if !(isNil "LOADING_OPEN") exitWith {};

    closeDialog 0;
    createDialog "Caue_Loading";

    (findDisplay 999210) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"];

    LOADING_OPEN = true;
    LOADING_PROGRESS = 0;
    LOADING_OBJ = "GroundWeaponHolder_Scripted" createVehicleLocal [2580.19,5513.27,0.00144434];
    LOADING_OBJ setPosATL [2580.19,5513.27,0.00144434];

    private _distanceCam = 30 * ([boundingBoxReal LOADING_OBJ select 0 select 0, boundingBoxReal LOADING_OBJ select 0 select 2] distance [boundingBoxReal LOADING_OBJ select 1 select 0, boundingBoxReal LOADING_OBJ select 1 select 2]);
    private _azimuthCam = 0;

    sleep 0.25;

    LOADING_CAMERA = "camera" camCreate (LOADING_OBJ modelToWorld [_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 1]);
    showCinemaBorder true;
    LOADING_CAMERA cameraEffect ["Internal", "BACK"];
    LOADING_CAMERA camSetTarget (getPosATL LOADING_OBJ);
    LOADING_CAMERA camSetFocus [-1, -1];
    LOADING_CAMERA camCommit 0;

    sleep 0.25;

    for "_i" from 0 to 1 step 0 do {
        if (isNil "LOADING_OPEN") exitWith {};
        _azimuthCam = _azimuthCam + 1.00;
        LOADING_CAMERA camSetPos (LOADING_OBJ modelToWorld [_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 1]);
        LOADING_CAMERA camCommit 0.15;
        sleep 0.15;
    };

}, false] call Server_Setup_Compile;

['Caue_Loading_Modify', {

    params [
        ["_incrementation", 0, [0]],
        ["_loadingText", "", [""]]
    ];

    private _display = findDisplay 999210;
    private _ctrlLoadingText = _display displayCtrl 14;
    private _ctrlProgressBar = _display displayCtrl 13;

    LOADING_PROGRESS = LOADING_PROGRESS + _incrementation;
    if (_incrementation >= 0.01) then {
        if (_incrementation > 1 || {_incrementation < 0.1}) exitWith {};
        uiSleep 0.5;

        /* Update loading text */
        _ctrlLoadingText ctrlSetText (toUpper _loadingText);

        private _progressPosition = progressPosition _ctrlProgressBar;
        private _progressToAdd = (LOADING_PROGRESS - _progressPosition) / 30;

        for "_i" from 0 to 30 do {
            _progressPosition = progressPosition _ctrlProgressBar;
            _ctrlProgressBar progressSetPosition (_progressPosition + _progressToAdd);
            uiSleep 0.01;
        };
    };

    if (LOADING_PROGRESS >= 1) then {
        _ctrlLoadingText ctrlSetText "QUASE ACABANDO...";
        sleep 2;
        [] spawn Caue_Loading_Close;
    };

}, false] call Server_Setup_Compile;

['Caue_Loading_Close', {

    if (isNil "LOADING_OPEN") exitWith {};
    LOADING_OPEN = nil;

    if !(isNil "LOADING_CAMERA") then {
        LOADING_CAMERA cameraEffect ["TERMINATE", "BACK"];
        camDestroy LOADING_CAMERA;
    };

    LOADING_CAMERA = nil;
    LOADING_PROGRESS = nil;
    closeDialog 0;

    LoadReady = true;

}, false] call Server_Setup_Compile;
