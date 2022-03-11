/*
    Client
*/
['Caue_Gear_Sync', {

    params [["_msg",false]];

    [player,(getPlayerUID player),false] remoteExec ["Server_Gear_Save",2];
    profileNamespace setVariable ["mainmenu_gear",(getUnitLoadout player)];
    profileNamespace setVariable ["mainmenu_pos",(getPosATL player)];
    saveProfileNamespace;

    if (_msg) then {["Sincronizado", Color_Green] call A3PL_HUD_Notification;};

}, false] call Server_Setup_Compile;

['Caue_Gear_NewPlayer', {

    disableSerialization;
    waitUntil {sleep 0.1; isNull(findDisplay 999210)};

    createDialog "Caue_NewPlayer";
    private _display = findDisplay 111;
    _display displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];

    if (isNil "NewPlayerRequested") then {
        ["Parece que você é um novo jogador, por favor insira seus dados", Color_Green] call A3PL_HUD_Notification;
    } else {
        ["Servidor foi incapaz de criar seu personagem, talvez o nome já esteja em uso?", Color_Red] call A3PL_HUD_Notification;
    };
    NewPlayerRequested = true;

}, false] call Server_Setup_Compile;

['Caue_Gear_NewPlayerSubmit', {

    private _display = findDisplay 111;
    private _firstname = toLower(ctrlText(_display displayCtrl 1400));
    private _lastname = toLower(ctrlText(_display displayCtrl 1401));
    private _age = ctrlText(_display displayCtrl 1402);
    private _numberage = parseNumber _age;
    private _sex = toLower(ctrlText(_display displayCtrl 1403));

    if (count _firstname < 2) exitWith {["Por favor, insira um nome que tenha mais de 2 caracteres", Color_Red] call A3PL_HUD_Notification;};
    if (count _lastname < 2) exitwith {["Por favor, insira um sobrenome que tenha mais de 2 caracteres", Color_Red] call A3PL_HUD_Notification;};
    if !(_sex in ["masculino","feminino"]) exitwith {["Seu sexo deve ser masculino ou feminino", Color_Red] call A3PL_HUD_Notification;};
    if ((_numberage < 20) || (_numberage > 100)) exitwith {["Sua idade deve ser entre 20 e 100 anos", Color_Red] call A3PL_HUD_Notification;};

    private _checkname = _firstname + _lastname;
    _checkname = toArray _checkname;
    private _acceptedChars = toArray "abcdefghijklmnopqrstuvwxyz";
    private _forbiddenUsed = false;
    {
        if (!(_x IN _acceptedChars)) exitwith {_forbiddenUsed = true;};
    } forEach _checkname;

    if (_forbiddenUsed) exitWith {
        ["Você usou caracteres proibidos em seu nome, resolva isso", Color_Red] call A3PL_HUD_Notification;
        ["Não use letras maiúsculas, isso será feito automaticamente", Color_Red] call A3PL_HUD_Notification;
    };

    private _c = toArray "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    _firstname = toArray _firstname;
    _firstname set [0,_c select (_acceptedChars find (_firstname select 0))];
    _firstname = toString _firstname;
    _lastname = toArray _lastname;
    _lastname set [0,_c select (_acceptedChars find (_lastname select 0))];
    _lastname = toString _lastname;

    [player,(_firstname + " " + _lastname),_sex,_age] remoteExec ["Server_Gear_NewRecieve", 2];
    [format ["Bem-vindo à Fishers Island. É aqui que você começará sua nova aventura.",(_firstname + " " + _lastname)], Color_Green] call A3PL_HUD_Notification;
    closeDialog 0;

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Gear_Load', {

    params [["_unit",objNull]];

    if (isNull _unit) exitWith {};

    private _uid = getPlayerUID _unit;

    private _return = [format["Gear_Load:%1",_uid],2] call Server_Database_Async;

    if ((count _return) isEqualTo 0) exitWith {[_unit,true] call Server_Gear_New;};

    if (_unit getVariable ["vaititomanocuporra",false]) exitWith {};
    _unit setVariable ["vaititomanocuporra",true,true];

    _return params [
        "_id",
        "_name",
        "_age",
        "_gender",
        "_cash",
        "_bank",
        "_job",
        "_faction",
        "_rank",
        "_licenses",
        "_gear",
        "_inventory",
        "_factory",
        "_position",
        "_stats",
        "_jail",
        "_admin",
        "_twitter",
        "_insert"
    ];

    if (_name isEqualTo "") exitWith {[_unit,false] call Server_Gear_New;};

    _position = call compile _position;
    _gear = [_gear] call Server_Database_ToArray;
    _inventory = [_inventory] call Server_Database_ToArray;
    _factory = [_factory] call Server_Database_ToArray;
    _admin = [_admin] call Server_Database_ToArray;
    _licenses = [_licenses] call Server_Database_ToArray;
    _twitter = [_twitter] call Server_Database_ToArray;
    _stats = [_stats] call Server_Database_ToArray;

    if ((count _admin) > 0) then {_unit setVariable ["ufbhasyufbaufa",true,true];};

    _unit setVariable ["twitterprofile",_twitter,true];
    _unit setVariable ["name",_name,true];
    _unit setVariable ["db_id",_id,true];
    _unit setVariable ["age",_age,true];
    _unit setVariable ["gender",_gender,true];
    _unit setVariable ["date",_insert,true];
    _unit setVariable ["faction",_faction,true];
    _unit setVariable ["faction_rank",_rank,true];
    _unit setVariable ["jail",_jail,true];

    _unit setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];

    private _ownsHouse = false;
    private _houseObj = objNull;
    {
        if (((_x getVariable "owner") select 0) isEqualTo _uid) exitWith {
            _houseObj = _x;
            _ownsHouse = true;
        };
    } forEach Server_HouseList;

    if (_ownsHouse) then {
        if ([[0,0,0],_position] call BIS_fnc_areEqual) then {
            switch (typeOf _houseObj) do {
                case ("Land_Mansion01"): {_unit setPosATL [(getPosATL _houseObj select 0),(getPosATL _houseObj select 1),1];};
                default {_unit setPosATL (getPosATL _houseObj);};
            };
        };
        _unit setVariable ["house",_houseObj,true];
        [_unit,_houseObj,_uid] call Server_Housing_LoadItems;
    };

    if (([[0,0,0],_position] call BIS_fnc_areEqual) && (!(_ownsHouse))) then {
        _unit setPosATL (selectRandom Config_Apts);
    };

    _unit setVariable ["job",_job,true];
    _unit setVariable ["player_inventory",_inventory,true];
    _unit setVariable ["player_fstorage",_factory,true];
    _unit setVariable ["getjobplayerguy",_cash,true];
    _unit setVariable ["getrankplayerguy",_bank,true];
    _unit setVariable ["pintodemacaco",_admin,true];
    _unit setVariable ["licenses",_licenses,true];

    _unit setVariable ["Player_Hunger",(_stats select 0),true];
    _unit setVariable ["Player_Thirst",(_stats select 1),true];
    _unit setVariable ["Caue_MedicalVars",(_stats select 2),true];
    _unit setVariable ["Caue_Wounds",(_stats select 3),true];

    if(_jail > 0) then {
        [] remoteExec ["Caue_Police_JailLoop",_unit];
    };

    _unit setPosATL _position;
    _unit setVariable ["caralhodedupefilhadaputa",_gear,true];

    _unit setVariable ["RetrievedInventory",true,true];

}, true] call Server_Setup_Compile;

