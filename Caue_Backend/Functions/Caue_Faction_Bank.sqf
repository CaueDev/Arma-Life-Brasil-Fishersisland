['Caue_FactionBank_Open', {

    if !(isNull (findDisplay 8999520)) exitWith {};

    closeDialog 0;
    createDialog "Caue_ATM";

    private _display = findDisplay 8999520;
    private _ctrlList = _display displayCtrl 122;
    private _ctrlButtonWithdraw = _display displayCtrl 126;
    private _ctrlButtonDeposit = _display displayCtrl 127;
    private _ctrlButtonDepositAll = _display displayCtrl 125;
    private _ctrlButtonTransfer = _display displayCtrl 128;

    /* Set money info */
    [] spawn Caue_FactionBank_Update;

    /* List all players into combo */
    {
        private _index = _ctrlList lbAdd (_x getVariable ["name","error"]);
        _ctrlList lbSetData [_index, (getPlayerUID _x)];
    } forEach (allPlayers - [player]);
    _ctrlList lbSetCurSel 0;

    /* Setup Buttons */
    _ctrlButtonWithdraw ctrlAddEventHandler ["ButtonClick", {[] spawn Caue_FactionBank_Withdraw;}];
    _ctrlButtonDeposit ctrlAddEventHandler ["ButtonClick", {[] spawn Caue_FactionBank_Deposit;}];
    _ctrlButtonDepositAll ctrlEnable ((player getVariable ["getjobplayerguy",0]) > 0);
    _ctrlButtonDepositAll ctrlAddEventHandler ["ButtonClick", {[] spawn Caue_FactionBank_DepositAll;}];
    _ctrlButtonTransfer ctrlAddEventHandler ["ButtonClick", {[] spawn Caue_FactionBank_Transfer;}];

}, false] call Server_Setup_Compile;

['Caue_FactionBank_Update', {

    if (isNull (findDisplay 8999520)) exitWith {};

    private _display = findDisplay 8999520;
    private _ctrlTextBank = _display displayCtrl 120;
    private _ctrlTextCash = _display displayCtrl 121;
    private _cashFormatted = [(player getVariable ["getjobplayerguy",0])] call Caue_Lib_NumberText;
	private _factionVar = [(player getVariable ["faction", "citizen"])] call Caue_FactionSetup_GetBudget;
	private _bankFormatted = [(server getVariable [_factionVar,0])] call Caue_Lib_NumberText;
    private _ctrlButtonDepositAll = _display displayCtrl 125;

    /* Only enable if cash is present */
    _ctrlButtonDepositAll ctrlEnable ((player getVariable ["getjobplayerguy",0]) > 0);

    /* Update assets */
    _ctrlTextBank ctrlSetText _bankFormatted;
    _ctrlTextCash ctrlSetText _cashFormatted;

}, false] call Server_Setup_Compile;

['Caue_FactionBank_Withdraw', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if (isNull (findDisplay 8999520)) exitWith {};

    private _display = findDisplay 8999520;
    private _ctrlInput = _display displayCtrl 123;
    private _amountString = ctrlText _ctrlInput;
    private _amount = round parseNumber _amountString;

    /* Checks */
    if (_amount < 1) exitWith {["Coloque uma quantia valida.",Color_Red] call A3PL_HUD_Notification;};
	private _factionVar = [(player getVariable ["faction", "citizen"])] call Caue_FactionSetup_GetBudget;
	if ((server getVariable [_factionVar,0]) < _amount) exitWith {["Sua fac????o n??o possui essa quantia.",Color_Red] call A3PL_HUD_Notification;};

    /* :) */
    [server,_factionVar,((server getVariable _factionVar) - _amount)] remoteExec ["Server_Core_ChangeVar",2];
    [player,'getjobplayerguy',((player getVariable 'getjobplayerguy') + _amount)] remoteExec ["Server_Core_ChangeVar",2];

    [format["Voc?? sacou $%1 da conta bancaria da sua fac????o.",([_amount] call Caue_Lib_NumberText)],Color_Green] call A3PL_HUD_Notification;

	[(getPlayerUID player),"BankWidthdraw Faction",_amount] remoteExec ["Caue_Log_Misc",2];

    sleep 0.35;
    [] call Caue_FactionBank_Update;

}, false] call Server_Setup_Compile;

