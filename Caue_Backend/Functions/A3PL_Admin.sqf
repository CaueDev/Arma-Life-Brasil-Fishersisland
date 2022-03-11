['A3PL_StartAdmining', {

    if (player getVariable ["inadminform",false]) then {
        [player,"Admin Mode",[format ["Toggled Admin Mode Off"]]] remoteExec ["Caue_Log_Admin", 2];
        player setvariable ["inadminform",false,true];
        player setAnimSpeedCoef 1;
    } else {
        [player,"Admin Mode",[format ["Toggled Admin Mode On"]]] remoteExec ["Caue_Log_Admin", 2];
        player setvariable ["inadminform",true,true];
        player setVariable ["Caue_Wounds",[],true];
        player setVariable ["Caue_MedicalVars",[5000],true];
        player setVariable ["canExecute",false,true];
        player setVariable ["Player_Hunger",100,true];
        player setVariable ["Player_Thirst",100,true];
        player setHit ["legs",0];
        player setAnimSpeedCoef 2.5;
    };

}, false] call Server_Setup_Compile;

['A3PL_StartCursorTarget', {

    ("Dialog_HUD_AdminCursor" call BIS_fnc_rscLayer) cutRsc ["Dialog_HUD_AdminCursor", "PLAIN"];
    Player_Cursortargetmode = true;
    ((uiNamespace getVariable "Dialog_HUD_AdminCursor") displayCtrl 2414) ctrlSetStructuredText (parseText format["<t font='PuristaSemiBold' align='left' size='0.85'>Numpad 0: Get in Driver cursortarget<br/>Numpad 1: Attach Cursor<br/>Numpad 2: Detach Cursor<br/>Numpad 3: Impound Cursor<br/>Numpad 4: Delete Cursor<br/>Numpad 5: Move in Cursor<br/>Numpad 6: Eject all Cursor<br/>Numpad 7: Heal Cursortarget<br/>Numpad 8: Repair Cursortarget</t>"]);

    while {Player_Cursortargetmode} do {
        uisleep 0.5;
        if (isPlayer player_objintersect) then {
            ((uiNamespace getVariable "Dialog_HUD_AdminCursor") displayCtrl 1000) ctrlSetStructuredText (parseText format["<t font='PuristaSemiBold' align='center' size='1'>Cursor: %1</t>",(name player_objintersect)]);
        };
    };

    ("Dialog_HUD_AdminCursor" call BIS_fnc_rscLayer) cutFadeOut 1;

}, false] call Server_Setup_Compile;

['A3PL_Admin_AddFactory', {

    private ["_display","_control","_type","_player","_recipe","_isFactory","_itemType"];

    _display = findDisplay 69;
    _control = _display displayCtrl 2100;
    if (lbCurSel _control < 0) exitwith {["System: No factory selected",Color_Red] call A3PL_HUD_Notification;};
    _type = _control lbText (lbCurSel _control);

    _control = _display displayCtrl 1500;
    if (lbCurSel _control < 0) exitwith {["System: No recipe selected",Color_Red] call A3PL_HUD_Notification;};
    _recipe = _control lbdata (lbCurSel _control);

    _control = _display displayCtrl 1501;
    if (lbCurSel _control < 0) exitwith {["System: No player selected",Color_Red] call A3PL_HUD_Notification;};
    _player = A3PL_Admin_PlayerFacList select (lbCurSel _control);

    _control = _display displayCtrl 1400;
    _amount = parseNumber (ctrlText _control);
    if (_amount < 1) exitwith {["System: Invalid amount",Color_Red] call A3PL_HUD_Notification;};

    _isFactory = _recipe splitString "_";
    if ((_isFactory select 0) == "f") then {_isFactory = true; _itemType = [_recipe,_type,"type"] call Caue_Config_GetFactory;} else {_isFactory = false;};
    if (isNil "_itemType") then {_itemType = ""};
    if (_isFactory && (_itemType == "item")) then {_recipe = [_recipe,_type,"class"] call Caue_Config_GetFactory;};

    [_player,_type,[_recipe,_amount],false] remoteExec ["Server_Factory_Add", 2];
    ["System: Sent request to assign item to the players factory, the item will be added to their respective factory",Color_Green] call A3PL_HUD_Notification;

    [player,"factories",[format ["Added %5 %1(s) ADDED TO %2(%3) (%4)",_recipe,_player getVariable ["name","Undefined"],(getPlayerUID _player),_type,_amount]]] remoteExec ["Caue_Log_Admin", 2];

}, false] call Server_Setup_Compile;