['Server_Gear_New', {

    params [
        ["_unit",objNull],
        "_newEntry"
    ];

    if (isNull _unit) exitWith {};

    _unit addUniform (selectRandom ["A3PL_featherlite_blue_Uniform","A3PL_featherlite_green_Uniform","A3PL_featherlite_pink_Uniform","A3PL_featherlite_red_Uniform"]);
    _unit addItem "RoleplayRadio";
    _unit linkItem "ItemMap";
    _unit linkItem "ItemWatch";

    _unit setVariable ["RetrievedInventory",true,true];

    if (_newEntry) then {
        [format["Gear_New:%1",(getPlayerUID _unit)],1] call Server_Database_Async;
    };

    [] remoteExec ["Caue_Gear_NewPlayer",_unit];

    _unit setPosATL (selectRandom Config_Apts);

}, true] call Server_Setup_Compile;

['Server_Gear_NewRecieve', {

    params [
        ["_unit",objNull],
        ["_name",""],
        ["_sex",""],
        ["_age",""]
    ];

    if (isNull _unit) exitWith {};

    private _uid = getPlayerUID _unit;

    private _return = [format["Gear_NewRecieveSelect:%1",_name],2] call Server_Database_Async;
    if ((count _return) > 0) exitWith {[] remoteExec ["Caue_Gear_NewPlayer",_unit];};

    private _idnew = [format["Gear_ID:%1",_uid],2] call Server_Database_Async;

    _unit setVariable ["db_id",(_idnew select 0),true];
    _unit setVariable ["name",_name,true];
    _unit setVariable ["age",_age,true];
    _unit setVariable ["gender",_gender,true];
    _unit setVariable ["job","unemployed",true];
    _unit setVariable ["faction","citizen",true];
    _unit setVariable ["getjobplayerguy",1000,true];
    _unit setVariable ["getrankplayerguy",5000,true];
    _unit setVariable ["Player_Inventory",[],true];
    _unit setVariable ["Player_Hunger",100,true];
    _unit setVariable ["Player_Thirst",100,true];
    _unit setVariable ["Caue_MedicalVars",[5000],true];
    _unit setVariable ["Caue_Wounds",[],true];

    [_unit,"burger_full_cooked",5] call Server_Inventory_Change;
    [_unit,"coke",5] call Server_Inventory_Change;
    [_unit,"repairwrench",2] call Server_Inventory_Change;

    private _paints = [
        "#(argb,8,8,3)color(1,1,1,1.0,co)", // white
        "#(argb,8,8,3)color(0.305349,0,0,1.0,co)", // red
        "#(argb,8,8,3)color(0,0.29671,0,1.0,co)", // green
        "#(argb,8,8,3)color(0,0,0.548041,1.0,co)", // blue
        "#(argb,8,8,3)color(0.565495,0.558513,0,1.0,co)", // yellow
        "#(argb,8,8,3)color(0.404922,0,0.534078,1.0,co)", // pink
        "#(argb,8,8,3)color(0.712104,0.293219,0.129156,1.0,co)" // orange
    ];

    [format["Gear_NewRecieveUpdate:%1:%2:%3:%4",_name,_age,_sex,_uid],1] spawn Server_Database_Async;
    [format["Gear_NewRecieveInsert:%1:%2:%3:%4",([7] call Caue_Lib_GenerateID),'A3PL_CVPI',_uid,(selectRandom _paints)],1] spawn Server_Database_Async;

    sleep 2;
    [_unit,_uid,false] call Server_Gear_Save;

}, true] call Server_Setup_Compile;

