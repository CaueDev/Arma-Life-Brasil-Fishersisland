['A3PL_Drugs_Add', {

    private ["_drugsType","_amount","_drugsArray"];

    _drugstype = param [0,""];
    _amount = param [1,1];
    _drugsarray = player getvariable ["drugs_array",[[["alcohol",0],["cocaine",0],["shrooms",0],["weed",0]],false]];
    {
        if (_drugstype == (_x select 0)) then {
            ((_drugsarray select 0) select _forEachIndex) set [1,(_amount+(_x select 1))];
        };
    } foreach (_drugsarray select 0);

    [true] spawn A3PL_Drugs_Loop;

}, false] call Server_Setup_Compile;

['A3PL_Drugs_Loop', {

    private ["_drugsArray","_consumption"];

    _drugsarray = player getvariable ["drugs_array",[[["alcohol",0],["cocaine",0],["shrooms",0],["weed",0]],false]];
    _consumption = _this select 0;
    {
        if (_x select 1 != 0) then {
            switch (_x select 0) do {
                case "alcohol": {
                    if (_x select 1 > 100) then {
                        ((_drugsarray select 0) select _forEachIndex) set [1,100];
                    };
                    resetCamShake;
                    enableCamShake true;
                    addCamShake [((_x select 1)*0.5), 100, 2];
                    if (!_consumption) then {((_drugsarray select 0) select _forEachIndex) set [1,((_x select 1)-2)];};
                    if (_x select 1 <= 0) exitwith {
                        ((_drugsarray select 0) select _forEachIndex) set [1,0];
                        resetCamShake;
                    };
                };

                case "cocaine": {
                    if (_x select 1 > 100) then {
                        ((_drugsarray select 0) select _forEachIndex) set [1,100];
                    };

                    if (_x select 1 < 60) then {  player setAnimSpeedCoef ((0.40/60*(_x select 1))+1)} else {player setAnimSpeedCoef 1.4;};
                    "filmGrain" ppEffectEnable true;
                    "filmGrain" ppEffectAdjust [(0.50/100*(_x select 1)), -1, 0.5, (-0.5+(0.5/100*(_x select 1))), 2, true];
                    "filmGrain" ppEffectCommit 1;

                    if ((floor random 20 == 6) && (_drugsarray select 0 select 0 select 1 == 0)) then {enableCamShake true; addCamShake [60, 5, 500];};

                    if (!_consumption) then {((_drugsarray select 0) select _forEachIndex) set [1,((_x select 1)-2)];};

                    if (_x select 1 <= 0) exitwith {
                        ((_drugsarray select 0) select _forEachIndex) set [1,0];
                        player setAnimSpeedCoef 1;
                        "filmGrain" ppEffectEnable false;
                    };
                };

                case "shrooms": {
                    if (_x select 1 > 100) then {
                        ((_drugsarray select 0) select _forEachIndex) set [1,100];
                    };
                    "colorCorrections" ppEffectEnable true;
                    "colorCorrections" ppEffectAdjust [0.5, 0.5, 0, [(random 10),(random 10),(random 10),0.2], [1,1,5,2], [(random 5),(random 5),(random 5),(random 5)]];
                    "colorCorrections" ppEffectCommit 40;
                    player setstamina 100;
                    if (_x select 1 < 70) then {  player setAnimSpeedCoef ((0.20/60*(_x select 1))+1)} else {player setAnimSpeedCoef 1.2;};
                    if (round random (300/(_x select 1)) == 1) then {
                        _fscriptedCharge = "DemoCharge_Remote_Ammo_Scripted" createVehicleLocal [(getpos player select 0),(getpos player select 1),30];
                        _fscriptedCharge setdammage 1;
                        if (round random (500/(_x select 1)) == 1) then {
                            _randommodels = [
                                "Land_Cargo20_blue_F",
                                "Land_Cargo20_brick_red_F",
                                "Land_LuggageHeap_05_F",
                                "Land_Device_disassembled_F",
                                "ArrowDesk_R_F",
                                "Land_Scrap_MRAP_01_F",
                                "WaterPump_01_forest_F",
                                "Land_PressureWasher_01_F",
                                "WaterPump_01_sand_F",
                                "Land_AirIntakePlug_03_F",
                                "Land_WoodenCrate_01_stack_x5_F",
                                "Land_WoodenPlanks_01_messy_F",
                                "Land_Boat_03_abandoned_F",
                                "Land_Boat_01_abandoned_red_F",
                                "Land_Addon_01_ruins_F",
                                "Land_Shop_Town_02_ruins_F",
                                "Land_Church_01_V1_F",
                                "Land_LightHouse_F",
                                "Land_Airport_Tower_F"
                            ];
                            _locobject = (_randommodels select round random (count _randommodels)-1) createVehicleLocal (player modelToWorld [(random 10),((random 30)+30),(random 10)]);
                            sleep 5;
                            deletevehicle _locobject;
                        };

                        if (!_consumption) then {((_drugsarray select 0) select _forEachIndex) set [1,((_x select 1)-2)];};

                        if (_x select 1 <= 0) exitwith {
                            ((_drugsarray select 0) select _forEachIndex) set [1,0];
                            player setAnimSpeedCoef 1;
                            "colorCorrections" ppEffectEnable false;
                        };
                    };
                };

                case "weed": {
                    if (_x select 1 > 100) then {
                        ((_drugsarray select 0) select _forEachIndex) set [1,100];
                    };

                    if (_x select 1 <= 0) exitwith {
                        ((_drugsarray select 0) select _forEachIndex) set [1,0];
                        resetCamShake;
                        deleteVehicle BLUNT;
                        BLUNT = objNull;
                        [player, "amovpercmstpsnonwnondnon"] remoteExec ["A3PL_Lib_SyncAnim", -2];

                        "chromAberration" ppEffectAdjust [0,0,true];
                        "chromAberration" ppEffectCommit 5;
                        "radialBlur" ppEffectAdjust  [0,0,0,0];
                        "radialBlur" ppEffectCommit 5;

                        "chromAberration" ppEffectEnable false;
                        "radialBlur" ppEffectEnable false;
                        resetCamShake;
                    };

                    resetCamShake;

                    if (BLUNT isEqualTo objNull) then {
                        BLUNT = "AFPL_Drugs_Blunt" createVehicle (position player);
                        BLUNT attachTo [player, [-0.025, 0.02, -0.025], "RightHand"];

                        [player, "kka3_blunt_in", false] remoteExec ["A3PL_Lib_SyncAnim", -2];

                        "chromAberration" ppEffectEnable true;
                        "radialBlur" ppEffectEnable true;
                    };

                    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
                    "chromAberration" ppEffectCommit 1;
                    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
                    "radialBlur" ppEffectCommit 1;
                    addcamShake[random 3, 1, random 3];

                    player setstamina 50;

                    [player, "kka3_blunt_loop", false] remoteExec ["A3PL_Lib_SyncAnim", -2];

                    if (!_consumption) then {((_drugsarray select 0) select _forEachIndex) set [1,((_x select 1)-2)];};
                };

                default {};
            };
        };
    } forEach (_drugsarray select 0);
    player setvariable ["drugs_array",_drugsarray,true];

}, false] call Server_Setup_Compile;

