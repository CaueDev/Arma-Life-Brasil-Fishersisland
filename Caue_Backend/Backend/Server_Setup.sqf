['Server_Setup_Init', {

    waitUntil {missionNamespace getVariable ["Server_FilesSetup",false]};

    ["a3lbr","SQL_CUSTOM","a3lbr.ini"] call Server_Database_Setup;

    [] call Server_Core_Variables;
    [] call Caue_Anticheat_Server;
    [] call Server_Gear_HandleDisconnect;

    [] spawn {
        waitUntil {!isNil "npc_bank1"};

        [] call Server_Housing_Initialize;
        [] call Server_Shop_BlackMarketPos;
        [] call Server_JobFarming_DrugDealerPos;
        [] spawn Server_JobWildcat_RandomizeRes;
        [] spawn Server_JobWildCat_RandomizeOil;
        [] call Server_Core_GetDefVehicles;
        [] spawn Server_Lumber_TreeRespawn;
        [] spawn Server_ShopStock_Load;
        [] spawn Server_Police_LockerLoad;
    };

    [] spawn Server_IE_Init;

    Ship_BlackMarket animate ["door_1",1,true];
    Ship_BlackMarket animate ["door_2",1,true];
    Ship_BlackMarket animate ["door_5",1,true];
    Ship_BlackMarket animate ["door_6",1,true];

    [] spawn {
        waitUntil {diag_tickTime >= 21000};
        [] spawn Caue_Vehicle_SaveFuel;
        [] spawn Server_Restart_Warning;
    };

    /* Loops */
    [{[] call Server_fisherman_loop;}, 60] spawn Server_Loop;
    [{[] call Server_Shop_BlackMarketPos;}, 1200] spawn Server_Loop;
    [{[] call Server_Shop_BlackMarketNear;}, 55] spawn Server_Loop;
    [{[] call Server_JobFarming_DrugDealerPos;}, 1800] spawn Server_Loop;
    [{[] spawn Server_Core_RepairTerrain;}, 300] spawn Server_Loop;
    [{[] spawn Server_Business_Loop;}, 60] spawn Server_Loop;
    [{[] spawn Server_Core_Clean;}, 900] spawn Server_Loop;
    [{[] spawn Server_JobWildcat_RandomizeRes;}, 3600] spawn Server_Loop;
    [{[] spawn Server_Fire_FireLoop;}, 10] spawn Server_Loop;
    [{[] spawn Server_IE_ShipImport;}, 2100] spawn Server_Loop;
    [{[] spawn Server_ShopStock_Save;}, 70] spawn Server_Loop;
    [{[] spawn Caue_Events_Loop;}, 3600] spawn Server_Loop;
    [{[] spawn Server_Police_LockerSave;}, 60] spawn Server_Loop;
    [{[] spawn Server_Government_Loop;}, 60] spawn Server_Loop;

    /* Animal Loops */
    [{["goat",(getMarkerPos "marker_hunting1"),["Goat","Goat02","Goat03"],200,13] spawn Server_Hunting_SpawnLoop;}, 120] spawn Server_Loop;
    [{["wildboar",(getMarkerPos "marker_hunting2"),["WildBoar"],230,13] spawn Server_Hunting_SpawnLoop;}, 123] spawn Server_Loop;
    [{["sheep",(getMarkerPos "marker_hunting3"),["Sheep","Sheep02","Sheep03"],200,13] spawn Server_Hunting_SpawnLoop;}, 125] spawn Server_Loop;

    /* Restart */
    [{[] spawn Server_Restart_Warning;}, 900] spawn Server_Loop_Realtime;

    [] spawn Server_Setup_DB;

    [] spawn Server_FactionVehicles_Init;
    [] spawn Server_Government_Init;
    [] spawn Server_FactionSetup_Init;

    0 setFog 0;
    forceWeatherChange;
    999999 setFog 0;

    ServerLoaded = true;
    publicVariable "ServerLoaded";

}, true] call Server_Setup_Compile;

['Server_Setup_DB', {

    //["ResetPlayerDB",1] call Server_Database_Async; // Reset players pos
    ["ResetVehicleDB",1] call Server_Database_ASync; //Store the cars

    /* Persistent Vars */
    [] spawn Server_Core_LoadPersistentVar;

}, true] call Server_Setup_Compile;

['Server_Loop', {

    params [
        "_code",
        ["_sleepTime", 0, [0]]
    ];

    if (!canSuspend) exitWith {};

    for "_i" from 0 to 1 step 0 do {
        sleep _sleepTime;
        call _code;
    };

}, true] call Server_Setup_Compile;

['Server_Loop_Realtime', {

    params [
        "_code",
        ["_sleepTime", 0, [0]]
    ];

    if (!canSuspend) exitWith {};

    for "_i" from 0 to 1 step 0 do {
        uiSleep _sleepTime;
        call _code;
    };

}, true] call Server_Setup_Compile;
