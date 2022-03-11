['A3PL_Exterminator_KillEH', {

    private ["_animals"];
    _animals = param [0,[]];
    {
        _x addEventHandler ["killed",
        {
            if ((param [2,objNull]) == player) then
            {
                private ["_animal"];
                _animal = param [0,objNull];

                ["Você matou um dos animais e ganhou $1500",Color_Green] call A3PL_HUD_Notification;
                player setVariable ["getjobplayerguy",(player getVariable ["getjobplayerguy",0])+1500,true];
                A3PL_Exterminator_PestAnimals = A3PL_Exterminator_PestAnimals - [_animal];
                publicVariable "A3PL_Exterminator_PestAnimals";
                deleteVehicle _animal;
                deleteVehicle _animal;

                if (count A3PL_Exterminator_PestAnimals <= 4) then
                {
                    [] call A3PL_Exterminator_PestStart;
                    ["Parece que esta praga está sob controle, verifique seu mapa para um novo local!",Color_Green] call A3PL_HUD_Notification;
                };
            };
        }];
    } foreach _animals;

}, false] call Server_Setup_Compile;

['A3PL_Exterminator_Loop', {

    private ["_animals"];
    _animals = missionNameSpace getVariable ["A3PL_Exterminator_PestAnimals",[]];
    [_animals] call A3PL_Exterminator_KillEH;
    while {(player getVariable ["job","unemployed"]) isEqualTo "extermy"} do
    {
        private ["_markers","_marker"];
        _animals = missionNameSpace getVariable ["A3PL_Exterminator_PestAnimals",[]];
        _markers = [];
        {
            _marker = createMarkerLocal [format["%1_marker",floor (random 5000)],getpos _x];
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerColorLocal "ColorRed";
            _marker setMarkerTypeLocal "Mil_dot";
            _marker setMarkerTextLocal "Extermine este animal!";
            _markers pushback _marker;
        } foreach _animals;

        { deleteMarkerLocal _x; } foreach (missionNameSpace getVariable ["A3PL_Exterminator_Markers",[]]);
        A3PL_Exterminator_Markers = _markers;

        uiSleep 2;
    };

    { deleteMarkerLocal _x; } foreach A3PL_Exterminator_Markers;

}, false] call Server_Setup_Compile;

['A3PL_Exterminator_PestStart', {

    private ["_houses","_animals"];

    _animals = missionNameSpace getVariable ["A3PL_Exterminator_PestAnimals",[]];
    if ((count _animals) >= 4) exitwith {[] spawn A3PL_Exterminator_Loop;};

    [] call A3PL_Exterminator_SpawnPest;

    [] spawn A3PL_Exterminator_Loop;

}, false] call Server_Setup_Compile;

['A3PL_Exterminator_SpawnPest', {

    private ["_animals","_random","_animal","_animalType","_pos","_houses"];
    _animals = missionNameSpace getVariable ["A3PL_Exterminator_PestAnimals",[]];
    {deleteVehicle _x} foreach _animals;

    _houses = nearestObjects [[7661.16,6609.34,0], ["Land_Home1g_DED_Home1g_01_F","Land_Mansion01","Land_A3PL_Ranch1","Land_A3PL_Ranch2","Land_A3PL_Ranch3","Land_A3PL_ModernHouse1","Land_A3PL_ModernHouse2","Land_A3PL_ModernHouse3","Land_A3PL_BostonHouse","Land_A3PL_Shed3","Land_A3PL_Shed4","Land_A3PL_Shed2"], 6000,true];
    _pos = getpos (_houses select (floor(random ((count _houses)-1))));
    if (isNil "_pos") exitwith {[] call A3PL_Exterminator_SpawnPest;};

    _animalType = "Rabbit_F";

    A3PL_Exterminator_PestAnimals = [];
    for "_i" from 0 to (8 + (round (random 7))) do
    {
        _animal = createAgent [_animalType, _pos, [], 25, "NONE"];
        A3PL_Exterminator_PestAnimals pushback _animal;
    };
    publicVariable "A3PL_Exterminator_PestAnimals";

}, false] call Server_Setup_Compile;

['A3PL_Exterminator_Start', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_mask"];
    if (!(["ccp"] call Caue_DMV_Check)) exitwith {["Você não tem um porte de armas, um porte de armas é necessário para este trabalho!"] call A3PL_HUD_Notification;};
    if ((player getVariable ["job","unemployed"]) isEqualTo "extermy") exitwith {["Você parou de trabalhar como Exterminador!",Color_Red]; [] call A3PL_NPC_LeaveJob};
    if (handgunWeapon player == "") exitwith {["Você não está carregando uma arma, você precisa equipar uma pistola para começar este trabalho!"] call A3PL_HUD_Notification;};

    player setVariable ["job","extermy"];
    ["Vá pegar seu veiculo e verifique o mapa para o seu destino, mate as praga e você será recompensado!",Color_Green] call A3PL_HUD_Notification;

    player addUniform "A3PL_Exterminator_Uniform";
    player addgoggles "A3PL_FD_Mask";
    _mask = createVehicle ["A3PL_FD_Mask_Obj", getpos player, [], 0, "CAN_COLLIDE"];
    _mask attachto [player,[-0.12,-0.15,-0.73],"RightHand"];
    player playaction "gesture_maskon";
    [_mask] spawn
    {
        sleep 2.5;
        deleteVehicle (param [0,objNull]);
    };

    ["A3PL_Mailtruck",[6801.26,7627.35,0.0135574],"EXTERMY",1800] spawn A3PL_Lib_JobVehicle_Assign;
    [] call A3PL_Exterminator_PestStart;

}, false] call Server_Setup_Compile;