['A3PL_Drugs_Use', {

    private ["_item"];
    _item = param [0,""];

    switch (_item) do
    {
        case ("beer"):
        {
            if (!isNil "Player_IsDrinking") exitwith {["Você já está bebendo alguma coisa",Color_Red] call A3PL_HUD_Notification;};
            Player_IsDrinking = true;
            [_item,-1] call Caue_Inventory_Add;
            [] spawn
            {
                player playAction "Gesture_drink";
                Player_Item attachTo [player, [-0.03,0,0.1], 'LeftHand'];
                Player_Item setVectorDirAndUp [[0,0,1],[1,0,0]];
                sleep 3;
                Player_Item setVectorDirAndUp [[0,-1,0],[1,0,0]];
                sleep 3;
                Player_Item setVectorDirAndUp [[0,0,1],[1,0,0]];
                sleep 4.5;
                [false] call Caue_Inventory_PutBack;
                Player_IsDrinking = nil;
                ["alcohol",3] call A3PL_Drugs_Add;

                Player_Thirst = Player_Thirst + 15;
                [] call Caue_Lib_VerifyThirst;

                if (Player_Thirst > 50) then { ThirstWarning1 = Nil; };
                if (Player_Thirst > 20) then { ThirstWarning2 = Nil; };
                if (Player_Thirst > 10) then { ThirstWarning3 = Nil; };
            };
        };
        case ("beer_gold"):
        {
            if (!isNil "Player_IsDrinking") exitwith {["Você já está bebendo alguma coisa",Color_Red] call A3PL_HUD_Notification;};
            Player_IsDrinking = true;
            [_item,-1] call Caue_Inventory_Add;
            [] spawn
            {
                player playAction "Gesture_drink";
                Player_Item attachTo [player, [-0.03,0,0.1], 'LeftHand'];
                Player_Item setVectorDirAndUp [[0,0,1],[1,0,0]];
                sleep 3;
                Player_Item setVectorDirAndUp [[0,-1,0],[1,0,0]];
                sleep 3;
                Player_Item setVectorDirAndUp [[0,0,1],[1,0,0]];
                sleep 4.5;
                [false] call Caue_Inventory_PutBack;
                Player_IsDrinking = nil;
                ["alcohol",6] call A3PL_Drugs_Add;

                Player_Thirst = Player_Thirst + 15;
                [] call Caue_Lib_VerifyThirst;

                if (Player_Thirst > 50) then { ThirstWarning1 = Nil; };
                if (Player_Thirst > 20) then { ThirstWarning2 = Nil; };
                if (Player_Thirst > 10) then { ThirstWarning3 = Nil; };
            };
        };
        case ("cocaine"): {["cocaine",10] call A3PL_Drugs_Add; [false] call Caue_Inventory_PutBack; [_item,-1] call Caue_Inventory_Add;};
        case ("shrooms"): {["shrooms",5] call A3PL_Drugs_Add; [false] call Caue_Inventory_PutBack; [_item,-1] call Caue_Inventory_Add;};
        case ("blunt"): {
            ["weed", 20] call A3PL_Drugs_Add; [false] call Caue_Inventory_PutBack; [_item,-1] call Caue_Inventory_Add;
        };
    };

}, false] call Server_Setup_Compile;
