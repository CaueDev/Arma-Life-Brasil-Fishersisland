/*
    Client
*/
['A3PL_Uber_AcceptRequest', {

    private ["_job","_marker"];

    closeDialog 0;
    A3PL_Uber_JobActive = true;
    A3PL_Uber_CurrentJobPlayer = A3PL_Uber_ActiveRequest;

    deleteMarkerLocal "uber_job";

    _marker = createMarkerLocal ["uber_job", A3PL_Uber_CurrentJobPlayer];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "mil_warning";
    _marker setMarkerTextLocal format ["Pedido atual de uber - %1",(A3PL_Uber_CurrentJobPlayer getVariable ["name","Unknown name"])];
    _marker setMarkerColorLocal "ColorBlack";

    ["Pedido de uber aceito e marcado no seu mapa, para cancelar o trabalho use o aplicativo uber",Color_Green] call A3PL_HUD_Notification;
    ["Você é obrigado a sair do trabalho usando o aplicativo uber quando a solicitação for aceita ou se você não receber mais solicitações",Color_Green] call A3PL_HUD_Notification;
    ["Um motorista do uber aceitou seu pedido e está a caminho", Color_Green] remoteExec ["A3PL_HUD_Notification",A3PL_Uber_CurrentJobPlayer];

}, false] call Server_Setup_Compile;

['A3PL_Uber_AddDriver', {

    [player] remoteExec ["Server_Uber_addDriver", 2];
    ["Pedido para se tornar um motorista uber foi enviado",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Uber_EndJob', {

    A3PL_Uber_JobActive = false;
    deleteMarkerLocal "uber_job";
    A3PL_Uber_CurrentJobPlayer = nil;

    ["Seu trabalho atual foi cancelado",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Uber_Open', {

    disableSerialization;

    createDialog "Dialog_Phone_UberMenu";

    if (player getVariable ["job","unemployed"] == "uber") then
    {
        ctrlSetText [1609, "Sair"];
        buttonSetAction [1609, "[] call A3PL_Uber_removeDriver"];

        if (A3PL_Uber_JobActive) then {

            ctrlSetText [1613, "Terminar Trabalho"];
            buttonSetAction [1613, "[] call A3PL_Uber_EndJob;"];

        } else {
            ctrlSetText [1613, ""];
            ctrlEnable [1613, false];
        };
    } else
    {
        buttonSetAction [1613, "[] call A3PL_Uber_requestDriver;"];
        buttonSetAction [1609, "[] call A3PL_Uber_addDriver;"];
    };

}, false] call Server_Setup_Compile;

['A3PL_Uber_RecieveRequest', {

    if (A3PL_Uber_JobActive) exitWith {};

    params[["_customer",objNull,[objNull]]];

    A3PL_Uber_ActiveRequest = _customer;

    closeDialog 0;
    createDialog "Dialog_UberAccept";

}, false] call Server_Setup_Compile;

['A3PL_Uber_RemoveDriver', {

    [player] remoteExec ["Server_Uber_removeDriver", 2];
    ["Pedido para sair de motorista uber foi enviado",Color_Green] call A3PL_HUD_Notification;

    if (A3PL_Uber_JobActive) then
    {
        [] call A3PL_Uber_EndJob;
    };

}, false] call Server_Setup_Compile;

['A3PL_Uber_RequestDriver', {

    disableSerialization;

    [player] remoteExec ["Server_Uber_requestDriver",2];
    ["Pedido uber enviado",Color_Red] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;
/*
    Server
*/
['Server_Uber_AddDriver', {

    params[["_user",objNull,[objNull]]];

    if(!(_user in Uber_Drivers)) then {
        Uber_Drivers pushBack _user;
    };

    _user setVariable ["job","uber",true];

}, true] call Server_Setup_Compile;

['Server_Uber_FlushDrivers', {

    {
        if (isNull _x) then {
            Uber_Drivers deleteAt _forEachIndex;
        };
    } forEach Uber_Drivers;

}, true] call Server_Setup_Compile;

['Server_Uber_RemoveDriver', {

    params[["_user",objNull,[objNull]]];

    if(_user in Uber_Drivers) then {
        _id = Uber_Drivers find _user;
        Uber_Drivers deleteAt _id;
    };

    _user setVariable ["job","unemployed",true];

}, true] call Server_Setup_Compile;

['Server_Uber_RequestDriver', {

    private ["_user"];

    params[["_user",objNull,[objNull]]];

    [] call Server_Uber_flushDrivers;

    if(count Uber_Drivers < 1) then
    {
        ["Não há motoristas disponíveis", Color_Red] remoteExec ["A3PL_HUD_Notification", _user];
    } else
    {
        ["Uber Solicitado", Color_Green] remoteExec ["A3PL_HUD_Notification", _user];
        {
            [_user] remoteExec ["A3PL_Uber_RecieveRequest", _x];
        } forEach Uber_Drivers;
    };

}, true] call Server_Setup_Compile;
