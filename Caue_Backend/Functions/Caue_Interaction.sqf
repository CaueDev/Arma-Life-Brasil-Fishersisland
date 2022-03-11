['Caue_Interaction_Open', {

    disableSerialization;
    params[
        ["_target",objNull,[objNull]]
    ];

    Interaction_ActionList = [];
    Interaction_OverflowList = [];

    {
        if ((count Interaction_ActionList) >= 7) then {
            if (call (_x select 2)) then {Interaction_OverflowList pushBack [(_x select 0),(_x select 1)];};
        } else {
            if (call (_x select 2)) then {Interaction_ActionList pushBack [(_x select 0),(_x select 1)];};
        };
    } forEach Config_Interactions;

    if ((count Interaction_OverflowList) > 0) then {
        if ((count Interaction_OverflowList) < 2) then {
            Interaction_ActionList pushBack [(Interaction_OverflowList select 0 select 0),(Interaction_OverflowList select 0 select 1)];
        } else {
            Interaction_ActionList pushBack ["Mais Opções",{[] call Caue_Interaction_More;}];
        };
    };

    if ((count Interaction_ActionList) < 1) exitWith {};

    closeDialog 0;
    createDialog "Caue_Interaction";

    buttonSetAction [7000,"[0] call Caue_Interaction_Button;"];
    buttonSetAction [7001,"[1] call Caue_Interaction_Button;"];
    buttonSetAction [7002,"[2] call Caue_Interaction_Button;"];
    buttonSetAction [7003,"[3] call Caue_Interaction_Button;"];
    buttonSetAction [7004,"[4] call Caue_Interaction_Button;"];
    buttonSetAction [7005,"[5] call Caue_Interaction_Button;"];
    buttonSetAction [7006,"[6] call Caue_Interaction_Button;"];
    buttonSetAction [7007,"[7] call Caue_Interaction_Button;"];

    private _idd = 1001;
    {
        ctrlSetText[_idd,(_x select 0)];
        _idd = _idd + 1;
    } forEach Interaction_ActionList;

}, false] call Server_Setup_Compile;

['Caue_Interaction_More', {

    closeDialog 0;
    createDialog "Caue_Interaction";

    buttonSetAction [7000,"[0] call Caue_Interaction_Button;"];
    buttonSetAction [7001,"[1] call Caue_Interaction_Button;"];
    buttonSetAction [7002,"[2] call Caue_Interaction_Button;"];
    buttonSetAction [7003,"[3] call Caue_Interaction_Button;"];
    buttonSetAction [7004,"[4] call Caue_Interaction_Button;"];
    buttonSetAction [7005,"[5] call Caue_Interaction_Button;"];
    buttonSetAction [7006,"[6] call Caue_Interaction_Button;"];
    buttonSetAction [7007,"[7] call Caue_Interaction_Button;"];

    Interaction_ActionList = [];

    private _idd = 1001;
    {
        ctrlSetText[_idd,(_x select 0)];
        _idd = _idd + 1;
        Interaction_ActionList pushBack _x;
    } forEach Interaction_OverflowList;

}, false] call Server_Setup_Compile;

['Caue_Interaction_Button', {

    params[
        ["_value",0,[0]]
    ];

    if (_value > ((count Interaction_ActionList)-1)) exitWith {};

    closeDialog 0;

    call ((Interaction_ActionList select _value) select 1);

}, false] call Server_Setup_Compile;
