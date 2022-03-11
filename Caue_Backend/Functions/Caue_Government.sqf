/*
	Client
*/
["Caue_Government_Open", {

	if !((getPlayerUID player) isEqualTo (Mayor select 0)) exitWith {["Você não é o prefeito!", Color_Red] call A3PL_HUD_Notification;};

	closeDialog 0;
	createDialog "Dialog_Treasury";

	AFPL_SELECTED_LAW = 0;

	[] call Caue_Government_Load;

}, false] call Server_Setup_Compile;

["Caue_Government_Load", {

	private _display = findDisplay 109;

	private _control = _display displayCtrl 2100;
	private _totalBalance = 0;

	lbClear _control;
    {
		_x params ["_name","_var"];

		_control lbAdd _name;
		_control lbSetData [_forEachIndex,_var];

		_totalBalance = _totalBalance + (server getVariable [_var,0]);
    } forEach [["Dinheiro Federal","FEDERAL_GRANT"],["Imposto sobre vendas","SALES_TAX_BAL"],["Imposto de Renda","INCOME_TAX_BAL"],["Imposto sobre imóveis","PROPERTY_TAX_BAL"],["Imposto de Importação","IMPORT_TAX_BAL"]];

	_control ctrlAddEventhandler ["LBSelChanged",{
        params [["_control",ctrlNull]];

		private _balance = server getVariable [(_control lbData (lbCurSel _control)),0];
        private _control = (findDisplay 109) displayCtrl 1400;
        _control ctrlSetText (format ["$%1",([_balance] call Caue_Lib_NumberText)]);
    }];
	_control lbSetCurSel 0;

	_control = _display displayCtrl 1402;
    _control ctrlSetText format ["$%1",([_totalBalance] call Caue_Lib_NumberText)];

	_control = _display displayCtrl 2101;
	lbClear _control;
    {
        _control lbAdd (_x select 0);
		_control lbSetData [_forEachIndex,(_x select 1)];
    } foreach [["Imposto sobre vendas","SALES_TAX"], ["Imposto de Renda","INCOME_TAX"], ["Imposto sobre imóveis","PROPERTY_TAX"], ["Imposto de Importação","IMPORT_TAX"]];

	_control ctrlAddEventHandler ["LBSelChanged",{
        params [["_control",ctrlNull]];

        private _tax = server getVariable [(_control lbData (lbCurSel _control)),0];

        private _control = (findDisplay 109) displayCtrl 1403;
        _control ctrlSetText format ["%1%2",_tax,"%"];
    }];
	_control lbSetCurSel 0;

	_control = _display displayCtrl 1600;
    _control buttonSetAction "[] spawn Caue_Government_Tax;";

	_control = _display displayCtrl 2102;
	lbClear _control;
    {
		private _factionBalance = server getVariable [(_x select 1),0];
		_control lbAdd format ["%1 (saldo: $%2)",(_x select 0),([_factionBalance] call Caue_Lib_NumberText)];
		_control lbSetData [_forEachIndex,(_x select 1)];
    } foreach [["Policia","PD_BUDGET"],["EMS","FD_BUDGET"],["Governo","GOV_BUDGET"],["DMV","DMV_BUDGET"],["DOJ","DOJ_BUDGET"],["FAA","FAA_BUDGET"]];
	_control lbSetCurSel 0;

    _control = _display displayCtrl 1601;
    _control buttonSetAction "[] spawn Caue_Government_Balance;";

 	_control = _display displayCtrl 2103;
	lbClear _control;
	{
		_control lbAdd format ["%1. %2", (_forEachIndex + 1), (_x select 1)];
		_control lbSetData [_forEachIndex, str(_forEachIndex)];
	} forEach AFPL_GOVERNMENT_LAWS;

	_control ctrlAddEventHandler ["LBSelChanged",{
        private ["_control","_display"];
        _display = findDisplay 109;
        _control = param [0, ctrlNull];

		_index = parseNumber(_control lbData (lbCurSel _control));
		_law = AFPL_GOVERNMENT_LAWS select _index;
		AFPL_SELECTED_LAW = _index;

        _control = _display displayCtrl 1000;
        _control ctrlSetText (_law select 1);

        _control = _display displayCtrl 1401;
        _control ctrlSetText (_law select 1);
    }];

	_control = _display displayCtrl 1000;
 	_control ctrlSetText "";

	_control = _display displayCtrl 1401;
	_control ctrlSetText "";

	_control = _display displayCtrl 2100;
	_control ctrlSetText "";

	_control = _display displayCtrl 1603;
    _control buttonSetAction "[] spawn AFPL_Gov_Add_Law;";

    _control = _display displayCtrl 1605;
    _control buttonSetAction "[] spawn AFPL_Gov_Remove_Law;";

    _control = _display displayCtrl 1602;
    _control buttonSetAction "[] spawn AFPL_Gov_Update_Law;";

}, false] call Server_Setup_Compile;


