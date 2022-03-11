['Caue_Log_Misc', {

    params [
        ["_uid",""],
        ["_action",""],
        ["_data",[],[[],""]]
    ];

    private _dataString = "";

    if (_data isEqualType []) then {
        {
            if (_dataString isEqualTo "") then {
                _dataString = _x;
            } else {
                _dataString = format["%1-%2",_dataString,_x];
            };
        } forEach _data;
    } else {
        _dataString = _data;
    };

    [format["Log_Misc:%1:%2:%3",_uid,_action,_dataString],1] spawn Server_Database_Async;

}, true, true] call Server_Setup_Compile;

['Caue_Log_Anticheat', {

    params [
        ["_uid",""],
        ["_type",""],
        ["_data",""]
    ];

    if ((_uid isEqualTo "") || (_type isEqualTo "") || (_data isEqualTo "")) exitWith {};

    [format["Log_Anticheat:%1:%2:%3",_uid,_type,_data],1] spawn Server_Database_Async;

}, true, true] call Server_Setup_Compile;

['Caue_Log_Shop', {

    params [
        "_uid",
        "_shop",
        "_type",
        "_item",
        "_amount",
        "_value",
        "_cashtotal"
    ];

    [format["Log_Shop:%1:%2:%3:%4:%5:%6:%7",_uid,_shop,_type,_item,_amount,_value,_cashtotal],1] spawn Server_Database_Async;

}, true] call Server_Setup_Compile;

['Caue_Log_Admin', {

    params [
        "_admin",
        "_type",
        "_data"
    ];

    private _adminname = format["%1 (%2)",_admin getvariable ["name","Undefined"],name _admin];
    private _adminuid = getPlayerUID _admin;

    private _dataString = "";

    {
        if (_dataString isEqualTo "") then {
            _dataString = _X;
        } else {
            _dataString = format["%1 | %2",_dataString,_x];
        };
    } forEach _data;

    [format["Log_Admin:%1:%2:%3:%4",_adminname,_adminuid,_type,_dataString],1] spawn Server_Database_Async;

}, true, true] call Server_Setup_Compile;

['Caue_Log_Chat', {

    params [
        ["_playerid",""],
        ["_msg",""],
        ["_msgcolor",""],
        ["_namepicture",""],
        ["_name",""],
        ["_namecolor",""],
        ["_msgto",""]
    ];

    if (_msgto isEqualTo "deepweb") then {
        _name = format["[DEEPWEB] %1",_name];
    };

    [format["Log_Chat:%1:%2:%3:%4",_name,_playerid,([_msg] call Server_Twitter_StripQuotes),([[_namepicture,_namecolor,_msgcolor]] call Server_Database_Array)],1] spawn Server_Database_Async;

}, true, true] call Server_Setup_Compile;

['Caue_Log_Events', {

    params [
        ["_type",""],
        ["_data",""]
    ];

    if ((_type isEqualTo "") || (_data isEqualTo "")) exitWith {};

    [format["Log_Events:%1:%2",_type,_data],1] spawn Server_Database_Async;

}, true, true] call Server_Setup_Compile;

['Caue_Log_Factory', {

    params [
        ["_uid",""],
        ["_factory",""],
        ["_type",""],
        ["_data",""]
    ];

    if ((_uid isEqualTo "") || (_factory isEqualTo "") || (_type isEqualTo "") || (_data isEqualTo "")) exitWith {};

    [format["Log_Factory:%1:%2:%3:%4",_uid,_factory,_type,_data],1] spawn Server_Database_Async;

}, true, true] call Server_Setup_Compile;

['Caue_Log_Debug', {

    params [
        ["_uid",""],
        ["_type",""],
        ["_data",""]
    ];

    if ((_uid isEqualTo "") || (_type isEqualTo "") || (_data isEqualTo "")) exitWith {};

    [format["Log_Debug:%1:%2:%3",_uid,_type,_data],1] spawn Server_Database_Async;

}, true, true] call Server_Setup_Compile;
