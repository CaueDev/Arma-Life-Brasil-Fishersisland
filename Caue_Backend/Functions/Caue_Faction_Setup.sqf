/*
	Client Functions
*/
["Caue_FactionSetup_Open", {

	if !([(player getVariable ["faction", "citizen"])] call Caue_FactionSetup_IsLeader) exitWith {};

	closeDialog 0;
	createDialog "Dialog_FactionSetup";

	SELECTED_FACTION_RANK = -1;
	FACTION_MEMBERS = [];

	[] call Caue_FactionSetup_Load;

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_Load", {

	private _display = findDisplay 111;
	private _myFaction = player getVariable ["faction", "citizen"];

	private _factionRanks = [_myFaction] call Caue_FactionSetup_GetRanks;
	private _factionSettings = [(player getVariable ["faction", "citizen"])] call Caue_FactionSetup_GetBudget;

	(_display displayCtrl 1502) lbAdd "Remover";
	{
		(_display displayCtrl 1502) lbAdd format["%1 : $%2", (_x select 0), ([(_x select 1)] call Caue_Lib_NumberText)];
		(_display displayCtrl 1502) lbSetData [(lbSize 1502)-1, format["%1", (_x select 1)]];
	} forEach _factionRanks;

	[_myFaction,player] remoteExecCall ["Server_FactionSetup_Members",2];
	[] spawn Caue_FactionSetup_BPAdd;

	(_display displayCtrl 1502) ctrlAddEventHandler ["LBSelChanged", {
		private _display = findDisplay 111;
		private _ctrl = _display displayCtrl 1502;

		SELECTED_FACTION_RANK = lbCurSel _ctrl;

		[] call Caue_FactionSetup_RankMembers;
		(_display displayCtrl 1401) ctrlSetText (_ctrl lbData SELECTED_FACTION_RANK);
	}];

	(_display displayCtrl 1100) ctrlSetText format["$%1", ([(server getVariable [_factionSettings,0])] call Caue_Lib_NumberText)];

	(_display displayCtrl 1603) buttonSetAction "[] spawn Caue_FactionSetup_SetRankPay";
	(_display displayCtrl 1600) buttonSetAction "[] spawn Caue_FactionSetup_UpdateRankMenu";
	(_display displayCtrl 1606) buttonSetAction "[] spawn Caue_FactionSetup_BPCreate";

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_Members", {

	FACTION_MEMBERS = _this;
	private _display = findDisplay 111;

	FACTION_MEMBERS sort true;
	private _control = _display displayCtrl 1501;

	lbClear _control;
    {
        _x params ["_name","_uid"];
        private _index = _control lbAdd _name;
        _control lbSetData [_index,_uid];
    } foreach FACTION_MEMBERS;

	(_display displayCtrl 1101) ctrlSetText format["%1", (count FACTION_MEMBERS)];

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_RankMembers", {

	private _display = findDisplay 111;
	private _control = _display displayCtrl 1500;

	lbClear _control;
    {
		_x params ["_name","_uid","_rank"];
		if (_rank isEqualTo SELECTED_FACTION_RANK) then {_control lbAdd _name;};
    } forEach FACTION_MEMBERS;

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_GetRanks", {

	params [
		["_faction", "police"]
	];

	private _return = [];

	for "_i" from 1 to (call compile format["%1_MAXRANK", _faction]) do {
		_return pushBack (call compile format["%1_%2", _faction, (_i)]);
	};

	_return;

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_SetRankPay", {

	private _display = findDisplay 111;

	if (SELECTED_FACTION_RANK isEqualTo -1) exitWith {};
	if (SELECTED_FACTION_RANK isEqualTo 0) exitWith {};

	private _ranks = [player getVariable ["faction", "citizen"]] call Caue_FactionSetup_GetRanks;
	private _rank = _ranks select (SELECTED_FACTION_RANK - 1);

	private _pay = round(parseNumber(ctrlText 1401));
	private _rankCap = _rank select 3;

	if (_pay > _rankCap) exitWith {[format["Você não pode definir o pagamento deste rank mais do que $%1", ([_rankCap] call Caue_Lib_NumberText)], Color_Red] call A3PL_HUD_Notification;};

	[(_rank select 2),_pay] remoteExec ["Server_FactionSetup_SetRankPay", 2];
	sleep 0.3;
	closeDialog 0;

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_UpdateRankMenu", {

	disableSerialization;

	private _display = findDisplay 111;
    private _control = _display displayCtrl 1501;

	if ((lbCurSel _control) < 0) exitwith {["Nenhum player selecionado",Color_Red] call A3PL_HUD_Notification;};

	private _person = _control lbData (lbCurSel _control);

    private _rank = SELECTED_FACTION_RANK;
    if (_rank < 0) exitwith {["Nenhum rank selecionado",Color_Red] call A3PL_HUD_Notification;};

	[_person, _rank] remoteExec ["Server_FactionSetup_ChangeRank",2];

	{
		if ((getPlayerUID _X) isEqualTo _person) exitWith {
			if (_rank isEqualTo 0) then {
				[_x,'job','unemployed'] remoteExec ["Server_Core_ChangeVar",2];
				[_x,'faction','citizen'] remoteExec ["Server_Core_ChangeVar",2];
			};
			[_x,'faction_rank',_rank] remoteExec ["Server_Core_ChangeVar",2];
		};
	} forEach allPlayers;

	sleep 0.3;
	closeDialog 0;

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_BPAdd", {

	disableSerialization;

	private _faction = player getVariable ["faction","citizen"];
	private _display = findDisplay 111;
	private _control = _display displayCtrl 1504;

	lbClear _control;
    {
        if ((_x select 0) isEqualTo _faction) exitwith {
			{
				private _index = _control lbAdd ([_x,"name"] call Caue_Config_GetItem);
				_control lbSetData [_index,_x];
			} forEach (_x select 1);
        };
    } forEach Config_Blueprints;

}, false] call Server_Setup_Compile;