["Caue_Government_Tax", {

	if !([] call Caue_Player_AntiSpam) exitWith {};
	if !((getPlayerUID player) isEqualTo (Mayor select 0)) exitWith {["Você não é o prefeito!", Color_Red] call A3PL_HUD_Notification;};

	private _display = findDisplay 109;
    private _control = _display displayCtrl 1403;
	private _rate = round(parseNumber((((ctrlText _control) splitString "%") select 0)));

	if (isNil "_rate") exitwith {["Por favor, insira um número válido no campo de taxa de imposto", Color_Red] call A3PL_HUD_Notification;};
	if ((_rate > 100) || (_rate < 0)) exitWith {["Por favor, insira um número válido entre 0 e 100 no campo de taxa de imposto", Color_Red] call A3PL_HUD_Notification;};

	_control = _display displayCtrl 2101;
	private _tax = _control lbData (lbCurSel _control);
	private _oldRate = server getVariable [_tax,0];

	[_tax,_rate,_oldRate] remoteExec ["Server_Government_Tax",2];

	[] spawn {
		sleep 1;
		[] call Caue_Government_Load;
	};

}, false] call Server_Setup_Compile;

["Caue_Government_Balance", {

	if !([] call Caue_Player_AntiSpam) exitWith {};
	if !((getPlayerUID player) isEqualTo (Mayor select 0)) exitWith {["Você não é o prefeito!", Color_Red] call A3PL_HUD_Notification;};

	private _display = findDisplay 109;

	private _control = _display displayCtrl 2100;
	private _selectedBalance = (_control lbData (lbCurSel _control));
	private _selectedBalanceValue = server getVariable [_selectedBalance,0];

	_control = _display displayCtrl 2102;
	private _selectedFaction = (_control lbData (lbCurSel _control));

	_control = _display displayCtrl 1404;
    private _amount = round(parseNumber(ctrlText _control));

	if (_amount < 1) exitwith {["Por favor, insira um número válido para transferir",Color_Red] call A3PL_HUD_Notification;};
    if (_amount > _selectedBalanceValue) exitwith {["Você não pode transferir mais dinheiro do que o valor do saldo atual que você selecionou",Color_Red] call A3PL_HUD_Notification;};

	hint str ([_selectedBalance,_selectedFaction,_amount]);

	[_selectedBalance,_selectedFaction,_amount] remoteExec ["Server_Government_Balance",2];

	[] spawn {
		sleep 1;
		[] call Caue_Government_Load;
	};

}, false] call Server_Setup_Compile;