['A3PL_Admin_AttachTo', {

    params[["_veh",objNull,[objNull]]];

    _type = typeOf _veh;
    _dir = getDir _veh;
    _veh attachTo [player];
    _veh setDir (_dir + (360 - (getDir player)));

    [player,"cursortarget",[format ["Attached Object (%1)", _type]]] remoteExec ["Caue_Log_Admin", 2];

}, false] call Server_Setup_Compile;

['A3PL_Admin_Check', {

    _adminpowers = [
        ["goback","Goback","closeDialog 0; player setPos AFPL_MYOLDPOS; AFPL_MYOLDPOS = nil;",[1,1,1,1]],
        ["spectate","Spectate","closedialog 0; [] spawn A3PL_Admin_Spectate;",[1,1,1,1]],
        ["spectate","Stop Spectate","['Terminate'] call BIS_fnc_EGSpectator;",[1,1,1,1]],
        ["players","Check Player","closedialog 0; [] spawn A3PL_Admin_players;",[1,1,1,1]],
        ["vehicles","Vehicles","closedialog 0; [] spawn A3PL_Admin_Vehicles;",[1,1,1,1]],
        ["objects","Objects","closedialog 0; [] spawn A3PL_Admin_Objects;",[1,1,1,1]],
        ["unflip","Unflip Target","closedialog 0; [true,cursorObject] spawn Caue_Vehicle_Unflip;",[1,1,1,1]],
        ["cursortarget","Cursortargeting","closedialog 0; [] spawn A3PL_StartCursorTarget;",[1,1,1,1]],
        ["admintag","Admin Mode (god)","closedialog 0; [] spawn A3PL_StartAdmining;",[1,1,1,1]],
        ["globalmessage","Send Global Message","closedialog 0; [] spawn A3PL_Admin_OpenGblMsg;",[1,1,1,1]],
        ["factories","Factories","closedialog 0; [] spawn A3PL_Admin_Factory;",[1,1,1,1]],
        ["playermarkes","Player Markers","closedialog 0; if (missionNamespace getVariable ['Markers_Players',false]) then {Markers_Players = false;} else {Markers_Players = true;};",[1,1,1,1]],
        ["mapmarkers","Map Markers","closedialog 0; if (missionNamespace getVariable ['Markers_Ores',false]) then {Markers_Ores = false;} else {Markers_Ores = true;};",[1,1,1,1]],
        ["mapteleporting","Map Teleporting","closedialog 0; [] spawn A3PL_Admin_MapTeleport;",[1,1,1,1]],
        ["createfire","Create fire","closedialog 0; [(getPosATL player),(windDir)] call A3PL_Fire_StartFire;",[1,1,1,1]],
        ["removefire","Remove fire","closedialog 0; [] call A3PL_Fire_RemoveFires;",[1,1,1,1]],
        ["mayorvote","Start mayor vote","closedialog 0; [] remoteExec ['Server_Mayor_StartVote', 2]; ['System: Mayor vote started (warning: it will not start if no registered candidates)',color_green] call A3PL_HUD_Notification;",[1,1,1,1]],
        ["import","Manually send import ship","[] remoteExec ['Server_IE_ShipImport',2];",[1,1,1,1]]
    ];

    player_canopenadminmenu = false;
    Player_Cursortargetmode = false;

    player setvariable ["inadminform",false,true];

    _myadminpowers = player getVariable ["pintodemacaco",[]];
    if (getPlayerUID player == "_SP_PLAYER_") exitwith {player setVariable ["pintodemacaco",_adminpowers,true]; player_canopenadminmenu = true;};
    if (getPlayerUID player IN ["76561198166982296"]) exitwith {player setVariable ["pintodemacaco",_adminpowers,true]; player_canopenadminmenu = true; player_Twitteradminpwr = true;};
    if (count _myadminpowers isEqualTo 0) exitwith {};
    if ("twitter" IN _myadminpowers) then {player_Twitteradminpwr = true;};

    _player_administrator_powers = [];
    {
        _selected = _x;
        {
            if (_selected == ((_adminpowers select _forEachIndex) select 0)) then {
                _player_administrator_powers = _player_administrator_powers + [_adminpowers select _forEachIndex];
            };
        } foreach _adminpowers;
    } foreach _myadminpowers;

    player setVariable ["pintodemacaco",_player_administrator_powers,true];

    player_canopenadminmenu = true;

}, false] call Server_Setup_Compile;

