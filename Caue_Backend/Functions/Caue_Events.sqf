/*
    Server
*/
['Caue_Events_Loop', {

    if !(isNil "ActiveEvent") exitwith {};

    private _script = selectRandom [Caue_Events_Truck];
    [] spawn _script;

}, true] call Server_Setup_Compile;

['Caue_Events_Truck', {

    if ((count allplayers) < 20) exitwith {sleep 1200; [] spawn Caue_Events_Loop;};
    if ((count (["police"] call A3PL_Lib_FactionPlayers)) < 2) exitwith {sleep 1200; [] spawn Caue_Events_Loop;};

    if !(isNil "ActiveEvent") exitwith {};
    ActiveEvent = true;

    private _pos = [];
    private _pos1 = 0;
    private _pos2 = 0;
    private _findedpos = true;
    while {_findedpos} do {
        private _randomPos = [nil, ["water"]] call BIS_fnc_randomPos;
        _pos1 = _randomPos select 0;
    	_pos2 = _randomPos select 1;

    	private _list = [_pos1,_pos2] nearRoads 200;
        private _units = nearestObjects [[_pos1,_pos2,0],["Man"],300] select {isPlayer _x && {!isObjectHidden _x}} apply {_x};
    	if ((count _units) isEqualTo 0) then {
    		if ((count _list) > 0) exitwith {
    			_pos = selectRandom _list;
    			_pos = getPos _pos;
                _findedpos = false;
    		};
    	};
    	sleep 0.2;
    };

    _pos1 = _pos select 0;
    _pos2 = _pos select 1;

    ["Houve um acidente e a carga de um caminhão tombou. As autoridades querem abafar o acontecimento, mas a mídia revelará a localização em 1 minuto!",Color_Orange] remoteExec ["A3PL_HUD_Notification",-2];
    uiSleep 60;
    ["A informação vazou e o local da carga está marcado no mapa. É de quem pegar!",Color_Orange] remoteExec ["A3PL_HUD_Notification",-2];

    private _markerstr = createMarker ["lootdrop",[_pos1,_pos2]];
    _markerstr setMarkerShape "ELLIPSE";
    _markerstr setMarkerColor "ColorRed";
    _markerstr setMarkerSize [150,150];

    private _markerstr = createMarker ["openfire",[_pos1,_pos2]];
    _markerstr setMarkerShape "ICON";
    _markerstr setMarkerType "hd_dot";
    _markerstr setmarkertext "ZONA SEM LEI";

    private _truck = createVehicle ["c_truck_02_box_f",[_pos1,_pos2,0], [], 0, "CAN_COLLIDE"];
    _truck setPosATL [_pos1,_pos2,0];
    _truck setDamage 0.7;
    _truck allowdamage false;
    _truck setVectorDirAndUp [[1,0,0],[0,1,0]];
    _truck lock true;

    private _box = createVehicle ["plp_ct_woodboxlightbig",[(_pos1 + random 10 + random -10),(_pos2  + random 10 + random -10),0], [], 0, "CAN_COLLIDE"];
    _box setPosATL [(_pos1 + random 10 + random -10),(_pos2  + random 10 + random -10),0];
    _box allowdamage false;

    [_box] spawn {
        params [["_box",objNull]];

        private _chance = round(random 100);

        if (_chance <= 5) exitWith {
            _weapon_mag = selectRandom [[["RH_ar10",1],["RH_20Rnd_762x51_AR10",10]],[["hgun_PDW2000_F",1],["30Rnd_9x21_Mag",10]],[["arifle_AKS_F",1],["30Rnd_545x39_Mag_F",10]]];
            _weapon_mag params ["_weapon","_mag"];
            _box addWeaponCargoGlobal _weapon;
            _box addMagazineCargoGlobal _mag;
            ["Truck",format["%1 | %2",_weapon,_mag]] spawn Caue_Log_Events;
        };

        if (_chance <= 20) exitWith {
            _weapon_mag = selectRandom [[["RH_vz61",1],["RH_20Rnd_32cal_vz61",10]],[["RH_fn57",1],["RH_20Rnd_57x28_FN",10]],[["RH_kimber_nw",1],["RH_7Rnd_45cal_m1911",10]]];
            _weapon_mag params ["_weapon","_mag"];
            _box addWeaponCargoGlobal _weapon;
            _box addMagazineCargoGlobal _mag;
            ["Truck",format["%1 | %2",_weapon,_mag]] spawn Caue_Log_Events;
        };

        if (_chance <= 55) exitWith {
            private _item = selectRandom ["Steel","Coal_Ingot","Sulphur_Powder","Iron_Ingot","Aramid","Rubber"];
            private _amount = (50 + (round(random 50)));
            _box setVariable ["vitems",[[_item,_amount]],true];
            ["Truck",format["x%1 - %2",_amount,_item]] spawn Caue_Log_Events;
        };

        if (_chance <= 100) exitWith {
            private _item = selectRandom ["meatpie","lamington","burger_cooked","taco_cooked","fish_cooked"];
            _box setVariable ["vitems",[[_item,(10 + (round(random 10)))],["coke",(10 + (round(random 10)))]],true];
            ["Truck",format["%1 | %2",_item,"coke"]] spawn Caue_Log_Events;
        };
    };

    sleep 600;
    deletevehicle _truck;
    deletevehicle _box;
    deleteMarker "lootdrop";
    deleteMarker "openfire";
    ActiveEvent = nil;

}, true] call Server_Setup_Compile;
