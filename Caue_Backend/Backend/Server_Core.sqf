['Server_Core_ChangeVar', {

    params [
        ["_obj",objNull],
        ["_var",""],
        "_value"
    ];

    if ((isNull _obj) || (_var isEqualTo "")) exitWith {};

    _obj setVariable [_var,_value,true];

}, true] call Server_Setup_Compile;

['Server_Core_Clean', {

    private _objects = 0;
    private _toDelete = [];
    private _allMO = allMissionObjects "All";
    private _ignore = [
        "A3PL_Anchor","A3PL_FSS_Siren","A3PL_FSS_Phaser","A3PL_FSS_Priority","A3PL_FSS_Rumbler","A3PL_EQ2B_Wail","A3PL_Whelen_Warble","A3PL_AirHorn_1","A3PL_FSUO_Siren","A3PL_Whelen_Priority3","A3PL_FIPA20A_Priority","A3PL_Electric_Horn","A3PL_Whelen_Siren","A3PL_Whelen_Priority""A3PL_Whelen_Priority2""A3PL_Electric_Airhorn","A3PL_Lifebuoy","A3PL_rescueBasket","A3PL_Ladder","A3PL_OilBarrel","A3PL_MiniExcavator_Bucket","A3PL_MiniExcavator_Jackhammer","A3PL_MiniExcavator_Claw","A3PL_TapeSign","A3PL_PlasticBarrier_01","A3PL_PlasticBarrier_02","A3PL_Road_Bollard","A3PL_RoadBarrier","A3PL_AAA_Box","A3PL_Corn","A3PL_Marijuana","A3PL_Wheat","A3PL_Lettuce","A3PL_Coco_Plant","A3PL_Sugarcane_Plant","A3PL_DeliveryBox","A3PL_Net","A3PL_Stinger","A3PL_Camping_Light","Alsatian_Sand_F","Alsatian_Black_F","Alsatian_Sandblack_F","Land_WoodenTable_small_F","Land_cargo_house_slum_F","Rope","A3PL_Yacht_Pirate","A3PL_Pumpjack","A3PL_OilBarrel","A3PL_Drillhole","A3PL_Ladder","A3PL_FireObject","A3PL_FD_HoseEnd1_Float","A3PL_FD_HoseEnd2_Float","A3PL_FD_HoseEnd2","A3PL_FD_HoseEnd1","A3PL_FD_EmptyPhysx","A3PL_FD_yAdapter","A3PL_FD_HydrantWrench_F","plp_ct_FootlockerBrown","A3PL_Container_Hook","A3PL_MobileCrane","A3PL_Container_Ship","A3PL_RoadCone_x10","A3PL_RoadCone","Land_A3PL_Tree3","Rabbit_F","A3PL_Grainsack_Malt","A3PL_Grainsack_Yeast","A3PL_Grainsack_CornMeal","A3PL_Distillery","A3PL_Distillery_Hose","A3PL_Jug","A3PL_Jug_Green","Land_A3PL_EstateSign","Land_A3PL_FireHydrant","A3PL_Resource_Ore_Pink","A3PL_Resource_Ore_Black","A3PL_Resource_Ore_Orange","A3PL_Resource_Ore_Yellow","Land_Sleeping_bag_folded_F","GroundWeaponHolder", "A3PL_FishingBuoy"
    ];

    {
        if (((_x getVariable ["clean",0]) > 0) && ((Server_Core_DefVehicles find _x) isEqualTo -1)) then {
            private _skip = false;
            private _class = _x getVariable ["class",nil];

            if (!isNil "_class") then {
                if (!([_class,"canPickup"] call Caue_Config_GetItem)) then {_skip = true;};
            };

            if (!_skip) then {
                _toDelete pushback _x;
            };
        } else {
            _x setVariable ["clean",1,false];
        };
    } forEach _allMO;

    {
        if (!isNil {_x getVariable ["keyAccess",nil]}) then {
            if ((count crew _x) > 0) then {} else {};
        } else {
            if ((!isNull (attachedTo _x)) OR (!isNil {_x getVariable ["bItem",nil]}) OR ((typeOf _x) IN _ignore)) then {
                _x setVariable ["clean",nil,false];
            } else {
                deleteVehicle _x;
                _objects = _objects + 1;
            };
        };
    } forEach _toDelete;

}, true] call Server_Setup_Compile;

['Server_Core_GetDefVehicles', {

    Server_Core_DefVehicles = allMissionObjects "All";

}, true] call Server_Setup_Compile;

['Server_Core_RepairTerrain', {

    private _c = 0;

    {
        if ((getDammage _x) isEqualTo 1) then {
            _x setDammage 0;
            _c = _c + 1;
        };
    } forEach nearestTerrainObjects [[6690.16,7330.15,0],[],6000];

}, true] call Server_Setup_Compile;

['Server_Core_SavePersistentVar', {

    params [
        ["_var",""],
        ["_toArray",true]
    ];

    private _query = "";

    if (_toArray) then {
        _query = format ["SaveVars:%2:%1",_var,[(call compile _var)] call Server_Database_Array];
    } else {
        _query = format ["SaveVars:%2:%1",_var,(call compile _var)];
    };

    [_query,1] spawn Server_Database_Async;

}, true] call Server_Setup_Compile;

['Server_Core_LoadPersistentVar', {

    private _pVars = ["LoadVars", 2, true] call Server_Database_Async;
    {
        _compile = formatText ['%1 = %2;',(_x select 0),([(_x select 1)] call Server_Database_ToArray)];
        call compile str(_compile);

        if ((_x select 2) isEqualTo 1) then {
            publicVariable (_x select 0);
        };
    } forEach _pVars;

}, true] call Server_Setup_Compile;

['Server_Core_Variables', {

    server setVariable ["Server_DroppedItems",[],true];
    server setVariable ["Marked_Impound",[],true];
    server setVariable ["RobberyShopActive","",true];

    Server_HouseList = [];

    Server_FishingBuoys = [];

    Server_Dispatch_Active = [];

    Color_Yellow = '#E1BB00';
    Color_White = '#ffffff';
    Color_Red = '#FD1703';
    Color_Green = '#17ED00';
    Color_Blue = '#001cf0';
    Color_Orange = '#ff9d00';

    Uber_Drivers = [];

    HitchingVehicles = ["A3PL_Car_Base","A3PL_Truck_Base"];

    Server_TerrainFires = [];
    Server_ObjectFires = [];

}, true] call Server_Setup_Compile;