['A3PL_Admin_CreateRecipe', {

    private ["_display","_control","_type","_player","_recipe"];

    _display = findDisplay 69;

    _control = _display displayCtrl 2100;
    if (lbCurSel _control < 0) exitwith {["System: No factory selected",Color_Red] call A3PL_HUD_Notification;};
    _type = _control lbText (lbCurSel _control);

    _control = _display displayCtrl 1500;
    if (lbCurSel _control < 0) exitwith {["System: No recipe selected",Color_Red] call A3PL_HUD_Notification;};
    _recipe = _control lbdata (lbCurSel _control);

    _control = _display displayCtrl 1501;
    if (lbCurSel _control < 0) exitwith {["System: No player selected",Color_Red] call A3PL_HUD_Notification;};
    _player = A3PL_Admin_PlayerFacList select (lbCurSel _control);

    [_player,[_recipe,1],_type] remoteExec ["Server_Factory_Create", 2];
    ["System: Sent request to assign item to player, the item will be assigned/or spawn at your selected player",Color_Green] call A3PL_HUD_Notification;

    [player,"factories",[format ["%1 CREATED FOR %2(%3) (%4)",_recipe,_player getVariable ["name","Undefined"],(getPlayerUID _player),_type]]] remoteExec ["Caue_Log_Admin", 2];

}, false] call Server_Setup_Compile;

['A3PL_Admin_DetachAll', {

    {
        _type = typeOf _x;
        detach _x;
        [player,"cursortarget",[format ["Dettached Object (%1)", _type]]] remoteExec ["Caue_Log_Admin", 2];
    } forEach attachedObjects player;

}, false] call Server_Setup_Compile;

['A3PL_Admin_Factory', {

    disableSerialization;
    closeDialog 0;
    createDialog "Dialog_AdminFactory";
    _display = findDisplay 69;
    _control = _display displayCtrl 2100;
    {
        _control lbAdd (_x select 0);
    } foreach Config_Factories;
    _control ctrlAddEventHandler ["lbSelChanged",{[] call A3PL_Admin_FillRecipes;}];

    A3PL_Admin_PlayerFacList = [];
    {
        lbAdd [1501, format ["%1 (%2)",_x getVariable ["name","Undefined"],name _x]];
        A3PL_Admin_PlayerFacList pushback _x;
    } foreach (allPlayers);

    (_display displayCtrl 1600) buttonSetAction "[] call A3PL_Admin_CreateRecipe";
    (_display displayCtrl 1601) buttonSetAction "[] call A3PL_Admin_AddFactory";
    (_display displayCtrl 1602) buttonSetAction "[0] call A3PL_Admin_SearchFactory";
    (_display displayCtrl 1603) buttonSetAction "[1] call A3PL_Admin_SearchFactory";

}, false] call Server_Setup_Compile;

['A3PL_Admin_FillRecipes', {

    private ["_display","_control","_type"];

    _display = findDisplay 69;
    _control = _display displayCtrl 2100;

    if (lbCurSel _control < 0) exitwith {};

    _type = _control lbText (lbCurSel _control);

    _control = _display displayCtrl 1500;
    lbClear _control;
    _recipes = ["all",_type] call Caue_Config_GetFactory;

    {
        private ["_name","_itemType","_itemClass","_index"];
        _id = _x select 0;
        _name = _x select 2;
        _itemClass = _x select 4;
        _itemType = _x select 5;
        if (_name == "inh") then {_name = [_itemClass,_itemType,"name"] call A3PL_Factory_Inheritance;};
        _index = _control lbAdd _name;
        _control lbSetData [_index,_id];
    } foreach _recipes;

}, false] call Server_Setup_Compile;