["AFPL_Gov_Update_Law", {

	_display = findDisplay 109;

	_updatedText = ctrlText (_display displayCtrl 1401);
	_law = AFPL_GOVERNMENT_LAWS select AFPL_SELECTED_LAW;

	if (_updatedText isEqualTo "") exitWith {
		["Mensagem não pode estar vazia", Color_Red] call A3PL_HUD_Notification;
	};
	if ((count _updatedText) > 200) exitWith {
		["A mensagem deve ter menos de 200 caracteres", Color_Red] call A3PL_HUD_Notification;
	};

	_sanitze = [_updatedText, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789. "] call AFPL_Lib_HasBadChar;
	if (_sanitze) exitWith {
		["A mensagem contém caracteres que não são permitidos!", Color_Red] call A3PL_HUD_Notification;
	};

	[AFPL_SELECTED_LAW, (_law select 0), _updatedText] remoteExec ["AFPL_Server_Gov_Update_Law", 2];

	[] spawn {
		sleep 1;
		[] call Caue_Government_Load;
	};

}, false] call Server_Setup_Compile;

["AFPL_Gov_Add_Law", {

	_display = findDisplay 109;

	_newLaw = ctrlText (_display displayCtrl 1401);

	if ((count _newLaw) > 200) exitWith {
		["A mensagem deve ter menos de 200 caracteres", Color_Red] call A3PL_HUD_Notification;
	};

	_sanitze = [_newLaw, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789. "] call AFPL_Lib_HasBadChar;
	if (_sanitze) exitWith {
		["A mensagem contém caracteres que não são permitidos!", Color_Red] call A3PL_HUD_Notification;
	};

	[_newLaw] remoteExec ["AFPL_Server_Gov_Add_Law", 2];

	[] spawn {
		sleep 1;
		[] call Caue_Government_Load;
	};

}, false] call Server_Setup_Compile;

["AFPL_Gov_Remove_Law", {

	_display = findDisplay 109;

	_law = AFPL_GOVERNMENT_LAWS select AFPL_SELECTED_LAW;

	[(_law select 0)] remoteExec ["AFPL_Server_Gov_Remove_Law", 2];

	[] spawn {
		sleep 1;
		[] call Caue_Government_Load;
	};

}, false] call Server_Setup_Compile;



["Caue_Government_Notification", {

	params [
		["_type","tax",[""]]
	];

	private _message = "";
	private _color = Color_Green;

	switch (_type) do {
		case "tax": {
			private _balance = param [1,"SALES_TAX",[""]];
			private _oldRate = param [2,0,[0]];
			private _newRate = param [3,0,[0]];

			private _tax = switch (_balance) do {
				case "SALES_TAX": {"Imposto sobre vendas"};
				case "INCOME_TAX": {"Imposto de Renda"};
				case "PROPERTY_TAX": {"Imposto sobre imóveis"};
				case "IMPORT_TAX": {"Imposto de Importação"};
			};

			_message = format["CAROS CIDADÃOS: O prefeito mudou o %1 de %2%4 para %3%4",_tax,_oldRate,_newRate,"%"];
		};
		case "law": {
			private _actionType = param [1,"add",[""]];
			private _law = param [2,"",[""]];

			_message = format["CAROS CIDADÃOS: O prefeito acrescentou uma nova lei: %1",_law];
		};
	};

    [_message,_color] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

/*
	Server
*/
["Server_Government_Init", {

	if (!canSuspend) exitWith {};

	private _balances = ["Government_FetchBalances",2,true] call Server_Database_Async;
	{
		_x params ["_var","_balance"];

		server setVariable [_var,_balance,true];
	} forEach _balances;

	AFPL_GOVERNMENT_LAWS = ["fetchGovLaws",2,true] call Server_Database_Async;
	publicVariable "AFPL_GOVERNMENT_LAWS";

}, true] call Server_Setup_Compile;

["Server_Government_Loop", {

	{
		private _value = server getVariable [_x,0];
		[format["Government_UpdateBalances:%1:%2", ([_value] call Server_Database_NumberSafe),_x],1] call Server_Database_Async;
		uiSleep 02;
	} forEach ["FEDERAL_GRANT","PD_BUDGET","FD_BUDGET","GOV_BUDGET","DMV_BUDGET","DOJ_BUDGET","FAA_BUDGET","SALES_TAX","INCOME_TAX","PROPERTY_TAX","IMPORT_TAX","SALES_TAX_BAL","INCOME_TAX_BAL","PROPERTY_TAX_BAL","IMPORT_TAX_BAL"];

}, true] call Server_Setup_Compile;


["Server_Government_Tax", {

	if (!canSuspend) exitWith {};

	params [
		["_tax","",[""]],
		["_rate",0,[0]],
		["_oldRate",0,[0]]
	];

	server setVariable [_tax,_rate,true];
	["tax",_tax,_oldRate,_rate] remoteExec ["Caue_Government_Notification",-2];

}, true] call Server_Setup_Compile;

["Server_Government_Balance", {

	params [
		["_fromBalance","",[""]],
		["_toBalance","",[""]],
		["_value",0,[0]]
	];

	if (((server getVariable [_fromBalance,0]) - _value) < 0) exitWith {};

	server setVariable [_fromBalance,((server getVariable [_fromBalance,0]) - _value),true];
	server setVariable [_toBalance,((server getVariable [_toBalance,0]) + _value),true];

}, true] call Server_Setup_Compile;


["AFPL_Server_Gov_Add_Law", {
	if (!canSuspend) exitWith {};

	params [
		["_law", "", [""]]
	];

	[format["addGovLaw:%1",_law], 1] call Server_Database_Async;

	sleep 0.5;

	AFPL_GOVERNMENT_LAWS = ["fetchGovLaws", 2, true] call Server_Database_Async;
	publicVariable "AFPL_GOVERNMENT_LAWS";

	["law", "add", _law] remoteExec ["Caue_Government_Notification", -2];

}, true] call Server_Setup_Compile;

["AFPL_Server_Gov_Update_Law", {
	if (!canSuspend) exitWith {};

	params [
		["_lawIndex", 0, [0]],
		["_lawID", 0, [0]],
		["_updatedText", "", [""]]
	];

	_law = AFPL_GOVERNMENT_LAWS select _lawIndex;
	_oldLaw = _law select 1;

	_law set [1, _updatedText];

	AFPL_GOVERNMENT_LAWS set [_lawIndex, _law];

	[format["updateGovLaw:%1:%2", _updatedText, _lawID], 1] call Server_Database_Async;

	publicVariable "AFPL_GOVERNMENT_LAWS";

}, true] call Server_Setup_Compile;

["AFPL_Server_Gov_Remove_Law", {
	if (!canSuspend) exitWith {};

	params [
		["_lawID", 0, [0]]
	];

	[format["delGovLaw:%1",_lawID], 1] call Server_Database_Async;

	AFPL_GOVERNMENT_LAWS =  ["fetchGovLaws", 2, true] call Server_Database_Async;
	publicVariable "AFPL_GOVERNMENT_LAWS";

}, true] call Server_Setup_Compile;


["Server_Government_ReceiveTax", {

	if (!canSuspend) exitWith {};

	params [
		["_tax","",[""]],
		["_value",0,[0]]
	];

	_tax = format["%1_BAL",_tax];
	private _value = (server getVariable [_tax,0]) + _value;
	server setVariable [_tax,_value,true];

}, true] call Server_Setup_Compile;

["Server_Government_UpdateBalance", {

	if (!canSuspend) exitWith {};

	params [
		["_fromBalance","",[""]],
		["_value",0,[0]],
		["_add",false,[false]]
	];

	private _amount = server getVariable [_fromBalance,0];

	if (_add) then {
		server setVariable [_fromBalance,((server getVariable [_fromBalance,0]) + _value),true];
	} else {
		if ((_amount - _value) < 0) then {
			server setVariable [_fromBalance,0,true];
		} else {
			server setVariable [_fromBalance,((server getVariable [_fromBalance,0]) - _value),true];
		};
	};

}, true] call Server_Setup_Compile;