['Caue_FactionSetup_BPCreate', {

    disableSerialization;
    if !([] call Caue_Player_AntiSpam) exitWith {};

    private _display = findDisplay 111;
    private _control = _display displayCtrl 1504;

	if ((lbCurSel _control) < 0) exitwith {["Nenhuma blueprint selecionada",Color_Red] call A3PL_HUD_Notification;};

	private _bp = _control lbData (lbCurSel _control);
    [_bp,1] call Caue_Inventory_Add;
    ["Blueprint foi adicionada ao seu inventario",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_AddToFaction", {

	params [
		["_target",objNull],
		["_uid",""],
		["_faction",""]
	];

	if ((isNull _target) || (!isPlayer _target)) exitWith {["Erro: Nenhum alvo", Color_Red] call A3PL_HUD_Notification;};
	if !((_target getVariable ["faction","citizen"]) isEqualTo "citizen") exitWith {["Esta pessoa ja esta em uma facção", Color_Red] call A3PL_HUD_Notification;};
	if (_faction isEqualTo "citizen") exitWith {};

	[_target,'faction',_faction] remoteExec ["Server_Core_ChangeVar",2];
	[_target,'faction_rank',1] remoteExec ["Server_Core_ChangeVar",2];

	[_faction,_uid] remoteExecCall ["Server_FactionSetup_AddToFaction",2];
	[format["%1 foi adicionado a sua facção", (_target getVariable "name")],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

/*
	Client Helper Functions
*/
["Caue_FactionSetup_GetBudget", {

	params [
		["_job", "police"]
	];

	private _balance = switch (_job) do {
		case "police": {"PD_BUDGET"};
		case "fifr": {"FD_BUDGET"};
		case "gov": {"GOV_BUDGET"};
		case "dmv": {"DMV_BUDGET"};
		case "doj": {"DOJ_BUDGET"};
		case "faa": {"FAA_BUDGET"};
	};

	_balance;

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_UpdateBudget", {

	params [
		["_job","police",[""]],
		["_value",0,[0]],
		["_add",false,[false]]
	];

	private _balance = [_job] call Caue_FactionSetup_GetBudget;

	[_balance,_value,_add] remoteExec ["Server_Government_UpdateBalance",2]

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_PayCheck", {

	private _job = player getVariable ["job",""];
	private _factionRank = player getVariable ["faction_rank",1];

	if (_factionRank isEqualTo 0) then {_factionRank = 1;};

	private _settings = call compile format["%1_%2", (toUpper _job), _factionRank];
	private _pay = _settings select 1;

	_pay;

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_CanPay", {

	private _canPay = true;

	private _myPayCheck = [] call Caue_FactionSetup_PayCheck;

	private _myFactionBudget = [(player getVariable ["job", "unemployed"])] call Caue_FactionSetup_GetBudget;
	private _budget = server getVariable [_myFactionBudget,0];

	if ((_budget - _myPayCheck) < 0) then {_canPay = false;};

	_canPay;

}, false] call Server_Setup_Compile;

["Caue_FactionSetup_IsLeader", {

	params [
		["_curFaction", "police", [""]]
	];

	if (_curFaction isEqualTo "citizen") exitWith {false};

	private _setup = call compile (format["%1_LEADER",(toUpper(_curFaction))]);
	private _return = false;

	if ((player getVariable ["db_id",-1]) IN _setup) then {
		_return = true;
	};

	_return;

}, false] call Server_Setup_Compile;

/*
	Server
*/
["Server_FactionSetup_Init", {

	if (!canSuspend) exitWith {};

	private _factionsResult = ["FactionSetup_Fetch",2,true] call Server_Database_Async;
	private _pvarArray = [];
	{
		_pvarArray pushBack [format["%1_LEADER", (_x select 0)],(_x select 1)];
		_pvarArray pushBack [format["%1_MAXRANK", (_x select 0)],(_x select 2)];
	} forEach _factionsResult;

	[_pvarArray,0,1] spawn Server_FactionSetup_ArrayToVars;

	private _ranksResult = ["FactionSetup_FetchRanks",2,true] call Server_Database_Async;
	private _pvarArray = [];
	{
		_pvarArray pushBack [format["%1_%2",(_x select 4),(_x select 2)],[(_x select 1), (_x select 3),(_x select 5),(_x select 6)]];
	} forEach _ranksResult;

	[_pvarArray,0,1] spawn Server_FactionSetup_ArrayToVars;

}, true] call Server_Setup_Compile;

["Server_FactionSetup_ArrayToVars", {

	params [
		"_array",
		["_varNameIndex", 0, [0]],
		["_varDataIndex", 0, [0]],
		["_isFinal", false, [false]]
	];

	{
		private _compile = formatText['%1 = %2;',(_x select _varNameIndex),(_x select _varDataIndex)];
		if (_isFinal) then {
			call compileFinal str(_compile);
		} else {
			call compile str(_compile);
		};

		publicVariable (_x select _varNameIndex);
	} forEach _array;

}, true] call Server_Setup_Compile;

["Server_FactionSetup_Members", {

	params [
		"_faction",
		"_clientID"
	];

	private _factionPlayers = [format["FactionSetup_Info:%1",_faction],2,true] call Server_Database_Async;

	_factionPlayers remoteExec ["Caue_FactionSetup_Members",_clientID];

}, true] call Server_Setup_Compile;

["Server_FactionSetup_SetRankPay", {

	params [
		["_id",0],
		["_pay",""]
	];

	[format["FactionSetup_UpdatePay:%1:%2",_pay,_id],1] call Server_Database_Async;

	sleep 0.5;

	private _pvarArray = [];
	private _ranksResult = ["FactionSetup_FetchRanks",2,true] call Server_Database_Async;

	{
		_pvarArray pushBack [format["%1_%2", (_x select 4), (_x select 2)], [(_x select 1), (_x select 3), (_x select 5), (_x select 6)]];
	} forEach _ranksResult;

	[_pvarArray,0,1] spawn Server_FactionSetup_ArrayToVars;

}, true] call Server_Setup_Compile;

["Server_FactionSetup_ChangeRank", {

	params ["_uid","_rank"];

	if (_rank isEqualTo 0) then {
		[format["FactionSetup_UpdateRankRemove:%1",_uid],1] call Server_Database_Async;
	} else {
		[format["FactionSetup_UpdateRank:%1:%2",_rank,_uid],1] call Server_Database_Async;
	};

}, true] call Server_Setup_Compile;

["Server_FactionSetup_AddToFaction", {

	params ["_faction","_uid"];

	[format["FactionSetup_RankAdd:%1:%2",_faction,_uid],1] call Server_Database_Async;

}, true] call Server_Setup_Compile;