['A3PL_Admin_GlobalMessage', {

    _display = findDisplay 69;
    _message = ctrlText 1400;

    if (_message == "") exitWith {["System: Enter a message!", Color_Red] call A3PL_HUD_Notification;};

    _colorselected = [Color_Yellow,Color_White,Color_Red,Color_Green,Color_blue] select (lbCurSel 2100);

    [format["Admin Message %1", _message],_colorselected] remoteExec ["A3PL_HUD_Notification", -2];
    [getPlayerUID player,"Admin",["GlobalMessage",_message]] remoteExec ["Caue_Log_Misc", 2];
    [player,"globalmessage",[format ["%1",_message]]] remoteExec ["Caue_Log_Admin", 2];

}, false] call Server_Setup_Compile;

['A3PL_Admin_MapTeleport', {

    closeDialog 0;

    onMapSingleClick "_currentPos = getPos player;
    	(vehicle player) setpos _pos;
    	[] call A3PL_Admin_Open;
    	[player,'mapteleporting',[format ['FROM %1 TO %2',_currentPos,_pos]]] remoteExec ['Caue_Log_Admin', 2];
    	onMapSingleClick '';
    	openMap false;";
    openMap true;

}, false] call Server_Setup_Compile;

['A3PL_Admin_Objects', {

    disableSerialization;
    closeDialog 0;
    createDialog "Dialog_AdminVeh";

    _display = findDisplay 69;

    {
        _class = _x;
        _i = lbAdd [1500,_class];
        lbSetData [1500,_i,_class];
    } foreach ["Land_A3PL_EstateSign","Land_A3PL_FireHydrant", "Land_anton_storage_unit", "Land_Anton_Modern_Bungalow", "Land_Anton_Store_01"];

    _control = _display displayCtrl 1600;
    _control buttonSetAction "[] call A3PL_Admin_SpawnObject";

}, false] call Server_Setup_Compile;

['A3PL_Admin_Open', {

    disableSerialization;
    if (count (player getVariable ["pintodemacaco",[]]) == 0) exitwith {};

    closeDialog 0;
    createDialog "Dialog_Admin";
    {
        lbAdd [1500,format ["%1",(_x select 1)]];
        ((findDisplay 69) displayCtrl 1500) lbSetColor [_forEachIndex,(_x select 3)];

        if (_x select 0 == "admintag" && (player getVariable ["inadminform",false])) then {
            ((findDisplay 69) displayCtrl 1500) lbSetColor [_forEachIndex,[0,1,0.1,1]];
        };
    } foreach (player getVariable ["pintodemacaco",[]]);

    buttonSetAction [1600, "[] call A3PL_Admin_Selectcommand"];

}, false] call Server_Setup_Compile;

['A3PL_Admin_OpenGblMsg', {

    disableSerialization;
    closeDialog 0;
    createdialog "Dialog_AdminGlobalMsg";
    _display = findDisplay 69;
    _control = _display displayCtrl 2100;

    {
        lbAdd [2100,_x];
    } foreach ["Yellow","White","Red","Green","blue"];

    _control lbSetCurSel 0;
    (_display displayCtrl 1600) buttonSetAction "[] call A3PL_Admin_GlobalMessage";
    (_display displayCtrl 1601) buttonSetAction "closedialog 0; [] call A3PL_Admin_GlobalMessage";

}, false] call Server_Setup_Compile;

['A3PL_Admin_Players', {

    disableSerialization;

    closeDialog 0;
    createDialog "Dialog_players";
    _display = findDisplay 69;
    _control = _display displayCtrl 1500;

    A3PL_Admin_PlayerList = [];
    {
        lbAdd [1500, format ["%1 (%2)",_x getVariable ["name","Undefined"],name _x]];
        A3PL_Admin_PlayerList pushback _x;
    } foreach allPlayers;

    _control ctrlAddEventHandler ["LBSelChanged", {[] call A3PL_Admin_PlayerSelChanged;}];
    _control lbSetCurSel 0;

    buttonSetAction [1600, "[] call A3PL_Admin_TeleTo"];
    buttonSetAction [1601, "[] call A3PL_Admin_TeleToMe"];

}, false] call Server_Setup_Compile;