['Caue_FactionBank_Deposit', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if (isNull (findDisplay 8999520)) exitWith {};

    private _display = findDisplay 8999520;
    private _ctrlInput = _display displayCtrl 123;
    private _amountString = ctrlText _ctrlInput;
    private _amount = round parseNumber _amountString;

    /* Checks */
    if (_amount < 1) exitWith {["Coloque uma quantia valida.",Color_Red] call A3PL_HUD_Notification;};
    if ((player getVariable ["getjobplayerguy",0]) < _amount) exitWith {["Voc?? n??o possui essa quantia.",Color_Red] call A3PL_HUD_Notification;};

	private _factionVar = [(player getVariable ["faction", "citizen"])] call Caue_FactionSetup_GetBudget;

	/* :) */
    [player,'getjobplayerguy',((player getVariable 'getjobplayerguy') - _amount)] remoteExec ["Server_Core_ChangeVar",2];
    [server,_factionVar,((server getVariable _factionVar) + _amount)] remoteExec ["Server_Core_ChangeVar",2];

    [format["Voc?? depositou $%1 na conta banc??ria da sua fac????o.",([_amount] call Caue_Lib_NumberText)],Color_Green] call A3PL_HUD_Notification;

	[(getPlayerUID player),"BankDeposit Faction",_amount] remoteExec ["Caue_Log_Misc",2];

    sleep 0.35;
    [] call Caue_FactionBank_Update;

}, false] call Server_Setup_Compile;

['Caue_FactionBank_DepositAll', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if (isNull (findDisplay 8999520)) exitWith {};

    private _amount = player getVariable ["getjobplayerguy",0];

    /* Checks */
    if (_amount < 1) exitWith {};

	private _factionVar = [(player getVariable ["faction", "citizen"])] call Caue_FactionSetup_GetBudget;

	[player,'getjobplayerguy',0] remoteExec ["Server_Core_ChangeVar",2];
    [server,_factionVar,((server getVariable _factionVar) + _amount)] remoteExec ["Server_Core_ChangeVar",2];

	[(getPlayerUID player),"BankDeposit Faction",_amount] remoteExec ["Caue_Log_Misc",2];

    [format["Voc?? depositou $%1 na conta banc??ria da sua fac????o.",([_amount] call Caue_Lib_NumberText)],Color_Green] call A3PL_HUD_Notification;

    sleep 0.35;
    [] call Caue_FactionBank_Update;

}, false] call Server_Setup_Compile;

['Caue_FactionBank_Transfer', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if (isNull (findDisplay 8999520)) exitWith {};

    private _display = findDisplay 8999520;
    private _ctrlInput = _display displayCtrl 123;
    private _amountString = ctrlText _ctrlInput;
    private _amount = round parseNumber _amountString;
    private _ctrlPlayerList = _display displayCtrl 122;
    private _targetUID = _ctrlPlayerList lbData (lbCurSel _ctrlPlayerList);
    private _target = [_targetUID] call Caue_Lib_UIDToObject;

    /* Checks */
    if (isNull _target) exitWith {["_target isNull.",Color_Red] call A3PL_HUD_Notification;};
    if (_amount < 1) exitWith {["Coloque uma quantia valida.",Color_Red] call A3PL_HUD_Notification;};
    if ((lbCurSel _ctrlPlayerList) isEqualTo -1) exitWith {["Selecione algu??m para transferir o dinheiro.",Color_Red] call A3PL_HUD_Notification;};

	private _factionVar = [(player getVariable ["faction", "citizen"])] call Caue_FactionSetup_GetBudget;
	if ((server getVariable [_factionVar,0]) < _amount) exitWith {["Sua fac????o n??o possui essa quantia.",Color_Red] call A3PL_HUD_Notification;};

    /* Transfer */
    [server,_factionVar,((server getVariable _factionVar) - _amount)] remoteExec ["Server_Core_ChangeVar",2];
    [_target,'getrankplayerguy',((_target getVariable ['getrankplayerguy',0]) + _amount)] remoteExec ["Server_Core_ChangeVar",2];

    [(getPlayerUID player),"BankTransfer Faction",[_amount,_targetUID]] remoteExec ["Caue_Log_Misc",2];

    [format["Voc?? transferiu $%1 para a conta banc??ria de %2.",([_amount] call Caue_Lib_NumberText),(_target getVariable ["name","error"])],Color_Green] call A3PL_HUD_Notification;
    [format["%2 transferiu $%1 para sua conta banc??ria com dinheiro da fac????o.",([_amount] call Caue_Lib_NumberText),(player getVariable ["name","error"])],Color_Green] remoteExecCall ["A3PL_HUD_Notification",_target];

    sleep 0.35;
    [] call Caue_FactionBank_Update;

}, false] call Server_Setup_Compile;
