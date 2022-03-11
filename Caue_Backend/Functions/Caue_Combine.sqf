['Caue_Combine_Open', {

    disableSerialization;

    closeDialog 0;
    createDialog "Caue_Combine";

    private _display = findDisplay 9;
    private _control = _display displayCtrl 1500;

    {
        private _class = _x select 0;
        private _name = [_class,"name"] call Caue_Config_GetItem;
        _index = _control lbAdd _name;
        _control lbSetData [_index,_class];
    } forEach Config_Combine;

    _control ctrlAddEventHandler ["LBSelChanged", {
        params [
            ["_control",ctrlNull],
            ["_selectedIndex",-1]
        ];

        if (_selectedIndex < 0) exitwith {};

        private _class = _control lbData (lbCurSel _control);

        private _required = [];
        private _output = 1;
        {
            if ((_x select 0) isEqualTo _class) exitwith {
                _required = _x select 1;
                _output = _x select 2;
            };
        } foreach Config_Combine;

        if ((count _required) < 1) exitwith {};

        Caue_Combine_ItemSelected = _class;
        Caue_Combine_ItemRequired = _required;

        _control = (findDisplay 9) displayCtrl 1501;
        lbClear _control;
        {
            _x params ["_class","_amount"];

            private _index = _control lbAdd format["(x%1) %2",_amount,([_class,"name"] call Caue_Config_GetItem)];
            _control lbSetData [_index,_class];

            if ([_class,_amount] call Caue_Inventory_Has) then {
                _control lbSetColor [_index,[0, 1, 0, 1]];
            } else {
                _control lbSetColor [_index,[1, 0, 0, 1]];
            };
        } forEach _required;
    }];

    _control lbSetCurSel 0;

    _control = _display displayCtrl 1600;
    _control ctrlAddEventHandler ["ButtonDown", {[] spawn Caue_Combine_Create;}];

}, false] call Server_Setup_Compile;

['Caue_Combine_Create', {

    disableSerialization;

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    private _creating = Caue_Combine_ItemSelected;
    private _required = Caue_Combine_ItemRequired;

    private _craftamount = round(parseNumber(ctrlText((findDisplay 9) displayCtrl 1400)));
    if (_craftamount < 1) exitwith {["Por favor, insira um número válido para o valor",Color_Red] call A3PL_HUD_Notification;};

    private _haveItems = true;
    {
        _x params ["_class","_amount"];
        if !([_class,(_craftamount * _amount)] call Caue_Inventory_Has) exitwith {_haveItems = false};
    } foreach _required;

    if (!_haveItems) exitwith {["Você não tem os itens necessários para criar esta quantia",Color_Red] call A3PL_HUD_Notification;};

    {
        _x params ["_class","_amount"];
        [_class,-(_craftamount * _amount)] call Caue_Inventory_Add;
    } foreach _required;

    private _output = 0;
    {
        if ((_x select 0) isEqualTo _creating) exitwith {_output = _x select 2;};
    } forEach Config_Combine;

    if (_output < 1) exitwith {};

    [_creating,(_output * _craftamount)] call Caue_Inventory_Add;

    [format ["Você combinou alguns itens em x%2 %1",([_creating,"name"] call Caue_Config_GetItem),(_output * _craftamount)],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;