['A3PL_Admin_PlayerSelChanged', {

    disableSerialization;

    private ["_display","_player","_control","_cash","_bank","_profileName","_charName"];
    _display = findDisplay 69;

    _player = (A3PL_Admin_PlayerList select (lbCurSel 1500));
    if (isNull _player) exitwith {};

    lbClear 1501;
    {
        _i = lbAdd [1501,(format ["%1 (x%2)",(_x select 0),(_x select 1)])];
        lbSetData [1501,_i,(_x select 0)];
    } foreach (_player getVariable ["player_inventory",[]]);

    _control = _display displayCtrl 1100;

    _cash = _player getVariable ["getjobplayerguy",0];
    _bank = _player getVariable ["getrankplayerguy",0];
    _profileName = name _player;
    _charName = _player getVariable ["name","Undefined"];
    ctrlSetText [1002, _charName];
    ctrlSetText [1000, format ["Cash: $%1",_cash]];
    ctrlSetText [1001, format ["Bank: $%1",_bank]];

}, false] call Server_Setup_Compile;

['A3PL_Admin_SearchFactory', {

    _selectedbutton = _this select 0;
    _display = findDisplay 69;
    _control = _display displayCtrl 2100;

    if (_selectedbutton == 0) then {
        _text = ctrltext 1401;

        [player,"factories",[format ["Searched for %1", _text]]] remoteExec ["Caue_Log_Admin", 2];

        if (lbCurSel _control < 0) exitwith {["System: No factory selected",Color_Red] call A3PL_HUD_Notification;};
        if (count _text > 20) exitwith {["System: Fuq you spamming?",Color_Red] call A3PL_HUD_Notification;};
        if (_text == "") exitwith {[] spawn A3PL_Admin_FillRecipes;};

        _type = _control lbText (lbCurSel _control);

        _control = _display displayCtrl 1500;
        lbClear _control;
        _recipes = ["all",_type] call Caue_Config_GetFactory;

        {
            private ["_name","_itemType","_itemClass","_index"];
            _id = _x select 0;
            _name = _x select 2;
            _itemClass = _x select 4;
            _itemType = _x select 5;
            if (_name == "inh") then {_name = [_itemClass,_itemType,"name"] call A3PL_Factory_Inheritance;};
            if ((_name find _text) != -1) then {
                _index = _control lbAdd _name;
                _control lbSetData [_index,_id];
            };
        } foreach _recipes;
    };

    if (_selectedbutton == 1) then {
        _text = ctrltext 1402;

        [player,"factories",[format ["Searched for %1", _text]]] remoteExec ["Caue_Log_Admin", 2];

        if (count _text > 20) exitwith {["System: Fuq you spamming?",Color_Red] call A3PL_HUD_Notification;};
        _control = _display displayCtrl 1501;
        lbClear _control;
        if (_text == "") exitwith {
            A3PL_Admin_PlayerFacList = [];
            {
                lbAdd [1501, format ["%1 (%2)",_x getVariable ["name","Undefined"],name _x]];
                A3PL_Admin_PlayerFacList pushback _x;
            } foreach ([player] + allPlayers);
        };

        A3PL_Admin_PlayerFacList = [];
        {
            _name = format ["%1 (%2)",_x getVariable ["name","Undefined"],name _x];
            if ((_name find _text) != -1) then {
                lbAdd [1501, _name];
                A3PL_Admin_PlayerFacList pushback _x;
            };
        } foreach ([player] + allPlayers);
    };

}, false] call Server_Setup_Compile;

['A3PL_Admin_SelectCommand', {

    _display = findDisplay 69;
    _listbox = _display displayCtrl 1500;

    if (lbCurSel _listbox < 0) exitwith {["Nothing selected...",Color_Red] call A3PL_HUD_Notification;};

    [] call (compile (((player getVariable ["pintodemacaco",[]]) select (lbCurSel _listbox)) select 2));

}, false] call Server_Setup_Compile;

['A3PL_Admin_SpawnObject', {

    private ["_id","_display","_class","_pos","_pos"];
    _display = findDisplay 69;
    if(isNull _display) exitWith {};

    _id = lbCurSel 1500;

    if(_id < 0) exitWith {};

    _class = lbdata [1500, _id];
    _pos = getPos player;

    _obj = createvehicle [_class,_pos, [], 0, "CAN_COLLIDE"];

    [player,"objects",[format ["%1 AT %2",_class,_pos]]] remoteExec ["Caue_Log_Admin", 2];

}, false] call Server_Setup_Compile;

