Config_Intersect_NoNameNoFire = [
    ["GroundWeaponHolder","Items","\a3\ui_f\data\gui\cfg\Hints\gear_ca.paa"]
];
publicVariable "Config_Intersect_NoNameNoFire";

Config_Intersect_NoName = [
    ["RoadCone_F", "Cone", "\a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_toolbox_triggers_ca.paa"],
    ["plp_ct_WoodBoxLightMedium", "Abrir Caixa", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa"],
    ["Land_Sleeping_bag_folded_F", "Pegar Items", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa"],
    ["Land_Rope_01_F", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa"],
    ["plp_ct_WoodBoxLightBig", "Pegar Items", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa"],
    ["plp_ct_FootlockerBrown", "Acessar inventario virtual", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa"]
];
publicVariable "Config_Intersect_NoName";

Config_IntersectArray = [
    ["ladder_bank_bottom", "Subir Escada", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        ((typeOf player_objintersect) isEqualTo "Land_A3PL_Bank")
    }],
    ["ladder_bank_top", "Descer Escada", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        ((typeOf player_objintersect) isEqualTo "Land_A3PL_Bank")
    }],
    ["distillery_end", "Instalar Mangueira", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        ((count(nearestObjects[player_objintersect, ["A3PL_Distillery_Hose"], 2])) > 0) && ((count([player_objintersect] call A3PL_Lib_AttachedAll)) < 1)
    }],
    ["distillery_main", "Iniciar Destilaria", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        true
    }],
    ["distillery_main", "Checar Destilaria", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        (player_objintersect getVariable["running", false])
    }],
    ["distillery_main", "Adicionar Item a Destilaria", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        true
    }],
    ["item_Pickup", "Conectar Jarro na Mangueira", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((typeOf player_objintersect) == "A3PL_Distillery_Hose") && ((count([player_objIntersect] call A3PL_Lib_AttachedAll)) < 1)
    }],
    ["item_Pickup", "Moer trigo em fermento", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((typeOf player_objintersect) == "A3PL_Mixer")
    }],
    ["item_Pickup", "Moer trigo em malte", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((typeOf player_objintersect) == "A3PL_Mixer")
    }],
    ["item_Pickup", "Moer milho em fubá", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((typeOf player_objintersect) == "A3PL_Mixer")
    }],
    ["spine2", "Esfolar Animal", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        ((typeOf player_objintersect) IN["Sheep", "Sheep02", "Sheep03", "Goat", "Goat02", "Goat03", "WildBoar"]) && !alive player_objintersect
    }],
    ["hips", "Esfolar Animal", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        ((typeOf player_objintersect) IN["Sheep", "Sheep02", "Sheep03", "Goat", "Goat02", "Goat03", "WildBoar"]) && !alive player_objintersect
    }],
    ["spine", "Esfolar Animal", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        ((typeOf player_objintersect) IN["Sheep", "Sheep02", "Sheep03", "Goat", "Goat02", "Goat03", "WildBoar"]) && !alive player_objintersect
    }],
    ["head", "Esfolar Animal", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        ((typeOf player_objintersect) IN["Sheep", "Sheep02", "Sheep03", "Goat", "Goat02", "Goat03", "WildBoar"]) && !alive player_objintersect
    }],
    ["item_pickup", "Entiquetar Carne", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        (player_objintersect getVariable["class", "unknown"]) IN["meat_sheep", "meat_goat", "meat_boar", "mullet", "shark_2lb", "shark_4lb", "shark_5lb", "shark_7lb", "shark_10lb"]
    }],
    ["trunkinside", "Secar erva", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((typeOf player_objintersect) == "A3PL_WorkBench") && (player_itemClass == "cannabis_bud")
    }],
    ["item_pickup", "Checar status", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((typeOf player_objintersect) == "A3PL_Cannabis_Bud")
    }],
    ["item_Pickup", "Moer maconha", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((typeOf player_objintersect) == "A3PL_Mixer")
    }],
    ["item_Pickup", "Pegar maconha moída", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((typeOf player_objintersect) == "A3PL_Mixer")
    }],
    ["item_Pickup", "Ensacar maconha", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((typeOf player_objintersect) == "A3PL_Scale")
    }],
    ["item_Pickup", "Bolar Maconha", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((typeOf player_objintersect) == "A3PL_Scale")
    }],
    ["Toggle_Ramp", "Abaixar/Levantar Rampa de Carros", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objintersect isKindOf "A3PL_Car_Trailer"
    }],
    ["Bin_Controller1", "Virar Lixeira da Esquerda", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (player_objintersect animationSourcePhase "Bin1" == 0.1)
    }],
    ["Bin_Controller1", "Abaixar Lixeira da Esquerda", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (player_objintersect animationSourcePhase "Bin1" > 0.5)
    }],
    ["Bin_Controller1", "Virar Lixeira da Direita", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (player_objintersect animationSourcePhase "Bin2" == 0.1)
    }],
    ["Bin_Controller1", "Abaixar Lixeira da Direita", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (player_objintersect animationSourcePhase "Bin2" > 0.5)
    }],
    ["Bin_Controller2", "Virar Lixeira da Esquerda", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (player_objintersect animationSourcePhase "Bin1" == 0.1)
    }],
    ["Bin_Controller2", "Abaixar Lixeira da Esquerda", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (player_objintersect animationSourcePhase "Bin1" > 0.5)
    }],
    ["Bin_Controller2", "Virar Lixeira da Direita", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (player_objintersect animationSourcePhase "Bin2" == 0.1)
    }],
    ["Bin_Controller2", "Abaixar Lixeira da Direita", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (player_objintersect animationSourcePhase "Bin2" > 0.5)
    }],
    ["Lid", "Abrir Lixeira", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect animationPhase "Lid" < 0.5)
    }],
    ["Lid", "Colocar Lixeira no Caminhão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        [player_objintersect] call A3PL_Waste_CheckNear
    }],
    ["bin1", "Tirar Lixeira do Caminhão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (typeOf player_objintersect == "A3PL_P362_Garbage_Truck") && (player_objintersect animationSourcePhase "Bin1" == 0.1)
    }],
    ["bin2", "Tirar Lixeira do Caminhão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (typeOf player_objintersect == "A3PL_P362_Garbage_Truck") && (player_objintersect animationSourcePhase "Bin2" == 0.1)
    }],
    ["Lid", "Pegar Lixeira", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        typeOf player_objintersect == "A3PL_WheelieBin"
    }],
    ["Lid", "Fechar Lixeira", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect animationPhase "Lid" > 0.5)
    }],
    ["goose_floats", "Toggle Floats", "\a3\ui_f\data\IGUI\Cfg\Actions\autohover_ca.paa", {
        (vehicle player) isKindOf "A3PL_Goose_Base"
    }],
    ["goose_fuelpump", "Toggle Fuelpump", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\fuelwarning_ca.paa", {
        (vehicle player) isKindOf "A3PL_Goose_Base"
    }],
    ["goose_gear", "Toggle Fuelpump", "\a3\ui_f\data\IGUI\Cfg\Actions\autohover_ca.paa", {
        (vehicle player) isKindOf "A3PL_Goose_Base"
    }],
    ["goose_bat", "Toggle Battery", "\a3\ui_f\data\IGUI\Cfg\Actions\ico_cpt_batt_on_ca", {
        (vehicle player) isKindOf "A3PL_Goose_Base"
    }],
    ["goose_flaps", "Adjust Flaps Upward", "\a3\ui_f\data\IGUI\Cfg\Actions\flapsretract_ca.paa", {
        (vehicle player) isKindOf "A3PL_Goose_Base"
    }],
    ["goose_flaps", "Adjust Flaps Downward", "\a3\ui_f\data\IGUI\Cfg\Actions\flapsextend_ca.paa", {
        (vehicle player) isKindOf "A3PL_Goose_Base"
    }],
    ["goose_gen", "Switch Generator", "\a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa", {
        (vehicle player) isKindOf "A3PL_Goose_Base"
    }],
    ["goose_ign", "Switch Ignition/Starter", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\igui_wlight_eng_ca.paa", {
        (vehicle player) isKindOf "A3PL_Goose_Base"
    }],
    ["lightswitch", "Alternar Faróis Dianteiros", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        (vehicle player) isKindOf "A3PL_Goose_Base"
    }],
    ["collision_lights", "Toggle Collision Lights", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_col_ON_ca.paa", {
        (vehicle player) isKindOf "A3PL_Goose_Base"
    }],
    ["C172_fuelpump", "Toggle Fuelpump", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\fuelwarning_ca.paa", {
        (vehicle player) isKindOf "A3PL_Cessna172"
    }],
    ["C172_batteries", "Toggle Battery", "\a3\ui_f\data\IGUI\Cfg\Actions\ico_cpt_batt_on_ca", {
        (vehicle player) isKindOf "A3PL_Cessna172"
    }],
    ["Switch_C172_Flaps", "Adjust Flaps Upward", "\a3\ui_f\data\IGUI\Cfg\Actions\flapsretract_ca.paa", {
        (vehicle player) isKindOf "A3PL_Cessna172"
    }],
    ["Switch_C172_Flaps", "Adjust Flaps Downward", "\a3\ui_f\data\IGUI\Cfg\Actions\flapsextend_ca.paa", {
        (vehicle player) isKindOf "A3PL_Cessna172"
    }],
    ["C172_Ignition", "Switch Ignition/Starter", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\igui_wlight_eng_ca.paa", {
        (vehicle player) isKindOf "A3PL_Cessna172"
    }],
    ["lightswitch", "Alternar Faróis Dianteiros", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        (vehicle player) isKindOf "A3PL_Cessna172"
    }],
    ["collision_lights", "Toggle Collision Lights", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_col_ON_ca.paa", {
        (vehicle player) isKindOf "A3PL_Cessna172"
    }],
    ["switch_radio_atc", "Alternar o Rádio ATC", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_ATC_ON_ca.paa", {
        (vehicle player) isKindOf "A3PL_Cessna172"
    }],
    ["switch_starter", "Alternar Starter (Motor 1)", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_start_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_starter", "Alternar Starter (Motor 2)", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_start_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_throttle", "Fechar Acelerador (Motor 1)", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_thtl_OFF_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_throttle2", "Fechar Acelerador (Motor 2)", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_thtl_OFF_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_radio_atc", "Alternar o Rádio ATC", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_ATC_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_batteries", "Alternar Baterias", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_batt_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["Interior_Lights", "Cockpit Lights", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_col_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["Searchlight_Switch", "Alternar Holofotes", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_land_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_lightsac", "Toggle Collision Lights", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_col_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_lightsldg", "Alternar Faróis Dianteiros", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_land_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_rotor_brake", "Alternar Freio Rotor", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_brk_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_starter_2", "Alternar Starter (Motor 1)", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_start_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_starter_2", "Alternar Starter (Motor 2)", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_start_ON_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_throttle_2", "Fechar Acelerador (Motor 1)", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_thtl_OFF_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["switch_throttle2_2", "Fechar Acelerador (Motor 2)", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_thtl_OFF_ca.paa", {
        (vehicle player) isKindOf "Heli_Medium01_Base_H"
    }],
    ["item_pickup", "Juntar Cone", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (typeOf player_objintersect IN["A3PL_RoadCone", "A3PL_RoadCone_x10"])
    }],
    ["Pilot_Door", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        (player_objintersect isKindOf "Air") && (vehicle player == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Pilot_Door", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Pilot_Door", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Pilot_Door", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Pilot_Door", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Pilot_Door", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["CoPilot_Door", "Entrar Como Co-Piloto", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        (player_objintersect isKindOf "Air") && (vehicle player == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["CoPilot_Door", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["CoPilot_Door", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["CoPilot_Door", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["CoPilot_Door", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["CoPilot_Door", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["inspect_hitengine1", "Inspecionar Motor #1", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!("inspect_hitengine1"
            IN(player_objIntersect getVariable "Inspection"))) && (player_objintersect animationSourcePhase "Inspect_Panel1_1" > 0.5)
    }],
    ["inspect_hitengine2", "Inspecionar Motor #2", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!("inspect_hitengine2"
            IN(player_objIntersect getVariable "Inspection"))) && (player_objintersect animationSourcePhase "Inspect_Panel2_1" > 0.5)
    }],
    ["inspect_hithrotor1", "Inspecionar Rotor Principal #1", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hithrotor1"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hithrotor2", "Inspecionar Rotor Principal #2", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hithrotor2"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hithrotor3", "Inspecionar Rotor Principal #3", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hithrotor3"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hithrotor4", "Inspecionar Rotor Principal #4", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hithrotor4"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitvrotor1", "Inspecionar Rotor de Cauda #1", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitvrotor1"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitvrotor2", "Inspecionar Rotor de Cauda #2", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitvrotor2"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitvrotor3", "Inspecionar Rotor de Cauda Central", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitvrotor3"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hittransmission1", "Inspecionar Transmissão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hittransmission1"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitfuel1", "Inspecionar Combustível", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitfuel1"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitgear1", "Inspecionar Engrenagem #1", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitgear1"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitgear2", "Inspecionar Engrenagem #2", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitgear2"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitgear3", "Inspecionar Engrenagem #3", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitgear3"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitgear4", "Inspecionar Engrenagem #4", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitgear4"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hithstabilizerl11", "Inspecionar Estabilizador Horizontal #1", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hithstabilizerl11"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hithstabilizerr11", "Inspecionar Estabilizador Horizontal #2", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hithstabilizerr11"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitlight1", "Inspecionar Luzes de Pouso", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitlight1"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitpitottube1", "Inspecionar Tubo Pitot #1", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitpitottube1"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitpitottube2", "Inspecionar Tubo Pitot #2", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitpitottube2"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitstaticport1", "Inspecionar Porta Estática #1", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitstaticport1"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitstaticport2", "Inspecionar Porta Estática #2", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitstaticport2"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_hitvstabilizer11", "Inspecionar Estabilizador Vertical", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_hitvstabilizer11"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_intake1", "Inspect Intake #1", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_intake1"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["inspect_intake2", "Inspect Intake #2", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!("inspect_intake2"
            IN(player_objIntersect getVariable "Inspection"))
    }],
    ["hatchl", "Toggle Left Engine Hatch", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!(player_objIntersect getVariable["locked", true]))
    }],
    ["hatchr", "Toggle Right Engine Hatch", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!(player_objIntersect getVariable["locked", true]))
    }],
    ["button_bargate2", "Abrir/Fechar Portão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["button_bargate1", "Abrir/Fechar Portão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Virtual_Storage", "Access virtual storage", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Body", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Repair", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["collision_lights", "Toggle Collision Lights", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_col_ON_ca.paa", {
        true
    }],
    ["ignition", "Ignição", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\igui_wlight_eng_ca.paa", {
        (vehicle player) isKindOf "AllVehicles"
    }],
    ["lightswitch", "Alternar Faróis Dianteiros", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        (vehicle player != player)
    }],
    ["collision_lights2", "Toggle Collision Lights", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_col_ON_ca.paa", {
        true
    }],
    ["ignition2", "Ignição", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\igui_wlight_eng_ca.paa", {
        (vehicle player) isKindOf "AllVehicles"
    }],
    ["lightswitch2", "Alternar Faróis Dianteiros", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        (vehicle player != player)
    }],
    ["collision_lights3", "Toggle Collision Lights", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_col_ON_ca.paa", {
        true
    }],
    ["ignition3", "Ignição", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\igui_wlight_eng_ca.paa", {
        (vehicle player) isKindOf "AllVehicles"
    }],
    ["lightswitch3", "Alternar Faróis Dianteiros", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        (vehicle player != player)
    }],
    ["collision_lights4", "Toggle Collision Lights", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_col_ON_ca.paa", {
        true
    }],
    ["ignition4", "Ignição", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\igui_wlight_eng_ca.paa", {
        (vehicle player) isKindOf "AllVehicles"
    }],
    ["lightswitch4", "Alternar Faróis Dianteiros", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        (vehicle player != player)
    }],
    ["Door_RF", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        (player_objintersect isKindOf "Air") && (vehicle player == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF", "Entrar Como Co-Piloto", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        (player_objintersect isKindOf "Air") && (vehicle player == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["ship_driver", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["ship_driver", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["ship_passenger", "Entrar Como Passageiro", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["ship_passenger", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["lever_drillarm", "Recolher/Estender Braço de Broca", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["lever_drill", "Recolher/Estender Broca", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["pumpjack_connect", "Start Jack Pump", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["ski", "Attach/Detach Rope", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        typeOf player_objintersect == "A3PL_Ski_Base"
    }],
    ["ski", "Pickup Ski", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        typeOf player_objintersect == "A3PL_Ski_Base"
    }],
    ["spine3", "Dar Multa", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        (player_ItemClass == "ticket") && (isPlayer player_objintersect)
    }],
    ["spine3", "Falar com Atendente McFishers", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_mc1,npc_mc2,npc_mc3,npc_mc4]
    }],
    ["spine3", "Pegar Uniforme McFishers", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_mc1,npc_mc2,npc_mc3,npc_mc4]
    }],
    ["spine3", "Falar com Pescador", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_fisher
    }],
    ["spine3", "Falar com o Policial", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_police1,npc_police2,npc_police3]
    }],
    ["spine3", "Falar com Medico", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_emt1,npc_emt2,npc_emt3,npc_emt4,npc_emt5]
    }],
    ["spine3", "Falar com Atendente do Banco", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_bank1,npc_bank2,npc_bank3,npc_bank4,npc_bank5]
    }],
    ["spine3", "Acessar Conta da Facção", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        (player_objintersect IN [npc_bank1,npc_bank2,npc_bank3,npc_bank4,npc_bank5]) && ([(player getVariable ["faction","citizen"])] call Caue_FactionSetup_IsLeader)
    }],
    ["spine3", "Falar com o Mecanico", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_roadworker
    }],
    ["spine3", "Falar com Fazendeiro", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_farmer,npc_farmerjail]
    }],
    ["spine3", "Falar com Recuperador de Petroleo", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_oilrecovery
    }],
    ["spine3", "Falar com FAA 1", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_faastart
    }],
    ["spine3", "Falar com FAA 2", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_faastop
    }],
    ["spine3", "Falar com Atendente Taco Hell", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_taco1,npc_taco2,npc_taco3,npc_taco4]
    }],
    ["spine3", "Pegar Uniforme Taco Hell", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_taco1,npc_taco2,npc_taco3,npc_taco4]
    }],
    ["spine3", "Falar com Traficante", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_drugsdealer
    }],
    ["spine3", "Falar com Mercado Negro", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_blackmarket
    }],
    ["spine3", "Falar com Vendedor de Armas", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_guns, npc_guns_1]
    }],
    ["spine3", "Falar com Atendente do Mercado", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_market1,npc_market2,npc_market3]
    }],
    ["spine3", "Falar com Atendente da Prefeitura", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[npc_government, npc_government_1, npc_government_2]
    }],
    ["spine3", "Falar com NPC DOJ", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_doj_supplier, npc_doj_supplier_1, npc_doj_pris]
    }],
    ["spine3", "Falar com NPC DMV", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_dmv1,npc_dmv2]
    }],
    ["spine3", "Falar com Caçador", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_hunting
    }],
    ["spine3", "Abrir Importação/Exportação", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_import
    }],
    ["spine3", "Lavar Dinheiro Sujo", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_moneylaunderer
    }],
    ["spine3", "Acessar Indústria Química", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_chemicalplant
    }],
    ["spine3", "Acessar Siderúrgica", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_steelmill
    }],
    ["spine3", "Acessar Refinaria de Oleo", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_oilrefinery
    }],
    ["spine3", "Fabrica de Armas", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_weaponfactory
    }],
    ["spine3", "Fabrica de Alimentos", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_foodprocessing
    }],
    ["spine3", "Fabrica de Mercadorias", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_goodsfactory
    }],
    ["spine3", "Fabrica de Veiculos", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_vehiclefactory
    }],
    ["spine3", "Fabrica de Veiculos Facção", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_factionvehicle
    }],
    ["spine3", "Fabrica de Barcos", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_marinefactory
    }],
    ["spine3", "Fabrica de Aeronaves", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_aircraftfactory
    }],
    ["spine3", "Fabrica de Peças de Veiculos", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_carpartfactory
    }],
    ["spine3", "Loja de Roupas", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_clothing1,npc_clothing2,npc_clothing3]
    }],
    ["spine3", "Acessar Loja de Moveis", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_furniture1,npc_furniture2,npc_furniture3]
    }],
    ["spine3", "Acessar Loja Geral", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_general1,npc_general2,npc_general3]
    }],
    ["spine3", "Acessar Loja de Paintball", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[npc_pinhead]
    }],
    ["spine3", "Acessar Loja de Bebidas", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_MoonshineWilly]
    }],
    ["spine3", "Acessar Loja do Lenhador", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_Hemlock]
    }],
    ["spine3", "Inciar/Parar Trabalhar como Lixeiro", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_WasteManagement]
    }],
    ["spine3", "Inciar/Parar Trabalhar como Entregador", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[npc_mailman]
    }],
    ["spine3", "Inciar/Parar Trabalhar como Exterminador", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_Exterminator]
    }],
    ["spine3", "Inciar/Parar Alugar Kart", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_Karts]
    }],
    ["spine3", "Acessar Loja do Minerador", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_MiningMike]
    }],
    ["spine3", "Comprar mapa de mineração de ferro ($500)", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_MiningMike]
    }],
    ["spine3", "Comprar mapa de mineração de carvão ($500)", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_MiningMike]
    }],
    ["spine3", "Comprar mapa de mineração de aluminio ($500)", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_MiningMike]
    }],
    ["spine3", "Comprar mapa de mineração de enxofre ($500)", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_MiningMike]
    }],
    ["spine3", "Comprar mapa de mineração de petróleo ($1000)", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_MiningMike]
    }],
    ["spine3", "Acessar Loja de Equipamentos", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_hardware_1]
    }],
    ["spine3", "Acessar Loja de Sementes", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [NPC_Seed_Store]
    }],
    ["spine3", "Acessar Loja de Joias", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN[NPC_gemshop]
    }],
    ["spine3", "Equipamentos EMS", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_ems_equipments1,npc_ems_equipments2,npc_ems_equipments3,npc_ems_equipments4,npc_ems_equipments5]
    }],
    ["spine3", "Roupas EMS", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_ems_equipments1,npc_ems_equipments2,npc_ems_equipments3,npc_ems_equipments4,npc_ems_equipments5]
    }],
    ["spine3", "Loja de Bombeiros", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_fifr_equipments1,npc_fifr_equipments2,npc_fifr_equipments3,npc_fifr_equipments4]
    }],
    ["carInfo", "Veiculos EMS", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objintersect IN [npc_ems_vehicles1,npc_ems_vehicles2,npc_ems_vehicles3]
    }],
    ["spine3", "Equipamentos SD", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_sd_equipments1,npc_sd_equipments2,npc_sd_equipments3]
    }],
    ["spine3", "Roupas SD", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_sd_equipments1,npc_sd_equipments2,npc_sd_equipments3]
    }],
    ["carInfo", "Veiculos SD", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objintersect IN [npc_sd_vehicles1,npc_sd_vehicles2,npc_sd_vehicles3]
    }],
    ["spine3", "Acessar Loja de Veiculos", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == NPC_vehicles_1
    }],
    ["spine3", "Loja de Equipamentos FAA", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == npc_faa_supplier
    }],
    ["spine3", "Veiculos FAA", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == NPC_faa_vehicles
    }],
    ["spine3", "Loja de Equipamentos DOJ", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [NPC_doj_supplier, NPC_doj_supplier_1, npc_doj_pris]
    }],
    ["spine3", "Loja de Equipamentos DMV", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [npc_dmv1,npc_dmv2]
    }],
    ["spine3", "Veiculos DMV", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [NPC_dmv_veh, NPC_dmv_veh_1]
    }],
    ["spine3", "Veiculos DOJ", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect IN [NPC_dmv_veh, NPC_dmv_veh_1]
    }],
    ["spine3", "Loja de Equipamentos USCG", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == NPC_uscg_supplier
    }],
    ["spine3", "Veiculos USCG Carros", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == NPC_uscg_vehicles
    }],
    ["carInfo", "Veiculos USCG Barcos", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == NPC_uscg_boats
    }],
    ["spine3", "Veiculos USCG Aeronaves", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        player_objintersect == NPC_uscg_aircraft
    }],
    ["pilecash", "Roubar Dinheiro", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_bankvault", "Conectar Furadeira", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        backpack player == "A3PL_Backpack_Drill"
    }],
    ["Door_bankvault", "Fechar Cofre", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player getVariable["job", "unemployed"]) == "police"
    }],
    ["drill_bit_install", "Instalar Broca", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_ItemClass == "drill_bit"
    }],
    ["drill_handle", "Ligar Furadeira", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["drill_handle", "Remover Furadeira", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_1", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_2", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_3", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_4", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_5", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_6", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_7", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_8", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_9", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_10", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_11", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_12", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_13", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_14", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_15", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_16", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_17", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_18", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_19", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deposit_20", "Abrir Caixa de Depósito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["dogcage", "Abrir Menu K-9", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player getVariable["job", "unemployed"] IN ["police"]
    }],
    ["mcfishergrill", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["mcfishergrill", "Checar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["mcfishergrill", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["mcfishergrill", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["mcfishertable", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["mcFishersTable1", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["mcFishersTable2", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["mcfishergrill", "Colocar Hamburger", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["mcFishersGrill1", "Colocar Hamburger", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["mcFishersGrill2", "Colocar Hamburger", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["net", "Comprar/Vender Rede", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["stock", -1]) == -1)
    }],
    ["buoy", "Coletar Rede", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["fishstate", -1]) == -1)
    }],
    ["buoy", "Soltar Rede", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (simulationEnabled player_objIntersect) && ((player_objintersect getVariable["fishstate", -1]) == -1)
    }],
    ["buoy", "Colocar Isca Na Rede", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (simulationEnabled player_objIntersect) && ((player_objintersect getVariable["fishstate", -1]) > -1)
    }],
    ["bucket", "Comprar/Vender Balde", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["stock", -1]) == -1)
    }],
    ["farmingplant", "Colher Planta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["plant_cannabis", "Colher Planta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["lettuce", "Colher Planta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objintersect getVariable["growState", -1] != -1
    }],
    ["EstateSign", "Comprar Casa", "\a3\ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa", {
        ((getObjectTextures player_objIntersect) select 0) isEqualTo "a3pl_objects\street\estate_sign\house_sale_co.paa"
    }],
    ["EstateSign", "Vender Casa", "\a3\ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa", {
        ((getObjectTextures player_objIntersect) select 0) isEqualTo "a3pl_objects\street\estate_sign\house_rented_co.paa"
    }],
    ["greenhousesign", "Alugar Estufa", "\a3\ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa", {
        true
    }],
    ["sign_business", "Alugar Negócio", "\a3\ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa", {
        true
    }],
    ["fd_hoseend", "Conectar Mangueira Enrolada", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_ItemClass == "FD_hose") && (typeOf player_objintersect == "A3PL_FD_HoseEnd1_Float")
    }],
    ["fd_hoseend", "Conectar Mangueira ao Adaptador", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"]) && (typeOf player_objintersect == "A3PL_FD_HoseEnd1_Float")
    }],
    ["fd_hoseend", "Conectar Mangueira ao Adaptador", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"]) && (typeOf player_objintersect IN["A3PL_FD_HoseEnd1"])
    }],
    ["fd_hoseend", "Segurar Adaptador de Mangueira", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (typeOf player_objintersect IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"])
    }],
    ["fd_hoseend", "Enrolar Mangueira", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (typeOf player_objintersect IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"])
    }],
    ["fd_yadapter_in", "Conectar Mangueira à Entrada", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (typeOf player_objintersect == "A3PL_FD_yAdapter") && ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"])
    }],
    ["fd_yadapter_out1", "Conectar Mangueira à Entrada", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (typeOf player_objintersect == "A3PL_FD_yAdapter") && ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"])
    }],
    ["fd_yadapter_out2", "Conectar Mangueira à Saída", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (typeOf player_objintersect == "A3PL_FD_yAdapter") && ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"])
    }],
    ["outlet_4", "Conectar Mangueira ao Tanque", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"]) && (typeOf player_objintersect == "A3PL_Tanker_Trailer")
    }],
    ["outlet_3", "Conectar Mangueira ao Tanque", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"]) && (typeOf player_objintersect == "A3PL_Tanker_Trailer")
    }],
    ["outlet_2", "Conectar Mangueira ao Tanque", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"]) && (typeOf player_objintersect == "A3PL_Tanker_Trailer")
    }],
    ["outlet_1", "Conectar Mangueira ao Tanque", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"]) && (typeOf player_objintersect == "A3PL_Tanker_Trailer")
    }],
    ["outlet_1", "Conectar Mangueira ao Tanque", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"]) && (typeOf player_objintersect == "A3PL_Fuel_Van")
    }],
    ["gas_hoseconnect", "Conectar Adaptador de Mangueira", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_ItemClass == "FD_adapter") && (typeOf player_objintersect == "Land_A3PL_Gas_Station")
    }],
    ["gas_hoseswitch", "Switch Gas Storage Switch", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["hydrant_connect", "Conectar Adaptador de Mangueira", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_ItemClass == "FD_adapter") && (typeOf player_objintersect == "Land_A3PL_FireHydrant")
    }],
    ["hydrant_wrench", "Conectar Chave de Hidrante", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_ItemClass == "FD_hydrantwrench") && (typeOf player_objintersect == "Land_A3PL_FireHydrant")
    }],
    ["hydrantwrench", "Abrir Hidrante", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (typeOf player_objintersect == "A3PL_FD_HydrantWrench_F") && (player_objintersect animationSourcePhase "WrenchRotation" < 0.5)
    }],
    ["hydrantwrench", "Fechar Hidrante", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (typeOf player_objintersect == "A3PL_FD_HydrantWrench_F") && (player_objintersect animationSourcePhase "WrenchRotation" > 0.5)
    }],
    ["inlet_r", "Connect Hose To Ladder Inlet", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"])
    }],
    ["inlet_ds", "Connect Hose To Engine Inlet", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"])
    }],
    ["ft_lever_11", "Open/Close Discharge", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["ft_lever_10", "Open/Close Discharge", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["ft_lever_8", "Open/Close Discharge", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["ft_lever_7", "Open/Close Discharge", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["ft_lever_1", "Open/Close Discharge", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["outlet_ps", "Connect Hose To Engine Discharge", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"])
    }],
    ["outlet_ds", "Connect Hose To Engine Discharge", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"])
    }],
    ["burger", "Criar Hambúrguer De Peixe", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        _burgers = nearestObjects[player_objIntersect, ["A3PL_Burger_Bun"], 1];
        (count _burgers) > 0
    }],
    ["tacoshell", "Criar Taco De Peixe", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        _burgers = nearestObjects[player_objIntersect, ["A3PL_Fish_Raw", "A3PL_Fish_Cooked", "A3PL_Fish_Burned"], 1];
        _salads = nearestObjects[player_objIntersect, ["A3PL_Salad"], 1];
        ((count _burgers) > 0) && ((count _salads) > 0)
    }],
    ["burgerbread", "Criar Hambúrguer De Peixe", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        _burgers = nearestObjects[player_objIntersect, ["A3PL_Burger_Raw", "A3PL_Burger_Cooked", "A3PL_Burger_Burnt"], 1];
        (count _burgers) > 0
    }],
    ["clothes", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!(isNil {
            player_objIntersect getVariable "stock"
        }))
    }],
    ["handcuffs", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["handcuffs", "Checar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["handcuffs", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["handcuffs", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["wrench", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!(isNil {
            player_objIntersect getVariable "stock"
        }))
    }],
    ["carInfo", "Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!isNil {
            player_objIntersect getVariable "positionSpawn"
        }
    }],
    ["carInfo", "Guardar Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!isNil {
            player_objIntersect getVariable "positionSpawn"
        }
    }],
    ["carInfo", "Pintar Aeronave", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objIntersect IN [AircraftPaint1,AircraftPaint2]
    }],
    ["carInfo", "Guardar Aeronave", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objIntersect IN [AircraftStore1,AircraftStore2]
    }],
    ["Door_8_button1", "Abrir/Fechar Sala Réu", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" == "police"
    }],
    ["Door_8_button2", "Abrir/Fechar Sala Réu", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" == "police"
    }],
    ["treasurysettings", "Abrir Tesouraria", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["jailDoor_1", "Abrir/Fechar Porta Prisão", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" == "police"
    }],
    ["jailDoor_2", "Abrir/Fechar Porta Prisão", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" == "police"
    }],
    ["jailDoor_3", "Abrir/Fechar Porta Prisão", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" == "police"
    }],
    ["Door_1_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_1_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_2_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_2_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_3_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_3_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_4_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_4_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_5_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_5_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_6_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_6_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_7_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_7_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_8_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_8_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_9_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_9_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_10_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_10_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_11_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_11_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_12_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_12_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_13_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_13_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_14_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_14_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_15_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_15_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_16_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_16_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_22_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_22_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_23_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_23_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_24_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_25_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["Door_26_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        player getVariable "job" in ["police"]
    }],
    ["garageDoor_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", false])
    }],
    ["garageDoor_button2", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", false])
    }],
    ["garageDoor_1_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", false])
    }],
    ["garageDoor_1_source", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", false])
    }],
    ["garageDoor_2_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", false])
    }],
    ["garageDoor1_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", false])
    }],
    ["garageDoor2_button", "Usar Botão Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", false])
    }],
    ["garageDoor_button", "Retirar Veiculo da Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f") && !((typeOf player_objintersect) IN ["Land_A3PL_Sheriffpd"])
    }],
    ["garageDoor_button2", "Retirar Veiculo da Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f") && !((typeOf player_objintersect) IN ["Land_A3PL_Sheriffpd"])
    }],
    ["garageDoor_1_button", "Retirar Veiculo da Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f")
    }],
    ["garageDoor_1_source", "Retirar Veiculo da Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f")
    }],
    ["garageDoor_2_button", "Retirar Veiculo da Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f")
    }],
    ["garageDoor1_button", "Retirar Veiculo da Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f")
    }],
    ["garageDoor2_button", "Retirar Veiculo da Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f")
    }],
    ["garageDoor_button", "Guardar Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f") && !((typeOf player_objintersect) IN ["Land_A3PL_Sheriffpd"])
    }],
    ["garageDoor_button2", "Guardar Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f") && !((typeOf player_objintersect) IN ["Land_A3PL_Sheriffpd"])
    }],
    ["garageDoor_1_button", "Guardar Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f")
    }],
    ["garageDoor_1_source", "Guardar Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f")
    }],
    ["garageDoor_2_button", "Guardar Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f")
    }],
    ["garageDoor1_button", "Guardar Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f")
    }],
    ["garageDoor2_button", "Guardar Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["locked", false])) && (player_objintersect isKindOf "House_f")
    }],
    ["console_cell1", "Abrir Cela 1", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell2", "Abrir Cela 2", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell3", "Abrir Cela 3", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell4", "Abrir Cela 4", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell5", "Abrir Cela 5", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell6", "Abrir Cela 6", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell7", "Abrir Cela 7", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell8", "Abrir Cela 8", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell9", "Abrir Cela 9", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell10", "Abrir Cela 10", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell11", "Abrir Cela 11", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell12", "Abrir Cela 12", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell13", "Abrir Cela 13", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_cell14", "Abrir Cela 14", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_maincell1", "Abrir Cela Principal 1", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_maincell2", "Abrir Cela Principal 2", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_maincell3", "Abrir Cela Cozinha", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_garage", "Abrir Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["console_lockdown", "LOCKDOWN!", "\a3\ui_f\data\IGUI\Cfg\Actions\ico_cpt_col_ON_ca.paa", {
        true
    }],
    ["StorageDoor1", "Garagem", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        player_objIntersect animationSourcePhase "StorageDoor" < 0.1
    }],
    ["StorageDoor2", "Garagem", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        player_objIntersect animationSourcePhase "StorageDoor" < 0.1
    }],
    ["StorageDoor3", "Garagem", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        player_objIntersect animationSourcePhase "StorageDoor" < 0.1
    }],
    ["StorageDoor1", "Guardar Veiculo", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        player_objIntersect animationSourcePhase "StorageDoor" < 0.1
    }],
    ["StorageDoor2", "Guardar Veiculo", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        player_objIntersect animationSourcePhase "StorageDoor" < 0.1
    }],
    ["StorageDoor3", "Guardar Veiculo", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        player_objIntersect animationSourcePhase "StorageDoor" < 0.1
    }],
    ["SDStorageDoor3", "Garagem", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        player_objIntersect animationSourcePhase "StorageDoor" < 0.1
    }],
    ["SDStorageDoor6", "Garagem", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        player_objIntersect animationSourcePhase "StorageDoor" < 0.1
    }],
    ["SDStorageDoor3", "Guardar Veiculo", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        player_objIntersect animationSourcePhase "StorageDoor" < 0.1
    }],
    ["SDStorageDoor6", "Guardar Veiculo", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        player_objIntersect animationSourcePhase "StorageDoor" < 0.1
    }],
    ["door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["door0_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["apt1_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_1_locked", false])
    }],
    ["apt2_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_2_locked", false])
    }],
    ["apt3_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_3_locked", false])
    }],
    ["apt4_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_4_locked", false])
    }],
    ["apt5_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_5_locked", false])
    }],
    ["apt6_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_6_locked", false])
    }],
    ["apt7_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_7_locked", false])
    }],
    ["apt8_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_8_locked", false])
    }],
    ["apt9_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_9_locked", false])
    }],
    ["apt10_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_10_locked", false])
    }],
    ["apt11_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_11_locked", false])
    }],
    ["apt12_door0", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_12_locked", false])
    }],
    ["gas_openmenu", "Pagar Pelo Combustivel", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["gas_openmenu", "Abrir Menu do Posto", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["garage1_open", "Abrir Portas Concessionária", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (typeOf player_objintersect) == "Land_A3PL_Showroom"
    }],
    ["garage1_close", "Fechar Portas Concessionária", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (typeOf player_objintersect) == "Land_A3PL_Showroom"
    }],
    ["garage2_open", "Abrir Portas Concessionária", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (typeOf player_objintersect) == "Land_A3PL_Showroom"
    }],
    ["garage2_close", "Fechar Portas Concessionária", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (typeOf player_objintersect) == "Land_A3PL_Showroom"
    }],
    ["Door_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (!(player_objIntersect getVariable["Door_1_locked", false]) && !((typeOf player_objIntersect) IN ["A3PL_Police_Locker"]))
    }],
    ["Door_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_2_locked", false])
    }],
    ["Door_3", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_3_locked", false])
    }],
    ["Door_4", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_4_locked", false])
    }],
    ["Door_5", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_5_locked", false])
    }],
    ["Door_6", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_6_locked", false])
    }],
    ["Door_7", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_7_locked", false])
    }],
    ["Door_8", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_8_locked", false])
    }],
    ["Door_9", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_9_locked", false])
    }],
    ["Door_10", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_10_locked", false])
    }],
    ["Door_11", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_11_locked", false])
    }],
    ["Door_12", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_12_locked", false])
    }],
    ["Door_13", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_13_locked", false])
    }],
    ["Door_14", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_14_locked", false])
    }],
    ["Door_15", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_15_locked", false])
    }],
    ["Door_16", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_16_locked", false])
    }],
    ["Door_17", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_17_locked", false])
    }],
    ["Door_18", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_18_locked", false])
    }],
    ["Door_19", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_19_locked", false])
    }],
    ["Door_20", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_20_locked", false])
    }],
    ["Door_21", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_21_locked", false])
    }],
    ["Door_22", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_22_locked", false])
    }],
    ["Door_23", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_22_locked", false])
    }],
    ["Door_24", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_24_locked", false])
    }],
    ["Door_25", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_25_locked", false])
    }],
    ["Door_26", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_26_locked", false])
    }],
    ["Door_27", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_27_locked", false])
    }],
    ["Door_28", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_28_locked", false])
    }],
    ["Door_29", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_29_locked", false])
    }],
    ["Door_30", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_30_locked", false])
    }],
    ["Door_31", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_31_locked", false])
    }],
    ["Door_32", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_32_locked", false])
    }],
    ["Door_33", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_33_locked", false])
    }],
    ["Door_34", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_34_locked", false])
    }],
    ["Door_35", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_35_locked", false])
    }],
    ["Door_36", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_36_locked", false])
    }],
    ["Door_37", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_37_locked", false])
    }],
    ["Door_38", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_38_locked", false])
    }],
    ["Door_39", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_39_locked", false])
    }],
    ["Door_40", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_40_locked", false])
    }],
    ["Door_41", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_41_locked", false])
    }],
    ["Door_42", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_42_locked", false])
    }],
    ["Door_43", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_43_locked", false])
    }],
    ["Door_44", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_44_locked", false])
    }],
    ["Door_45", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_45_locked", false])
    }],
    ["Door_46", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_46_locked", false])
    }],
    ["Door_47", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_47_locked", false])
    }],
    ["Door_48", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_48_locked", false])
    }],
    ["Door_49", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_49_locked", false])
    }],
    ["Door_50", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["Door_50_locked", false])
    }],
    ["Door_1", "Trancar/Destrancar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (typeOf([] call Caue_Intersect_CursorTarget)) IN["Land_A3PL_Ranch3", "Land_A3PL_Ranch2", "Land_A3PL_Ranch1", "Land_Mansion01", "Land_A3PL_Greenhouse", "Land_Home1g_DED_Home1g_01_F", "Land_Home2b_DED_Home2b_01_F", "Land_Home3r_DED_Home3r_01_F", "Land_Home4w_DED_Home4w_01_F", "Land_Home5y_DED_Home5y_01_F", "Land_Home6b_DED_Home6b_01_F", "Land_A3PL_Shed2", "Land_A3PL_Shed3", "Land_A3PL_Shed4", "Land_A3PL_BostonHouse"]
    }],
    ["Door_2", "Trancar/Destrancar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (typeOf([] call Caue_Intersect_CursorTarget)) IN["Land_A3PL_Ranch3", "Land_A3PL_Ranch2", "Land_A3PL_Ranch1", "Land_A3PL_Greenhouse", "Land_Home1g_DED_Home1g_01_F", "Land_Home2b_DED_Home2b_01_F", "Land_Home3r_DED_Home3r_01_F", "Land_Home4w_DED_Home4w_01_F", "Land_Home5y_DED_Home5y_01_F", "Land_Home6b_DED_Home6b_01_F", "Land_A3PL_Shed3", "Land_A3PL_Shed4"]
    }],
    ["Door_3", "Trancar/Destrancar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (typeOf([] call Caue_Intersect_CursorTarget)) IN["Land_Home1g_DED_Home1g_01_F", "Land_Home2b_DED_Home2b_01_F", "Land_Home3r_DED_Home3r_01_F", "Land_Home4w_DED_Home4w_01_F", "Land_Home5y_DED_Home5y_01_F", "Land_Home6b_DED_Home6b_01_F"]
    }],
    ["Door_4", "Trancar/Destrancar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (typeOf([] call Caue_Intersect_CursorTarget)) IN[]
    }],
    ["Door_5", "Trancar/Destrancar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (typeOf([] call Caue_Intersect_CursorTarget)) IN[]
    }],
    ["Door_6", "Trancar/Destrancar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (typeOf([] call Caue_Intersect_CursorTarget)) IN[]
    }],
    ["Door_7", "Trancar/Destrancar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (typeOf([] call Caue_Intersect_CursorTarget)) IN[]
    }],
    ["Door_8", "Trancar/Destrancar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (typeOf([] call Caue_Intersect_CursorTarget)) IN["Land_Mansion01"]
    }],
    ["Door_1", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        !((typeOf player_objIntersect) IN ["A3PL_Police_Locker"])
    }],
    ["Door_2", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_3", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_4", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_5", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_6", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_7", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_8", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_9", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_10", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_11", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_12", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_13", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_14", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_15", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_16", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_17", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_18", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_19", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_20", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_21", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_22", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_23", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_24", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_25", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_26", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_26", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_27", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_28", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_29", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_30", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_31", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_32", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_33", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_34", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_35", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_36", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_37", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_38", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_39", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_40", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_41", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_42", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_43", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_44", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_45", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_46", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_47", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_48", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_49", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Door_50", "Bater na Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["garageButton", "Porta da Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["Door_RB", "Board Helicopter (Side)", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (typeOf player_objintersect == "A3PL_Jayhawk") && (vehicle player == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["ignition_Switch", "Switch Ignition", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\igui_wlight_eng_ca.paa", {
        typeOf(vehicle player) IN["A3PL_Jayhawk"]
    }],
    ["battery", "Switch Battery", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        true
    }],
    ["gen1", "APU Generator", "\a3\ui_f\data\IGUI\Cfg\Actions\engine_on_ca.paa", {
        true
    }],
    ["gen2", "ENG Generator NO.1", "\a3\ui_f\data\IGUI\Cfg\Actions\engine_on_ca.paa", {
        true
    }],
    ["gen3", "ENG Generator NO.2", "\a3\ui_f\data\IGUI\Cfg\Actions\engine_on_ca.paa", {
        true
    }],
    ["apucontrol", "APU Control", "\a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa", {
        true
    }],
    ["ecs", "ECS/Start", "\a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\editor_wind_min_ca.paa", {
        true
    }],
    ["fuelpump", "Fuel Pump", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\fuelwarning_ca.paa", {
        true
    }],
    ["windshield", "Windshield", "\a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\rainy_ca.paa", {
        true
    }],
    ["fold", "Unfold/Fold Jayhawk", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Fold_switch", "Unfold/Fold Jayhawk", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Interior_Lights", "Cockpit Lights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Searchlight_Switch", "Alternar Holofotes", "\a3\ui_f\data\IGUI\Cfg\Actions\engine_on_ca.paa", {
        true
    }],
    ["PatrolLadder", "Use Ladder", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["boatdoor", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        true
    }],
    ["driver", "Drive Ship", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        true
    }],
    ["cargo1", "Cargo Ship", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        true
    }],
    ["cargo2", "Cargo Ship", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        true
    }],
    ["extinguisher", "Control Extinguisher", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_fire_put_down_ca.paa", {
        true
    }],
    ["extPump", "Toggle Pump", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\fuelwarning_ca.paa", {
        true
    }],
    ["extPressure", "Toggle Pressure", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderup_ca.paa", {
        true
    }],
    ["Spine1", "Algemar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_hand_1_ca.paa", {
        (player_Itemclass == "handcuffs") && (isPlayer player_objintersect) && !(player_objintersect getVariable ["Cuffed",false]) && !(player_objintersect getVariable ["Tied",false])
    }],
    ["Spine3", "Algemar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_hand_1_ca.paa", {
        (player_Itemclass == "handcuffs") && (isPlayer player_objintersect) && !(player_objintersect getVariable ["Cuffed",false]) && !(player_objintersect getVariable ["Tied",false])
    }],
    ["Spine1", "Desalgemar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_hand_1_ca.paa", {
        (isPlayer player_objintersect) && (player_objintersect getVariable ["Cuffed",false])
    }],
    ["Spine3", "Desalgemar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_hand_1_ca.paa", {
        (isPlayer player_objintersect) && (player_objintersect getVariable ["Cuffed",false])
    }],
    ["Spine1", "Amarrar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_hand_1_ca.paa", {
        (player_Itemclass == "rope") && (isPlayer player_objintersect) && !(player_objintersect getVariable ["Tied",false]) && !(player_objintersect getVariable ["Cuffed",false])
    }],
    ["Spine3", "Amarrar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_hand_1_ca.paa", {
        (player_Itemclass == "rope") && (isPlayer player_objintersect) && !(player_objintersect getVariable ["Tied",false]) && !(player_objintersect getVariable ["Cuffed",false])
    }],
    ["Spine1", "Desamarrar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_hand_1_ca.paa", {
        (isPlayer player_objintersect) && (player_objintersect getVariable ["Tied",false])
    }],
    ["Spine3", "Desamarrar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_hand_1_ca.paa", {
        (isPlayer player_objintersect) && (player_objintersect getVariable ["Tied",false])
    }],
    ["Spine3", "Arrastar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_hand_1_ca.paa", {
        (isPlayer player_objintersect) && ((player_objintersect getVariable ["Cuffed",false]) || (player_objintersect getVariable ["Tied",false])) && (isNull (player getVariable ["dragged",objNull])) && !(player_objintersect getVariable ["isdragged",false])
    }],
    ["spine3", "Chutar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        animationState player_objintersect == "a3pl_handsupkneelcuffed"
    }],
    ["Spine3", "Revistar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_insp_hand_1_ca.paa", {
        (isPlayer cursorObject) && (((animationState cursorObject) IN ["a3pl_idletohandsup", "a3pl_handsuptokneel"]) || cursorObject getVariable ["Cuffed",false])
    }],
    ["Spine3", "Colocar no Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (isPlayer player_objintersect) && ((player_objintersect getVariable ["Cuffed",false]) || (player_objintersect getVariable ["Tied",false])) && !(player_objintersect getVariable ["isdragged",false])
    }],
    ["Retract_Stinger", "Retract Stinger", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((player getVariable "job") == "police") && ({
            player_objintersect animationSourcePhase "Deploy_Stinger" > 0.5
        })
    }],
    ["Deploy_Stinger", "Retract Stinger", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((player getVariable "job") == "police") && ({
            player_objintersect animationSourcePhase "Deploy_Stinger" > 0.1
        })
    }],
    ["Deploy_Stinger", "Deploy Stinger", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        ((player getVariable "job") == "police") && ({
            player_objintersect animationSourcePhase "Deploy_Stinger" < 0.5
        })
    }],
    ["Deploy_Stinger", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]}) && ({player_objintersect animationSourcePhase "Deploy_Stinger" < 0.5})
    }],
    ["Deploy_Stinger", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]}) && ({player_objintersect animationSourcePhase "Deploy_Stinger" < 0.5})
    }],
    ["Deploy_Stinger", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["Deploy_Stinger", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["ski", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["ski", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["ski", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RF", "Entrar Como Co-Motorista", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((typeOf player_objintersect) IN["A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_CVPI_PD", "A3PL_CVPI_PD_Slicktop", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop"]) && !(player_objIntersect getVariable["locked", true])
    }],
    ["scooter_driver", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["scooter_driver", "Sair do Veiculo", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {!((vehicle player) == player)
    }],
    ["scooter_driver", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["scooter_driver", "Reset Scooter", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        true
    }],
    ["scooter_passenger", "Entrar Como Passageiro", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect)
    }],
    ["scooter_passenger", "Sair do Veiculo", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {!((vehicle player) == player)
    }],
    ["carinfo", "Info Veiculo", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        (!isNil {
            player_objIntersect getVariable "stock"
        })
    }],
    ["sirenSwitch", "Alternar Lightbar", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        (vehicle player != player)
    }],
    ["sirenSwitch", "Alternar Sirene", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_on_ca.paa", {
        (vehicle player != player)
    }],
    ["sirenSwitch", "Alternar Manual 1", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_on_ca.paa", {
        (vehicle player != player)
    }],
    ["sirenSwitch", "Alternar Manual 2", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_on_ca.paa", {
        (vehicle player != player)
    }],
    ["sirenSwitch", "Alternar Manual 3", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_on_ca.paa", {
        (vehicle player != player)
    }],
    ["carpanel", "Abrir/Fechar Porta-malas", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["carpanel", "Alternar Luzes de Aviso", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        (vehicle player != player)
    }],
    ["policeradio", "Use Police Radio", "\a3\ui_f\data\IGUI\RscIngameUI\RscDisplayVoiceChat\microphone_ca.paa", {
        (vehicle player != player)
    }],
    ["hitchTrailer", "Engatar Reboque", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objIntersect animationSourcePhase "Hitched" <= 1.5
    }],
    ["hitchTrailer", "Desprender Reboque", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objIntersect animationSourcePhase "Hitched" > 1.5
    }],
    ["door", "Abrir/Fechar Porta Reboque", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (vehicle player) == player
    }],
    ["door", "Abaixar/Subir Rampa Reboque", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (vehicle player) == player
    }],
    ["Cargo_Door_1", "Abaixar/Subir Rampa Reboque", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (player_objintersect isKindOf "A3PL_Trailer_Base") && (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Cargo_Door_2", "Abaixar/Subir Rampa Reboque", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (player_objintersect isKindOf "A3PL_Trailer_Base") && (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["hitchTrailer", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["ramp", "Abaixar/Levantar Rampa", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objintersect isKindOf "car"
    }],
    ["Hitch_Fold", "Alternar Engate", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objIntersect animationSourcePhase "Hitched" <= 1.5) && (typeOf player_objintersect == "A3PL_Lowboy")
    }],
    ["hitchTrailer", "Alternar Gooseneck", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objIntersect animationSourcePhase "Hitched" <= 1.5) && (typeOf player_objintersect == "A3PL_Lowboy")
    }],
    ["trunkSwitch", "Abrir/Fechar Porta-malas", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Front_LPlate", "Spin Sign", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Rear_LPlate", "Spin Sign", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["sd_computer", "Acessar CCTV System", "\a3\ui_f\data\map\MapControl\bunker_ca.paa", {
        (player getVariable["job", "unemployed"]) == "police"
    }],
    ["PC_youtube", "Check Out", "\a3\ui_f\data\map\MapControl\bunker_ca.paa", {
        (player getVariable["Youtube_Lobby", false])
    }],
    ["PC_youtube2", "Check Out", "\a3\ui_f\data\map\MapControl\bunker_ca.paa", {
        (player getVariable["Youtube_Lobby", false])
    }],
    ["cinemaSeat1_1", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat1_2", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat1_3", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat1_4", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat1_5", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat1_6", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat1_7", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat1_8", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat2_1", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat2_2", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat2_3", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat2_4", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat2_5", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat2_6", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat2_7", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat2_8", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat3_1", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat3_2", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat3_3", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat3_4", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat3_5", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat3_6", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat3_7", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["cinemaSeat3_8", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_1", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_2", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_3", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_4", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_5", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_6", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_7", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_8", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_9", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_10", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_11", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_12", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_13", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_14", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_15", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_16", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_17", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_18", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_19", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_20", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_21", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_22", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_23", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_24", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_25", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_26", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_27", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_28", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_29", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_30", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_31", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_32", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_33", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_34", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_35", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_36", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_37", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_38", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_39", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_40", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_41", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_42", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_43", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_44", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_45", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_46", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_47", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_48", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_49", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_50", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_51", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_52", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_53", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_54", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_55", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_56", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_57", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_58", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_59", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_60", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_61", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_62", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_63", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_64", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_65", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_66", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_67", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_68", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_69", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_70", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_71", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_72", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_73", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_74", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_75", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_76", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_77", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_78", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_79", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_80", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_81", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_82", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_83", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_84", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_85", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_86", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_87", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_88", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_89", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_90", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_91", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_92", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_93", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_94", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_95", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_96", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_97", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_98", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_99", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["Seat_100", "Sentar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["bed_1", "Deitar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["bed_2", "Deitar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["bed_3", "Deitar", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        true
    }],
    ["bed_1", "Levantar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        animationState player == "a3pl_bed"
    }],
    ["bed_2", "Levantar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        animationState player == "a3pl_bed"
    }],
    ["bed_3", "Levantar-se", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        animationState player == "a3pl_bed"
    }],
    ["GetIn_Driver", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Driver2", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Driver3", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Driver4", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Driver5", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_CoPilot", "Entrar Como Co-Piloto", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner0", "Enter as Gunner 1", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner1", "Enter as Gunner 2", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner2", "Enter as Gunner 3", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner3", "Enter as Gunner 4", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner4", "Enter as Gunner 5", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner5", "Enter as Gunner 6", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner6", "Enter as Gunner 7", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner7", "Enter as Gunner 8", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner8", "Enter as Gunner 9", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner9", "Enter as Gunner 10", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner10", "Enter as Gunner 11", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner11", "Enter as Gunner 12", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner12", "Enter as Gunner 13", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner13", "Enter as Gunner 14", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner14", "Enter as Gunner 15", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner15", "Enter as Gunner 16", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner16", "Enter as Gunner 17", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner17", "Enter as Gunner 18", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner18", "Enter as Gunner 19", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner19", "Enter as Gunner 20", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo1", "Sentar-se no assento 1", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo2", "Sentar-se no assento 2", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo3", "Sentar-se no assento 3", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo4", "Sentar-se no assento 4", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo5", "Sentar-se no assento 5", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo6", "Sentar-se no assento 6", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo7", "Sentar-se no assento 7", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo8", "Sentar-se no assento 8", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo9", "Sentar-se no assento 9", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo10", "Sentar-se no assento 10", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo11", "Sentar-se no assento 11", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo12", "Sentar-se no assento 12", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo13", "Sentar-se no assento 13", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo14", "Sentar-se no assento 14", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo15", "Sentar-se no assento 15", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo16", "Sentar-se no assento 16", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo17", "Sentar-se no assento 17", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo18", "Sentar-se no assento 18", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo19", "Sentar-se no assento 19", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo20", "Sentar-se no assento 20", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo21", "Sentar-se no assento 21", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo22", "Sentar-se no assento 22", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo23", "Sentar-se no assento 23", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo24", "Sentar-se no assento 24", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo25", "Sentar-se no assento 25", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo26", "Sentar-se no assento 26", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo27", "Sentar-se no assento 27", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo28", "Sentar-se no assento 28", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo29", "Sentar-se no assento 29", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo30", "Sentar-se no assento 30", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo31", "Sentar-se no assento 31", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo32", "Sentar-se no assento 32", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo33", "Sentar-se no assento 33", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo34", "Sentar-se no assento 34", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo35", "Sentar-se no assento 35", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo36", "Sentar-se no assento 36", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo37", "Sentar-se no assento 37", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo38", "Sentar-se no assento 38", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo39", "Sentar-se no assento 39", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo40", "Sentar-se no assento 40", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo41", "Sentar-se no assento 41", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo42", "Sentar-se no assento 42", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo43", "Sentar-se no assento 43", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo44", "Sentar-se no assento 44", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo45", "Sentar-se no assento 45", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo46", "Sentar-se no assento 46", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo47", "Sentar-se no assento 47", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo48", "Sentar-se no assento 48", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo49", "Sentar-se no assento 49", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo50", "Sentar-se no assento 50", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Driver", "Move to Driver", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Driver2", "Move to Driver", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Driver3", "Move to Driver", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Driver4", "Move to Driver", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Driver5", "Move to Driver", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_CoPilot", "Move to Co-Pilot", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner0", "Mover para o atirador 1", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner1", "Mover para o atirador 2", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner2", "Mover para o atirador 3", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner3", "Mover para o atirador 4", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner4", "Mover para o atirador 5", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner5", "Mover para o atirador 6", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner6", "Mover para o atirador 7", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner7", "Mover para o atirador 8", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner8", "Mover para o atirador 9", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner9", "Mover para o atirador 10", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner10", "Mover para o atirador 11", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner11", "Mover para o atirador 12", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner12", "Mover para o atirador 13", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner13", "Mover para o atirador 14", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner14", "Mover para o atirador 15", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner15", "Mover para o atirador 16", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner16", "Mover para o atirador 17", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner17", "Mover para o atirador 18", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner18", "Mover para o atirador 19", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Gunner19", "Mover para o atirador 20", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo1", "Mover para o assento 1", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo2", "Mover para o assento 2", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo3", "Mover para o assento 3", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo4", "Mover para o assento 4", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo5", "Mover para o assento 5", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo6", "Mover para o assento 6", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo7", "Mover para o assento 7", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo8", "Mover para o assento 8", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo9", "Mover para o assento 9", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo10", "Mover para o assento 10", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo11", "Mover para o assento 11", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo12", "Mover para o assento 12", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo13", "Mover para o assento 13", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo14", "Mover para o assento 14", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo15", "Mover para o assento 15", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo16", "Mover para o assento 16", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo17", "Mover para o assento 17", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo18", "Mover para o assento 18", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo19", "Mover para o assento 19", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo20", "Mover para o assento 20", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo21", "Mover para o assento 21", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo22", "Mover para o assento 22", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo23", "Mover para o assento 23", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo24", "Mover para o assento 24", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo25", "Mover para o assento 25", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo26", "Mover para o assento 26", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo27", "Mover para o assento 27", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo28", "Mover para o assento 28", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo29", "Mover para o assento 29", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo30", "Mover para o assento 30", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo31", "Mover para o assento 31", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo32", "Mover para o assento 32", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo33", "Mover para o assento 33", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo34", "Mover para o assento 34", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo35", "Mover para o assento 35", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo36", "Mover para o assento 36", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo37", "Mover para o assento 37", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo38", "Mover para o assento 38", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo39", "Mover para o assento 39", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo40", "Mover para o assento 40", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo41", "Mover para o assento 41", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo42", "Mover para o assento 42", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo43", "Mover para o assento 43", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo44", "Mover para o assento 44", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo45", "Mover para o assento 45", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo46", "Mover para o assento 46", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo47", "Mover para o assento 47", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo48", "Mover para o assento 48", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo49", "Mover para o assento 49", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["GetIn_Cargo50", "Mover para o assento 50", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["yacht_ladder1", "Usar Escada Iate", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["yacht_ladder2", "Usar Escada Iate", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["yacht_driver", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        true
    }],
    ["Mooring_1", "Toggle Mooring Line", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Mooring_2", "Toggle Mooring Line", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Mooring_3", "Toggle Mooring Line", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Mooring_4", "Toggle Mooring Line", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["cutterDriver", "Enter USCG Cutter", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        true
    }],
    ["cutterCargo1", "Enter USCG Cutter (Cargo)", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        true
    }],
    ["cutterGunner", "Enter USCG Cutter (Gunner)", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        true
    }],
    ["cutterladder1_bottom", "Use Cutter Ladder", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["cutterladder1_top", "Use Cutter Ladder", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["cutterladder2_bottom", "Use Cutter Ladder", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["cutterladder2_top", "Use Cutter Ladder", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["cutterladder3_bottom", "Use Cutter Ladder", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["cutterladder3_top", "Use Cutter Ladder", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["cutterladder4_bottom", "Use Cutter Ladder", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["cutterladder4_top", "Use Cutter Ladder", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        true
    }],
    ["climbYacht", "Subir no Iate", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_ladderonup_ca.paa", {
        (vehicle player == player)
    }],
    ["farmingground", "Plantar Semente", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        Player_ItemClass IN["seed_wheat", "seed_marijuana", "seed_corn", "seed_lettuce", "seed_coca"]
    }],
    ["farmingground1", "Plantar Semente", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        Player_ItemClass IN["seed_wheat", "seed_marijuana", "seed_corn", "seed_lettuce", "seed_coca"]
    }],
    ["farmingground2", "Plantar Semente", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        Player_ItemClass IN["seed_wheat", "seed_marijuana", "seed_corn", "seed_lettuce", "seed_coca"]
    }],
    ["farmingground3", "Plantar Semente", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        Player_ItemClass IN["seed_wheat", "seed_marijuana", "seed_corn", "seed_lettuce", "seed_coca"]
    }],
    ["farmingground4", "Plantar Semente", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        Player_ItemClass IN["seed_wheat", "seed_marijuana", "seed_corn", "seed_lettuce", "seed_coca"]
    }],
    ["farmingground5", "Plantar Semente", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        Player_ItemClass IN["seed_wheat", "seed_marijuana", "seed_corn", "seed_lettuce", "seed_coca"]
    }],
    ["gasHose", "Pegar Mangueira de Gasolina", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["gasHose", "Ativar/Desativar Bomba", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["gasTurn", "Ativar/Desativar Bomba", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["hoseback1", "Retornar Mangueira de Gasolina", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["hoseback2", "Retornar Mangueira de Gasolina", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["hoseback3", "Retornar Mangueira de Gasolina", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["hoseback4", "Retornar Mangueira de Gasolina", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["gastank", "Conectar Mangueira de Gásolina", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\fuelwarning_ca.paa", {
        typeOf Player_Item IN["A3PL_Gas_Hose", "A3PL_GasHose"]
    }],
    ["gastank", "Usar Jerry Can", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\fuelwarning_ca.paa", {
        player_itemClass == "jerrycan"
    }],
    ["inspect_hitfuel1", "Conectar Mangueira de Gásolina", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\fuelwarning_ca.paa", {
        typeOf Player_Item IN["A3PL_Gas_Hose", "A3PL_GasHose"]
    }],
    ["Repair", "Conectar Mangueira de Gásolina", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\fuelwarning_ca.paa", {
        (typeOf Player_Item IN["A3PL_Gas_Hose", "A3PL_GasHose"]) && (typeOf player_objintersect == "A3PL_RHIB")
    }],
    ["popcornmachine1", "Pegar Pipoca", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((getPlayerUID player) IN ["76561198166982296"])
    }],
    ["popcornmachine2", "Pegar Pipoca", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((getPlayerUID player) IN ["76561198166982296"])
    }],
    ["popcornBucket", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["popcornBucket", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["popcornBucket", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["popcornBucket", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["garage_2_button", "Porta da Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["garage_1_button", "Porta da Garagem", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["car_lift_button", "Usar Elevador", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["car_upgrade", "Melhorar Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["mailtruck_trunk", "Abrir/Fechar Porta Mailtruck", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["mailtruck_trunk", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["deliverybox", "Pegar Entrega", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deliverybox", "Verificar Rótulo de Entrega", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["fireworkIgnite", "Acender Foguete", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        ((player_objintersect getVariable["stock", -1]) == -1) && (simulationEnabled player_objIntersect)
    }],
    ["fireworkrocket", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objintersect getVariable["stock", -1] == -1)
    }],
    ["atego_tow", "Carregar Veículo", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["atego_tow", "Descarregar Veículo", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Ramp_Switch", "Alternar Rampa", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Spotlight_Switch", "Toggle Rear Spotlight", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["carinfo", "Apreender Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        vehicleVarName player_objintersect IN ["Shop_Impound1","Shop_Impound2","Shop_Impound3","Shop_Impound4"]
    }],
    ["impound_Door_button", "Abrir/Fechar Portão Impound", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["impound_Door_button_2", "Abrir/Fechar Portão Impound", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["big_Door_1_1_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["big_Door_1_2_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["big_Door_2_1_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["big_Door_2_2_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_3", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_4", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_5", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_6", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_7", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_8", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_All_switch_1", "Turn On All Lights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_1_switch_1", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_1_switch_2", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_1_switch_3", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_1_switch_4", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_1_switch_5", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_1_switch_6", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_1_switch_7", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_1_switch_8", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_1_switch_9", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_1_switch_10", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_2_switch_1", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_2_switch_2", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_2_switch_3", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_2_switch_4", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_2_switch_5", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_2_switch_6", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_2_switch_7", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_2_switch_8", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_2_switch_9", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_2_switch_10", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_3_switch_1", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_3_switch_2", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_3_switch_3", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_3_switch_4", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_3_switch_5", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_3_switch_6", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_3_switch_7", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_3_switch_8", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_3_switch_9", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_3_switch_10", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_4_switch_1", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_4_switch_2", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_4_switch_3", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_4_switch_4", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_4_switch_5", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_4_switch_6", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_4_switch_7", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_4_switch_8", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_4_switch_9", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_4_switch_10", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_5_switch_1", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_5_switch_2", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_5_switch_3", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_5_switch_4", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_5_switch_5", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_5_switch_6", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_5_switch_7", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_5_switch_8", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_5_switch_9", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_5_switch_10", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_6_switch_1", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_6_switch_2", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_6_switch_3", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_6_switch_4", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_6_switch_5", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_6_switch_6", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_6_switch_7", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_6_switch_8", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_6_switch_9", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_6_switch_10", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_7_switch_1", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_7_switch_2", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_7_switch_3", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_7_switch_4", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_7_switch_5", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_7_switch_6", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_7_switch_7", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_7_switch_8", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_7_switch_9", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_7_switch_10", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_8_switch_1", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_8_switch_2", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_8_switch_3", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_8_switch_4", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_8_switch_5", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_8_switch_6", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_8_switch_7", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_8_switch_8", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_8_switch_9", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_8_switch_10", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_9_switch_1", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_9_switch_2", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_9_switch_3", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_9_switch_4", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_9_switch_5", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_9_switch_6", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_9_switch_7", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_9_switch_8", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_9_switch_9", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_9_switch_10", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_10_switch_1", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_10_switch_2", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_10_switch_3", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_10_switch_4", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_10_switch_5", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_10_switch_6", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_10_switch_7", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_10_switch_8", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_10_switch_9", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Room_10_switch_10", "Ligar Luzes", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_1_switch_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_1_switch_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_2_switch_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_2_switch_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_3_switch_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_3_switch_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_4_switch_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_4_switch_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_5_switch_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_5_switch_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_6_switch_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_6_switch_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_7_switch_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_7_switch_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_8_switch_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["bay_Door_8_switch_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["big_Door_1_switch_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["big_Door_1_switch_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["big_Door_2_switch_1", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["big_Door_2_switch_2", "Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Ladder_action", "Pegar Escadas", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objintersect animationPhase "ladder" < 0.5
    }],
    ["Ladder_action", "Colocar Escada de Volta", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        _ladders = nearestObjects[player, ["A3PL_Ladder"], 2];
        (count _ladders) > 0
    }],
    ["Hose_1_action", "Colocar de Volta Mangueira 1", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_ItemClass == "FD_Hose"
    }],
    ["Hose_2_action", "Colocar de Volta Mangueira 2", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_ItemClass == "FD_Hose"
    }],
    ["Hose_3_action", "Colocar de Volta Mangueira 3", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_ItemClass == "FD_Hose"
    }],
    ["Hose_4_action", "Colocar de Volta Mangueira 4", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_ItemClass == "FD_Hose"
    }],
    ["Hose_5_action", "Colocar de Volta Mangueira 5", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_ItemClass == "FD_Hose"
    }],
    ["Hose_1_action", "Pegar Mangueira 1", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect animationPhase "Hose_1") < 1
    }],
    ["Hose_2_action", "Pegar Mangueira 2", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect animationPhase "Hose_2") < 1
    }],
    ["Hose_3_action", "Pegar Mangueira 3", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect animationPhase "Hose_3") < 1
    }],
    ["Hose_4_action", "Pegar Mangueira 4", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect animationPhase "Hose_4") < 1
    }],
    ["Hose_5_action", "Pegar Mangueira 5", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect animationPhase "Hose_5") < 1
    }],
    ["controller_cover", "Toggle Controller Cover", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_1", "Toggle DS Front Outrigger", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_2", "Toggle DS Rear Outrigger", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_3", "Toggle PS Front Outrigger", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_4", "Toggle PS Rear Outrigger", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_5", "Toggle/Raise DS Outriggers", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_6", "Toggle/Raise PS Outriggers", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_8", "DS Floodlights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_9", "PS Floodlights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_10", "Perimeter Lights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_11", "Ladder Floodlight", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_12", "Ladder Cam", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_13", "Toggle DS Front Outrigger", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_14", "Toggle DS Rear Outrigger", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_15", "Toggle PS Front Outrigger", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_16", "Toggle PS Rear Outrigger", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_17", "Toggle/Raise DS Outriggers", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_18", "Toggle/Raise PS Outriggers", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_20", "DS Floodlights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_21", "PS Floodlights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_22", "Perimeter Lights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_23", "Ladder Floodlight", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_24", "Ladder Cam", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Ladder_Controls", "Enter as Ladder Operator", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Ladder_Controls", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Ladder_Holder", "Lower/Raise Ladder Rack", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Pump_Switch", "Turn On\Off Pump", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Ambo_Switch_7", "Rear Floodlights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Ambo_Switch_8", "DS Floodlights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Ambo_Switch_9", "PS Floodlights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Ambo_Switch_10", "Interior Lights", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Ambo_Switch_11", "Farol Alto", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Stretcher_Action", "Usar Maca", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true]) && ((player getVariable["job", "unemployed"]) == "fifr")
    }],
    ["Stretcher_Action", "Sentar-se no assento 2", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Stretcher_Action", "Mover para o assento 2", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) != player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Switch_Fair_Available", "Alternar Taximetro Disponivel", "\a3\ui_f\data\IGUI\Cfg\Actions\lightsiconon_ca.paa", {
        player == driver player_objintersect
    }],
    ["Switch_Pause_Fair", "Pausar Taximetro", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player == driver player_objintersect
    }],
    ["Switch_Reset_Fair", "Resetar Taximetro", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player == driver player_objintersect
    }],
    ["Switch_Start_Fair", "Iniciar Taximetro", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player == driver player_objintersect
    }],
    ["Switch_Stop_Fair", "Parar Taximetro", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player == driver player_objintersect
    }],
    ["ASC_Switch", "Controle de Suspensão a Ar", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["PD_lightSwitch", "Alternar Faróis Dianteiros", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["PD_Switch_8", "Alternar Spotlight", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["PD_Switch_9", "Luz Lateral Esquerda", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["PD_Switch_10", "Luz Lateral Direita", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["High_Beam_Switch", "Farol Alto", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["lightSwitch", "Farol Alto", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Reverse_Cam_Button", "Camera Reversa", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_33", "Buzina de Ar", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_34", "Buzina Eletrica", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_35", "Buzina de Ar Eletrica", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_36", "Rumbler Manual", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_37", "T3 Yelp", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["FT_Switch_38", "Master On", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Directional_Switch", "Direcional Master", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Directional_Control_Noob", "Controle Direcional", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Siren_Control_Switch", "Sirene Master", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Siren_Control_Noob", "Controle Sirene", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Laptop_Top", "Ligar/Desligar Laptop", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Laptop_Top", "Acessar Banco de Dados", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Laptop", "Girar Laptop", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Switch_Radar_Master", "Radar Master", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Switch_Radar_Rear", "Radar Traseiro", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Switch_Radar_Front", "Radar Frontal", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Switch_Radar_Master", "Resetar Radar", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Lightbar_Switch", "Alternar Lightbar", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["groundShov_Switch", "Toggle Dozer Blade", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Attachment_Switch", "Detach Attachment", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Attachment", "Conectar Balde", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_ItemClass == "ME_Bucket"
    }],
    ["Attachment", "Conectar Jackhammer", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_ItemClass == "ME_Jackhammer"
    }],
    ["Attachment", "Conectar Garra", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_ItemClass == "ME_Claw"
    }],
    ["hydrantwrench", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["stock", -1]) == -1)
    }],
    ["fd_hoseend", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["stock", -1]) == -1)
    }],
    ["fd_yadapter", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["stock", -1]) == -1)
    }],
    ["fd_hoserolled", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["stock", -1]) == -1)
    }],
    ["fd_axe", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["stock", -1]) == -1)
    }],
    ["fd_oxygen", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["stock", -1]) == -1)
    }],
    ["fd_mask", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["stock", -1]) == -1)
    }],
    ["fd_helmet", "Comprar/Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!((player_objintersect getVariable["stock", -1]) == -1)
    }],
    ["Door_mailbox", "Abrir/Fechar Caixa de Correio", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["vote1", "Eleger Prefeito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["vote1", "Torne-se Candidato", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["vote2", "Eleger Prefeito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["vote2", "Torne-se Candidato", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["vote3", "Eleger Prefeito", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["vote3", "Torne-se Candidato", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["furniture", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["furniture", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["furniture", "Colocar Gasolina No Tanque", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["class", ""]) == "Petrol"
    }],
    ["furniture", "Colocar Gasolina No Posto", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["class", ""]) == "Petrol"
    }],
    ["item_pickup", "Colocar Querosene No Tanque", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["class", ""]) == "Kerosene"
    }],
    ["furniture", "Checar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["furniture", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["furniture", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["burger", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["burger", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["burger", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["burger", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["burgerbread", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["burgerbread", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["burgerbread", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["burgerbread", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["fishburger", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["fishburger", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["fishburger", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["fishburger", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["taco", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["taco", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["taco", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["taco", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["wrench", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["wrench", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["wrench", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["wrench", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["cash", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["cash", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["cash", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["bucket", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["bucket", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["bucket", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["bucket", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["buoy", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["buoy", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["buoy", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["buoy", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["fireworkrocket", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["fireworkrocket", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["fireworkrocket", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["fireworkrocket", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["seedbox", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["seedbox", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["seedbox", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["seedbox", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["cornCob", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["cornCob", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["cornCob", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["cornCob", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["weedbag", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["weedbag", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["item_pickup", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["item_pickup", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["weedbag", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["weedbag", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["lettuce", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["lettuce", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["lettuce", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["lettuce", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["salad", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["salad", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["salad", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["salad", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["tacoshell", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["tacoshell", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["tacoshell", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["tacoshell", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["fish", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["fish", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["fish", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["fish", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["fd_yadapter", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]}) && (simulationEnabled player_objIntersect)
    }],
    ["fd_yadapter", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]}) && (simulationEnabled player_objIntersect)
    }],
    ["fd_yadapter", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["fd_yadapter", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["fd_hoseend", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]}) && (!(typeOf player_objintersect IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"]))
    }],
    ["fd_hoseend", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]}) && (simulationEnabled player_objIntersect) && (typeOf player_objintersect != "A3PL_FD_HoseEnd1_Float") && (!(typeOf player_objintersect IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"]))
    }],
    ["fd_hoseend", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["fd_hoseend", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["fd_hoserolled", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["fd_hoserolled", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["fd_hoserolled", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["fd_hoserolled", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["fd_mask", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["fd_mask", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["fd_mask", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["fd_mask", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["hydrantwrench", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["hydrantwrench", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["hydrantwrench", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["hydrantwrench", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["ore", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["ore", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["ore", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["ore", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["crate", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["crate", "Checar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["crate", "Coletar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["crate", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["crate", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["clothing", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["clothing", "Checar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["clothing", "Coletar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["clothing", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["clothing", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["Item_Pickup", "Pegar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["Item_Pickup", "Checar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Item_Pickup", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["Item_Pickup", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["Item_Pickup", "Pegar Item Na Mão", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["deliverybox", "Checar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["deliverybox", "Comprar Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (!isNil {
            player_objintersect getVariable["bitem", nil]
        })
    }],
    ["deliverybox", "Vender Item", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        (player_objintersect getVariable["owner", "0"]) == (getPlayerUID player)
    }],
    ["spine3", "Menu Medico", "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\si_prone_down_ca.paa", {
        ((player getVariable["job", "unemployed"]) isEqualTo "fifr") && (isPlayer player_objintersect)
    }],
    ["Ladder_1", "Pegar Escada", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        typeof player_objintersect == "A3PL_Ladder"
    }],
    ["Ladder_1", "Climb Up Ladder 1", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderup_ca.paa", {
        true
    }],
    ["Ladder_2", "Climb Up Ladder 2", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderup_ca.paa", {
        true
    }],
    ["Ladder_3", "Climb Up Ladder 3", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderup_ca.paa", {
        true
    }],
    ["Ladder_4", "Climb Up Ladder 4", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderup_ca.paa", {
        true
    }],
    ["Ladder_5", "Climb Up Ladder 5", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderup_ca.paa", {
        true
    }],
    ["Ladder_1", "Climb Down Ladder 1", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderdown_ca.paa", {
        true
    }],
    ["Ladder_2", "Climb Down Ladder 2", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderdown_ca.paa", {
        true
    }],
    ["Ladder_3", "Climb Down Ladder 3", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderdown_ca.paa", {
        true
    }],
    ["Ladder_4", "Climb Down Ladder 4", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderdown_ca.paa", {
        true
    }],
    ["Ladder_5", "Climb Down Ladder 5", "\a3\ui_f\data\IGUI\Cfg\Actions\ladderdown_ca.paa", {
        true
    }],
    ["Ladder_1", "Estender/Recuar Escada", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        typeof player_objintersect == "A3PL_Ladder"
    }],
    ["Door_1", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_1", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true]) && (player_objintersect isKindOf "A3PL_RBM")
    }],
    ["Door_1", "Enter as Engineer", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true]) && (player_objintersect isKindOf "A3PL_RBM")
    }],
    ["Door_1", "Entrar Como Passageiro", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true]) && (player_objintersect isKindOf "A3PL_RBM")
    }],
    ["Door_1", "Enter as Captain", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true]) && (player_objintersect isKindOf "A3PL_RBM")
    }],
    ["Door_1", "Enter as Gunner", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true]) && (player_objintersect isKindOf "A3PL_RBM")
    }],
    ["Bow_Gun", "Enter as Bow Gunner", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true]) && (player_objintersect isKindOf "A3PL_RBM")
    }],
    ["Lifebuoy_1_action", "Grab Left Lifebuoy", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Lifebuoy_1_action", "Put Back Left Lifebuoy", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Lifebuoy_2_action", "Grab Right Lifebuoy", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Lifebuoy_2_action", "Put Back Right Lifebuoy", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        true
    }],
    ["Item_Pickup", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && (typeOf player_objintersect == "A3PL_Lifebuoy")
    }],
    ["Item_Pickup", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && (typeOf player_objintersect == "A3PL_Lifebuoy")
    }],
    ["Item_Pickup", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((typeOf player_objintersect) == "A3PL_Lifebuoy")
    }],
    ["Platform_1", "Toggle Left Platform", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Platform_2", "Toggle Right Platform", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Anchor", "Soltar/Pegar Ancora", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Door_1", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect == "A3PL_EMS_Locker")
    }],
    ["Door_1", "Lock/Unlock Locker", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []])) && (typeOf player_objintersect == "A3PL_EMS_Locker")
    }],
    ["lockerbottom", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["lockertop", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["doorL", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["doorL", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk"])
    }],
    ["doorL", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["doorL", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["doorL", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["doorL", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["doorR", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["doorR", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk"])
    }],
    ["doorR", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["doorR", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["doorR", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["doorR", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["z_doorl_front", "Entrar Como Motorista", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["z_doorr_front", "Entrar Como Passageiro", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["z_doorr_back", "Entrar Como Passageiro", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["z_doorl_back", "Entrar Como Passageiro", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["z_doorl_front", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["z_doorr_front", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LF", "Entrar Como Motorista", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true]) && (typeof player_objintersect == "A3PL_Goose_Base")
    }],
    ["Pilot_Door", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true]) && (typeof player_objintersect == "A3PL_Cessna172")
    }],
    ["CoPilot_Door", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true]) && (typeof player_objintersect == "A3PL_Cessna172")
    }],
    ["Door_LF", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LF", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LF", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LF2", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF2", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF2", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LF2", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF2", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LF2", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LF3", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF3", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF3", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LF3", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF3", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LF3", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LF4", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF4", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF4", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LF4", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF4", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LF4", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LF5", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF5", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF5", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LF5", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF5", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LF5", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LF6", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF6", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LF6", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LF6", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF6", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LF6", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LB", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LB", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LB", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LB2", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB2", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB2", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LB2", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB2", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LB2", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LB3", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB3", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB3", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LB3", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB3", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LB3", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LB4", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB4", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB4", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LB4", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB4", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LB4", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LB5", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB5", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB5", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LB5", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB5", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LB5", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LB6", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB6", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_LB6", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_LB6", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB6", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_LB6", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RF", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RF", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RF", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RF2", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF2", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF2", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RF2", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF2", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RF2", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RF3", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF3", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF3", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RF3", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF3", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RF3", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RF4", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF4", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF4", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RF4", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF4", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RF4", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RF5", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF5", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF5", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RF5", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF5", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RF5", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RF6", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF6", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RF6", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RF6", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF6", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RF6", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RB", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RB", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RB", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RB2", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB2", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB2", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RB2", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB2", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RB2", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RB3", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB3", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB3", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RB3", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB3", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RB3", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RB4", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB4", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB4", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RB4", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB4", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RB4", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RB5", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB5", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB5", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RB5", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB5", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RB5", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_RB6", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB6", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Door_RB6", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
    }],
    ["Door_RB6", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB6", "Abrir\Fechar Porta", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true]) && (typeOf player_objintersect IN["Heli_Medium01_Base_H", "Heli_Medium01_H", "Heli_Medium01_Coastguard_H", "Heli_Medium01_Sheriff_H", "Heli_Medium01_Luxury_H", "Heli_Medium01_Medic_H", "Heli_Medium01_Military_Base_H", "Heli_Medium01_Military_H", "Heli_Medium01_Veteran_H", "A3PL_Charger", "A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Tahoe", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_Tahoe_FD", "A3PL_Mustang", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_Fuel_Van", "A3PL_Transport_Van", "A3PL_Silverado", "A3PL_Silverado_PD", "Jonzie_Ambulance", "A3PL_E350", "A3PL_Pierce_Ladder", "A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Pumper", "A3PL_Jayhawk", "alr_Tesla", "alr_cadillac"])
    }],
    ["Door_RB6", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench"
    }],
    ["Door_LF", "Entrar Como Co-Piloto", "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa", {
        (player_objintersect isKindOf "Air") && (vehicle player == player) && !(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_1", "Alternar Compartimento 1", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_2", "Alternar Compartimento 2", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_3", "Alternar Compartimento 3", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_4", "Alternar Compartimento 4", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_5", "Alternar Compartimento 5", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_6", "Alternar Compartimento 6", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_7", "Alternar Compartimento 7", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_8", "Alternar Compartimento 8", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_9", "Alternar Compartimento 9", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_10", "Alternar Compartimento 10", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_11", "Alternar Compartimento 11", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_12", "Alternar Compartimento 12", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_13", "Alternar Compartimento 13", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_14", "Alternar Compartimento 14", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_15", "Alternar Compartimento 15", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_16", "Alternar Compartimento 16", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_17", "Alternar Compartimento 17", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_18", "Alternar Compartimento 18", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_19", "Alternar Compartimento 19", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["Cargo_Door_20", "Alternar Compartimento 20", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["trunk", "Abrir/Fechar Porta-malas", "\a3\ui_f\data\gui\cfg\Hints\doors_ca.paa", {!(player_objIntersect getVariable["locked", true])
    }],
    ["trunkinside", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside1", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside2", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside3", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside4", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside5", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside6", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside7", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside8", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside9", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside10", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside11", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside12", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside13", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside14", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside15", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside16", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside17", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside18", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside19", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["trunkinside20", "Colocar Item", "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoput_ca.paa", {
        true
    }],
    ["door1", "Entrar Como Motorista", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && (!(player_objIntersect getVariable["locked", true])) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door1", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && (!(player_objIntersect getVariable["locked", true])) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door1", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []])) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door1", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door1", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench" && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door2", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && (!(player_objIntersect getVariable["locked", true])) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door2", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && (!(player_objIntersect getVariable["locked", true])) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door2", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []])) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door2", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door2", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench" && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door3", "Entrar Como Passageiro", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (simulationEnabled player_objIntersect) && (!(player_objIntersect getVariable["locked", true])) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F"])
    }],
    ["door3", "Sair do Veiculo", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {!((vehicle player) == player) && (!(player_objIntersect getVariable["locked", true])) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F"])
    }],
    ["door3", "Trancar/Destrancar Portas", "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_open_ca.paa", {
        (getPlayerUID player in (player_objintersect getVariable["keyAccess", []])) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F"])
    }],
    ["door3", "Ejetar Passageiros", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F"])
    }],
    ["door3", "Reparar Veiculo", "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa", {
        player_ItemClass == "repairwrench" && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F"])
    }],
    ["spine3", "Roubar Loja", "\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa", {
        player_objintersect IN [NPC_Seed_Store,npc_clothing1,npc_clothing2,npc_clothing3,npc_vehicles_1,npc_furniture1,npc_furniture2,npc_furniture3,npc_gemshop,npc_hardware_1,npc_general1,npc_general2,npc_general3,npc_market1,npc_market2,npc_market3,npc_mc1,npc_mc2,npc_mc3,npc_mc4,npc_taco1,npc_taco2,npc_taco3,npc_taco4]
    }],
    ["item_pickup", "Roubar Objeto", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        ((typeOf player_objintersect) IN ["A3PL_Steel_Pellet","A3PL_Aluminium_Pellet","A3PL_Titanium_Pellet","A3PL_Kerosene","A3PL_Pumpjack","A3PL_OilBarrel"])
    }],
    ["furniture", "Roubar Objeto", "\a3\ui_f\data\IGUI\Cfg\Actions\talk_ca.paa", {
        ((typeOf player_objintersect) IN ["A3PL_Steel_Pellet","A3PL_Aluminium_Pellet","A3PL_Titanium_Pellet","A3PL_Kerosene","A3PL_Pumpjack","A3PL_OilBarrel"])
    }],
    ["Pilot_Door", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["CoPilot_Door", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["doorL", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["doorR", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF2", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF3", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF4", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF5", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LF6", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB2", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB3", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB4", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB5", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_LB6", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF2", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF3", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF4", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF5", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RF6", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB2", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB3", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB4", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB5", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["Door_RB6", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) isEqualTo player) && ((speed player_objIntersect) < 5)
    }],
    ["door1", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door2", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])
    }],
    ["door3", "Tentar Destrancar", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        ((vehicle player) == player) && (typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F"])
    }],
    ["Door_1", "Evidencias Fisicas", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (player_objIntersect isEqualTo evidence_locker)
    }],
    ["Door_1", "Evidencias Virtuais", "\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa", {
        (player_objIntersect isEqualTo evidence_locker)
    }]
];
publicVariable "Config_IntersectArray";