['Server_Gear_Save', {

    params [
        ["_unit",objNull],
        ["_uid",""],
        ["_delete",false]
    ];

    if ((isNull _unit) || (_uid isEqualTo "")) exitWith {};
    if !(_unit getVariable ["RetrievedInventory",false]) exitWith {};
    if (_delete) then {_unit setVariable ["RetrievedInventory",false,true];};

    private _pos = getPosATL _unit;

    private _cash = [(_unit getVariable ["getjobplayerguy",0])] call Server_Database_NumberSafe;
    private _bank = [(_unit getVariable ["getrankplayerguy",0])] call Server_Database_NumberSafe;
    private _job = _unit getVariable ["job","unemployed"];
    _gear = [(getUnitLoadout _unit)] call Server_Database_Array;
    private _inv = [(_unit getVariable ["player_inventory",[]])] call Server_Database_Array;
    private _stats = [(_unit getVariable ["Player_Hunger",100]),(_unit getVariable ["Player_Thirst",100]),(_unit getVariable ["Caue_MedicalVars",[5000]]),(_unit getVariable ["Caue_Wounds",[]])];
    _stats = [_stats] call Server_Database_Array;
    private _jail = [(_unit getVariable ["jail",0])] call Server_Database_NumberSafe;

    if (_delete) then {deleteVehicle _unit;};

    [format["Gear_Save:%1:%2:%3:%4:%5:%6:%7:%8:%9",_cash,_bank,_job,_gear,_inv,_pos,_stats,_jail,_uid],1] spawn Server_Database_Async;

}, true] call Server_Setup_Compile;

['Server_Gear_HandleDisconnect', {

    addMissionEventHandler ["HandleDisconnect",{
        params [
            "_unit",
            "_id",
            "_uid",
            "_name"
        ];

        private _var = _unit getVariable "name";
        if (isNil "_var") exitwith {};

        if (!isNil {_unit getVariable ["house",nil]}) then {
            [_unit,_uid] call Server_Housing_SaveItems;
        };

        private _deleteAt = [];
        {
            if (_x getVariable ["owner",""] isEqualTo _uid) then {
                ropeDestroy (_x getVariable ["rope",objNull]);
                deleteVehicle (_x getVariable ["net",objNull]);
                deleteVehicle _x;
                _deleteAt pushBack _forEachIndex;
            };
        } forEach Server_FishingBuoys;

        {
            Server_FishingBuoys deleteAt _x;
        } forEach _deleteAt;

        if !(isNil "Robbery_ShopRob") then {
            if (Robbery_ShopRob isEqualTo _uid) then {
                Robbery_ShopRob = nil;
                publicVariable "Robbery_ShopRob";
            };
        };

        if ((server getVariable ["RobberyShopActive",""]) isEqualTo _uid) then {
            server setVariable ["RobberyShopActive","",true];
        };

        [_unit,_uid,true] spawn Server_Gear_Save;

        false;
    }];

}, true] call Server_Setup_Compile;