['A3PL_Admin_SpawnVehicle', {

    _display = findDisplay 69;
    if(isNull _display) exitWith {};

    _id = lbCurSel 1500;

    if(_id < 0) exitWith {};

    _class = lbdata [1500, _id];
    _pos = getPos player;

    [_class,_pos,"ADMIN",player] remoteExec ["Server_Vehicle_Spawn", 2];

    [player,"vehicles",[format ["%1 AT %2",_class,_pos]]] remoteExec ["Caue_Log_Admin", 2];

}, false] call Server_Setup_Compile;

['A3PL_Admin_Spectate', {

    disableSerialization;
    private ["_display","_logic","_dummy"];

    if (!isObjectHidden player) then
    {
        [player] remoteExec ["A3PL_Lib_HideObject", 2];
        uisleep 0.5;
    };

    if (!isNil "A3PL_ORGADMPOS") exitwith {["System: You are already spectating",Color_Red] call A3PL_HUD_Notification;};
    ["Initialize", [player, [], false, true, true, false, true, true, true, true]] call BIS_fnc_EGSpectator;
    A3PL_ORGADMPOS = getPosATL player;
    [player,"spectate",[format ["ENABLED"]]] remoteExec ["Caue_Log_Admin", 2];

    _i = 0;
    waituntil {_display = findDisplay 60492; sleep 0.01; _i = _i + 0.01; if (_i > 1) exitwith {true;}; !isNull _display;};
    if (isNull _display) exitwith {};
    _dummy = ["GetCamera"] call BIS_fnc_EGSpectatorCamera;
    _display displayAddEventHandler ["KeyUp",{private ["_dik"]; _dik = param [1,0]; if (_dik == 59) then {[] call A3PL_Admin_Open;}; true;}];
    _logic = "logic" createvehicleLocal (getpos _dummy);
    player attachTo [_logic,[0,0,0]];

    while {!isNull _display} do
    {
        _logic setposATL (getposATL _dummy);
        uiSleep 0.1;
    };

    deleteVehicle _logic;
    detach player;
    player setposATL (missionNameSpace getVariable ['A3PL_ORGADMPOS',getposATL player]);
    A3PL_ORGADMPOS = nil;
    [player,false] remoteExec ['A3PL_Lib_HideObject', 2];

}, false] call Server_Setup_Compile;

['A3PL_Admin_TeleTo', {
    _display = findDisplay 69;
    if(isNull _display) exitWith {};

    AFPL_MYOLDPOS = getPos player;

    _id = lbCurSel 1500;
    if(_id < 0) exitWith {};
    _target = (A3PL_Admin_PlayerList select _id);
    player setPosATL (getPosATL _target);

    [player,"players",[format ["TeleTo | %1(%2) FROM %3 TO %4",_target getVariable ["name","Undefined"],(getPlayerUID _target),(getPos player),(getPos _target)]]] remoteExec ["Caue_Log_Admin", 2];
}, false] call Server_Setup_Compile;

['A3PL_Admin_TeleToMe', {

    _display = findDisplay 69;
    if(isNull _display) exitWith {};

    _id = lbCurSel 1500;
    if(_id < 0) exitWith {};
    _target = (A3PL_Admin_PlayerList select _id);
    _target setPosATL (getPosATL player);

    [player,"players",[format ["TeleToMe | %1(%2) FROM %3 TO %4",_target getVariable ["name","Undefined"],(getPlayerUID _target),(getPos _target),(getPos player)]]] remoteExec ["Caue_Log_Admin", 2];

}, false] call Server_Setup_Compile;

['A3PL_Admin_Vehicles', {

    disableSerialization;
    closeDialog 0;
    createDialog "Dialog_AdminVeh";

    _display = findDisplay 69;

    {
        private ["_m"];
        _m = _x;

        {
            _class = format ["%1_%2",(_m select 0),_x];
            _i = lbAdd [1500,_class];
            lbSetData [1500,_i,_class];
        } foreach (_x select 1);

    } foreach Config_Shops_VehicleColours;

    _control = _display displayCtrl 1600;
    _control buttonSetAction "[] call A3PL_Admin_SpawnVehicle";

}, false] call Server_Setup_Compile;