Config_GenArray = [
    "Retirar Veiculo da Garagem", "Abrir Importação/Exportação", "Abaixar/Levantar Rampa de Carros", "Virar Lixeira da Esquerda", "Abaixar Lixeira da Esquerda", "Virar Lixeira da Direita", "Abaixar Lixeira da Direita", "Abrir Lixeira", "Fechar Lixeira", "Alternar Engate", "Alternar Gooseneck", "Alternar Starter (Motor 1)", "Alternar Starter (Motor 2)", "Fechar Acelerador (Motor 1)", "Fechar Acelerador (Motor 2)", "Alternar o Rádio ATC", "Alternar Baterias", "Alternar Faróis Dianteiros", "Alternar Freio Rotor", "Inspecionar Motor #1", "Inspecionar Motor #2", "Inspecionar Rotor Principal #1", "Inspecionar Rotor Principal #2", "Inspecionar Rotor Principal #3", "Inspecionar Rotor Principal #4", "Inspecionar Rotor de Cauda #1", "Inspecionar Rotor de Cauda #2", "Inspecionar Rotor de Cauda Central", "Inspecionar Transmissão", "Inspecionar Combustível", "Inspecionar Engrenagem #1", "Inspecionar Engrenagem #2", "Inspecionar Engrenagem #3", "Inspecionar Engrenagem #4", "Inspecionar Estabilizador Horizontal #1", "Inspecionar Estabilizador Horizontal #2", "Inspecionar Luzes de Pouso", "Inspecionar Tubo Pitot #1", "Inspecionar Tubo Pitot #2", "Inspecionar Porta Estática #1", "Inspecionar Porta Estática #2", "Inspecionar Estabilizador Vertical", "Inspect Intake #1", "Inspect Intake #2", "Toggle Left Engine Hatch", "Toggle Right Engine Hatch", "Sentar-se", "Deitar", "Levantar-se", "Porta", "Usar Botão Porta", "Ligar Luzes", "Turn On All Lights", "Toggle Collision Lights", "Engatar Reboque", "Desprender Reboque", "Farol Alto", "Abrir/Fechar Porta Reboque", "Abaixar/Subir Rampa Reboque", "Porta da Garagem", "Revistar", "Algemar", "Desalgemar", "Amarrar", "Desamarrar", "Porta-malas", "DoorL", "DoorR", "Entrar Como Motorista", "Entrar Como Passageiro", "Sair do Veiculo", "Ignição", "Alternar Lightbar", "Alternar Sirene", "Alternar Manual 1", "Alternar Manual 2", "Alternar Manual 3", "Abrir/Fechar Porta-malas", "Spin Sign", "Alternar Luzes de Aviso", "Use Police Radio", "Colocar Item", "Alternar Taximetro Disponivel", "Pausar Taximetro", "Resetar Taximetro", "Iniciar Taximetro", "Parar Taximetro", "Climb Up Ladder 1", "Climb Up Ladder 2", "Climb Up Ladder 3", "Climb Up Ladder 4", "Climb Up Ladder 5", "Climb Down Ladder 1", "Climb Down Ladder 2", "Climb Down Ladder 3", "Climb Down Ladder 4", "Climb Down Ladder 5", "Pegar Escada", "Estender/Recuar Escada", "Colocar no Veiculo", "Ejetar Passageiros", "Pegar Movel", "Trancar/Destrancar Porta", "Garagem", "Guardar Veiculo", "Buy Vehicle", "Falar com Atendente McFishers", "Pegar Uniforme McFishers", "Falar com Atendente Taco Hell", "Pegar Uniforme Taco Hell", "Falar com Pescador", "Falar com o Policial", "Falar com Medico", "Falar com Atendente do Banco", "Talk to Supermarket Employee", "Falar com Atendente do Mercado", "Falar com o Mecanico", "Falar com o Mecanico", "Falar com Fazendeiro", "Talk to Wildcat", "Falar com Recuperador de Petroleo", "Falar com Comprador de Petroleo", "Falar com FAA 1", "Falar com FAA 2", "Falar com Traficante", "Falar com Mercado Negro", "Falar com Vendedor de Armas", "Falar com Atendente da Prefeitura", "Falar com NPC DOJ", "Falar com NPC DOC", "Falar com NPC DMV", "Falar com Caçador", "Lavar Dinheiro Sujo", "Acessar Loja de Joias", "Acessar Indústria Química", "Acessar Siderúrgica", "Acessar Refinaria de Oleo", "Fabrica de Armas", "Fabrica de Alimentos", "Fabrica de Mercadorias", "Fabrica de Veiculos", "Fabrica de Peças de Veiculos", "Fabrica de Veiculos Facção", "Fabrica de Barcos", "Fabrica de Aeronaves", "Acessar Loja de Moveis", "Equipamentos EMS", "Roupas EMS", "Loja de Bombeiros", "Acessar Loja de Equipamentos", "Acessar Loja Geral", "Acessar Loja de Paintball", "Acessar Loja de Bebidas", "Acessar Loja do Lenhador", "Acessar Loja do Minerador", "Inciar/Parar Trabalhar como Lixeiro", "Inciar/Parar Trabalhar como Entregador", "Inciar/Parar Trabalhar como Exterminador", "Inciar/Parar Alugar Kart", "Comprar mapa de mineração de ferro ($500)", "Comprar mapa de mineração de carvão ($500)", "Comprar mapa de mineração de aluminio ($500)", "Comprar mapa de mineração de enxofre ($500)", "Comprar mapa de mineração de petróleo ($1000)", "Acessar Loja de Sementes", "Veiculos EMS", "Equipamentos SD", "Roupas SD", "Veiculos SD", "Acessar Loja de Veiculos", "Loja de Equipamentos FAA", "Veiculos FAA", "Veiculos DMV", "Veiculos DOJ", "Loja de Equipamentos DOJ", "Loja de Equipamentos DMV", "Loja de Equipamentos DOC", "Loja de Equipamentos USCG", "Veiculos USCG Carros", "Veiculos USCG Barcos", "Veiculos USCG Aeronaves", "Toggle Dozer Blade", "Detach Attachment", "Attachment_Switch", "Conectar Balde", "Conectar Jackhammer", "Conectar Garra", "Modo de Operações", "Modo Motorista", "Pegar Item", "Pegar Entrega", "Pegar Item Na Mão", "Criar Hambúrguer De Peixe", "Abrir/Fechar Porta Prisão", "Comprar/Vender Item", "Arrastar", "Chutar", "Trancar/Destrancar Portas", "Reparar Veiculo", "Buy Furniture", "climbYacht", "Dar Multa", "Abaixar/Levantar Rampa", "Bater na Porta", "Colher Planta", "Enter as Engineer", "Enter as Captain", "Enter as Gunner", "Enter as Bow Gunner", "Abaixar/Subir Rampa Reboque", "Toggle Rear Spotlight", "Carregar Veículo", "Descarregar Veículo", "Alternar Rampa", "Toggle Left Platform", "Toggle Right Platform", "Menu Medico", "Recolher/Estender Braço de Broca", "Recolher/Estender Broca", "Start Jack Pump", "Abrir Menu K-9", "Colocar Hamburger", "Comprar/Vender Rede", "Coletar Rede", "Soltar Rede", "Comprar/Vender Balde", "Controle de Suspensão a Ar", "Switch Ignition", "Switch Ignition/Starter", "Switch Battery", "APU Generator", "ENG Generator NO.1", "ENG Generator NO.2", "APU Control", "ECS/Start", "Fuel Pump", "Windshield", "Unfold/Fold Jayhawk", "Cockpit Lights", "Alternar Holofotes", "Conectar Mangueira ao Tanque", "Conectar Mangueira de Gásolina", "Pegar Mangueira de Gasolina", "Ativar/Desativar Bomba", "Retornar Mangueira de Gasolina", "Toggle Floats", "Toggle Fuelpump", "Toggle Fuelpump", "Toggle Battery", "Adjust Flaps Upward", "Adjust Flaps Downward", "Switch Generator", "Switch Ignition/Starter Left", "Switch Ignition/Starter Right", "Entrar Como Co-Piloto", "Lower Towing Rope", "Raise Towing Rope (Tow)", "Alternar Compartimento 1", "Alternar Compartimento 2", "Alternar Compartimento 3", "Alternar Compartimento 4", "Alternar Compartimento 5", "Alternar Compartimento 6", "Alternar Compartimento 7", "Alternar Compartimento 8", "Alternar Compartimento 9", "Alternar Compartimento 10", "Alternar Compartimento 11", "Alternar Compartimento 12", "Alternar Compartimento 13", "Alternar Compartimento 14", "Alternar Compartimento 15", "Alternar Compartimento 16", "Alternar Compartimento 17", "Alternar Compartimento 18", "Alternar Compartimento 19", "Alternar Compartimento 20", "Toggle Mooring Line", "Enter as Gunner 1", "Enter as Gunner 2", "Enter as Gunner 3", "Enter as Gunner 4", "Enter as Gunner 5", "Enter as Gunner 6", "Enter as Gunner 7", "Enter as Gunner 8", "Enter as Gunner 9", "Enter as Gunner 10", "Enter as Gunner 11", "Enter as Gunner 12", "Enter as Gunner 13", "Enter as Gunner 14", "Enter as Gunner 15", "Enter as Gunner 16", "Enter as Gunner 17", "Enter as Gunner 18", "Enter as Gunner 19", "Enter as Gunner 20", "Sentar-se no assento 1", "Sentar-se no assento 2", "Sentar-se no assento 3", "Sentar-se no assento 4", "Sentar-se no assento 5", "Sentar-se no assento 6", "Sentar-se no assento 7", "Sentar-se no assento 8", "Sentar-se no assento 9", "Sentar-se no assento 10", "Sentar-se no assento 11", "Sentar-se no assento 12", "Sentar-se no assento 13", "Sentar-se no assento 14", "Sentar-se no assento 15", "Sentar-se no assento 16", "Sentar-se no assento 17", "Sentar-se no assento 18", "Sentar-se no assento 19", "Sentar-se no assento 20", "Sentar-se no assento 21", "Sentar-se no assento 22", "Sentar-se no assento 23", "Sentar-se no assento 24", "Sentar-se no assento 25", "Sentar-se no assento 26", "Sentar-se no assento 27", "Sentar-se no assento 28", "Sentar-se no assento 29", "Sentar-se no assento 30", "Sentar-se no assento 31", "Sentar-se no assento 32", "Sentar-se no assento 33", "Sentar-se no assento 34", "Sentar-se no assento 35", "Sentar-se no assento 36", "Sentar-se no assento 37", "Sentar-se no assento 38", "Sentar-se no assento 39", "Sentar-se no assento 40", "Sentar-se no assento 41", "Sentar-se no assento 42", "Sentar-se no assento 43", "Sentar-se no assento 44", "Sentar-se no assento 45", "Sentar-se no assento 46", "Sentar-se no assento 47", "Sentar-se no assento 48", "Sentar-se no assento 49", "Sentar-se no assento 50", "Move to Driver", "Move to Co-Pilot", "Mover para o atirador 1", "Mover para o atirador 2", "Mover para o atirador 3", "Mover para o atirador 4", "Mover para o atirador 5", "Mover para o atirador 6", "Mover para o atirador 7", "Mover para o atirador 8", "Mover para o atirador 9", "Mover para o atirador 10", "Mover para o atirador 11", "Mover para o atirador 12", "Mover para o atirador 13", "Mover para o atirador 14", "Mover para o atirador 15", "Mover para o atirador 16", "Mover para o atirador 17", "Mover para o atirador 18", "Mover para o atirador 19", "Mover para o atirador 20", "Mover para o assento 1", "Mover para o assento 2", "Mover para o assento 3", "Mover para o assento 4", "Mover para o assento 5", "Mover para o assento 6", "Mover para o assento 7", "Mover para o assento 8", "Mover para o assento 9", "Mover para o assento 10", "Mover para o assento 11", "Mover para o assento 12", "Mover para o assento 13", "Mover para o assento 14", "Mover para o assento 15", "Mover para o assento 16", "Mover para o assento 17", "Mover para o assento 18", "Mover para o assento 19", "Mover para o assento 20", "Mover para o assento 21", "Mover para o assento 22", "Mover para o assento 23", "Mover para o assento 24", "Mover para o assento 25", "Mover para o assento 26", "Mover para o assento 27", "Mover para o assento 28", "Mover para o assento 29", "Mover para o assento 30", "Mover para o assento 31", "Mover para o assento 32", "Mover para o assento 33", "Mover para o assento 34", "Mover para o assento 35", "Mover para o assento 36", "Mover para o assento 37", "Mover para o assento 38", "Mover para o assento 39", "Mover para o assento 40", "Mover para o assento 41", "Mover para o assento 42", "Mover para o assento 43", "Mover para o assento 44", "Mover para o assento 45", "Mover para o assento 46", "Mover para o assento 47", "Mover para o assento 48", "Mover para o assento 49", "Mover para o assento 50", "Controle Sirene", "Master On", "Sirene Master", "Controle Direcional", "Direcional Master", "Buzina de Ar", "Buzina Eletrica", "Buzina de Ar Eletrica", "Rumbler Manual", "T3 Yelp", "Radar Master", "Radar Traseiro", "Radar Frontal", "Resetar Radar", "Ligar/Desligar Laptop", "Acessar Banco de Dados", "Girar Laptop", "Luz Lateral Direita", "Luz Lateral Esquerda", "Alternar Spotlight", "Toggle Controller Cover", "Toggle DS Front Outrigger", "Toggle DS Rear Outrigger", "Toggle PS Front Outrigger", "Toggle PS Rear Outrigger", "Toggle/Raise DS Outriggers", "Toggle/Raise PS Outriggers", "DS Floodlights", "PS Floodlights", "Perimeter Lights", "Ladder Floodlight", "Ladder Cam", "Usar Maca", "Grab Left Lifebuoy", "Put Back Left Lifebuoy", "Grab Right Lifebuoy", "Put Back Right Lifebuoy", "Subir no Iate", "Rear Floodlights", "Interior Lights", "Enter as Ladder Operator", "Segurar Adaptador de Mangueira", "Conectar Mangueira ao Adaptador", "Enrolar Mangueira", "Abrir\Fechar Porta", "Turn On\Off Pump", "Camera Reversa", "Entrar Como Co-Motorista", "Lower/Raise Ladder Rack", "Pegar Escadas", "Colocar Escada de Volta", "Colocar de Volta Mangueira 1", "Colocar de Volta Mangueira 2", "Colocar de Volta Mangueira 3", "Colocar de Volta Mangueira 4", "Colocar de Volta Mangueira 5", "Pegar Mangueira 1", "Pegar Mangueira 2", "Pegar Mangueira 3", "Pegar Mangueira 4", "Pegar Mangueira 5", "Abrir\Fechar Porta", "Lock/Unlock Locker", "Checar Item", "Coletar Item", "Vender Item", "Comprar Item", "Usar Jerry Can", "Esfolar Animal", "Entiquetar Carne", "Loja de Roupas", "Roubar Loja", "Subir Escada", "Descer Escada", "Apreender Veiculo", "Roubar Objeto", "Guardar Aeronave", "Pintar Aeronave", "Tentar Destrancar", "Evidencias Fisicas", "Evidencias Virtuais", "Acessar Conta da Facção"
];
publicVariable "Config_GenArray";

