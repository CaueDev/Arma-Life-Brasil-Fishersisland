if (missionNamespace getVariable ["Server_Started",false]) exitWith {};
Server_Started = true;

[] spawn {
	waitUntil {missionNamespace getVariable ["Server_FilesSetup",false]};
	waitUntil {!isNil "Server_Setup_Init"};

	[] spawn Server_Setup_Init;
};

Server_Setup_Compile = {
	params [
		["_name","",[""]],
		["_code",{},[{}]],
		["_forServer",false,[false]],
		["_final",false,[false]]
	];

	private _compile = formatText ["%1 = %2;", _name, _code];

	if (_final) then {
		call compileFinal str(_compile);
	} else {
		call compile str(_compile);
	};

	if (!_forServer) then {
		publicVariable _name;
	};
};

Server_Files = [
    ["Backend", "Server_Setup"],
	["Backend", "Server_Database"],
	["Backend", "Server_Log"],
	["Backend", "Server_Core"],
	["Configs", "Caue_Config"],
	["Configs", "Config_Master"],
    ["Functions", "A3PL_Admin"],
    ["Functions", "A3PL_ATC"],
    ["Functions", "Caue_ATM"],
    ["Functions", "Caue_BHeist"],
    ["Functions", "A3PL_Business"],
    ["Functions", "A3PL_Create"],
	["Functions", "A3PL_Delivery"],
	["Functions", "Caue_DMV"],
	["Functions", "A3PL_Dogs"],
	["Functions", "A3PL_Drugs"],
	["Functions", "Caue_Eventhandlers"],
	["Functions", "A3PL_Exterminator"],
	["Functions", "Caue_Factory"],
    ["Functions", "A3PL_FD"],
    ["Functions", "A3PL_Fire"],
	["Functions", "A3PL_Garage"],
    ["Functions", "Caue_Gear"],
    ["Functions", "A3PL_Goose"],
	["Functions", "Caue_Mayor"],
	["Functions", "Caue_Housing"],
	["Functions", "A3PL_HUD"],
	["Functions", "A3PL_Hunting"],
    ["Functions", "A3PL_Hydrogen"],
    ["Functions", "A3PL_IE"],
    ["Functions", "Caue_Interaction"],
    ["Functions", "Caue_Intersect"],
	["Functions", "Caue_Inventory"],
	["Functions", "Caue_Items"],
    ["Functions", "A3PL_JobFarming"],
    ["Functions", "A3PL_JobFisherman"],
    ["Functions", "A3PL_JobMcFisher"],
    ["Functions", "A3PL_JobMechanic"],
    ["Functions", "A3PL_JobOil"],
	["Functions", "A3PL_JobRoadWorker"],
	["Functions", "A3PL_JobTaxi"],
	["Functions", "A3PL_JobWildcat"],
	["Functions", "A3PL_Lib"],
    ["Functions", "Caue_Loading"],
	["Functions", "Caue_Loop"],
    ["Functions", "A3PL_Lumber"],
	["Functions", "Caue_Trunk"],
    ["Functions", "Caue_Map"],
	["Functions", "Caue_Medical"],
    ["Functions", "A3PL_Moonshine"],
	["Functions", "A3PL_NPC"],
	["Functions", "Caue_Phone"],
    ["Functions", "A3PL_Pickup"],
	["Functions", "A3PL_Placeable"],
	["Functions", "A3PL_Placeables"],
	["Functions", "Caue_Player"],
	["Functions", "Caue_Police"],
	["Functions", "A3PL_Prison"],
	["Functions", "A3PL_Resources"],
	["Functions", "Caue_Shop"],
	["Functions", "Caue_ShopStock"],
	["Functions", "Caue_Storage"],
	["Functions", "Caue_Twitter"],
	["Functions", "A3PL_Uber"],
	["Functions", "A3PL_USCG"],
	["Functions", "A3PL_Vehicle"],
	["Functions", "A3PL_Waste"],
	["Functions", "Caue_Faction_Setup"],
	["Functions", "Caue_Faction_Vehicles"],
	["Functions", "Caue_Faction_Bank"],
	["Functions", "Caue_Government"],
	["Functions", "Caue_Clothing"],
	["Functions", "Caue_Robbery"],
	["Functions", "Caue_Animations"],
	["Functions", "Caue_Debug"],
	["Functions", "Caue_Wiki"],
	["Functions", "Caue_Events"],
	["Functions", "Caue_Keys"],
	["Functions", "Caue_Combine"],
	["Functions", "Caue_Anticheat"]
];

Server_SetupFiles = {
	{
		private _type = _x select 0;
		private _name = _x select 1;

		call compile preprocessFile format ['\Caue_Backend\%1\%2.sqf',_type,_name];
		diag_log format["Server Setup: File %1.sqf Ready",_name];
	} forEach Server_Files;

    Server_FilesSetup = true;
	diag_log "Server Setup: All Files Ready";
};

[] spawn Server_SetupFiles;
