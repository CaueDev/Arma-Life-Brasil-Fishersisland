['A3PL_Hunting_Skin', {

    private ["_animal","_type","_meatItem","_animalType"];
    _animal = param [0,objNull];
    if (isNull _animal) exitwith {};
    _type = typeOf _animal;

    if (_animal getVariable ["skinning",false]) exitwith {["Este animal já foi esfolado"] call A3PL_HUD_Notification;};
    _animal setVariable ["skinning",true,true];

    if ([10,"Esfolando Animal...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown"] call Caue_HUD_Progress) then {
        _meatItem = "meat_sheep";
        _animalType = "Unknown";
        switch (true) do {
            case (_type IN ["Goat","Goat02","Goat03"]): { _meatItem = "meat_goat"; _animalType = "Goat"; };
            case (_type IN ["WildBoar"]): { _meatItem = "meat_boar"; _animalType = "Boar"; };
            case (_type IN ["Sheep","Sheep02","Sheep03"]): { _meatItem = "meat_sheep"; _animalType = "Sheep";};
        };

        [_meatItem,1] call Caue_Inventory_Add;
        [format["Você esfolou um %1 e obteve 1 %2",_animalType,[_meatItem,"name"] call Caue_Config_GetItem],Color_Green] call A3PL_HUD_Notification;

        deleteVehicle _animal;
    } else {
        ["Cancelado",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['A3PL_Hunting_Tag', {

    private ["_meat","_newClass","_tagClass","_class"];
    _meat = param [0,objNull];
    _class = _meat getVariable ["class","unknown"];
    switch (_class) do
    {
        case ("meat_goat"): {_newClass = "meat_goat_tag"; _tagClass = "tag_meat";};
        case ("meat_sheep"): {_newClass = "meat_sheep_tag"; _tagClass = "tag_meat";};
        case ("meat_boar"): {_newClass = "meat_boar_tag"; _tagClass = "tag_meat";};

        case ("mullet"): {_newClass = "mullet_tag"; _tagClass = "tag_fish";};
        case ("shark_2lb"): {_newClass = "shark_2lb_tag"; _tagClass = "tag_shark";};
        case ("shark_4lb"): {_newClass = "shark_4lb_tag"; _tagClass = "tag_shark";};
        case ("shark_5lb"): {_newClass = "shark_5lb_tag"; _tagClass = "tag_shark";};
        case ("shark_7lb"): {_newClass = "shark_7lb_tag"; _tagClass = "tag_shark";};
        case ("shark_10lb"): {_newClass = "shark_10lb_tag"; _tagClass = "tag_shark";};
    };
    if (isNil "_tagClass") exitwith {["Você não tem uma etiqueta para este tipo de carne",Color_Red] call A3PL_HUD_Notification};
    if (!([_tagClass,1] call Caue_Inventory_Has)) exitwith {["Você não tem uma etiqueta para este tipo de carne",Color_Red] call A3PL_HUD_Notification};
    if (isNil "_newClass") exitwith {["Esta carne já está marcada"] call A3PL_HUD_Notification;};
    if ((_meat getVariable ["amount",1]) > 1) exitwith {["Você só pode marcar uma carne de cada vez, por favor, solte-os um por um",Color_Red] call A3PL_HUD_Notification;};
    _meat setVariable ["class",_newClass,true];
    [_tagClass,-1] call Caue_Inventory_Add;
    ["Esta carne foi etiquetada com sucesso, agora você pode vendê-la na loja",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Hunting_SpawnLoop', {

    params [
        ["_siteVar","def"],
        ["_sitePos",[]],
        ["_animalList",[]],
        ["_genDist",5],
        ["_animalCount",5],
        ["_radius",5]
    ];

    _siteVar = format ["A3PL_Animals_%1",_siteVar];
    private _dist = 10000;
    private _siteAnimals = missionNamespace getVariable [_siteVar,[]];

    private _deleteAnimals = [];
    {
        if (isNull _x) then {_deleteAnimals = _deleteAnimals + [_x];};
    } forEach _siteAnimals;

    {
        _siteAnimals = _siteAnimals - [_x];
    } forEach _deleteAnimals;

    {
        private _checkDist = (_x distance2D _sitePos);
        if (_checkDist < _dist) then {_dist = _checkDist};
    } forEach allPlayers;

    private _animal = "";
    private _pos = [];
    private _unit = objNull;
    if (_dist < _genDist) then {
        private _i = count _siteAnimals;
        while {_i < _animalCount} do {
            _animal = selectRandom _animalList;
            _pos = [((_sitePos select 0) - _radius + random (_radius * 2)), ((_sitePos select 1) - _radius + random (_radius * 2)), 0];
            _unit = createAgent [_animal,_pos,[],0,"NONE"];

            _unit setDir (random 360);
            _siteAnimals = _siteAnimals + [_unit];
            _i = _i + 1;
            sleep 0.05;
        };
        missionNameSpace setVariable [_siteVar,_siteAnimals];
    } else {
        {deleteVehicle _x} forEach _siteAnimals;
        missionNameSpace setVariable [_siteVar,[]];
    };

}, true] call Server_Setup_Compile;