Config_QuickActions = [
    ["", "Porta", {
        [] call Caue_Intersect_HandleDoors;
    }],
    ["", "Porta da Garagem", {
        [] call Caue_Intersect_HandleDoors;
    }],
    ["", "Porta-malas", {
        private["_obj"];
        _obj = (call Caue_Intersect_CursorTarget);
        if (_obj animationPhase "trunk" < 0.5) then {
            _obj animate["trunk", 1];
        } else {
            _obj animate["trunk", 0]
        };
    }],
    ["A3PL_Distillery", "Instalar Mangueira", {
        [player_objIntersect] call A3PL_Moonshine_InstallHose;
    }],
    ["A3PL_Distillery_Hose", "Conectar Jarro na Mangueira", {
        [player_objIntersect] call A3PL_Moonshine_InstallJug;
    }],
    ["A3PL_Distillery", "Iniciar Destilaria", {
        [player_objIntersect] spawn A3PL_Moonshine_Start;
    }],
    ["A3PL_Distillery", "Checar Destilaria", {
        [player_objIntersect] call A3PL_Moonshine_CheckStatus;
    }],
    ["A3PL_Distillery", "Adicionar Item a Destilaria", {
        [player_objIntersect] call A3PL_Moonshine_addItem;
    }],
    ["A3PL_Mixer", "Moer trigo em malte", {
        ["malt", player_objIntersect] call A3PL_Moonshine_Grind;
    }],
    ["A3PL_Mixer", "Moer trigo em fermento", {
        ["yeast", player_objIntersect] call A3PL_Moonshine_Grind;
    }],
    ["A3PL_Mixer", "Moer milho em fubá", {
        ["cornmeal", player_objIntersect] call A3PL_Moonshine_Grind;
    }],
    ["A3PL_Mixer", "Moer maconha", {
        [player_objintersect] call A3PL_JobFarming_Grind;
    }],
    ["A3PL_Mixer", "Pegar maconha moída", {
        [player_objintersect] call A3PL_JobFarming_GrindCollect;
    }],
    ["A3PL_Scale", "Ensacar maconha", {
        [player_objintersect] call A3PL_JobFarming_BagOpen;
    }],
    ["A3PL_Scale", "Bolar Maconha", {
        [player_objintersect] call A3PL_JobFarming_BluntMake;
    }],
    ["A3PL_WorkBench", "Secar erva", {
        if ((player_itemClass == "cannabis_bud") && (typeOf Player_Item == "A3PL_Cannabis_Bud")) then {
            [Player_Item] call A3PL_JobFarming_CureLoop;
            [] call A3PL_Placeables_QuickAction;
        } else {
            ["Você não parece estar segurando um bud para secar", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["A3PL_Cannabis_Bud", "Checar status", {
        [player_objintersect] call A3PL_JobFarming_CheckCured;
    }],
    ["plp_ct_FootlockerBrown", "", {
        [player_objintersect] call Caue_Housing_VirtualOpen;
    }],
    ["Land_Sleeping_bag_folded_F", "", {
        [player_objintersect] spawn Caue_Robbery_ItemsOpen;
    }],
    ["plp_ct_WoodBoxLightBig", "", {
        private _target = call Caue_Intersect_CursorTarget;
        if !((typeOf _target) isEqualTo "plp_ct_WoodBoxLightBig") exitwith {};
        if ((player_objIntersect getVariable ["vitems",[]]) isEqualTo []) then {
            player action ["Gear",_target];
        } else {
            [_target] spawn Caue_Robbery_ItemsOpen;
        };
    }],
    ["A3PL_Roadcone", "Juntar Cone", {
        [player_objintersect] call A3PL_Placeables_StackCone;
    }],
    ["A3PL_RoadCone_x10", "Juntar Cone", {
        [player_objintersect] call A3PL_Placeables_StackCone;
    }],
    ["A3PL_carInfo", "Info Veiculo", {
        [(format["%1", player_objIntersect])] call Caue_Shop_Open;
    }],
    ["", "Pintar Aeronave", {
        [player_objintersect] spawn A3PL_Garage_Open;
    }],
    ["A3PL_Net", "Comprar/Vender Rede", {
        [(format["%1", player_objIntersect])] call Caue_Shop_Open;
    }],
    ["A3PL_Bucket", "Comprar/Vender Balde", {
        [(format["%1", player_objIntersect])] call Caue_Shop_Open;
    }],
    ["A3PL_Crate", "Comprar/Vender Item", {
        [(format["%1", player_objIntersect])] call Caue_Shop_Open;
    }],
    ["A3PL_Seed_Marijuana", "Buy/Sell Marijuana Seeds", {
        [(format["%1", player_objIntersect])] call Caue_Shop_Open;
    }],
    ["A3PL_Seed_Lettuce", "Buy/Sell Lettuce Seeds", {
        [(format["%1", player_objIntersect])] call Caue_Shop_Open;
    }],
    ["A3PL_MarijuanaBag", "Buy/Sell Weed Bag", {
        [(format["%1", player_objIntersect])] call Caue_Shop_Open;
    }],
    ["A3PL_Seed_Wheat", "Buy/Sell Wheat Seeds", {
        [(format["%1", player_objIntersect])] call Caue_Shop_Open;
    }],
    ["A3PL_Seed_Corn", "Buy/Sell Corn Seeds", {
        [(format["%1", player_objIntersect])] call Caue_Shop_Open;
    }],
    ["", "Colocar Hamburger", {
        private["_attached", "_playerItem"];

        if (isNull player_item) exitwith {
            ["Você não tem nada na sua mão para colocar aqui", Color_Red] call A3PL_HUD_Notification;
        };

        _class = player_itemclass;
        if (!(_class IN["burger_raw", "burger_burnt", "burger_cooked", "fish_raw", "fish_cooked", "fish_burned"])) exitwith {
            ["Você só pode colocar hambúrgueres/peixe na grelha", Color_Red] call A3PL_HUD_Notification;
        };

        if (!isNull Player_Item) exitwith {
            _playeritem = Player_Item;
            [] call A3PL_Placeables_QuickAction;


            if (isNull(attachedTo _playeritem)) exitwith {};
            if ((typeOf(attachedTo _playeritem)) IN["A3PL_Mcfisher_Grill"]) exitwith {
                [_playeritem] call A3PL_JobMcfisher_CookBurger;
            };
        };
    }],
    ["RoadCone_F", "", {
        private["_name"];
        _name = Player_NameIntersect;
        if (_name != "") exitwith {};
        [] call A3PL_Placeables_QuickAction;

    }],
    ["", "Pegar Movel", {
        private["_name"];
        if (!isNull player_item) exitwith {
            ["Você não pode pegar/soltar este item porque tem algo na sua mão", Color_Red] call A3PL_HUD_Notification;
        };
        _name = Player_NameIntersect;
        [] call A3PL_Placeables_QuickAction;
    }],
    ["C_man_1", "", {
        _attachedObjects = [] call A3PL_Lib_Attached;
        if ((count _attachedObjects) == 0) exitwith {};
        _attachedObject = _attachedObjects select 0;

        if (((typeOf _attachedObject) IN Config_Placeables) OR(_attachedObject isKindOf "A3PL_Furniture_Base")) then {
            if (_attachedObject isKindOf "A3PL_Furniture_Base") then {
                if (isOnRoad player) then {
                    ["Você não pode colocar móveis na rua!", Color_Red] call A3PL_HUD_Notification;
                } else {
                    [] call A3PL_Placeables_QuickAction;
                };
            } else {
                [] call A3PL_Placeables_QuickAction;
            };
        };
    }],
    ["", "Colocar Item", {
        if !(isNull Player_Item) exitwith {
            [] call A3PL_Placeables_QuickAction;
        };

        private _attached = [] call A3PL_Lib_Attached;
        if ((count _attached) isEqualTo 0) exitwith {};

        if ((typeOf (_attached select 0)) IN Config_Placeables) then {
            [] call A3PL_Placeables_QuickAction;
        };
    }],
    ["GroundWeaponHolder", "", {
        private _gear = call Caue_Intersect_CursorTarget;
        if !((typeOf _gear) isEqualTo "GroundWeaponHolder") exitwith {};
        player action ["Gear",_gear];
    }],
    ["plp_ct_WoodBoxLightMedium", "", {
        private _gear = call Caue_Intersect_CursorTarget;
        if !((typeOf _gear) isEqualTo "plp_ct_WoodBoxLightMedium") exitwith {};
        player action ["Gear",_gear];
    }],
    ["A3PL_PileCash", "Roubar Dinheiro", {
        [player_objintersect] spawn Caue_BHeist_PickCash;
    }],
    ["A3PL_Drill_Bank", "Instalar Broca", {
        [player_objintersect] call Caue_BHeist_InstallBit;
    }],
    ["A3PL_Drill_Bank", "Remover Furadeira", {
        [player_objintersect] call Caue_BHeist_PickupDrill;
    }],
    ["A3PL_Drill_Bank", "Ligar Furadeira", {
        [player_objintersect] spawn Caue_BHeist_StartDrill;
    }],
    ["", "Menu Medico", {
        [player_objintersect] spawn Caue_Medical_Open;
    }],
    ["", "Pegar Entrega", {
        [player_objintersect] call A3PL_Delivery_Pickup;
    }],
    ["", "Pegar Item", {
        [player_objintersect] spawn Caue_Inventory_Pickup;
    }],
    ["", "Checar Item", {
        [player_objintersect] call Caue_Factory_CrateCheck;
    }],
    ["", "Coletar Item", {
        [player_objintersect] call Caue_Factory_CrateCollect;
    }],
    ["", "Comprar Item", {
        [player_objintersect] call A3PL_Business_BuyItem;
    }],
    ["", "Vender Item", {
        [player_objintersect] call A3PL_Business_Sell;
    }],
    ["A3PL_OilBarrel", "Colocar Gasolina No Tanque", {
        [player_objintersect] call A3PL_Hydrogen_LoadPetrol;
    }],
    ["A3PL_OilBarrel", "Colocar Gasolina No Posto", {
        if !([] call Caue_Player_AntiSpam) exitWith {};
        if (true) exitWith {["Desabilitado",Color_Red] call A3PL_HUD_Notification;};

        private _barrel = player_objIntersect;
        if (isNull _barrel) exitWith {};
        if !((typeOf _barrel) isEqualTo "A3PL_OilBarrel") exitWith {};

        private _tanker = nil;
        _tanker = (nearestObjects [player,["Land_A3PL_Gas_Station"],10]) select 0;
        if (isNil "_tanker") exitwith {["Não é possível encontrar um tanque de posto nas proximidades",Color_Red] call A3PL_HUD_Notification;};
        if ((player distance (_tanker modelToWorld [-4.70166,4.26172,0.00123072])) > 3.5) exitwith {["Va mais perto do tanque de gasolina do posto",Color_Red] call A3PL_HUD_Notification;};

        deleteVehicle _barrel;
        _tanker setVariable ["petrol",(_tanker getVariable ["petrol",0]) + 21,true];
        [format ["Você carregou o posto com gasolina (agora há %1 galões no tanque)",(_tanker getVariable ["petrol",0])],Color_Green] call A3PL_HUD_Notification;
    }],
    ["A3PL_Kerosene", "Colocar Querosene No Tanque", {
        [player_objintersect] call A3PL_Hydrogen_LoadKerosene;
    }],
    ["", "Pegar Item Na Mão", {
        [player_objintersect, true] call Caue_Inventory_Pickup;
    }],
    ["A3PL_DeliveryBox", "Verificar Rótulo de Entrega", {
        [player_objintersect] call A3PL_Delivery_Label;
    }],
    ["Land_A3PL_Cinema", "Pegar Pipoca", {
        [] call Caue_Items_GrabPopcorn;
    }],
    ["", "Colher Planta", {
        [player_objintersect] call A3PL_JobFarming_Harvest;
    }],
    ["", "Criar Hambúrguer De Peixe", {
        [player_objintersect] call A3PL_JobMcfisher_CombineBurger;
    }],
    ["A3PL_TacoShell", "Criar Taco De Peixe", {
        [player_objintersect, "taco"] call A3PL_JobMcfisher_CombineBurger;
    }],
    ["A3PL_FishingBuoy", "Coletar Rede", {
        [player_objintersect] call A3PL_JobFisherman_RetrieveNet;
    }],
    ["A3PL_FishingBuoy", "Soltar Rede", {
        [] call A3PL_JobFisherman_DeployNet;
    }],
    ["A3PL_FishingBuoy", "Colocar Isca Na Rede", {
        [player_objintersect] call A3PL_JobFisherman_Bait;
    }],
    ["A3PL_Planter2", "Plantar Semente", {
        [player_objintersect] call A3PL_JobFarming_PlanterPlant;
    }],
    ["Land_A3PL_Greenhouse", "Plantar Semente", {
        [player_objintersect] call A3PL_JobFarming_GreenHousePlant;
    }],
    ["A3PL_GasHose", "Pegar Mangueira de Gasolina", {
        [player_objintersect] spawn A3PL_Hydrogen_Grab;
    }],
    ["Land_A3PL_Gasstation", "Retornar Mangueira de Gasolina", {
        [player_objintersect] call A3PL_Hydrogen_Connect;
    }],
    ["A3PL_GasHose", "Ativar/Desativar Bomba", {
        [player_objintersect] spawn A3PL_Hydrogen_SwitchFuel;
    }],
    ["A3PL_Rocket", "Acender Foguete", {
        [player_objintersect] call Caue_Items_IgniteRocket;
    }],
    ["A3PL_FD_HoseEnd1_Float", "Conectar Mangueira Enrolada", {
        [player_objintersect] call A3PL_FD_ConnectHose;
    }],
    ["Land_A3PL_FireHydrant", "Conectar Adaptador de Mangueira", {
        [player_objintersect] call A3PL_FD_ConnectAdapter;
    }],
    ["Land_A3PL_Gas_Station", "Conectar Adaptador de Mangueira", {
        [player_objintersect] call A3PL_FD_ConnectAdapter;
    }],
    ["Land_A3PL_Gas_Station", "Switch Gas Storage Switch", {
        [player_objintersect] call A3PL_Hydrogen_StorageSwitch
    }],
    ["Land_A3PL_FireHydrant", "Conectar Chave de Hidrante", {
        [player_objintersect] call A3PL_FD_ConnectWrench;
    }],
    ["", "Segurar Adaptador de Mangueira", {
        [player_objintersect] call A3PL_FD_GrabHose;
    }],
    ["", "Conectar Mangueira ao Adaptador", {
        [player_objintersect] call A3PL_FD_ConnectHoseAdapter;
    }],
    ["", "Enrolar Mangueira", {
        [player_objintersect] call A3PL_FD_RollHose;
    }],
    ["A3PL_FD_yAdapter", "Conectar Mangueira à Entrada", {
        [player_objintersect, player_nameintersect] call A3PL_FD_ConnectHoseAdapter;
    }],
    ["A3PL_FD_yAdapter", "Conectar Mangueira à Saída", {
        [player_objintersect, player_nameintersect] call A3PL_FD_ConnectHoseAdapter;
    }],
    ["A3PL_Tanker_Trailer", "Conectar Mangueira ao Tanque", {
        [player_objintersect, player_nameintersect] call A3PL_FD_ConnectHoseAdapter;
    }],
    ["A3PL_FD_HydrantWrench_F", "Abrir Hidrante", {
        [player_objintersect] call A3PL_FD_WrenchRotate;
    }],
    ["A3PL_FD_HydrantWrench_F", "Fechar Hidrante", {
        [player_objintersect] call A3PL_FD_WrenchRotate;
    }],
    ["", "Algemar", {
        [player_objintersect,"handcuffs"] call Caue_Police_Cuff;
    }],
    ["", "Desalgemar", {
        if ((player getVariable ["job","unemployed"]) IN ["police","dmv"]) then {
            [player_objintersect,"handcuffs"] call Caue_Police_UnCuff;
        } else {
            if (Player_ItemClass != "lockpick") exitWith {["Você precisa de uma chave mestra para abrir as algemas",Color_Red] call A3PL_HUD_Notification;};
            private _target = player_objintersect;
            [player,["lockpick",50,1]] remoteExec ["say3D",-2];
            if ([25,"Tentando desalgemar...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default"] call Caue_HUD_Progress) then {
                if ((round(random 100)) >= 70) then {
                    [_target,"handcuffs"] call Caue_Police_UnCuff;
                } else {
                    ["lockpick",-1] call Caue_Inventory_Add;
                    [false] call Caue_Inventory_PutBack;
                    ["A chave mestra quebrou",Color_Red] call A3PL_HUD_Notification;
                };
            } else {
                ["Cancelado",Color_Red] call A3PL_HUD_Notification;
            };
        };
    }],
    ["", "Amarrar", {
        [player_objintersect,"rope"] call Caue_Police_Cuff;
    }],
    ["", "Desamarrar", {
        private _target = player_objintersect;
        if ([30,"Desamarrando...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default"] call Caue_HUD_Progress) then {
            [_target,"rope"] call Caue_Police_UnCuff;
        } else {
            ["Cancelado",Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["Land_Rope_01_F", "", {
        [player_objintersect] spawn Caue_Inventory_Pickup;
    }],
    ["", "Dar Multa", {
        [player_objintersect] call Caue_Police_TicketGive;
    }],
    ["", "Chutar", {
        [player_objintersect] call Caue_Police_CuffKick;
    }],
    ["", "Revistar", {
        [cursorObject] spawn Caue_Robbery_PatDownAction;
    }],
    ["", "Arrastar", {
        [player_objintersect] call Caue_Police_Drag;
    }],
    ["", "Ejetar Passageiros", {
        if !(isNil "UnDetain_Target") exitWith {};
        UnDetain_Target = player_objintersect;
        if ([10,"Removendo passageiros...","\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa","default",{((player distance UnDetain_Target) < 5) && ((speed UnDetain_Target) < 5)}] call Caue_HUD_Progress) then {
            [player_objintersect] call Caue_Police_UnDetain;
        } else {
            ["Cancelado",Color_Red] call A3PL_HUD_Notification;
        };
        UnDetain_Target = nil;
    }],
    ["", "Colocar no Veiculo", {
        [player_objintersect] call Caue_Police_Detain;
    }],
    ["A3PL_Stinger", "Deploy Stinger", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Deploy_Stinger" < 0.5) then {
            _veh animateSource["Deploy_Stinger", 1];
        } else {
            ["System: Stinger is already deployed", Color_Red] call A3PL_HUD_Notification;
        };

    }],
    ["A3PL_Stinger", "Retract Stinger", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Deploy_Stinger" > 0.5) then {
            _veh animateSource["Deploy_Stinger", 0];

        } else {
            ["System: Stinger is not deployed", Color_Red] call A3PL_HUD_Notification;
        };

    }],
    ["", "Entiquetar Carne", {
        [player_objintersect] call A3PL_Hunting_Tag;
    }],
    ["A3PL_Patrol", "Open/Close Door", {
        private["_veh", "_name"];
        _veh = player_objintersect;
        _name = Player_NameIntersect;
        if (_name != "boatdoor") exitwith {};

        if (_veh animationPhase "boatdoor" < 0.5) then {
            _veh animate["boatDoor", 1];
        } else {
            _veh animate["boatDoor", 0];
        };
    }],
    ["A3PL_Patrol", "Toggle Pump", {
        private["_veh", "_name"];
        _veh = player_objintersect;
        _name = Player_NameIntersect;
        if (_name != "extPump") exitwith {};

        if (_veh animationPhase "extPump" < 0.1) then {
            _veh animate["extPump", 1];

            [_veh] remoteExec ["A3PL_USCG_WaterCannon",0];
        } else {
            _veh animate["extPump", 0];
        };
    }],
    ["A3PL_Patrol", "Toggle Pressure", {
        private["_veh", "_name"];
        _veh = player_objintersect;
        _name = Player_NameIntersect;
        if (_name != "extPressure") exitwith {};

        if (_veh animationPhase "extPressure" < 0.4) then {
            _veh animate["extPressure", 0.5];
        };

        if ((_veh animationPhase "extPressure" > 0.4) && (_veh animationPhase "extPressure" < 0.6)) then {
            _veh animate["extPressure", 1];
        };

        if (_veh animationPhase "extPressure" > 0.6) then {
            _veh animate["extPressure", 0];
        };
    }],
    ["A3PL_Jayhawk", "Board Helicopter (Seat)", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};
        [_veh] spawn {
            private["_veh"];
            _veh = _this select 0;
            _veh animate["door3", 1];
            sleep 0.5;
            _veh lock 1;
            moveOut player;
            _value = getNumber(configFile >> "CfgVehicles" >> (typeOf _veh) >> "transportSoldier");
            _list = fullCrew[_veh, "cargo"];
            _freeseats = count _list;
            if (_freeseats >= _value) exitwith {};
            player action["GetInCargo", _veh];
            _veh lock 2;
        };
    }],
    ["A3PL_Jayhawk", "Board Helicopter (Side)", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};
        [_veh] spawn {
            private["_veh"];
            _veh = _this select 0;
            _veh lock 1;
            moveOut player;
            player action["GetInTurret", _veh, [1]];
            _veh lock 2;
        };
    }],
    ["A3PL_Jayhawk", "Switch Battery", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};

        if (_veh animationPhase "Battery" < 0.5) exitwith {
            _veh animate["battery", 1];
            playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
        };
        _veh animate["battery", 0];
        playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
    }],
    ["A3PL_Jayhawk", "APU Generator", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};

        if (_veh animationPhase "gen1" < 0.5) exitwith {
            if (_veh animationPhase "battery" < 0.5) exitwith {
                hintSilent "Battery is off"
            };
            if (_veh animationPhase "ecs" < 0.5) exitwith {
                hintSilent "ECS is not on APU Boost"
            };
            if (_veh animationPhase "fuelpump" > 0.5) exitwith {
                hintSilent "Fuel Pump is not on APU Boost"
            };
            if (_veh animationPhase "apucontrol" < 0.5) exitwith {
                hintSilent "APU Control is not on APU Boost"
            };

            _veh animate["gen1", 1];
            playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
        };
        _veh animate["gen1", 0];
        playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
    }],
    ["A3PL_Jayhawk", "ENG Generator NO.1", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};

        if (_veh animationPhase "gen2" < 0.5) exitwith {
            _veh animate["gen2", 1];
            playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
        };
        _veh animate["gen2", 0];
        playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
    }],
    ["A3PL_Jayhawk", "ENG Generator NO.2", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};

        if (_veh animationPhase "gen3" < 0.5) exitwith {
            _veh animate["gen3", 1];
            playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
        };
        _veh animate["gen3", 0];
        playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
    }],
    ["A3PL_Jayhawk", "ECS/Start", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};

        if (_veh animationPhase "ecs" < 0.5) exitwith {
            _veh animate["ecs", 1];
            playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
        };
        _veh animate["ecs", 0];
        playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
    }],
    ["A3PL_Jayhawk", "Fuel Pump", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};

        if (_veh animationPhase "fuelpump" < 0.5) exitwith {
            _veh animate["fuelpump", 1];
            playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
        };
        _veh animate["fuelpump", 0];
        playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
    }],
    ["A3PL_Jayhawk", "APU Control", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};

        if (_veh animationPhase "apucontrol" < 0.5) exitwith {
            _veh animate["apucontrol", 1];
            playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
        };
        _veh animate["apucontrol", 0];
        playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
    }],
    ["A3PL_Jayhawk", "Windshield", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};

        if (_veh animationPhase "Windshield" < 0.5) exitwith {
            _veh animateSource["Windshield", 0.1];
            playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
            [_veh] spawn {
                private["_veh"];
                _veh = _this select 0;
                if (_veh animationPhase "battery" < 0.5) exitwith {
                    _veh animateSource["Windshield", 0];
                };
                _veh animateSource["Windshield", 1];
                waitUntil {
                    _veh animationSourcePhase "battery" > 0.99
                };
                _veh animateSource["Windshield", 0.1];
                waitUntil {
                    _veh animationSourcePhase "battery" < 0.15
                };
            };
        };
        _veh animateSource["Windshield", 0];
        playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
    }],
    ["A3PL_Jayhawk", "Switch Ignition", {
        private["_veh"];
        _veh = player_objintersect;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};

        if (_veh animationPhase "ignition_Switch" > 0.5) exitwith {
            _veh animate["ignition_Switch", 0];
            _veh engineOn false;
            playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
        };
        if (_veh animationPhase "ignition_Switch" < 0.5) exitwith {
            if (_veh animationPhase "battery" < 0.5) exitwith {
                hintSilent "Battery is off"
            };
            if (_veh animationPhase "ecs" > 0.5) exitwith {
                hintSilent "ECS is not on Engine"
            };
            if (_veh animationPhase "fuelpump" < 0.5) exitwith {
                hintSilent "Fuel Pump is not on Fuel Prime"
            };
            if (_veh animationPhase "apucontrol" < 0.5) exitwith {
                hintSilent "APU Control is not on APU Boost"
            };
            if (_veh animationPhase "gen1" < 0.5) exitwith {
                hintSilent "APU is OFF"
            };
            if (_veh animationPhase "ctail" > 0.5) exitwith {
                hintSilent "Helicopter is not unfolded"
            };

            if (_veh animationPhase "gen2" < 0.5) exitwith {
                hintSilent "Generator 2 is not turned on"
            };
            if (_veh animationPhase "gen3" < 0.5) exitwith {
                hintSilent "Generator 3 is not turned on"
            };

            _veh animate["gen1", 0];
            _veh animate["ignition_Switch", 1];
            [_veh] spawn {
                private['_veh'];
                _veh = _this select 0;
                sleep 1;
                _veh engineOn true;
            };
            playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
        };
        _veh animate["ignition_Switch", 0];
        playSound3D["a3\ui_f\data\Sound\CfgCutscenes\repair.wss", player];
    }],
    ["", "Toggle Floats", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Batteries" < 0.9) exitwith {
            ["Airplane: Battery is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "Floats" < 0.5) then {
            _veh animateSource["Floats", 1];
        } else {
            _veh animateSource["Floats", 0];
        };
    }],
    ["", "Toggle Fuelpump", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Batteries" < 0.9) exitwith {
            ["Airplane: Battery is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "Fuelpump" < 0.5) then {
            _veh animateSource["Fuelpump", 1];
        } else {
            _veh animateSource["Fuelpump", 0];
        };
    }],
    ["", "Toggle Gear", {
        _veh = player_objintersect;
        if (_veh animationSourcePhase "Batteries" < 0.9) exitwith {
            ["Airplane: Battery is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "Gear" < 0.5) then {
            player action["LandGearUp", _veh];
        } else {
            player action["LandGear", _veh];
        };
    }],
    ["", "Toggle Battery", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Batteries" < 0.9) then {
            _veh animateSource["Batteries", 1];
        } else {
            _veh animateSource["Batteries", 0];
        };
    }],
    ["", "Adjust Flaps Downward", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Batteries" < 0.9) exitwith {
            ["Airplane: Battery is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "Flaps" < 0.5) then {
            _veh animateSource["Flaps", 0.5];
            player action["flapsDown", _veh];
        } else {
            if (_veh animationSourcePhase "Flaps" == 0.5) then {
                _veh animateSource["Flaps", 1];
                player action["flapsDown", _veh];
            };
        };
    }],
    ["", "Adjust Flaps Upward", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Batteries" < 0.9) exitwith {
            ["Airplane: Battery is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "Flaps" > 0.5) then {
            _veh animateSource["Flaps", 0.5];
            player action["flapsUp", _veh];
        } else {
            if (_veh animationSourcePhase "Flaps" == 0.5) then {
                _veh animateSource["Flaps", 0];
                player action["flapsUp", _veh];
            };
        };
    }],
    ["", "Switch Generator", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Batteries" < 0.9) exitwith {
            ["Airplane: Battery is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "Generator" < 0.5) then {
            _veh animateSource["Generator", 1];
        } else {
            _veh animateSource["Generator", 0];
        };
    }],
    ["", "Switch Ignition/Starter", {
        private["_veh"];
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Batteries" < 0.9) exitwith {
            ["Airplane: Battery is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "Generator" < 0.9 && (_veh isKindOf "A3PL_Goose_Base")) exitwith {
            ["Airplane: Generator is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "Fuelpump" < 0.9) exitwith {
            ["Airplane: Fuel Pump is turned off", Color_Red] call A3PL_HUD_Notification;
        };
                if (_veh animationSourcePhase "Ignition" < 0.9) then {
            if (!(_veh getVariable["clearance", false])) exitwith {
                ["Aircraft: No ATC clearance, please switch to 126mhz for clearance", Color_Red] call A3PL_HUD_Notification;
            };
            _veh animateSource["Ignition", 1];
            uiSleep 0.5;
            _veh engineOn true;
        } else {

            _veh animateSource["Ignition", 0];
            _veh engineOn false;


        };
    }],
    ["", "Switch Ignition/Starter Left", {
        private["_lEngRPM1", "_veh", "_leftEngineOn"];

        _veh = player_objintersect;
        if (!(_veh isKindOf "A3PL_Goose_Base")) exitwith {};
        if (_veh animationSourcePhase "goose_bat" < 0.9) exitwith {
            ["Airplane: Battery is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "goose_gen" < 0.9) exitwith {
            ["Airplane: Generator is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "goose_fuelpump" < 0.9) exitwith {
            ["Airplane: Fuel Pump is turned off", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "goose_ign" == 0.5) then {

            _lEngRPM1 = _veh animationPhase "rotorL";
            uiSleep 0.1;
            if (_lEngRPM1 == (_veh animationPhase "rotorL")) then {
                _leftEngineOn = false;
            } else {
                _leftEngineOn = true;
            };


            if (_leftEngineOn) then {
                _veh animate["rotorL", (_veh animationPhase "rotorL")];
                _veh animateSource["goose_ign", 0];
            } else {
                if (!isEngineOn _veh) exitwith {
                    ["Airplane: Startup the right engine first", Color_Red] call A3PL_HUD_Notification;
                };
                _veh animateSource["goose_ign", 0];
                _veh animate["rotorL", 10000];
            };

            _t = 0;
            waituntil {
                sleep 1;
                _t = _t + 1;
                if (_t > 4) exitwith {};
                _veh animationSourcePhase "goose_ign" == 0
            };
            _veh animateSource["goose_ign", 0.5];
        };
    }],
    ["", "Estender/Recuar Escada", {
        [player_objintersect, "ladder", false] call A3PL_Lib_ToggleAnimation;
    }],
    ["", "Pegar Escada", {
        [player_objintersect] spawn A3PL_Pickup_Ladder;
    }],
    ["", "Climb Up Ladder 1", {
        private["_veh"];
        _veh = player_objIntersect;
        player action["ladderUp", _veh, 0, 0];


    }],
    ["", "Climb Up Ladder 2", {
        private["_veh"];
        _veh = player_objIntersect;
        player action["ladderUp", _veh, 1, 0];


    }],
    ["", "Climb Up Ladder 3", {
        private["_veh"];
        _veh = player_objIntersect;
        player action["ladderUp", _veh, 2, 0];


    }],
    ["", "Climb Up Ladder 4", {
        private["_veh"];
        _veh = player_objIntersect;
        player action["ladderUp", _veh, 3, 0];


    }],
    ["", "Climb Up Ladder 5", {
        private["_veh"];
        _veh = player_objIntersect;
        player action["ladderUp", _veh, 4, 0];


    }],
    ["", "Climb Down Ladder 1", {
        private["_veh"];
        _veh = player_objIntersect;
        player action["ladderDown", _veh, 0, 1];


    }],
    ["", "Climb Down Ladder 2", {
        private["_veh"];
        _veh = player_objIntersect;
        player action["ladderDown", _veh, 1, 1];


    }],
    ["", "Climb Down Ladder 3", {
        private["_veh"];
        _veh = player_objIntersect;
        player action["ladderDown", _veh, 2, 1];


    }],
    ["", "Climb Down Ladder 4", {
        private["_veh"];
        _veh = player_objIntersect;
        player action["ladderDown", _veh, 3, 1];


    }],
    ["", "Climb Down Ladder 5", {
        private["_veh"];
        _veh = player_objIntersect;
        player action["ladderDown", _veh, 4, 1];


    }],
    ["", "Toggle Collision Lights", {
        _veh = player_objIntersect;
        _collisionLightOn = _veh getVariable["collisionLightOn", true];
        if (_collisionLightOn) then {
            player action["CollisionLightOff", _veh];
            _veh animateSource["collision_lights", 0];
            ["You Turned Collision Lights Off", Color_Red] call A3PL_HUD_Notification;
            player_objIntersect setVariable["collisionLightOn", false, true];
        } else {
            player_objIntersect setVariable["collisionLightOn", true, true];
            player action["CollisionLightOn", _veh];
            _veh animateSource["collision_lights", 1];
            ["You Turned Collision Lights On", Color_Green] call A3PL_HUD_Notification;
        };
    }],
    ["", "Alternar Rampa", {
        _veh = player_objintersect;

        if ((_veh animationSourcePhase "truck_flatbed") < 0.3) then {
            [_veh, 0] spawn A3PL_Vehicle_TowTruck_Ramp_down;
        } else {
            [_veh, -0.230112] spawn A3PL_Vehicle_TowTruck_Ramp_up;
        };
    }],
    ["", "Toggle Rear Spotlight", {
        _veh = player_objintersect;

        if (_veh animationPhase "Spotlights" < 0.5) then {
            _veh animate["Spotlight_Switch", 1];
            _veh animate["Spotlights", 1];
            if (_veh animationSourcePhase "Head_Lights" < 0.5) then {
                player action["lightOn", _veh];
            };

        } else {
            _veh animate["Spotlight_Switch", 0];
            _veh animate["Spotlights", 0];
            if (_veh animationSourcePhase "Head_Lights" < 0.5) then {
                player action["lightOff", _veh];
            };
        };

    }],
    ["", "Enter as Engineer", {
        _veh = player_objIntersect;
        _veh lock 0;
        player action["getInCargo", _veh, 0];
        _veh lock 2;
    }],
    ["", "Enter as Captain", {
        _veh = player_objIntersect;
        _veh lock 0;
        player action["getInTurret", _veh, [1]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner", {
        _veh = player_objIntersect;
        _veh lock 0;
        player action["getInTurret", _veh, [0]];
        _veh lock 2;
    }],
    ["", "Enter as Bow Gunner", {
        _veh = player_objIntersect;
        _veh lock 0;
        player action["getInTurret", _veh, [2]];
        _veh lock 2;
    }],
    ["", "Toggle Left Platform", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Platform_1" == 0) then {
            _veh animate["Platform_1", 1];
        } else {
            _veh animate["Platform_1", 0];
        };
    }],
    ["", "Toggle Right Platform", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Platform_2" == 0) then {
            _veh animate["Platform_2", 1];
        } else {
            _veh animate["Platform_2", 0];
        };
    }],
    ["", "Grab Left Lifebuoy", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Lifebuoy_1" == 0) then {
            _veh animate["Lifebuoy_1", 1];
            ["Lifebuoy", 1] call Caue_Inventory_Add;
            ["Lifebuoy"] call Caue_Inventory_Use;
            sleep 2;
            _Lifebuoy = Player_Item;
            _Lifebuoy setVariable["locked", false, true];
            _rope = ropeCreate[_veh, "Lifebuoy_1_point", _Lifebuoy, [0.00587467, 0.55251, 0.329934], 15];
            _veh setVariable["Left_rope", _rope, true];
        };
    }],
    ["", "Put Back Left Lifebuoy", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Lifebuoy_1" == 1 && player_itemClass == "Lifebuoy") then {
            [false] call Caue_Inventory_PutBack;
            ["Lifebuoy", -1] call Caue_Inventory_Add;
            _veh animate["Lifebuoy_1", 0];
            _rope = _veh getVariable "Left_rope";
            ropeDestroy _rope;
        };
    }],
    ["", "Grab Right Lifebuoy", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Lifebuoy_2" == 0) then {
            _veh animate["Lifebuoy_2", 1];
            ["Lifebuoy", 1] call Caue_Inventory_Add;
            ["Lifebuoy"] call Caue_Inventory_Use;
            sleep 2;
            _Lifebuoy = Player_Item;
            _rope = ropeCreate[_veh, "Lifebuoy_2_point", _Lifebuoy, [0.00587467, 0.55251, 0.329934], 15];
            _Lifebuoy setVariable["locked", false, true];
            _veh setVariable["Right_rope", _rope, true];
        };
    }],
    ["", "Put Back Right Lifebuoy", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Lifebuoy_2" == 1 && player_itemClass == "Lifebuoy") then {
            [false] call Caue_Inventory_PutBack;
            ["Lifebuoy", -1] call Caue_Inventory_Add;
            _veh animate["Lifebuoy_2", 0];
            _rope = _veh getVariable "Right_rope";
            ropeDestroy _rope;
        };
    }],
    ["", "Rear Floodlights", {
        _veh = vehicle player;

        if (_veh animationPhase "Ambo_Switch_7" < 0.5) then {
            _veh animate["Ambo_Switch_7", 1];
            _veh animate["R_Floodlights", 1];
        } else {
            _veh animate["Ambo_Switch_7", 0];
            _veh animate["R_Floodlights", 0];
        };
    }],
    ["", "Interior Lights", {
        _veh = vehicle player;

        if (_veh animationPhase "Ambo_Switch_10" < 0.5) then {
            _veh animate["Ambo_Switch_10", 1];
            _veh animate["Interior_Lights", 1];
        } else {
            _veh animate["Ambo_Switch_10", 0];
            _veh animate["Interior_Lights", 0];
        };
    }],
    ["", "Usar Maca", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Stretcher" == 0) then {
            _veh animateSource["Stretcher", 21];
        } else {
            _veh animateSource["Stretcher", 0];
        };
    }],
    ["", "Pegar Escadas", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Ladder" == 0) then {
            _veh animate["Ladder", 1];
            _Ladder = createVehicle["A3PL_Ladder", position player, [], 0, "CAN_COLLIDE"];
            _Ladder setVariable["class", "Ladder", true];
            [_Ladder] spawn A3PL_Pickup_Ladder;
        };
    }],
    ["", "Colocar Escada de Volta", {
        _veh = player_objIntersect;
        _Ladder = nearestObject[player, "A3PL_Ladder"];
        if (_veh animationPhase "Ladder" == 1) then {
            detach _Ladder;
            deleteVehicle _Ladder;
            _veh animate["Ladder", 0];
        };
    }],
    ["", "Pegar Mangueira 1", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Hose_1" < 0.99) then {
            _val = _veh animationPhase "Hose_1";
            _valu = _val + 0.25;
            if (_valu >= 1) then {
                _valu = 1
            };
            _veh animate["Hose_1", _valu];
            ["FD_Hose", 1] call Caue_Inventory_Add;
            ["FD_Hose"] call Caue_Inventory_Use;
        };
    }],
    ["", "Pegar Mangueira 2", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Hose_2" < 0.99) then {
            _val = _veh animationPhase "Hose_2";
            _valu = _val + 0.25;
            if (_valu >= 1) then {
                _valu = 1
            };
            _veh animate["Hose_2", _valu];
            ["FD_Hose", 1] call Caue_Inventory_Add;
            ["FD_Hose"] call Caue_Inventory_Use;
        };
    }],
    ["", "Pegar Mangueira 3", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Hose_3" < 0.99) then {
            _val = _veh animationPhase "Hose_3";
            _valu = _val + 0.25;
            if (_valu >= 1) then {
                _valu = 1
            };
            _veh animate["Hose_3", _valu];
            ["FD_Hose", 1] call Caue_Inventory_Add;
            ["FD_Hose"] call Caue_Inventory_Use;
        };
    }],
    ["", "Pegar Mangueira 4", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Hose_4" < 0.99) then {
            _val = _veh animationPhase "Hose_4";
            _valu = _val + 0.25;
            if (_valu >= 1) then {
                _valu = 1
            };
            _veh animate["Hose_4", _valu];
            ["FD_Hose", 1] call Caue_Inventory_Add;
            ["FD_Hose"] call Caue_Inventory_Use;
        };
    }],
    ["", "Pegar Mangueira 5", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Hose_5" < 0.99) then {
            _val = _veh animationPhase "Hose_5";
            _valu = _val + 0.25;
            if (_valu >= 1) then {
                _valu = 1
            };
            _veh animate["Hose_5", _valu];
            ["FD_Hose", 1] call Caue_Inventory_Add;
            ["FD_Hose"] call Caue_Inventory_Use;
        };
    }],
    ["", "Colocar de Volta Mangueira 1", {
        _veh = player_objIntersect;

        if (player_itemClass == "FD_Hose") then {
            [false] call Caue_Inventory_PutBack;
            ["FD_Hose", -1] call Caue_Inventory_Add;
            _val = _veh animationPhase "Hose_1";
            _valu = _val - 0.25;
            if (_valu <= 0) then {
                _valu = 0
            };
            _veh animate["Hose_1", _valu];
        };
    }],
    ["", "Colocar de Volta Mangueira 2", {
        _veh = player_objIntersect;

        if (player_itemClass == "FD_Hose") then {
            [false] call Caue_Inventory_PutBack;
            ["FD_Hose", -1] call Caue_Inventory_Add;
            _val = _veh animationPhase "Hose_2";
            _valu = _val - 0.25;
            if (_valu <= 0) then {
                _valu = 0
            };
            _veh animate["Hose_2", _valu];
        };
    }],
    ["", "Colocar de Volta Mangueira 3", {
        _veh = player_objIntersect;

        if (player_itemClass == "FD_Hose") then {
            [false] call Caue_Inventory_PutBack;
            ["FD_Hose", -1] call Caue_Inventory_Add;
            _val = _veh animationPhase "Hose_3";
            _valu = _val - 0.25;
            if (_valu <= 0) then {
                _valu = 0
            };
            _veh animate["Hose_3", _valu];
        };
    }],
    ["", "Colocar de Volta Mangueira 4", {
        _veh = player_objIntersect;

        if (player_itemClass == "FD_Hose") then {
            [false] call Caue_Inventory_PutBack;
            ["FD_Hose", -1] call Caue_Inventory_Add;
            _val = _veh animationPhase "Hose_4";
            _valu = _val - 0.25;
            if (_valu <= 0) then {
                _valu = 0
            };
            _veh animate["Hose_4", _valu];
        };
    }],
    ["", "Colocar de Volta Mangueira 5", {
        _veh = player_objIntersect;

        if (player_itemClass == "FD_Hose") then {
            [false] call Caue_Inventory_PutBack;
            ["FD_Hose", -1] call Caue_Inventory_Add;
            _val = _veh animationPhase "Hose_5";
            _valu = _val - 0.25;
            if (_valu <= 0) then {
                _valu = 0
            };
            _veh animate["Hose_5", _valu];
        };
    }],
    ["", "Toggle Controller Cover", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Controller_Cover" == 0) then {
            _veh animate["Controller_Cover", 1];
        } else {
            _veh animate["Controller_Cover", 0];
        };
    }],
    ["", "Toggle DS Front Outrigger", {
        _veh = vehicle player;

        if (_veh animationPhase "Outrigger_1" == 0) then {
            _veh animate["Outrigger_1", 1];
            _veh animate["Outrigger_1_1_Flash", 1];
            _veh animate["Outrigger_1_2_Flash", 1];
            _veh animate["FT_Switch_1", 1];
        } else {
            _veh animate["Outrigger_1", 0];
            _veh animate["Outrigger_1_1_Flash", 0];
            _veh animate["Outrigger_1_2_Flash", 0];
            _veh animate["FT_Switch_1", 0];
        };
    }],
    ["", "Toggle DS Rear Outrigger", {
        _veh = vehicle player;

        if (_veh animationPhase "Outrigger_2" == 0) then {
            _veh animate["Outrigger_2", 1];
            _veh animate["Outrigger_2_1_Flash", 1];
            _veh animate["Outrigger_2_2_Flash", 1];
            _veh animate["FT_Switch_2", 1];
        } else {
            _veh animate["Outrigger_2", 0];
            _veh animate["Outrigger_2_1_Flash", 0];
            _veh animate["Outrigger_2_2_Flash", 0];
            _veh animate["FT_Switch_2", 0];
        };
    }],
    ["", "Toggle PS Front Outrigger", {
        _veh = vehicle player;

        if (_veh animationPhase "Outrigger_3" == 0) then {
            _veh animate["Outrigger_3", 1];
            _veh animate["Outrigger_3_1_Flash", 1];
            _veh animate["Outrigger_3_2_Flash", 1];
            _veh animate["FT_Switch_3", 1];
        } else {
            _veh animate["Outrigger_3", 0];
            _veh animate["Outrigger_3_1_Flash", 0];
            _veh animate["Outrigger_3_2_Flash", 0];
            _veh animate["FT_Switch_3", 0];
        };
    }],
    ["", "Toggle PS Rear Outrigger", {
        _veh = vehicle player;

        if (_veh animationPhase "Outrigger_4" == 0) then {
            _veh animate["Outrigger_4", 1];
            _veh animate["Outrigger_4_1_Flash", 1];
            _veh animate["Outrigger_4_2_Flash", 1];
            _veh animate["FT_Switch_4", 1];
        } else {
            _veh animate["Outrigger_4", 0];
            _veh animate["Outrigger_4_1_Flash", 0];
            _veh animate["Outrigger_4_2_Flash", 0];
            _veh animate["FT_Switch_4", 0];
        };
    }],
    ["", "Toggle/Raise DS Outriggers", {
        _veh = vehicle player;

        if (_veh animationPhase "OutriggerFoot_1" == 0) then {
            _veh animate["OutriggerFoot_1", 1];
            _veh animate["OutriggerFoot_2", 1];
            _veh animate["FT_Switch_5", 1];
        } else {
            _veh animate["OutriggerFoot_1", 0];
            _veh animate["OutriggerFoot_2", 0];
            _veh animate["FT_Switch_5", 0];
        };
    }],
    ["", "Toggle/Raise PS Outriggers", {
        _veh = vehicle player;

        if (_veh animationPhase "OutriggerFoot_3" == 0) then {
            _veh animate["OutriggerFoot_3", 1];
            _veh animate["OutriggerFoot_4", 1];
            _veh animate["FT_Switch_6", 1];
        } else {
            _veh animate["OutriggerFoot_3", 0];
            _veh animate["OutriggerFoot_4", 0];
            _veh animate["FT_Switch_6", 0];
        };
    }],
    ["", "PS Floodlights", {
        _veh = vehicle player;

        if (_veh animationPhase "PS_Floodlights" == 0) then {
            _veh animate["FT_Switch_9", 1];
            _veh animate["PS_Floodlights", 1];
        } else {
            _veh animate["FT_Switch_9", 0];
            _veh animate["PS_Floodlights", 0];
        };
    }],
    ["", "DS Floodlights", {
        _veh = vehicle player;

        if (_veh animationPhase "DS_Floodlights" == 0) then {
            _veh animate["FT_Switch_8", 1];
            _veh animate["DS_Floodlights", 1];
        } else {
            _veh animate["FT_Switch_8", 0];
            _veh animate["DS_Floodlights", 0];
        };
    }],
    ["", "Perimeter Lights", {
        _veh = vehicle player;

        if (_veh animationPhase "FT_Switch_10" == 0) then {
            _veh animate["FT_Switch_10", 1];
            _veh animate["DS_Floodlights", 1];
            _veh animate["PS_Floodlights", 1];
            _veh animate["FT_Switch_8", 0];
            _veh animate["FT_Switch_9", 0];
        } else {
            _veh animate["FT_Switch_10", 0];
            _veh animate["DS_Floodlights", 0];
            _veh animate["PS_Floodlights", 0];
        };
    }],
    ["", "Ladder Floodlight", {
        _veh = vehicle player;

        if (_veh animationPhase "Ladder_Spotlight" == 0) then {
            _veh animate["FT_Switch_11", 1];
            _veh animate["Ladder_Spotlight", 1];
        } else {
            _veh animate["FT_Switch_11", 0];
            _veh animate["Ladder_Spotlight", 0];
        };
    }],
    ["", "Ladder Cam", {
        _veh = vehicle player;

        if (_veh animationPhase "Ladder_Cam" == 0) then {
            _veh animate["FT_Switch_12", 1];
            _veh animate["Ladder_Cam", 1];
            _veh animate["Reverse_Cam", 0];
        } else {
            _veh animate["FT_Switch_12", 0];
            _veh animate["Ladder_Cam", 0];
        };
    }],
    ["", "Enter as Ladder Operator", {
        _veh = player_objIntersect;
        _veh lock 0;
        player action["getInTurret", _veh, [0]];
        _veh lock 2;
    }],
    ["A3PL_Rear_Ladder", "Climb Left Ladder", {
        _veh = player_objIntersect;
        if (isNull _veh) exitwith {};
        if (typeOf _veh != "A3PL_Rear_Ladder") exitWith {};
        player action["ladderUp", _veh, 1, 0];
    }],
    ["A3PL_Rear_Ladder", "Climb Right Ladder", {
        _veh = player_objIntersect;
        if (isNull _veh) exitwith {};
        if (typeOf _veh != "A3PL_Rear_Ladder") exitWith {};
        player action["ladderUp", _veh, 0, 0];
    }],
    ["", "Lower/Raise Ladder Rack", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Ladder_Holder" == 0) then {
            _veh animateSource["Ladder_Holder", 1];
        } else {
            _veh animateSource["Ladder_Holder", 0];
        };
    }],
    ["", "Turn On\Off Pump", {
        _veh = player_objIntersect;
        if (!(_veh isKindOf "Car")) exitwith {};
        if (_veh animationPhase "FT_Pump_Switch" == 0) then {
            _veh animate["FT_Pump_Switch", 1];
            _PumpSound = createSoundSource["A3PL_FT_Pump", getpos _veh, [], 0];
            _PumpSound attachTo[_veh, [0, 0, 0], "pos_switches"];
            _veh setVariable["PumpSound", _PumpSound, true];
        } else {
            _veh animate["FT_Pump_Switch", 0];
            _PumpSound = _veh getVariable "PumpSound";
            deleteVehicle _PumpSound;
        };
    }],
    ["A3PL_Pierce_Pumper", "Open/Close Discharge", {
        private["_veh"];
        _veh = player_objintersect;
        _animName = player_nameintersect;
        if ((!(_veh isKindOf "Car")) OR(_animName == "")) exitwith {};

        if (_animName == "ft_lever_8" && (_veh animationPhase "ft_lever_8" < 0.5)) then {
            [_veh] spawn A3PL_FD_EngineLoop;
        };

        [_veh, _animName, false] call A3PL_Lib_ToggleAnimation;

    }],
    ["A3PL_Pierce_Heavy_Ladder", "Connect Hose To Ladder Inlet", {
        [player_objintersect, player_nameintersect] call A3PL_FD_ConnectHoseAdapter;
    }],
    ["A3PL_Pierce_Pumper", "Connect Hose To Engine Inlet", {
        [player_objintersect, player_nameintersect] call A3PL_FD_ConnectHoseAdapter;
    }],
    ["A3PL_Pierce_Pumper", "Connect Hose To Engine Discharge", {
        [player_objintersect, player_nameintersect] call A3PL_FD_ConnectHoseAdapter;
    }],
    ["", "Alternar Taximetro Disponivel", {
        _veh = player_objintersect;

        if ((_veh animationSourcePhase "Fair_Available") < 0.5) then {
            _veh animateSource["Fair_Available", 1];
        } else {
            _veh animateSource["Fair_Available", 0];
        };
    }],
    ["", "Iniciar Taximetro", {
        [player_objIntersect] call A3PL_JobTaxi_FareStart;
    }],
    ["", "Pausar Taximetro", {
        [player_objIntersect] call A3PL_JobTaxi_FarePause;
    }],
    ["", "Parar Taximetro", {
        [player_objIntersect] call A3PL_JobTaxi_FarePause;
    }],
    ["", "Resetar Taximetro", {
        [player_objIntersect] call A3PL_JobTaxi_FareReset;
    }],
    ["", "Entrar Como Co-Motorista", {
        private["_veh"];
        _veh = player_objIntersect;

        [_veh] spawn {
            _veh = param[0, objNull];
            _veh animateDoor["Door_RF", 1];
            sleep 0.4;
            player moveInGunner _veh;
            _veh animateDoor["Door_RF", 0];
        };

    }],
    ["A3PL_P362", "Controle de Suspensão a Ar", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "ASC" < 0.8) then {
            _veh animate["ASC_Switch", 1];
            _veh animateSource["ASC", 1];
            _veh setCenterOfMass[[0.00631652, 0.1, -1.03015], 8];
            _veh setMass[35000, 8];
        } else {
            _veh animate["ASC_Switch", 0];
            _veh animateSource["ASC", 0];
            _veh setMass[13000, 8];
            _veh setCenterOfMass[[0.00631652, -0.28197, -1.03015], 8];
        };
    }],
    ["", "Luz Lateral Esquerda", {
        _veh = player_objintersect;

        if (_veh animationPhase "PD_Switch_9" < 0.5) then {
            _veh animate["PD_Switch_9", 1];
            _veh animate["DS_Floodlights", 1];
        } else {
            _veh animate["PD_Switch_9", 0];
            _veh animate["DS_Floodlights", 0];
        };
    }],
    ["", "Luz Lateral Direita", {
        _veh = player_objintersect;

        if (_veh animationPhase "PD_Switch_10" < 0.5) then {
            _veh animate["PD_Switch_10", 1];
            _veh animate["PS_Floodlights", 1];
        } else {
            _veh animate["PD_Switch_10", 0];
            _veh animate["PS_Floodlights", 0];
        };
    }],
    ["", "Alternar Spotlight", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Spotlight" < 0.5 && _veh animationPhase "Spotlight_Addon" > 0.5) then {
            _veh animateSource["Spotlight", 1];
            if (_veh animationSourcePhase "Head_Lights" < 0.5) then {
                player action["lightOn", _veh];
            };

        } else {
            _veh animateSource["Spotlight", 0];
            if (_veh animationSourcePhase "Head_Lights" < 0.5) then {
                player action["lightOff", _veh];
            };
        };

    }],
    ["", "Radar Master", {
        _veh = player_objintersect;

        if (_veh animationPhase "Radar_Master" < 0.5) then {
            _veh animate["Radar_Master", 1];
            if ((_veh animationPhase "Radar_Front" < 0.5) && (_veh animationPhase "Radar_Rear" < 0.5)) then {
                _veh animate["Radar_Front", 1];
            };
        } else {
            _veh animate["Radar_Master", 0];
        };
    }],
    ["", "Radar Traseiro", {
        _veh = player_objintersect;
        if (_veh animationPhase "Radar_Rear" < 0.5) then {
            _veh animate["Radar_Rear", 1];
            _veh animate["Radar_Front", 0];
            if (player == driver _veh) then {
                _veh setVariable["forward", false, false];
            } else {
                _veh setVariable["forward", false, true];
            };

        };
    }],
    ["", "Radar Frontal", {
        _veh = player_objintersect;
        if (_veh animationPhase "Radar_Front" < 0.5) then {
            _veh animate["Radar_Front", 1];
            _veh animate["Radar_Rear", 0];
            if (player == driver _veh) then {
                _veh setVariable["forward", true, false];
            } else {
                _veh setVariable["forward", true, true];
            };

        };
    }],
    ["", "Resetar Radar", {
        _veh = vehicle player;
        if (player == driver _veh) then {
            _veh setVariable["lockfast", nil, false];
            _veh setVariable["locktarget", nil, false];
            [_veh, "lockfast", 0] call A3PL_Police_RadarSet;
            [_veh, "locktarget", 0] call A3PL_Police_RadarSet;
        } else {
            _veh setVariable["lockfast", nil, true];
            _veh setVariable["locktarget", nil, true];
            [_veh, "lockfast", 0] call A3PL_Police_RadarSet;
            [_veh, "locktarget", 0] call A3PL_Police_RadarSet;
        };
    }],
    ["", "Ligar/Desligar Laptop", {
        _veh = player_objintersect;

        if (_veh animationPhase "Laptop_Top" < 0.5) then {
            private["_playersRE"];
            _playersRE = [driver _veh]; {
                if (_veh getCargoIndex _x == 0) exitwith {
                    _playersRE pushback _x
                };
            }
            foreach(crew _veh);
            [(netID _veh)] remoteExec ["A3PL_fnc_Boot_Ambulance", _playersRE, false];
            _veh animateSource["Laptop_Top", 1];

        } else {
            _veh animateSource["Laptop_Top", 0];
        };
    }],
    ["", "Acessar Banco de Dados", {
        if (isNull(findDisplay 211) && player_objintersect animationPhase "Laptop_Top" > 0.5) then {
            [] call Caue_Police_DatabaseOpen;
        };
    }],
    ["", "Girar Laptop", {
        _veh = player_objintersect;

        if (_veh animationPhase "Laptop" < 0.5) then {
            _veh animate["Laptop", 1];
        } else {
            _veh animate["Laptop", 0];
        };
    }],
    ["", "Farol Alto", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "High_Beam" == 0) then {
            _veh animate["High_Beam_Switch", 1];
            _veh animateSource["High_Beam", 1];
        } else {
            _veh animate["High_Beam_Switch", 0];
            _veh animateSource["High_Beam", 0];
        };
    }],
    ["", "Camera Reversa", {
        _veh = player_objintersect;

        if (_veh animationPhase "Reverse_Cam" == 0) then {
            _veh animate["Reverse_Cam", 1];
        } else {
            _veh animate["Reverse_Cam", 0];
        };
    }],
    ["", "Buzina de Ar", {
        _veh = player_objintersect;

        if (_veh animationPhase "FT_Switch_33" < 0.5) then {
            [5] call A3PL_Vehicle_SirenHotkey;
        } else {
            [5] call A3PL_Vehicle_SirenHotkey;
            [_veh] call A3PL_Vehicle_SoundSourceClear;
        };
    }],
    ["", "Buzina Eletrica", {
        _veh = player_objintersect;

        if (_veh animationPhase "FT_Switch_34" < 0.5) then {
            [6] call A3PL_Vehicle_SirenHotkey;
        } else {
            [6] call A3PL_Vehicle_SirenHotkey;
            [_veh] call A3PL_Vehicle_SoundSourceClear;
        };
    }],
    ["", "Buzina de Ar Eletrica", {
        _veh = player_objintersect;

        if (_veh animationPhase "FT_Switch_35" < 0.5) then {
            [7] call A3PL_Vehicle_SirenHotkey;
        } else {
            [7] call A3PL_Vehicle_SirenHotkey;
            [_veh] call A3PL_Vehicle_SoundSourceClear;
        };
    }],
    ["", "Rumbler Manual", {
        _veh = player_objintersect;

        if (_veh animationPhase "FT_Switch_36" < 0.5) then {
            [8] call A3PL_Vehicle_SirenHotkey;
        } else {
            [8] call A3PL_Vehicle_SirenHotkey;
            [_veh] call A3PL_Vehicle_SoundSourceClear;
        };
    }],
    ["", "T3 Yelp", {
        _veh = player_objintersect;

        if (_veh animationPhase "FT_Switch_37" < 0.5) then {
            [9] call A3PL_Vehicle_SirenHotkey;
        } else {
            [9] call A3PL_Vehicle_SirenHotkey;
            [_veh] call A3PL_Vehicle_SoundSourceClear;
        };
    }],
    ["", "Master On", {
        [2] call A3PL_Vehicle_SirenHotkey;
    }],
    ["", "Alternar Lightbar", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "lightbar" < 0.5) then {
            [2] call A3PL_Vehicle_SirenHotkey;
        } else {
            [1] call A3PL_Vehicle_SirenHotkey;
        };
    }],
    ["", "Direcional Master", {
        _veh = player_objintersect;

        if (_veh animationPhase "Directional_Switch" < 0.5) then {
            _veh animate["Directional_Switch", 1];
            _veh animate["Directional", 1];
            if (_veh animationPhase "Directional_Control_Noob" == 0) then {
                _veh animate["Directional_L", 1];
            };
            if (_veh animationPhase "Directional_Control_Noob" == 17.5) then {
                _veh animate["Directional", 0];
                _veh animate["Directional_S", 0];
                _veh animate["Directional_F", 1];
            };
        } else {
            _veh animate["Directional_Switch", 0];
            _veh animate["Directional", 0];
            if (_veh animationPhase "Directional_Control_Noob" == 17.5) then {
                _veh animate["Directional", 0];
                _veh animate["Directional_S", 0];
                _veh animate["Directional_F", 0];
            };
        };
    }],
    ["", "Controle Direcional", {
        _veh = player_objintersect;

        if (_veh animationPhase "Directional_Control_Noob" == 0) then {
            _veh animate["Directional_Control_Noob", 6.5];
            _veh animate["Directional_L", 0];
            _veh animate["Directional_R", 1];
        };
        if (_veh animationPhase "Directional_Control_Noob" == 6.5) then {
            _veh animate["Directional_Control_Noob", 12];
            _veh animate["Directional_R", 0];
            _veh animate["Directional_S", 1];
        };
        if (_veh animationPhase "Directional_Control_Noob" == 12) then {
            _veh animate["Directional_Control_Noob", 17.5];
            _veh animate["Directional_S", 0];
            if (_veh animationPhase "Directional_Switch" == 1) then {
                _veh animate["Directional_F", 1];
                _veh animate["Directional", 0];
            };
        };
        if (_veh animationPhase "Directional_Control_Noob" == 17.5) then {
            _veh animate["Directional_Control_Noob", 0];
            _veh animate["Directional_F", 0];
            _veh animate["Directional_L", 1];
            if (_veh animationPhase "Directional_Switch" == 1) then {
                _veh animate["Directional", 1];
            };
        };
    }],
    ["", "Sirene Master", {
        _veh = player_objintersect;

        if (_veh animationPhase "Siren_Control_Switch" < 0.5) then {
            _veh animate["Siren_Control_Switch", 1];
            [3] call A3PL_Vehicle_SirenHotkey;
        } else {
            _veh animate["Siren_Control_Switch", 0];
            [_veh] call A3PL_Vehicle_SoundSourceClear;
        };
    }],
    ["", "Controle Sirene", {
        [4] call A3PL_Vehicle_SirenHotkey;
    }],
    ["", "Alternar Compartimento 1", {
        _veh = player_objintersect;

        if (_veh animationSourcePhase "Cargo_Door_1" < 0.5) then {
            _veh animateSource["Cargo_Door_1", 1];
        } else {
            _veh animateSource["Cargo_Door_1", 0];
        };
    }],
    ["", "Alternar Compartimento 2", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_2" < 0.5) then {
            _veh animateSource["Cargo_Door_2", 1];
        } else {
            _veh animateSource["Cargo_Door_2", 0];
        };
    }],
    ["", "Alternar Compartimento 3", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_3" < 0.5) then {
            _veh animateSource["Cargo_Door_3", 1];
        } else {
            _veh animateSource["Cargo_Door_3", 0];
        };
    }],
    ["", "Alternar Compartimento 4", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_4" < 0.5) then {
            _veh animateSource["Cargo_Door_4", 1];
        } else {
            _veh animateSource["Cargo_Door_4", 0];
        };
    }],
    ["", "Alternar Compartimento 5", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_5" < 0.5) then {
            _veh animateSource["Cargo_Door_5", 1];
        } else {
            _veh animateSource["Cargo_Door_5", 0];
        };
    }],
    ["", "Alternar Compartimento 6", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_6" < 0.5) then {
            _veh animateSource["Cargo_Door_6", 1];
        } else {
            _veh animateSource["Cargo_Door_6", 0];
        };
    }],
    ["", "Alternar Compartimento 7", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_7" < 0.5) then {
            _veh animateSource["Cargo_Door_7", 1];
        } else {
            _veh animateSource["Cargo_Door_7", 0];
        };
    }],
    ["", "Alternar Compartimento 8", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_8" < 0.5) then {
            _veh animateSource["Cargo_Door_8", 1];
        } else {
            _veh animateSource["Cargo_Door_8", 0];
        };
    }],
    ["", "Alternar Compartimento 9", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_9" < 0.5) then {
            _veh animateSource["Cargo_Door_9", 1];
        } else {
            _veh animateSource["Cargo_Door_9", 0];
        };
    }],
    ["", "Alternar Compartimento 10", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_10" < 0.5) then {
            _veh animateSource["Cargo_Door_10", 1];
        } else {
            _veh animateSource["Cargo_Door_10", 0];
        };
    }],
    ["", "Alternar Compartimento 11", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_11" < 0.5) then {
            _veh animateSource["Cargo_Door_11", 1];
        } else {
            _veh animateSource["Cargo_Door_11", 0];
        };
    }],
    ["", "Alternar Compartimento 12", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_12" < 0.5) then {
            _veh animateSource["Cargo_Door_12", 1];
        } else {
            _veh animateSource["Cargo_Door_12", 0];
        };
    }],
    ["", "Alternar Compartimento 13", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_13" < 0.5) then {
            _veh animateSource["Cargo_Door_13", 1];
        } else {
            _veh animateSource["Cargo_Door_13", 0];
        };
    }],
    ["", "Alternar Compartimento 14", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_14" < 0.5) then {
            _veh animateSource["Cargo_Door_14", 1];
        } else {
            _veh animateSource["Cargo_Door_14", 0];
        };
    }],
    ["", "Alternar Compartimento 15", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_15" < 0.5) then {
            _veh animateSource["Cargo_Door_15", 1];
        } else {
            _veh animateSource["Cargo_Door_15", 0];
        };
    }],
    ["", "Alternar Compartimento 16", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_16" < 0.5) then {
            _veh animateSource["Cargo_Door_16", 1];
        } else {
            _veh animateSource["Cargo_Door_16", 0];
        };
    }],
    ["", "Alternar Compartimento 17", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_17" < 0.5) then {
            _veh animateSource["Cargo_Door_17", 1];
        } else {
            _veh animateSource["Cargo_Door_17", 0];
        };
    }],
    ["", "Alternar Compartimento 18", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_18" < 0.5) then {
            _veh animateSource["Cargo_Door_18", 1];
        } else {
            _veh animateSource["Cargo_Door_18", 0];
        };
    }],
    ["", "Alternar Compartimento 19", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_19" < 0.5) then {
            _veh animateSource["Cargo_Door_19", 1];
        } else {
            _veh animateSource["Cargo_Door_19", 0];
        };
    }],
    ["", "Alternar Compartimento 20", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Cargo_Door_20" < 0.5) then {
            _veh animateSource["Cargo_Door_20", 1];
        } else {
            _veh animateSource["Cargo_Door_20", 0];
        };
    }],
    ["", "Abrir\Fechar Porta", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase player_nameintersect == 0) then {
            _veh animateDoor[player_nameintersect, 1];
        } else {
            _veh animateDoor[player_nameintersect, 0];
        };
    }],
    ["A3PL_MailTruck", "Abrir/Fechar Porta Mailtruck", {
        _veh = player_objintersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Este veículo está trancado", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "mailtruck_trunk" < 0.5) then {
            _veh animateSource["mailtruck_trunk", 1];
        } else {
            _veh animateSource["mailtruck_trunk", 0];
        };
    }],
    ["A3PL_Drill_Trailer", "Recolher/Estender Braço de Broca", {
        _drill = player_objintersect;
        if (typeOf _drill != "A3PL_Drill_Trailer") exitwith {};
        if (player getVariable["job", "unemployed"] != "oil") exitwith {
            ["Você não está no trabalho de recuperador de óleo e não pode controlar a broca", Color_Red] call A3PL_HUD_Notification;
        };
        _a = _drill animationSourcePhase "drill_arm_position";
        if (_a > 0) exitwith {

            if (_drill animationSourcePhase "drill" > 0) exitwith {
                ["Você precisa recolher a broca antes de poder mover a posição do braço de perfuração", Color_Red] call A3PL_HUD_Notification;
            };
            _drill animateSource["drill_arm_position", 0];
        };
        _drill animateSource["drill_arm_position", 1];
    }],
    ["A3PL_Drill_Trailer", "Recolher/Estender Broca", {
        _drill = player_objintersect;
        if (typeOf _drill != "A3PL_Drill_Trailer") exitwith {};
        [_drill] call A3PL_JobOil_Drill;
    }],
    ["A3PL_PumpJack", "Start Jack Pump", {
        _pump = player_objintersect;
        if (typeOf _pump != "A3PL_PumpJack") exitwith {};
        if (player getVariable["job", "unemployed"] != "oil") exitwith {
            ["Você não está no trabalho de recuperador de óleo e não pode controlar a bomba", Color_Red] call A3PL_HUD_Notification;
        };
        [_pump] call A3PL_JobOil_PumpStart;
    }],
    ["", "Conectar Mangueira de Gásolina", {
        [player_objintersect] spawn A3PL_Hydrogen_Connect;
    }],
    ["", "Abaixar/Levantar Rampa", {
        [player_objintersect] call A3PL_Vehicle_TrailerRamp;
    }],
    ["A3PL_Ski_Base", "Pickup Ski", {
        private["_name"];
        if (!isNull player_item) exitwith {
            ["You can't pickup/drop this item because you have something in your hand", Color_Red] call A3PL_HUD_Notification;
        };
        [] call A3PL_Placeables_QuickAction;
    }],
    ["A3PL_Ski_Base", "Attach/Detach Rope", {
        private["_ski", "_boat", "_rope"];

        _ski = player_objintersect;

        if (!(_ski isKindOf "A3PL_Ski_Base")) exitwith {
            ["System: Are you looking at a ski?", Color_Red] call A3PL_HUD_Notification;
        };
        if (!(isNull(ropeAttachedTo _ski))) exitwith {
            {
                ropeDestroy _x;
            }
            foreach(ropes(ropeAttachedTo _ski));
            ["System: Rope was detached succesfully", Color_Red] call A3PL_HUD_Notification;
        };

        _boat = nearestObjects[_ski, ["C_Boat_Civil_01_F"], 10];
        _boat = _boat - [_ski];

        if (count _boat < 1) exitwith {
            ["System: There is no boat nearby to attach a rope to", Color_Red] call A3PL_HUD_Notification;
        };
        _boat = _boat select 0;

        if (!(isNull attachedTo _boat)) exitwith {
            ["System: You cannot attach a ski to a boat that's on a trailer", Color_Red] call A3PL_HUD_Notification;
        };

        if (_boat == _ski) exitwith {
            ["System Error: Unable to attach a rope", Color_Red] call A3PL_HUD_Notification;
        };
        if ((ropeAttachedTo _boat) == _ski) exitwith {
            ["System Error: Unable to attach a rope", Color_Red] call A3PL_HUD_Notification;
        };

        _rope = ropeCreate[_boat, [0, -2.2, -0.5], _ski, "rope", 10];
        if (isNull _rope) exitwith {
            ["System: Error occured when trying to create a rope", Color_Red] call A3PL_HUD_Notification;
        };
        ["System: Rope was attached succesfully", Color_Green] call A3PL_HUD_Notification;
    }],
    ["", "Entrar Como Motorista", {
        private["_veh", "_anim"];

        _veh = player_objintersect;
        _anim = player_nameIntersect;

        if (_veh getVariable["locked", true]) exitWith {
            ["Veículo Trancado", Color_Red] call A3PL_HUD_Notification;
        };

        if !([] call Caue_Lib_InputAccess) exitWith {};

        [_veh, _anim] spawn {
            private["_veh"];
            _veh = _this select 0;
            _anim = _this select 1;

            _veh lock 1;
            player action["GetInDriver", _veh];
            switch (true) do {
                case (_veh isKindOf "helicopter"):{
                    _veh animate[_anim, 1];
                    sleep 2;
                    _veh animate[_anim, 0];
                };

                case (_veh isKindOf "car"):{
                    sleep 0.8;
                    _veh animate[_anim, 1];
                    sleep 1;
                    _veh animate[_anim, 0];
                };
            };
            _veh lock 2;
        };
    }],
    ["", "Trancar/Destrancar Portas", {
        if (player_objIntersect getVariable ["locked",true]) then {
            player_objIntersect setVariable ["locked",false,true];
            ["Você destrancou as portas do veículo", Color_Green] call A3PL_HUD_Notification;
        } else {
            player_objIntersect setVariable ["locked",true,true];
            ["Você trancou as portas do veículo", Color_Red] call A3PL_HUD_Notification;
        };
        player playAction "gesture_key";
        player_objIntersect say3D "A3PL_Car_Lock";
    }],
    ["", "Tentar Destrancar", {
        if (Player_ItemClass != "lockpick") exitWith {["Você precisa de uma chave mestra para tentar abrir",Color_Red] call A3PL_HUD_Notification;};
        private _target = player_objintersect;
        if (isNull _target) exitWith {};
        [_target,["lockpick",50,1]] remoteExec ["say3D",-2];
        if ([25,"Tentando abrir...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default"] call Caue_HUD_Progress) then {
            if (((player distance _target) < 5) && ((vehicle player) != player)) exitWith {["Muito longe",Color_Red] call A3PL_HUD_Notification;};
            if ((round(random 100)) <= 30) then {
                [_target,["Car_Alarm",150,1]] remoteExec ["say3D",-2];
                _target setVariable ["locked",false,true];
                ["Você destrancou as portas do veículo", Color_Green] call A3PL_HUD_Notification;
                [player,_target] call Caue_Keys_Add;
            } else {
                ["lockpick",-1] call Caue_Inventory_Add;
                [false] call Caue_Inventory_PutBack;
                ["A chave mestra quebrou",Color_Red] call A3PL_HUD_Notification;
            };
        } else {
            ["Cancelado",Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Reparar Veiculo", {
        private["_intersect"];
        _intersect = player_objintersect;
        if (isNull _intersect) exitwith {};
        [_intersect] call A3PL_Vehicle_Repair;
    }],
    ["", "Reset Scooter", {
        private["_intersect"];
        _intersect = player_objintersect;
        if (isNull _intersect) exitwith {};
        _pos = getPos _intersect;
        _intersect setPos[_pos select 0, _pos select 1, _pos select 2];
    }],
    ["A3PL_Yacht", "Usar Escada Iate", {
        private["_veh", "_name", "_posTop", "_posBottom", "_setPos"];
        _veh = player_objIntersect;
        _name = player_nameIntersect;

        if (_name == "yacht_ladder2") then {

            _posTop = player distance(_veh modelToWorld(_veh selectionPosition "ladder2_down"));
            _posBottom = player distance(_veh modelToWorld(_veh selectionPosition "ladder2_up"));

            if (_posTop < _posBottom) then {
                _setpos = (_veh modelToWorld(_veh selectionPosition "ladder2_up"));
                player setpos[_setpos select 0, _setpos select 1, (_setpos select 2) - 3.45];
            } else {
                _setpos = (_veh modelToWorld(_veh selectionPosition "ladder2_down"));
                player setpos[_setpos select 0, _setpos select 1, (_setpos select 2) - 3];
            };

        } else {
            _posTop = player distance(_veh modelToWorld(_veh selectionPosition "ladder1_down"));
            _posBottom = player distance(_veh modelToWorld(_veh selectionPosition "ladder1_up"));

            if (_posTop < _posBottom) then {
                _setpos = (_veh modelToWorld(_veh selectionPosition "ladder1_up"));
                player setpos[_setpos select 0, _setpos select 1, (_setpos select 2) - 3.45];
            } else {
                _setpos = (_veh modelToWorld(_veh selectionPosition "ladder1_down"));
                player setpos[_setpos select 0, _setpos select 1, (_setpos select 2) - 3];
            };
        };
    }],
    ["", "Entrar Como Co-Piloto", {
        _veh = player_objintersect;

        if (_veh getVariable["locked", true]) exitWith {
            ["Veiculo trancado", Color_Red] call A3PL_HUD_Notification;
        };

        if !([] call Caue_Lib_InputAccess) exitWith {};

        player moveInTurret[_veh, [0]];
    }],
    ["", "Entrar Como Passageiro", {
        private["_veh", "_value", "_list", "_freeseats"];

        _veh = player_objintersect;
        _anim = player_nameIntersect;

        _value = getNumber(configFile >> "CfgVehicles" >> (typeOf _veh) >> "transportSoldier");
        _list = fullCrew[_veh, "cargo"];
        _freeseats = count _list;
        if (_freeseats >= _value && (!(typeOf _veh IN[(typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])]))) exitwith {};
        if (_veh getVariable["locked", true]) exitWith {
            ["Veiculo trancado", Color_Red] call A3PL_HUD_Notification;
        };

        if !([] call Caue_Lib_InputAccess) exitWith {};

        if (_veh isKindOf "Plane"
            or(typeOf _veh IN[(typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])])) exitwith {
            player moveInCargo _veh;
        };
        if (typeOf _veh IN[(typeOf player_objintersect IN["C_Van_02_medevac_F", "C_Van_02_service_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_IDAP_Van_02_vehicle_F", "C_IDAP_Van_02_transport_F", "C_Offroad_02_unarmed_white_F", "C_Offroad_02_unarmed_red_F", "C_Offroad_02_unarmed_orange_F", "C_Offroad_02_unarmed_green_F", "C_Offroad_02_unarmed_F", "C_Offroad_02_unarmed_blue_F", "C_Offroad_02_unarmed_black_F"])]) exitwith {
            player moveInCargo _veh;
        };
        [_veh, _anim] spawn {
            private["_veh"];
            _veh = _this select 0;
            _anim = _this select 1;
            _veh animate[_anim, 1];
            sleep 1;
            if (_veh isKindOf "helicopter") then {
                sleep 2;
            };
            _veh animate[_anim, 0];
        };
        _veh lock 1;
        if (_veh isKindOf "helicopter") then {
            player action["GetInTurret", _veh, [0]];
        } else {
            _value = getNumber(configFile >> "CfgVehicles" >> (typeOf _veh) >> "transportSoldier");
            _list = fullCrew[_veh, "cargo"];
            _freeseats = count _list;
            if (_freeseats >= _value) exitwith {};
            player action["GetInCargo", _veh];
        };
        _veh lock 2;
    }],
    ["", "Sair do Veiculo", {
        if !([] call Caue_Lib_InputAccess) exitWith {};

        private["_veh", "_anim"];

        _veh = player_objintersect;
        _anim = player_nameintersect;

        [_veh, _anim] spawn {
            private["_veh"];
            _veh = _this select 0;
            _anim = _this select 1;

            _veh animate[_anim, 1];
            sleep 1;
            if (_veh isKindOf "helicopter") then {
                if (_anim == "door3") exitwith {};
                sleep 2;
            };
            _veh animate[_anim, 0];
        };
        _veh lock 1;
        player leaveVehicle _veh;
        unassignVehicle player;
        player action["GetOut", _veh];
        [] spawn {
            if (player getVariable["Cuffed", true]) then {
                sleep 1.5;
                player setVelocityModelSpace[0, 3, 1];
                [player, "a3pl_handsupkneelcuffed"] remoteExec ["A3PL_Lib_SyncAnim", 0];
            };
        };
        _veh lock 2;
    }],
    ["", "Ignição", {
        private["_veh"];
        _veh = player_objintersect;
        if (isEngineOn _veh) exitwith {
            _veh engineOn false;
            ["Você desligou o motor", Color_Red] call A3PL_HUD_Notification;
        };
        _veh setVariable["Ignition", true, false];
        _veh engineOn true;
        [_veh] spawn {
            sleep 0.1;
            (_this select 0) setVariable["Ignition", nil, false];
            ["Você ligou o motor", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Alternar Sirene", {
        private["_veh", "_atc", "_sirenObj"];
        _veh = player_objintersect;
        _atc = attachedObjects _veh;
        _sirenObj = _veh getVariable "sirenObj";

        if (isNil "_sirenObj") then {
            _sirenObj = createSoundSource["A3PL_PoliceSiren", getpos _veh, [], 0];
            _sirenObj attachTo[_veh, [0, 0, 0]];
            _veh setVariable["sirenObj", _sirenObj, true];
        } else {
            detach _sirenObj;
            deleteVehicle _sirenObj;
            _veh setVariable["sirenObj", Nil, true]; {
                _type = format["%1", typeOf _x];
                if (_type == "#dynamicsound") then {
                    deleteVehicle _x;
                };
            }
            foreach nearestObjects[_veh, [], 10];
        };
    }],
    ["", "Alternar Manual 1", {
        private["_veh", "_atc", "_sirenObj"];
        _veh = player_objintersect;
        _atc = attachedObjects _veh;
        _sirenObj = _veh getVariable "manualObj";

        if (isNil "_sirenObj") then {
            _sirenObj = createSoundSource["A3PL_PoliceSirenM1", getpos _veh, [], 0];
            _sirenObj attachTo[_veh, [0, 0, 0]];
            _veh setVariable["manualObj", _sirenObj, true];
        } else {
            detach _sirenObj;
            deleteVehicle _sirenObj;
            _veh setVariable["manualObj", Nil, true];
        };
    }],
    ["", "Alternar Manual 2", {
        private["_veh", "_atc", "_sirenObj"];
        _veh = player_objintersect;
        _atc = attachedObjects _veh;
        _sirenObj = _veh getVariable "manualObj";

        if (isNil "_sirenObj") then {
            _sirenObj = createSoundSource["A3PL_PoliceSirenM2", getpos _veh, [], 0];
            _sirenObj attachTo[_veh, [0, 0, 0]];
            _veh setVariable["manualObj", _sirenObj, true];
        } else {
            detach _sirenObj;
            deleteVehicle _sirenObj;
            _veh setVariable["manualObj", Nil, true];
        };
    }],
    ["", "Alternar Manual 3", {
        private["_veh", "_atc", "_sirenObj"];
        _veh = player_objintersect;
        _atc = attachedObjects _veh;
        _sirenObj = _veh getVariable "manualObj";

        if (isNil "_sirenObj") then {
            _sirenObj = createSoundSource["A3PL_PoliceSirenM3", getpos _veh, [], 0];
            _sirenObj attachTo[_veh, [0, 0, 0]];
            _veh setVariable["manualObj", _sirenObj, true];
        } else {
            detach _sirenObj;
            deleteVehicle _sirenObj;
            _veh setVariable["manualObj", Nil, true];
        };
    }],
    ["", "Alternar Faróis Dianteiros", {
        private["_veh", "_trailerArray"];
        _veh = player_objintersect;
        if (isLightOn _veh) then {
            player action["lightOff", _veh];
            ["Você desligou as luzes do veículo", Color_Red] call A3PL_HUD_Notification;

            _veh animateSource["Head_Lights", 0];

            _trailerArray = nearestObjects[(_veh modelToWorld[0, -4, 0]), ["A3PL_Trailer_Base"], 6.5];
            _trailerArray = _trailerArray select 0;
            if (!isNil "_trailerArray") then {
                _trailerArray animate["Tail_Lights", 0];
            };
        } else {
            player action["lightOn", _veh];
            ["Você ligou as luzes do veículo", Color_Red] call A3PL_HUD_Notification;

            _veh animateSource["Head_Lights", 3000];

            _trailerArray = nearestObjects[(_veh modelToWorld[0, -4, 0]), ["A3PL_Trailer_Base"], 6.5];
            _trailerArray = _trailerArray select 0;
            if (!isNil "_trailerArray") then {
                _trailerArray animate["Tail_Lights", 1];
            };
        };
    }],
    ["", "Abrir/Fechar Porta-malas", {
        private["_veh"];
        _veh = player_objintersect;
        if (_veh animationSourcePhase "trunk" < 0.5) then {
            _veh animateSource["trunk", 1];
            ["Você abriu o porta-malas", Color_Red] call A3PL_HUD_Notification;
        } else {
            _veh animateSource["trunk", 0];
            ["Você fechou o porta-malas", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Alternar Luzes de Aviso", {
        private["_veh"];
        _veh = player_objintersect;
        _lights = ((_veh animationPhase "indicator_L" > 0.5) && (_veh animationPhase "indicator_R" > 0.5));
        if (_lights) then {
            _veh animate["indicator_L", 0];
            _veh animate["indicator_R", 0];
            ["Você desligou as luzes de aviso", Color_Red] call A3PL_HUD_Notification;
        } else {
            _veh animate["indicator_L", 1];
            _veh animate["indicator_R", 1];
            ["Você ligou as luzes de aviso", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Engatar Reboque", {
        _f = false;
        if (typeOf player_objintersect == "A3PL_DrillTrailer_Default") then {
            if (((player_objintersect animationSourcePhase "drill") > 0) OR ((player_objintersect animationSourcePhase "drill_arm_position") > 0)) then {
                _f = true;
            };
        };

        if (_f) exitwith {
            ["Você não pode engatar este reboque se a broca ou o braço da broca estiverem estendidos", Color_Red] call A3PL_HUD_Notification;
        };

        [player_objIntersect] spawn A3PL_Vehicle_Trailer_Hitch;
    }],
    ["", "Subir no Iate", {
        player setPos(player_objintersect modelToWorld(player_objintersect selectionPosition "climbYacht"));
    }],
    ["", "Desprender Reboque", {
        [player_objintersect] call A3PL_Vehicle_Trailer_Unhitch;
    }],
    ["", "Abrir/Fechar Porta Reboque", {
        private["_veh"];
        _veh = player_objIntersect;
        if (_veh animationPhase "door" < 0.1) then {
            [_veh] spawn {
                _veh = _this select 0;
                _veh animate["door_lock", 1];
                sleep 1.9;
                _veh animate["Door", 1];
            };
        } else {
            [_veh] spawn {
                _veh = _this select 0;
                _veh animate["Door", 0];
                sleep 1.9;
                _veh animate["door_lock", 0];
            };
        };
    }],
    ["", "Abaixar/Subir Rampa Reboque", {
        _locked = player_objIntersect getVariable["locked", true];
        if (_locked) then {
            player_objIntersect setVariable["locked", false, true];
            ["Você destrancou as portas do veículo", Color_Green] call A3PL_HUD_Notification;
        } else {
            player_objIntersect setVariable["locked", true, true];

            ["Você trancou as portas do veículo", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Abaixar/Subir Rampa Reboque", {
        private["_veh"];
        _veh = player_objIntersect;
        if (_veh animationPhase "ramp1" < 0.1) then {
            [_veh] spawn {
                _veh = _this select 0;
                _veh animate["ramp1", 1];
                sleep 1.9;
                _veh animate["ramp2", 1];
            };
        } else {
            [_veh] spawn {
                _veh = _this select 0;
                _veh animate["ramp2", 0];
                sleep 1.9;
                _veh animate["ramp1", 0];
            };
        };
    }],
    ["", "Descarregar Veículo", {
        [player_Objintersect] spawn A3PL_Vehicle_TowTruck_Unloadcar;
    }],
    ["", "Carregar Veículo", {
        [player_objIntersect] spawn A3PL_Vehicle_TowTruck_Loadcar;
    }],
    ["", "Enter as Gunner 1", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;};
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [0]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 2", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [1]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 3", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [2]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 4", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [3]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 5", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [4]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 6", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [5]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 7", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [6]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 8", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [7]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 9", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [8]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 10", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [9]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 11", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [10]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 12", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [11]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 13", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [12]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 14", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [13]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 15", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [14]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 16", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [15]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 17", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [16]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 18", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [17]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 19", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [18]];
        _veh lock 2;
    }],
    ["", "Enter as Gunner 20", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInTurret", _veh, [19]];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 1", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInCargo", _veh, 0];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 2", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInCargo", _veh, 1];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 3", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInCargo", _veh, 2];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 4", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInCargo", _veh, 3];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 5", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInCargo", _veh, 4];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 6", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInCargo", _veh, 5];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 7", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if !([] call Caue_Lib_InputAccess) exitWith {};
        _veh lock 1;
        player action["getInCargo", _veh, 6];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 8", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 7];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 9", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 8];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 10", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 9];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 11", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 10];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 12", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 11];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 13", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 12];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 14", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 13];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 15", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 14];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 16", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 15];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 17", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 16];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 18", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 17];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 19", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 18];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 20", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 19];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 21", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 20];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 22", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 21];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 23", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 22];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 24", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 23];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 25", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 24];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 26", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 25];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 27", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 26];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 28", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 27];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 29", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 28];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 30", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 29];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 31", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 30];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 32", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 31];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 33", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 32];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 34", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 33];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 35", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 34];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 36", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 35];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 37", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 36];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 38", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 37];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 39", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 38];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 40", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 39];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 41", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 40];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 42", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 41];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 43", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 42];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 44", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 43];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 45", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 44];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 46", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 45];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 47", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 46];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 48", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 47];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 49", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 48];
        _veh lock 2;
    }],
    ["", "Sentar-se no assento 50", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInCargo", _veh, 49];
        _veh lock 2;
    }],
    ["", "Move to Driver", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToDriver", _veh];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 1", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [0]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 2", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [1]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 3", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [2]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 4", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [3]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 5", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [4]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 6", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [5]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 7", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [6]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 8", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [7]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 9", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [8]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 10", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [9]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 11", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [10]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 12", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [11]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 13", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [12]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 14", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [13]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 15", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [14]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 16", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [15]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 17", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [16]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 18", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [17]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 19", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [18]];
        _veh lock 2;
    }],
    ["", "Mover para o atirador 20", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["MoveToTurret", _veh, [19]];
        _veh lock 2;
    }],
    ["", "Move to Co-Pilot", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 0];
        _veh lock 2;
    }],
    ["", "Mover para o assento 1", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 0];
        _veh lock 2;
    }],
    ["", "Mover para o assento 2", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 1];
        _veh lock 2;
    }],
    ["", "Mover para o assento 3", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 2];
        _veh lock 2;
    }],
    ["", "Mover para o assento 4", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 3];
        _veh lock 2;
    }],
    ["", "Mover para o assento 5", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 4];
        _veh lock 2;
    }],
    ["", "Mover para o assento 6", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 5];
        _veh lock 2;
    }],
    ["", "Mover para o assento 7", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 6];
        _veh lock 2;
    }],
    ["", "Mover para o assento 8", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 7];
        _veh lock 2;
    }],
    ["", "Mover para o assento 9", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 8];
        _veh lock 2;
    }],
    ["", "Mover para o assento 10", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 9];
        _veh lock 2;
    }],
    ["", "Mover para o assento 11", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 10];
        _veh lock 2;
    }],
    ["", "Mover para o assento 12", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 11];
        _veh lock 2;
    }],
    ["", "Mover para o assento 13", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 12];
        _veh lock 2;
    }],
    ["", "Mover para o assento 14", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 13];
        _veh lock 2;
    }],
    ["", "Mover para o assento 15", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 14];
        _veh lock 2;
    }],
    ["", "Mover para o assento 16", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 15];
        _veh lock 2;
    }],
    ["", "Mover para o assento 17", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 16];
        _veh lock 2;
    }],
    ["", "Mover para o assento 18", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 17];
        _veh lock 2;
    }],
    ["", "Mover para o assento 19", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 18];
        _veh lock 2;
    }],
    ["", "Mover para o assento 20", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 19];
        _veh lock 2;
    }],
    ["", "Mover para o assento 21", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 20];
        _veh lock 2;
    }],
    ["", "Mover para o assento 22", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 21];
        _veh lock 2;
    }],
    ["", "Mover para o assento 23", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 22];
        _veh lock 2;
    }],
    ["", "Mover para o assento 24", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 23];
        _veh lock 2;
    }],
    ["", "Mover para o assento 25", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 24];
        _veh lock 2;
    }],
    ["", "Mover para o assento 26", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 25];
        _veh lock 2;
    }],
    ["", "Mover para o assento 27", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 26];
        _veh lock 2;
    }],
    ["", "Mover para o assento 28", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 27];
        _veh lock 2;
    }],
    ["", "Mover para o assento 29", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 28];
        _veh lock 2;
    }],
    ["", "Mover para o assento 30", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 29];
        _veh lock 2;
    }],
    ["", "Mover para o assento 31", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 30];
        _veh lock 2;
    }],
    ["", "Mover para o assento 32", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 31];
        _veh lock 2;
    }],
    ["", "Mover para o assento 33", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 32];
        _veh lock 2;
    }],
    ["", "Mover para o assento 34", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 33];
        _veh lock 2;
    }],
    ["", "Mover para o assento 35", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 34];
        _veh lock 2;
    }],
    ["", "Mover para o assento 36", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 35];
        _veh lock 2;
    }],
    ["", "Mover para o assento 37", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 36];
        _veh lock 2;
    }],
    ["", "Mover para o assento 38", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 37];
        _veh lock 2;
    }],
    ["", "Mover para o assento 39", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 38];
        _veh lock 2;
    }],
    ["", "Mover para o assento 40", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 39];
        _veh lock 2;
    }],
    ["", "Mover para o assento 41", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 40];
        _veh lock 2;
    }],
    ["", "Mover para o assento 42", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 41];
        _veh lock 2;
    }],
    ["", "Mover para o assento 43", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 42];
        _veh lock 2;
    }],
    ["", "Mover para o assento 44", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 43];
        _veh lock 2;
    }],
    ["", "Mover para o assento 45", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 44];
        _veh lock 2;
    }],
    ["", "Mover para o assento 46", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 45];
        _veh lock 2;
    }],
    ["", "Mover para o assento 47", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 46];
        _veh lock 2;
    }],
    ["", "Mover para o assento 48", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 47];
        _veh lock 2;
    }],
    ["", "Mover para o assento 49", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 48];
        _veh lock 2;
    }],
    ["", "Mover para o assento 50", {
        private["_veh"];
        _veh = player_objIntersect;
        _anim = player_nameIntersect;
        if (_veh getVariable["locked", true]) exitWith {
            ["Vehicle Locked", Color_Red] call A3PL_HUD_Notification;
        };
        if (animationState player IN["A3PL_HandsupToKneel", "A3PL_HandsupKneelGetCuffed", "A3PL_Cuff", "A3PL_HandsupKneelCuffed", "A3PL_HandsupKneelKicked", "A3PL_CuffKickDown", "a3pl_idletohandsup", "a3pl_kneeltohandsup", "a3pl_handsuptokneel", "A3PL_HandsupKneel"]) exitWith {
            ["System: You cannot enter a vehicle when handcuffed/surrendered", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["moveToCargo", _veh, 49];
        _veh lock 2;
    }],
    ["A3PL_Jayhawk", "Unfold/Fold Jayhawk", {
        private["_veh"];
        _veh = player_objIntersect;
        if ((_veh animationSourcePhase "Jayhawk_Fold") > 0.5) exitwith {
            _veh animateSource["Jayhawk_Fold", 0];
            _veh animate["RotorManual", 0];
        };
        if ((_veh animationSourcePhase "Jayhawk_Fold") < 0.5) exitwith {
            _veh animate["RotorManual", 1 - (_veh animationPhase "rotor")];
            waitUntil {_veh animationPhase "rotor" == 0;};
            _veh animateSource["Jayhawk_Fold", 1];
        };
    }],
    ["", "Cockpit Lights", {
        private["_delete", "_d", "_veh"];
        _veh = player_objIntersect;
        _delete = false;
        _d = objNull;
        if (_veh animationSourcePhase "Cockpit_Lights" > 0.5) then {
            _veh animateSource["Cockpit_Lights", 0];
            if (!(player == (vehicle player turretUnit[0]))) then {
                if (isnull(_veh turretUnit[0])) then {
                    _delete = true;
                    _d = createAgent["VirtualMan_F", [0, 0, 0], [], 0, "FORM"];
                    _d moveInTurret[_veh, [0]];
                };
            };
            (_veh turretUnit[0]) action["searchlightOff", _veh];
            if (_delete) then {
                moveout _d;
                deleteVehicle _d;
            };
        }
        else {
            _veh animateSource["Cockpit_Lights", 1];
            if (isnull(_veh turretUnit[0])) then {
                _delete = true;
                _d = createAgent["VirtualMan_F", [0, 0, 0], [], 0, "FORM"];
                _d moveInTurret[_veh, [0]];
            };
            (_veh turretUnit[0]) action["searchlightOn", _veh];
            if (_delete) then {
                moveout _d;
                deleteVehicle _d;
            };
        };
    }],
    ["", "Toggle Dozer Blade", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "groundShov" < 0.5) then {
            _veh animateSource["groundShov", 1];
        } else {
            _veh animateSource["groundShov", -0.5];
        };
    }],
    ["", "Detach Attachment", {
        [] spawn {
            _veh = player_objintersect;
            _posveh = _veh selectionPosition "Turret1_pos";
            _pos = _veh modeltoworld _posveh;
            if (!([] call Caue_Player_AntiSpam)) exitWith {};
            if ((_veh animationPhase "Bucket") > 0.5) then {
                _Bucket = "A3PL_MiniExcavator_Bucket"
                createvehicle[0, 0, 0];
                [player, _veh, _Bucket] remoteExec ["Server_Vehicle_AtegoHandle", 2];
                _veh removeMagazineTurret["A3PL_BucketMag", [0]];
                _veh removeWeaponTurret["A3PL_Machinery_Bucket", [0, 0]];
                _veh removeMagazineTurret["A3PL_JackhammerMag", [0]];
                _veh removeWeaponTurret["A3PL_Machinery_Pickaxe", [0, 0]];
                sleep 2;
                _Bucket setVariable["class", "ME_Bucket", true];
                _Bucket setVariable["owner", getPlayerUID player, true];
                _veh animate["Bucket", 0];
                _Bucket attachTo[_veh, [(_posveh select 0), (_posveh select 1), (_posveh select 2) - 0.6]];
                detach _Bucket;
                sleep 2;
                _veh animate["Attachment", 0];
            };
            if ((_veh animationPhase "Jackhammer") > 0.5) then {
                _Bucket = "A3PL_MiniExcavator_Jackhammer"
                createvehicle[0, 0, 0];
                [player, _veh, _Bucket] remoteExec ["Server_Vehicle_AtegoHandle", 2];
                _veh removeMagazineTurret["A3PL_BucketMag", [0]];
                _veh removeWeaponTurret["A3PL_Machinery_Bucket", [0, 0]];
                _veh removeMagazineTurret["A3PL_JackhammerMag", [0]];
                _veh removeWeaponTurret["A3PL_Machinery_Pickaxe", [0, 0]];
                sleep 2;
                _Bucket setVariable["class", "ME_Jackhammer", true];
                _Bucket setVariable["owner", getPlayerUID player, true];
                _veh animate["Jackhammer", 0];
                _Bucket attachTo[_veh, _posveh];
                detach _Bucket;
                sleep 2;
                _veh animate["Attachment", 0];
            };
            if ((_veh animationPhase "Claw") > 0.5) then {
                _Bucket = "A3PL_MiniExcavator_Claw"
                createvehicle[0, 0, 0];
                [player, _veh, _Bucket] remoteExec ["Server_Vehicle_AtegoHandle", 2];
                sleep 2;
                _Bucket setVariable["class", "ME_Claw", true];
                _Bucket setVariable["owner", getPlayerUID player, true];
                _veh animate["Claw", 0];
                _Bucket attachTo[_veh, _posveh];
                detach _Bucket;
                sleep 2;
                _veh animate["Attachment", 0];
            };
        };
    }],
    ["", "Conectar Balde", {
        _veh = player_objIntersect;
        if (_veh animationPhase "Attachment" < 0.5) then {
            _veh animate["Bucket", 1];
            _veh animate["Attachment", 1];
            [Player_ItemClass, -1] call Caue_Inventory_Add;
            [false] call Caue_Inventory_PutBack;
        };
    }],
    ["A3PL_MiniExcavator", "Conectar Garra", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Attachment" < 0.5) then {
            _veh animate["Claw", 1];
            _veh animate["Attachment", 1];
            [Player_ItemClass, -1] call Caue_Inventory_Add;
            [false] call Caue_Inventory_PutBack;
        };
    }],
    ["", "Conectar Jackhammer", {
        _veh = player_objIntersect;

        if (_veh animationPhase "Attachment" < 0.5) then {
            _veh animate["Jackhammer", 1];
            _veh animate["Attachment", 1];
            [Player_ItemClass, -1] call Caue_Inventory_Add;
            [false] call Caue_Inventory_PutBack;
        };
    }],
    ["", "Modo de Operações", {
        _veh = player_objIntersect;
        if (player == (driver _veh)) then {
            player action["moveToTurret", _veh, [0]];
        };
    }],
    ["", "Modo Motorista", {
        _veh = player_objIntersect;
        if (player == (_veh turretUnit[0])) then {
            player action["moveToDriver", _veh];
        };
    }],
    ["", "Alternar Holofotes", {
        _veh = player_objIntersect;
        if (_veh animationSourcePhase "Spotlight" < 0.5) then {
            _veh animateSource["Spotlight", 1];
            if (_veh animationSourcePhase "Head_Lights" < 0.5) then {
                player action["lightOn", _veh];
            };

        } else {
            _veh animateSource["Spotlight", 0];
            if (_veh animationSourcePhase "Head_Lights" < 0.5) then {
                player action["lightOff", _veh];
            };
        };

    }],
    ["", "Alternar Freio Rotor", {
        private["_veh"];
        _veh = player_objIntersect;
        if ((!("inspect_hitengine1"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitengine2"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hithrotor1"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hithrotor2"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hithrotor3"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hithrotor4"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitvrotor1"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitvrotor2"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitvrotor3"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hittransmission1"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitfuel1"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitgear1"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitgear2"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitgear3"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitgear4"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hithstabilizerl11"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hithstabilizerr11"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitlight1"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitpitottube1"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitpitottube2"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitstaticport1"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitstaticport2"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_hitvstabilizer11"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_intake1"
                IN(player_objIntersect getVariable "Inspection"))) or(!("inspect_intake2"
                IN(player_objIntersect getVariable "Inspection")))) exitwith {
            ["Aircraft: Please complete the pre flight check", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationPhase "switch_rotor_brake" < 0.5) then {
            _veh animate["switch_rotor_brake", 1];
            ["Aircraft: Rotor Brake Disengaged", Color_Green] call A3PL_HUD_Notification;
        } else {
            _veh animate["switch_rotor_brake", 0];
            ["Aircraft: Rotor Brake Engaged", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Alternar Baterias", {
        private["_veh"];
        _veh = player_objIntersect;
        if (_veh animationPhase "switch_rotor_brake" < 0.5) exitwith {
            ["Aircraft: Please contact a FAA CFI for instructions", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationSourcePhase "Batteries" < 0.5) then {
            _veh animateSource["Batteries", 1];
            ["Aircraft: Batteries On", Color_Green] call A3PL_HUD_Notification;
        } else {
            _veh animateSource["Batteries", 0];
            ["Aircraft: Batteries Off", Color_Red] call A3PL_HUD_Notification;
            sleep 0.5;
            _veh animate["Switch_Radio_Atc", 1];
            ["Aircraft: ATC Radio Off", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Alternar o Rádio ATC", {
        private["_veh"];
        _veh = player_objIntersect;
        if (_veh animationSourcePhase "Batteries" < 0.5) exitwith {
            _veh animate["Switch_Radio_Atc", 0];
            ["Aircraft: Please contact a FAA CFI for instructions", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationPhase "Switch_Radio_Atc" < 0.5) then {
            _veh animate["Switch_Radio_Atc", 1];
            ["Aircraft: ATC Radio On", Color_Green] call A3PL_HUD_Notification;
            if ((player getVariable "job") IN["police", "fifr", "faa"]) then {
                _veh setVariable["clearance", true, true];
            };
            TF_lr_dialog_radio = player call TFAR_fnc_VehicleLR;
            TF_lr_dialog_radio call TFAR_fnc_setActiveLrRadio;
            call TFAR_fnc_onLrDialogOpen;
        };
        if (_veh animationPhase "Switch_Radio_Atc" > 0.5) then {
            TF_lr_dialog_radio = player call TFAR_fnc_VehicleLR;
            TF_lr_dialog_radio call TFAR_fnc_setActiveLrRadio;
            call TFAR_fnc_onLrDialogOpen;
        };
    }],
    ["", "Fechar Acelerador (Motor 1)", {
        private["_veh"];
        _veh = player_objIntersect;
        if (_veh animationPhase "Switch_Radio_Atc" < 0.5) exitwith {
            ["Aircraft: Please contact a FAA CFI for instructions", Color_Red] call A3PL_HUD_Notification;
        };
        if (!(_veh getVariable["clearance", false])) exitwith {
            ["Aircraft: No ATC clearance, please switch to 126mhz for clearance", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationPhase "switch_throttle" < 0.5) then {
            _veh animate["switch_throttle", 1];
            ["Aircraft: Throttle Closed (Engine 1)", Color_Green] call A3PL_HUD_Notification;
        } else {
            _veh animate["switch_throttle", 0];
            ["Aircraft: Throttle Open (Engine 1)", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Alternar Starter (Motor 1)", {
        private["_veh"];
        _veh = player_objIntersect;
        if (_veh animationPhase "switch_throttle" < 0.5) exitwith {
            ["Aircraft: Please contact a FAA CFI for instructions", Color_Red] call A3PL_HUD_Notification;
        };
        if (!(_veh getVariable["clearance", false])) exitwith {
            ["Aircraft: No ATC clearance, please switch to 126mhz for clearance", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationPhase "switch_starter" < 0.5) then {
            _veh animate["switch_starter", 1];
            ["Aircraft: Starter Engaged (Engine 1)", Color_Green] call A3PL_HUD_Notification;
        } else {
            _veh engineOn false;
            _veh animate["switch_starter", 0];
            ["Aircraft: Starter Disengaged (Engine 1)", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Fechar Acelerador (Motor 2)", {
        private["_veh"];
        _veh = player_objIntersect;
        if (_veh animationPhase "switch_starter" < 0.5) exitwith {
            ["Aircraft: Please contact a FAA CFI for instructions", Color_Red] call A3PL_HUD_Notification;
        };
        if (!(_veh getVariable["clearance", false])) exitwith {
            ["Aircraft: No ATC clearance, please switch to 126mhz for clearance", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationPhase "switch_throttle2" < 0.5) then {
            _veh animate["switch_throttle2", 1];
            _veh animatesource["throttleRTD1", 0];
            ["Aircraft: Throttle Closed (Engine 2)", Color_Green] call A3PL_HUD_Notification;
        } else {
            _veh animate["switch_throttle2", 0];
            ["Aircraft: Throttle Open (Engine 2)", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Alternar Starter (Motor 2)", {
        private["_veh"];
        _veh = player_objIntersect;
        if ((_veh animationPhase "switch_throttle2" < 0.5) or(player_objintersect animationSourcePhase "Inspect_Panel2_1" > 0.5) or(player_objintersect animationSourcePhase "Inspect_Panel1_1" > 0.5)) exitwith {
            ["Aircraft: Please contact a FAA CFI for instructions", Color_Red] call A3PL_HUD_Notification;
        };
        if (!(_veh getVariable["clearance", false])) exitwith {
            ["Aircraft: No ATC clearance, please switch to 126mhz for clearance", Color_Red] call A3PL_HUD_Notification;
        };
        if (_veh animationPhase "switch_throttle2" > 0.5) then {
            ["Aircraft: Starter Engaged (Engine 2)", Color_Green] call A3PL_HUD_Notification;
            _veh animate["switch_starter", 2];
            sleep 1;
            _veh engineOn true;


            sleep 32;
            _veh animate["switch_starter", 0];
            ["Aircraft: Starter Disengaged (Engine 2)", Color_Red] call A3PL_HUD_Notification;
            sleep 0.5;
            ["Aircraft: Starter Disengaged (Engine 1)", Color_Red] call A3PL_HUD_Notification;
            sleep 0.5;
            _veh animate["switch_throttle", 0];
            ["Aircraft: Throttle Open (Engine 1)", Color_Red] call A3PL_HUD_Notification;
            sleep 0.5;
            _veh animate["switch_throttle2", 0];
            ["Aircraft: Throttle Open (Engine 2)", Color_Red] call A3PL_HUD_Notification;
        }
        else {
            _veh engineOn false;
            _veh animate["switch_starter", 1];
            ["Aircraft: Starter Disengaged (Engine 2)", Color_Red] call A3PL_HUD_Notification;
        };
    }],
    ["", "Inspecionar Motor #1", {
        private["_veh"];
        _veh = player_objIntersect;
        if (_veh animationSourcePhase "Inspect_Panel1_1" < 0.5) exitwith {};
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitengine1";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Motor #2", {
        private["_veh"];
        _veh = player_objIntersect;
        if (_veh animationSourcePhase "Inspect_Panel2_1" < 0.5) exitwith {};
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitengine2";
        _veh setVariable["Inspection", _Inspection, true];

    }],
    ["", "Inspecionar Rotor Principal #1", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hithrotor1";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Rotor Principal #2", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hithrotor2";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Rotor Principal #3", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hithrotor3";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Rotor Principal #4", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hithrotor4";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Rotor de Cauda #1", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitvrotor1";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Rotor de Cauda #2", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitvrotor2";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Rotor de Cauda Central", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitvrotor3";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Transmissão", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hittransmission1";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Combustível", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitfuel1";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Engrenagem #1", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitgear1";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Engrenagem #2", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitgear2";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Engrenagem #3", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitgear3";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Engrenagem #4", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitgear4";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Estabilizador Horizontal #1", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hithstabilizerl11";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Estabilizador Horizontal #2", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hithstabilizerr11";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Luzes de Pouso", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitlight1";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Tubo Pitot #1", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitpitottube1";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Tubo Pitot #2", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitpitottube2";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Porta Estática #1", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitstaticport1";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Porta Estática #2", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitstaticport2";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspecionar Estabilizador Vertical", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_hitvstabilizer11";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspect Intake #1", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_intake1";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Inspect Intake #2", {
        private["_veh"];
        _veh = player_objIntersect;
        _Inspection = _veh getVariable "Inspection";
        _Inspection pushBack "inspect_intake2";
        _veh setVariable["Inspection", _Inspection, true];
    }],
    ["", "Toggle Left Engine Hatch", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Inspect_Panel1_1" < 0.5) then {
            _veh animateSource["Inspect_Panel1_1", 1];
        } else {
            _veh animateSource["Inspect_Panel1_1", 0];
        };
    }],
    ["", "Toggle Right Engine Hatch", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "Inspect_Panel2_1" < 0.5) then {
            _veh animateSource["Inspect_Panel2_1", 1];
        } else {
            _veh animateSource["Inspect_Panel2_1", 0];
        };
    }],
    ["", "Spin Sign", {
        _veh = player_objIntersect;

        if (_veh animationSourcePhase "LPlate" < 0.5) then {
            _veh animateSource["LPlate", 1];
        } else {
            _veh animateSource["LPlate", 0];
        };
    }],
    ["", "Usar Jerry Can", {
        [player_objintersect] spawn A3PL_Vehicle_Jerrycan;
    }],
    ["", "Soltar/Pegar Ancora", {
        [player_objintersect] spawn A3PL_Vehicle_Anchor;
    }],
    ["A3PL_WheelieBin", "Pegar Lixeira", {
        if ((player getVariable["job", "unemployed"]) != "waste") exitwith {
            ["Você não está trabalhando para como lixeiro!"] call A3PL_HUD_Notification;
        };
        [player_objintersect] call Caue_Inventory_Pickup;
    }],
    ["A3PL_WheelieBin", "Colocar Lixeira no Caminhão", {
        [player_objintersect] call A3PL_Waste_LoadBin;
    }],
    ["A3PL_P362_Garbage_Truck", "Tirar Lixeira do Caminhão", {
        [player_objintersect, player_nameintersect] call A3PL_Waste_UnloadBin;
    }],
    ["", "Virar Lixeira da Esquerda", {
        _veh = player_objIntersect;
        if (_veh animationSourcePhase "Bin1" < 0.5) then {
            [_veh, "bin1"] call A3PL_Waste_FlipBin;
        };
    }],
    ["", "Abaixar Lixeira da Esquerda", {
        _veh = player_objIntersect;
        if (_veh animationSourcePhase "Bin1" > 0.5) then {
            _veh animateSource["Bin1", 0.1];
        };
    }],
    ["", "Virar Lixeira da Direita", {
        _veh = player_objIntersect;
        if (_veh animationSourcePhase "Bin2" < 0.5) then {
            [_veh, "bin2"] call A3PL_Waste_FlipBin;
        };
    }],
    ["", "Abaixar Lixeira da Direita", {
        _veh = player_objIntersect;
        if (_veh animationSourcePhase "Bin2" > 0.5) then {
            _veh animateSource["Bin2", 0.1];
        };
    }],
    ["", "Abrir Lixeira", {
        _veh = player_objIntersect;
        if (_veh animationPhase "Lid" < 0.5) then {
            _veh animate["Lid", 1];
        };
    }],
    ["", "Fechar Lixeira", {
        _veh = player_objIntersect;
        if (_veh animationPhase "Lid" > 0.5) then {
            _veh animate["Lid", 0];
        };
    }],
    ["", "Abaixar/Levantar Rampa de Carros", {
        [player_objintersect] call A3PL_Vehicle_TrailerAttachObjects;
    }],
    ["", "Toggle Mooring Line", {
        [] call A3PL_Vehicle_Mooring;
    }],
    ["", "Alternar Engate", {
        _veh = player_objIntersect;
        if (_veh animationSourcePhase "Hitch_Fold" < 0.5) then {
            _veh animateSource["Hitch_Fold", 1];
        } else {
            _veh animateSource["Hitch_Fold", 0];
        };
    }],
    ["", "Alternar Gooseneck", {
        [player_objintersect] call A3PL_Vehicle_Toggle_Gooseneck;
    }],
    ["Land_A3PL_BarGate", "Abrir/Fechar Portão", {
        private["_bargate", "_anim"];
        _bargate = player_objintersect;
        _anim = (player_nameintersect splitstring "_") select 1;

        if (_bargate animationSourcePhase _anim < 0.5) then {
            _bargate animateSource[_anim, 1];
        } else {
            _bargate animateSource[_anim, 0];
        };
    }],
    ["", "Retirar Veiculo da Garagem", {
        [] call Caue_Storage_Open;
    }],
    ["", "Garagem", {
        [] call Caue_Storage_Open;
    }],
    ["", "Guardar Veiculo", {
        [] call Caue_Storage_Store;
    }],
    ["", "Guardar Aeronave", {
        ["plane"] call Caue_Storage_Store;
    }],
    ["", "Apreender Veiculo", {
        [] call A3PL_JobRoadWorker_Impound;
    }],
    ["land_a3pl_sheriffpd", "Abrir/Fechar Porta Garagem", {
        _intersect = player_objintersect;
        _nameintersect = player_nameintersect;
        if (_nameintersect IN["door_1_1", "door_1_2", "door_1_3"]) exitwith {
            if (_intersect animationSourcePhase "garage1" < 0.1) then {
                _intersect animateSource["garage1", 1];
            } else {
                _intersect animateSource["garage1", 0];
            };
        };

        if (_nameintersect IN["door_2_1", "door_2_2", "door_2_3"]) exitwith {
            if (_intersect animationSourcePhase "garage2" < 0.1) then {
                _intersect animateSource["garage2", 1];
            } else {
                _intersect animateSource["garage2", 0];
            };
        };
    }],
    ["land_a3pl_sheriffpd", "Usar Botão SD", {
        private["_name", "_anim", "_inter"];
        _name = player_nameintersect;
        _inter = player_objintersect;

        switch (_name) do {
            case "garageDoor_button":{
                    _anim = "garage"
                };
            case "garageDoor_button2":{
                    _anim = "garage"
                };
            case "door3_button":{
                    _anim = ["door3", "door4"]
                };
            case "door3_button2":{
                    _anim = ["door3", "door4"]
                };
            case "door5_button":{
                    _anim = ["door5", "door6"]
                };
            case "door5_button2":{
                    _anim = ["door5", "door6"]
                };
            case "door7_button":{
                    _anim = ["door7", "door8"]
                };
            case "door7_button2":{
                    _anim = ["door7", "door8"]
                };
            case "door9_button":{
                    _anim = ["door9", "door10"]
                };
            case "door9_button2":{
                    _anim = ["door9", "door10"]
                };
            case "door11_button":{
                    _anim = "door11"
                };
            case "door11_button2":{
                    _anim = "door11"
                };
        };

        if (typeName _anim == "ARRAY") exitwith {
            {
                if (_inter animationPhase _x < 0.1) then {
                    _inter animate[_x, 1];
                } else {
                    _inter animate[_x, 0];
                };
            }
            foreach _anim;
        };

        if (_inter animationPhase _anim < 0.1) then {
            _inter animate[_anim, 1];
        } else {
            _inter animate[_anim, 0];
        };
    }],
    ["", "Abrir/Fechar Porta Prisão", {
        private["_name", "_inter"];
        _name = player_nameintersect;
        _inter = player_objintersect;

        if (_inter animationPhase _name < 0.1) then {
            _inter animate[_name, 1];
        } else {
            _inter animate[_name, 0];
        };
    }],
    ["C_man_w_worker_F", "Acessar CCTV System", {
        [] spawn A3PL_CCTV_Open;
    }],
    ["", "Sentar-se", {
        [player_objintersect, player_nameintersect] call A3PL_Lib_Sit;
    }],
    ["", "Deitar", {
        [player_objintersect, player_nameintersect] call A3PL_Lib_Sit;
    }],
    ["", "Levantar-se", {
        [player, "amovppnemstpsnonwnondnon"] remoteExec ["A3PL_Lib_SyncAnim", 0];
    }],
    ["Land_A3PL_Bank", "Conectar Furadeira", {
        [player_objintersect] call Caue_BHeist_SetDrill;
    }],
    ["Land_A3PL_Bank", "Abrir Caixa de Depósito", {
        [player_objintersect, player_nameintersect] spawn Caue_BHeist_OpenDeposit;
    }],
    ["Land_A3PL_Bank", "Fechar Cofre", {
        [player_objintersect, player_nameintersect] call Caue_BHeist_CloseVault;
    }],
    ["Land_A3PL_Garage", "Melhorar Veiculo", {
        [player_objintersect] spawn A3PL_Garage_Open;
    }],
    ["Land_A3PL_Gas_Station", "Abrir Menu do Posto", {
        [] call A3PL_Hydrogen_Open;
    }],
    ["Land_A3PL_Gas_Station", "Pagar Pelo Combustivel", {
        _station = player_objintersect;
        _customer = player;
        _price = (_station getVariable["pump1", [0, "0"]]) select 1;
        _price = parseNumber _price;
        _price = round _price;

        _owner = [(_station getVariable "bOwner")] call Caue_Lib_UIDToObject;

        _beforeTax = _price;
        _tax = round(_price - (_price * ((100 - (server getVariable ["SALES_TAX",0]))/100)));
        _price = _price - _tax;

        if ((isNull _owner)) exitwith {
            _cash = _customer getVariable["getjobplayerguy", 0];
            _bank = _customer getVariable["getrankplayerguy", 0];
            if (_price <= _cash) then {
                [_customer, 'getjobplayerguy', ((_customer getVariable 'getjobplayerguy') - _price)] remoteExec ["Server_Core_ChangeVar", 2];
                [format["Você pagou $%1 pelo Combustivel", _beforeTax], Color_Green] call A3PL_HUD_Notification;
            } else {
                [_customer, 'getrankplayerguy', ((_customer getVariable 'getrankplayerguy') - _price)] remoteExec ["Server_Core_ChangeVar", 2];
                [format["Você pagou $%1 pelo Combustivel", _beforeTax], Color_Green] call A3PL_HUD_Notification;
            };
            _station setVariable ["pump1",["0","0"],true];
        };
        if (_customer isEqualTo _owner) exitWith {["Você não pode pagar pelo proprio Combustivel", Color_Red] call A3PL_HUD_Notification;};
        _cash = _customer getVariable["getjobplayerguy", 0];
        _bank = _customer getVariable["getrankplayerguy", 0];
        if ((_price >= _cash) && (_price >= _bank)) exitwith {
            ["Você não pode pagar pelo Combustivel", Color_Red] call A3PL_HUD_Notification;
            ["O cliente não pode pagar pelo Combustivel", Color_Red] remoteExec ["A3PL_HUD_Notification", _owner];
        };
        if (_price <= _cash) then {
            [_customer, 'getjobplayerguy', ((_customer getVariable 'getjobplayerguy') - _price)] remoteExec ["Server_Core_ChangeVar", 2];
            [_owner, 'getjobplayerguy', ((_owner getVariable 'getjobplayerguy') + _price)] remoteExec ["Server_Core_ChangeVar", 2];
            [format["Você pagou $%1 pelo Combustivel", _beforeTax], Color_Green] call A3PL_HUD_Notification;
            [format["O cliente pagou $%1 pelo Combustivel. Imposto pago $%2", _price, _tax], Color_Green] remoteExec ["A3PL_HUD_Notification", _owner];
            ["SALES_TAX", _tax] remoteExec ["Server_Government_ReceiveTax", 2];
        } else {
            [_customer, 'getrankplayerguy', ((_customer getVariable 'getrankplayerguy') - _price)] remoteExec ["Server_Core_ChangeVar", 2];
            [_owner, 'getjobplayerguy', ((_owner getVariable 'getjobplayerguy') + _price)] remoteExec ["Server_Core_ChangeVar", 2];
            [format["Você pagou $%1 pelo Combustivel", _beforeTax], Color_Green] call A3PL_HUD_Notification;
            [format["O cliente pagou $%1 pelo Combustivel. Imposto pago $%2", _price, _tax], Color_Green] remoteExec ["A3PL_HUD_Notification", _owner];
            ["SALES_TAX", _tax] remoteExec ["Server_Government_ReceiveTax", 2];
        };
        _station setVariable ["pump1",["0","0"],true];
    }],
    ["land_a3pl_ch", "Eleger Prefeito", {
        [] call Caue_Mayor_Open;
    }],
    ["land_a3pl_ch", "Torne-se Candidato", {
        [] call Caue_Mayor_AddCandidate;
    }],
    ["Land_A3PL_Mailbox", "Abrir/Fechar Caixa de Correio", {
        private["_obj"];
        _obj = player_objintersect;
        if (_obj animationPhase "door_mailbox" < 0.5) then {
            _obj animate["door_mailbox", 1];
        } else {
            _obj animate["door_mailbox", 0];
        };
    }],
    ["", "Ligar Luzes", {
        [player_objintersect, player_nameintersect] call A3PL_Lib_SwitchLight
    }],
    ["Land_A3PL_Impound", "Abrir/Fechar Portão Impound", {
        _impound = player_objintersect;
        if (_impound animationSourcePhase "GarageDoor" < 0.5) then {
            _impound animateSource["GarageDoor", 1];
        } else {
            _impound animateSource["GarageDoor", 0];
        };
    }],
    ["", "Usar Botão Porta", {
        [player_objintersect, player_nameIntersect] call Caue_Intersect_HandleDoors;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 1", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 2", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 3", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 4", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 5", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 6", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 7", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 8", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 9", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 10", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 11", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 12", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 13", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela 14", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela Principal 1", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela Principal 2", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Cela Cozinha", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "Abrir Garagem", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_Prison", "LOCKDOWN!", {
        [player_objintersect, player_nameIntersect] call A3PL_Prison_HandleDoor;
    }],
    ["Land_A3PL_CH", "Abrir/Fechar Sala Réu", {
        [] call Caue_Intersect_HandleDoors;
    }],
    ["Land_A3PL_CH", "Abrir/Fechar Sala Réu", {
        [] call Caue_Intersect_HandleDoors;
    }],
    ["Land_A3PL_CH", "Abrir Tesouraria", {
        [] call Caue_Government_Open;
    }],
    ["", "Trancar/Destrancar Porta", {
        private _obj = player_objintersect;

        if !(((_obj getVariable ["owner",[""]]) select 0) isEqualTo (getPlayerUID player)) exitwith {
            ["Você não tem as chaves desta casa.",Color_Red] call A3PL_HUD_Notification;
        };

        _locked = _obj getVariable["unlocked",nil];
        if (isNil "_locked") then {
            _obj setVariable["unlocked",true,true];
            [format["As portas foram destrancadas"],Color_Green] call A3PL_HUD_Notification;
        } else {
            _obj setVariable["unlocked",nil,true];
            [format["As portas foram trancadas"],Color_Red] call A3PL_HUD_Notification;
        };
        player playAction "gesture_key";
    }],
    ["Land_A3PL_EstateSign", "Start Auction", {
        [player, player_objintersect] remoteExec ["Server_Housing_InitLottery", 2];
    }],
    ["Land_A3PL_GreenhouseSign", "Alugar Estufa", {
        [player_objIntersect] call A3PL_JobFarming_Rent;
    }],
    ["Land_A3PL_BusinessSign", "Alugar Negócio", {
        [player_objIntersect] call A3PL_Business_Buy;
    }],
    ["Land_A3PL_EstateSign", "Comprar Casa", {
        [player_objIntersect] spawn Caue_Housing_OpenBuyMenu;
    }],
    ["Land_A3PL_EstateSign", "Vender Casa", {
        [player_objIntersect] spawn Caue_Housing_OpenSellMenu;
    }],
    ["Land_A3PL_Showroom", "Abrir Portas Concessionária", {
        private["_obj", "_name"];

        _obj = player_objintersect;
        _name = player_nameIntersect;
        if ((isNull _obj) or(_name == "")) exitwith {
            ["Incapaz de abrir portas", Color_Red] call A3PL_HUD_Notification;
        };
        if (!(typeOf _obj == "Land_A3PL_Showroom")) exitwith {
            ["Você não está olhando para uma concessionária", Color_Red] call A3PL_HUD_Notification;
        };

        if (_name == "garage1_open") then {
            _obj animateSource["garage2", 1];
        } else {
            _obj animateSource["garage1", 1];
        };
    }],
    ["Land_A3PL_Showroom", "Fechar Portas Concessionária", {
        private["_obj", "_name"];

        _obj = player_objintersect;
        _name = player_nameIntersect;
        if ((isNull _obj) or(_name == "")) exitwith {
            ["Incapaz de fechar portas", Color_Red] call A3PL_HUD_Notification;
        };
        if (!(typeOf _obj == "Land_A3PL_Showroom")) exitwith {
            ["Você não está olhando para uma concessionária", Color_Red] call A3PL_HUD_Notification;
        };

        if (_name == "garage1_close") then {
            _obj animateSource["garage2", 0];
        } else {
            _obj animateSource["garage1", 0];
        };
    }],
    ["Land_A3PL_Garage", "Usar Elevador", {
        [player_objintersect] call A3PL_JobMechanic_UseLift;
    }],
    ["", "Bater na Porta", {
        playSound3D["A3PL_Common\effects\knockdoor.ogg", player, true, getPosASL player, 2, 1, 10];
    }],
    ["", "Talk to Purge Weapons Dealers", {
        ["Shop_Purge_Guns"] call Caue_Shop_Open;
    }],
    ["", "Talk to Purge Foods Dealer", {
        ["Shop_Purge_Food"] call Caue_Shop_Open;
    }],
    ["A3PL_DogCage", "Abrir Menu K-9", {
        [] call A3PL_Dogs_OpenMenu
    }],
    ["", "Abrir Importação/Exportação", {
        [] call A3PL_IE_Open;
    }],
    ["", "Lavar Dinheiro Sujo", {
        [] call Caue_BHeist_ConvertCash;
    }],
    ["", "Loja de Roupas",{
        ["Loja de Roupas"] spawn Caue_Clothing_Open;
    }],
    ["", "Acessar Loja de Paintball", {
        ["Shop_Paintball"] call Caue_Shop_Open;
    }],
    ["", "Acessar Loja de Bebidas", {
        ["Shop_Willy"] call Caue_Shop_Open;
    }],
    ["", "Acessar Loja do Lenhador", {
        ["Shop_Hemlock"] call Caue_Shop_Open;
    }],
    ["", "Acessar Loja do Minerador", {
        ["Shop_Mike"] call Caue_Shop_Open;
    }],
    ["", "Inciar/Parar Trabalhar como Lixeiro", {
        [] spawn A3PL_Waste_StartJob;
    }],
    ["", "Inciar/Parar Trabalhar como Entregador", {
        [] spawn A3PL_Delivery_StartJob;
    }],
    ["", "Inciar/Parar Trabalhar como Exterminador", {
        [] call A3PL_Exterminator_Start;
    }],
    ["", "Inciar/Parar Alugar Kart", {
        if ((player getVariable ["job","unemployed"]) == "KARTING") exitwith {["Você parou de alugar o kart!",Color_Red]; [] call A3PL_NPC_LeaveJob};
        if (!(player inArea "A3PL_Marker_SallySpeedway")) exitwith {["Você não está na área para usar este kart!"] call A3PL_HUD_Notification;};
        player setVariable ["job","karting"];
        ["C_Kart_01_F",(getpos player),"KARTING",900,"A3PL_Marker_SallySpeedway"] spawn A3PL_Lib_JobVehicle_Assign;
        ["Você alugou um kart!",Color_Green] call A3PL_HUD_Notification;
    }],
    ["", "Comprar mapa de mineração de ferro ($500)", {
        ["iron"] call A3PL_JobWildcat_BuyMap;
    }],
    ["", "Comprar mapa de mineração de carvão ($500)", {
        ["coal"] call A3PL_JobWildcat_BuyMap;
    }],
    ["", "Comprar mapa de mineração de aluminio ($500)", {
        ["aluminium"] call A3PL_JobWildcat_BuyMap;
    }],
    ["", "Comprar mapa de mineração de enxofre ($500)", {
        ["sulphur"] call A3PL_JobWildcat_BuyMap;
    }],
    ["", "Comprar mapa de mineração de petróleo ($1000)", {
        ["oil"] call A3PL_JobWildCat_BuyMap;
    }],
    ["", "Acessar Loja de Moveis", {
        ["Shop_Furniture"] call Caue_Shop_Open;
    }],
    ["", "Acessar Loja Geral", {
        ["Shop_General_Supplies"] call Caue_Shop_Open;
    }],
    ["", "Acessar Loja de Equipamentos", {
        ["Shop_Hardware"] call Caue_Shop_Open;
    }],
    ["", "Acessar Loja de Sementes", {
        ["Shop_Seeds"] call Caue_Shop_Open;
    }],
    ["", "Equipamentos EMS", {
        private["_whitelist"];
        _whitelist = "fifr";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["Shop_FIFR_Supplies_Vendor"] call Caue_Shop_Open;
    }],
    ["", "Roupas EMS", {
        private["_whitelist"];
        _whitelist = "fifr";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["Roupas EMS"] spawn Caue_Clothing_Open;
    }],
    ["", "Loja de Bombeiros", {
        private["_whitelist"];
        _whitelist = "fifr";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["Shop_FIFR_Supplies_Vendor2"] call Caue_Shop_Open;
    }],
    ["", "Veiculos EMS", {
        private["_whitelist"];
        _whitelist = "fifr";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["fifr"] spawn Caue_FactionVehicles_Open;
    }],
    ["", "Equipamentos SD", {
        private _whitelist = "police";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja",_whitelist],Color_Red] call A3PL_HUD_Notification;
        };
        ["Shop_SD_Supplies_Vendor"] call Caue_Shop_Open;
    }],
    ["", "Roupas SD", {
        private _whitelist = "police";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["Roupas SD"] spawn Caue_Clothing_Open;
    }],
    ["", "Veiculos SD", {
        private["_whitelist"];
        _whitelist = "police";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["police"] spawn Caue_FactionVehicles_Open;
    }],
    ["", "Acessar Loja de Veiculos", {
        ["Shop_Vehicles_Supplies_Vendor"] call Caue_Shop_Open;
    }],
    ["", "Loja de Equipamentos FAA", {
        private["_whitelist"];
        _whitelist = "faa";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["Shop_FAA_Supplies_Vendor"] call Caue_Shop_Open;
    }],
    ["", "Veiculos FAA", {
        private["_whitelist"];
        _whitelist = "faa";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["faa"] spawn Caue_FactionVehicles_Open;
    }],
    ["", "Loja de Equipamentos DOJ", {
        private["_whitelist"];
        _whitelist = "doj";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["Shop_DOJ_Supplies_Vendor"] call Caue_Shop_Open;
    }],
    ["", "Veiculos DOJ", {
        if ((player getVariable["faction", "citizen"]) != "doj") exitwith {
            ["System: Only the doj faction can use this shop", Color_Red] call A3PL_HUD_Notification;
        };
        ["doj"] spawn Caue_FactionVehicles_Open;
    }],
    ["", "Loja de Equipamentos DMV", {
        private["_whitelist"];
        _whitelist = "dmv";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["Shop_DMV_Supplies_Vendor"] call Caue_Shop_Open;
    }],
    ["", "Veiculos DMV", {
        private["_whitelist"];
        _whitelist = "dmv";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["dmv"] spawn Caue_FactionVehicles_Open;
    }],
    ["", "Loja de Equipamentos DOC", {
        if !((player getVariable["faction", "citizen"]) IN["police", "doc"]) exitwith {
            [format["System: Only the SD/DOC faction can use this shop"], Color_Red] call A3PL_HUD_Notification;
        };
        ["Shop_DOC_Supplies_Vendor"] call Caue_Shop_Open;
    }],
    ["", "Loja de Equipamentos USCG", {
        if !(["uscgcop"] call Caue_DMV_Check) exitwith {
            ["Você não pode usar esta loja", Color_Red] call A3PL_HUD_Notification;
        };
        ["Shop_USCG_Supplies_Vendor"] call Caue_Shop_Open;
    }],
    ["", "Veiculos USCG Carros", {
        if (true) exitwith {["Você não pode usar esta loja", Color_Red] call A3PL_HUD_Notification;};
        ["uscg"] spawn Caue_FactionVehicles_Open;
    }],
    ["", "Veiculos USCG Barcos", {
        if !((["uscgcop"] call Caue_DMV_Check) || ((player getVariable ["faction","citizen"]) isEqualTo "fifr")) exitwith {["Você não pode usar esta loja", Color_Red] call A3PL_HUD_Notification;};
        ["uscg_b"] spawn Caue_FactionVehicles_Open;
    }],
    ["", "Veiculos USCG Aeronaves", {
        if !((player getVariable ["job","unemployed"]) IN ["fifr","police"]) exitwith {["Você não pode usar esta loja", Color_Red] call A3PL_HUD_Notification;};
        ["uscg_h"] spawn Caue_FactionVehicles_Open;
    }],
    ["", "Acessar Indústria Química", {
        ["Indústria Química"] call Caue_Factory_Open;
    }],
    ["", "Acessar Siderúrgica", {
        ["Siderúrgica"] call Caue_Factory_Open;
    }],
    ["", "Acessar Refinaria de Oleo", {
        ["Refinaria de Oleo"] call Caue_Factory_Open;
    }],
    ["", "Fabrica de Armas", {
        ["Fabrica de Armas"] call Caue_Factory_Open;
    }],
    ["", "Fabrica de Alimentos", {
        ["Fabrica de Alimentos"] call Caue_Factory_Open;
    }],
    ["", "Fabrica de Mercadorias", {
        ["Fabrica de Mercadorias"] call Caue_Factory_Open;
    }],
    ["", "Fabrica de Veiculos", {
        ["Fabrica de Veiculos"] call Caue_Factory_Open;
    }],
    ["", "Fabrica de Peças de Veiculos", {
        ["Fabrica de Peças de Veiculos"] call Caue_Factory_Open;
    }],
    ["", "Fabrica de Veiculos Facção", {
        ["Fabrica de Veiculos Facção"] call Caue_Factory_Open;
    }],
    ["", "Fabrica de Barcos", {
        ["Fabrica de Barcos"] call Caue_Factory_Open;
    }],
    ["", "Fabrica de Aeronaves", {
        ["Fabrica de Aeronaves"] call Caue_Factory_Open;
    }],
    ["", "Falar com Atendente McFishers", {
        ["mcfishers_initial"] call A3PL_NPC_Start;
    }],
    ["", "Pegar Uniforme McFishers", {
        ["mcfisher"] call A3PL_NPC_ReqJobUniform;
    }],
    ["", "Falar com Atendente Taco Hell", {
        ["tacohell_initial"] call A3PL_NPC_Start;
    }],
    ["", "Pegar Uniforme Taco Hell", {
        ["tacohell"] call A3PL_NPC_ReqJobUniform;
    }],
    ["", "Falar com Pescador", {
        ["fisherman_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com o Policial", {
        ["police_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com Medico", {
        ["fifr_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com Atendente do Banco", {
        ["bank_initial"] call A3PL_NPC_Start;
    }],
    ["", "Acessar Conta da Facção", {
        [] call Caue_FactionBank_Open;
    }],
    ["", "Falar com Atendente Mercado", {
        ["auct_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com Fazendeiro", {
        ["farmer_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com Recuperador de Petroleo", {
        ["oil_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com Comprador de Petroleo", {
        ["oilbarrel_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com FAA 1", {
        ["faastart_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com FAA 2", {
        ["faastop_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com Traficante", {
        ["Shop_DrugsDealer"] call Caue_Shop_Open;
    }],
    ["", "Falar com Mercado Negro", {
        ["Shop_BlackMarket"] call Caue_Shop_Open;
    }],
    ["", "Falar com Vendedor de Armas", {
        private["_whitelist"];
        _whitelist = "doj";
        if ((player getVariable["faction", "citizen"]) != _whitelist) exitwith {
            [format["Apenas o(a) %1 pode usar esta loja", _whitelist], Color_Red] call A3PL_HUD_Notification;
        };
        ["Shop_Guns_Vendor"] call Caue_Shop_Open;
    }],
    ["", "Falar com Vendedor de Veiculos", {
        ["Shop_Guns_Vendor"] call Caue_Shop_Open;
    }],
    ["", "Falar com Atendente do Mercado", {
        ["Shop_Supermarket"] call Caue_Shop_Open;
    }],
    ["", "Falar com Atendente da Prefeitura", {
        ["government_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com NPC DOJ", {
        ["doj_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com NPC DOC", {
        ["doc_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com NPC DMV", {
        ["dmv_initial"] call A3PL_NPC_Start;
    }],
    ["", "Falar com Caçador", {
        ["Shop_Hunting_Supplies"] call Caue_Shop_Open;
    }],
    ["", "Falar com o Mecanico", {
        ["roadside_service_initial"] call A3PL_NPC_Start;
    }],
    ["", "Acessar Loja de Joias", {
        ["Shop_GemStone"] call Caue_Shop_Open;
    }],
    ["", "Esfolar Animal", {
        [player_objintersect] call A3PL_Hunting_Skin;
    }],
    ["", "Roubar Loja", {
        [player_objintersect] spawn Caue_Robbery_Shop;
    }],
    ["", "Subir Escada", {
        if !([] call Caue_Lib_InputAccess) exitWith {};
        player action ["ladderup",player_objIntersect,0,0];
    }],
    ["", "Descer Escada", {
        if !([] call Caue_Lib_InputAccess) exitWith {};
        player action ["ladderdown",player_objIntersect,0,1];
    }],
    ["", "Evidencias Fisicas", {
        if !([] call Caue_Lib_InputAccess) exitWith {};
        if !([] call Caue_Player_AntiSpam) exitWith {};
        player action ["Gear",player_objIntersect];
    }],
    ["", "Evidencias Virtuais", {
        private _target = player_objIntersect;
        if ((_target isEqualTo evidence_locker) && !((getPlayerUID player) IN ["76561198166982296","76561198149798646","76561198221208684"]) && (_target getVariable ["lockedlocker",true])) exitWith {["O armario de evidencias esta trancado ou voce nao tem a chave",Color_Red] call A3PL_HUD_Notification;};
        if !([] call Caue_Lib_InputAccess) exitWith {};
        [_target] spawn Caue_Trunk_Open;
    }],
    ["", "Roubar Objeto", {
        if !([] call Caue_Lib_InputAccess) exitWith {};
        [player_objIntersect] spawn Caue_Robbery_Placeables;
    }]
];
publicVariable "Config_QuickActions";










Config_CarFurnitureBlacklist = [
    ["K_Tahoe_Black",["a3pl_cabinet1","a3pl_cabinet2","a3pl_cabinet3","a3pl_bed1","a3pl_bed2"]]
];
publicVariable "Config_CarFurnitureBlacklist";

Config_Placeables = ["GroundWeaponHolder", "RoadCone_F", "A3PL_Spikes_Closed", "A3PL_Spikes_Open", "A3PL_Ski_Base", "A3PL_Bed1", "A3PL_Bed2", "A3PL_Cabinet1", "A3PL_Cabinet2", "A3PL_Cabinet3", "A3PL_Chair1"];
publicVariable "Config_Placeables";

Config_Items_ZOffset = [
    ["Roadcone_F", 0.25],
    ["A3PL_Handcuffs", 0],
    ["A3PL_Spikes_Closed", 0.02],
    ["A3PL_Burger_Bun", 0.045],
    ["A3PL_Burger_Full", 0.045],
    ["A3PL_BucketFull", 0.2],
    ["A3PL_Bucket", 0.2],
    ["A3PL_FishingBuoy", 0.18],
    ["A3PL_DeliveryBox", 0.11],
    ["A3PL_Salad", 0.02],
    ["A3PL_TacoShell", 0.065],
    ["A3PL_Fish_Raw", 0.01],
    ["A3PL_Fish_Cooked", 0.01],
    ["A3PL_Fish_Burned", 0.01],
    ["GroundWeaponHolder", 0.7],
    ["A3PL_OilBarrel", 0.44],
    ["A3PL_FD_yAdapter", 0.04],
    ["A3PL_FD_HoseEnd_Player", 0.07],
    ["A3PL_FD_HoseRolled", 0.35],
    ["A3PL_FD_Mask_Obj", -0.55],
    ["A3PL_Bookshelf", 1.02],
    ["A3PL_Bed3", 0.5],
    ["A3PL_DiningChair", 0.65],
    ["A3PL_DiningTableProps", 0.52],
    ["A3PL_Bar_Cabinet", 0.76],
    ["A3PL_Kennel", 0.5],
    ["A3PL_NightStandLamp", 0.31],
    ["A3PL_CabinetDoubleTop", 0.34],
    ["A3PL_CabinetSingleTop", 0.34],
    ["A3PL_CabinetTopCorner", 0.34],
    ["A3PL_CounterCorner", 0.5],
    ["A3PL_CounterDoubleCabinet", 0.5],
    ["A3PL_CounterDrawer", 0.16],
    ["A3PL_CounterSingleCabinet", 0.34],
    ["A3PL_CounterTop1", 0.54],
    ["A3PL_CounterTop2", 0.34],
    ["A3PL_CounterTop3", 0.34],
    ["A3PL_SinkBigCounter", 0.65],
    ["A3PL_SinkSingleCabinet", 0.65],
    ["A3PL_Bed1", 0.5],
    ["A3PL_Bed2", 0.5],
    ["A3PL_Chair1", 0.5],
    ["A3PL_Chair2", 0.5],
    ["A3PL_Chair3", 0.5],
    ["A3PL_Chair4", 0.5],
    ["A3PL_Cabinet1", 1],
    ["A3PL_Cabinet2", 1],
    ["A3PL_Cabinet3", 1],
    ["A3PL_coffeeTable1", 0.15],
    ["A3PL_coffeeTable2", 0.15],
    ["A3PL_coffeeTable3", 0.15],
    ["A3PL_coffeeTable4", 0.2],
    ["A3PL_CornerSova", 0.35],
    ["A3PL_DryingTowel", 0.25],
    ["A3PL_Flasket", 0.45],
    ["A3PL_KitchenChair1", 0.45],
    ["A3PL_KitchenChair2", 0.45],
    ["A3PL_KitchenShelf1", 0.35],
    ["A3PL_KitchenShelf2", 0.35],
    ["A3PL_KitchenShelf3", 0.35],
    ["A3PL_KitchenShelfCorner", 0.35],
    ["A3PL_KitchenTable1", 0.4],
    ["A3PL_KitchenTable2", 0.4],
    ["A3PL_Lamp1", 0.74],
    ["A3PL_Lamp2", 0.74],
    ["A3PL_ModularKitchen1", 0.4],
    ["A3PL_ModularKitchen2", 0.4],
    ["A3PL_ModularKitchen3", 0.4],
    ["A3PL_ModularKitchen4", 0.4],
    ["A3PL_Rack1", 0.75],
    ["A3PL_Rack2", 0.75],
    ["A3PL_Pouf", 0.2],
    ["A3PL_Sofa1", 0.35],
    ["A3PL_Sofa2", 0.35],
    ["A3PL_Sofa3", 0.35],
    ["A3PL_Sofa4", 0.35],
    ["A3PL_Table1", 0.4],
    ["A3PL_Table2", 0.4],
    ["A3PL_tvtable1", 0.3],
    ["A3PL_tvtable2", 0.3],
    ["A3PL_tvtable3", 0.2],
    ["A3PL_mirror", 0.25],
    ["A3PL_Pumpjack", 0.75],
    ["A3PL_RoadCone_x10", 0.25],
    ["A3PL_PlasticBarrier_02", 0.2],
    ["A3PL_RoadCone", 0.2],
    ["A3PL_Polyester", 0.1],
    ["A3PL_LPG", 0.75],
    ["A3PL_Kerosene", 0.4],
    ["A3PL_CanisterOil", 0.07],
    ["A3PL_Money", -0.05],
    ["A3PL_Wrench", -0.01],
    ["A3PL_Bandage", 0.01],
    ["A3PL_Medical_Icepack", -0.05],
    ["A3PL_Medical_Splint", -0.05],
    ["A3PL_Medical_Cast", -0.03],
    ["A3PL_Medical_Endotracheal", -0.05],
    ["A3PL_PainKillers", -0.025],
    ["A3PL_Medical_Kit", -0.05],
    ["A3PL_Medical_OxygenMask", -0.05],
    ["A3PL_BloodBag", -0.05],
    ["A3PL_Planter2", 0.23],
    ["A3PL_WorkBench", 0.4],
    ["A3PL_Cannabis_Lamp_200W", 0.66],
    ["A3PL_Cannabis_Lamp_500W", 0.66],
    ["A3PL_Cannabis_Lamp_1000W", 0.66],
    ["A3PL_Fan", 0.55],
    ["A3PL_Mixer", 0.3],
    ["A3PL_Scale", 0.04],
    ["A3PL_Pavilion", 1.2],
    ["A3PL_Cannabis_Bud", 0.01],
    ["A3PL_MarijuanaBag", 0.1],
    ["A3PL_WoodenLog", 0.22],
    ["A3PL_Distillery", 1],
    ["A3PL_Distillery_Hose", 0.5],
    ["A3PL_Jug", 0.13],
    ["A3PL_Jug_Corked", 0.13],
    ["A3PL_Jug_Green", 0.13],
    ["A3PL_Jug_Green_Corked", 0.13],
    ["A3PL_Grainsack_Malt", 0.07],
    ["A3PL_Grainsack_Yeast", 0.07],
    ["A3PL_Grainsack_CornMeal", 0.07]
];
publicVariable "Config_Items_ZOffset";
