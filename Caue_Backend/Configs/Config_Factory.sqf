Config_Factories = [
    ["Siderúrgica", [4433.15, 6672.56, 5],
        ["f_Iron_Ingot", "inh", "Iron_Ingot", "item", 1, [
            ["Iron_Ore", 4]
        ], 1],
        ["f_Coal_Ingot", "inh", "Coal_Ingot", "item", 1, [
            ["Coal_Ore", 4]
        ], 1],
        ["f_Steel", "(x30) Aço", "Steel", "item", 1, [
            ["Iron_Ingot", 4],
            ["Coal_Ingot", 2]
        ], 30],
        ["f_Aluminium", "(x30) Alumínio", "Aluminium", "item", 1, [
            ["Aluminium_Ingot", 4],
            ["Iron_Ingot", 2],
            ["Coal_Ingot", 6]
        ], 30],
        ["f_Titanium_Ingot", "inh", "Titanium_Ingot", "item", 1, [
            ["Titanium_Ore", 6]
        ], 1],
        ["f_Titanium", "(x15) Titânio", "Titanium", "item", 1, [
            ["Titanium_Ingot", 4],
            ["Coal_Ingot", 2]
        ], 15],
        ["f_Steel_Pellet", "inh", "Steel_Pellet", "item", 1, [
            ["Steel", 60]
        ], 1],
        ["f_Aluminium_Pellet", "inh", "Aluminium_Pellet", "item", 1, [
            ["Aluminium", 60]
        ], 1],
        ["f_Titanium_Pellet", "inh", "Titanium_Pellet", "item", 1, [
            ["Titanium", 60]
        ], 1],
        ["f_ME_Bucket", "inh", "ME_Bucket", "item", 5, [
            ["Steel", 15]
        ], 1],
        ["f_ME_Jackhammer", "inh", "ME_Jackhammer", "item", 5, [
            ["Steel", 15]
        ], 1]
    ],
    ["Indústria Química", [4433.15, 6672.56, 5],
        ["f_Synthetic_Fiber", "(50x) Fibra Sintética", "Synthetic_Fibre", "item", 5, [
            ["Crude_Oil", 1]
        ], 50],
        ["f_Glass_Fiber", "(50x) Fibra de Vidro", "Glass_Fibre", "item", 5, [
            ["Sand", 1]
        ], 50],
        ["f_Titanium_Ore", "(x4) Minério de Titânio", "Titanium_Ore", "item", 5, [
            ["Sand", 2]
        ], 4],
        ["f_Polyester", "inh", "Polyester", "item", 5, [
            ["Synthetic_Fibre", 1]
        ], 1],
        ["f_Aramid", "inh", "Aramid", "item", 5, [
            ["Synthetic_Fibre", 2]
        ], 1],
        ["f_Rubber", "inh", "Rubber", "item", 5, [
            ["Synthetic_Fibre", 5]
        ], 1],
        ["f_Fibreglass", "inh", "Fibreglass", "item", 5, [
            ["Glass_Fibre", 10]
        ], 1],
        ["f_Plastic", "(15x) Plastico", "Plastic", "item", 5, [
            ["Crude_Oil", 1]
        ], 15],
        ["f_Aluminium_Ingot", "inh", "Aluminium_Ingot", "item", 1, [
            ["Aluminium_Ore", 2]
        ], 1],
        ["f_Sulphur_Powder", "(x10) Enxofre", "Sulphur_Powder", "item", 5, [
            ["Sulphur_Ore", 5]
        ], 10],
        ["f_gunpowder", "(x5) Polvora", "Gunpowder", "item", 5, [
            ["Sulphur_Powder", 5],
            ["Coal_Ingot", 1]
        ], 5],
        ["f_Kevlar", "inh", "Kevlar", "item", 5, [
            ["Aramid", 50],
            ["Synthetic_Fibre", 80]
        ], 1],
        ["f_Glass", "inh", "Glass", "item", 5, [
            ["Glass_Fibre", 5]
        ], 1],
        ["f_Steel", "(x60) Aço", "Steel", "item", 1, [
            ["Steel_Pellet", 1]
        ], 60],
        ["f_Aluminium", "(x60) Alumínio", "Aluminium", "item", 1, [
            ["Aluminium_Pellet", 1]
        ], 60],
        ["f_Titanium", "(x60) Titânio", "Titanium", "item", 1, [
            ["Titanium_Pellet", 1]
        ], 60]
    ],
    ["Refinaria de Oleo", [4433.15, 6672.56, 5],
        ["f_pumpjack", "inh", "Pumpjack", "item", 5, [
            ["Steel_Pellet", 2],
            ["Engine", 1]
        ], 1],
        ["f_Petrol", "inh", "Petrol", "item", 5, [
            ["Crude_Oil", 1]
        ], 3],
        ["f_jerrycan", "inh", "jerrycan", "item", 5, [
            ["Petrol", 1],
            ["Steel", 6]
        ], 2],
        ["f_LPG", "inh", "LPG", "item", 5, [
            ["Crude_Oil", 1]
        ], 4],
        ["f_Kerosene", "inh", "Kerosene", "item", 5, [
            ["Crude_Oil", 5]
        ], 1],
        ["f_CanisterOil", "inh", "CanisterOil", "item", 5, [
            ["Crude_Oil", 1]
        ], 20]
    ],

    ["Fabrica de Armas", [3520.06, 7622.76, 2],
        ["f_CZ550", "inh", "A3PL_CZ550", "weapon", 60, [
            ["Steel", 100]
        ], 1],
        ["f_5rnd_3006", "(x10) 5rnd .30-06", "A3PL_5rnd_3006", "magazine", 30, [
            ["Steel", 30],
            ["Gunpowder", 10]
        ], 10],
        ["f_RH_mp412", "inh", "RH_mp412", "weapon", 60, [
            ["Steel", 200],
            ["Blueprint_MP412", 1]
        ], 1],
        ["f_6Rnd_357_Mag", "(x10) .357 Magnum", "RH_6Rnd_357_Mag", "magazine", 30, [
            ["Steel", 100],
            ["Gunpowder", 10],
            ["Blueprint_6Rnd_357_Mag", 1]
        ], 10],
        ["f_RH_m1911", "inh", "RH_m1911", "weapon", 60, [
            ["Steel", 200],
            ["Blueprint_M1911A1", 1]
        ], 1],
        ["f_RH_7Rnd_45cal_m1911", "(x10) M1911 mag", "RH_7Rnd_45cal_m1911", "magazine", 30, [
            ["Steel", 100],
            ["Gunpowder", 10],
            ["Blueprint_7Rnd_45cal_m1911", 1]
        ], 10],
        ["f_RH_gsh18", "inh", "RH_gsh18", "weapon", 60, [
            ["Steel", 200],
            ["Blueprint_GSH18", 1]
        ], 1],
        ["f_RH_18Rnd_9x19_gsh", "(x10) GSH-18 mag", "RH_18Rnd_9x19_gsh", "magazine", 30, [
            ["Steel", 100],
            ["Gunpowder", 10],
            ["Blueprint_18Rnd_9x19_gsh", 1]
        ], 10],
        ["f_RH_g17", "inh", "RH_g17", "weapon", 60, [
            ["Steel", 200],
            ["Blueprint_G17", 1]
        ], 1],
        ["f_RH_17Rnd_9x19_g17", "(x10) Glock 17 mag", "RH_17Rnd_9x19_g17", "magazine", 30, [
            ["Steel", 100],
            ["Gunpowder", 10],
            ["Blueprint_17Rnd_9x19_g17", 1]
        ], 10],
        ["f_RH_python", "inh", "RH_python", "weapon", 60, [
            ["Steel", 200],
            ["Blueprint_Python", 1]
        ], 1],
        ["f_RH_6Rnd_357_Mag", "(x10) .357 Magnum", "RH_6Rnd_357_Mag", "magazine", 30, [
            ["Steel", 100],
            ["Gunpowder", 10],
            ["Blueprint_6Rnd_357_Mag", 1]
        ], 10],
        ["f_hlc_rifle_FAL5000", "inh", "hlc_rifle_FAL5000", "weapon", 60, [
            ["Steel", 500],
            ["Blueprint_FAL", 1]
        ], 1],
        ["f_30Rnd_762x39_Mag_F", "(x10) FAL Mag 20rnd", "hlc_20Rnd_762x51_B_fal", "magazine", 60, [
            ["Steel", 100],
            ["Gunpowder", 10],
            ["Blueprint_30Rnd_762x39_Mag_F", 1]
        ], 10]
    ],
    ["Fabrica de Alimentos", [4433.15, 6672.56, 5],
        ["f_cola", "inh", "coke", "item", 5, [
            ["coca", 1],
            ["sugarcane", 1],
            ["Aluminium_Ingot", 1]
        ], 6],
        ["f_burgerbun", "Burger bun", "burger_bun", "item", 5, [
            ["wheat", 1]
        ], 10],
        ["f_burger_raw", "inh", "burger_raw", "item", 5, [
            ["bucket_full", 1]
        ], 10],
        ["f_tacoshell", "inh", "tacoshell", "item", 5, [
            ["Corn", 1]
        ], 20],
        ["f_salad", "inh", "salad", "item", 5, [
            ["Lettuce", 1]
        ], 5],
        ["f_fish", "inh", "fish_raw", "item", 5, [
            ["bucket_full", 1]
        ], 10],
        ["f_lamington", "inh", "lamington", "item", 5, [
            ["meat_sheep", 1],
            ["lettuce", 1]
        ], 2],
        ["f_sausages", "inh", "sausages", "item", 5, [
            ["meat_boar", 1],
            ["lettuce", 1]
        ], 2],
        ["f_meatpie", "inh", "meatpie", "item", 5, [
            ["meat_sheep", 1],
            ["meat_boar", 1],
            ["meat_goat", 1],
            ["fish_raw", 1],
            ["lettuce", 1]
        ], 2],
        ["f_lamington_tag", "inh", "lamington", "item", 5, [
            ["meat_sheep_tag", 1],
            ["lettuce", 1]
        ], 2],
        ["f_sausages_tag", "inh", "sausages", "item", 5, [
            ["meat_boar_tag", 1],
            ["lettuce", 1]
        ], 2],
        ["f_meatpie_tag", "inh", "meatpie", "item", 5, [
            ["meat_sheep_tag", 1],
            ["meat_boar_tag", 1],
            ["meat_goat_tag", 1],
            ["fish_raw", 1],
            ["lettuce", 1]
        ], 2]
    ],
    ["Fabrica de Mercadorias", [4433.15, 6672.56, 5],
        ["f_lockpick", "(x5) Chave Mestra", "lockpick", "item", 5, [
            ["Steel", 10]
        ], 5],
        ["f_rope", "(x5) Corda", "rope", "item", 5, [
            ["Synthetic_Fibre", 25]
        ], 5],
        ["f_distillery", "inh", "distillery", "item", 5, [
            ["Steel", 50],
            ["Glass", 50],
            ["log", 15]
        ], 1],
        ["f_distillery_hose", "inh", "distillery_hose", "item", 5, [
            ["Plastic", 15]
        ], 1],
        ["f_grinder", "inh", "grinder", "item", 5, [
            ["Steel", 15],
            ["Aluminium", 5]
        ], 1],
        ["f_repairwrench", "(x4) Chave de Reparo", "repairwrench", "item", 5, [
            ["Steel", 5]
        ], 4],
        ["f_Binocular", "inh", "Binocular", "aitem", 5, [
            ["Steel", 2],
            ["Glass", 2]
        ], 1],
        ["f_Rangefinder", "inh", "Rangefinder", "aitem", 5, [
            ["Steel", 2],
            ["Glass", 2],
            ["Plastic", 5]
        ], 1],
        ["f_FD_Adapter", "inh", "FD_Adapter", "item", 5, [
            ["Steel", 5]
        ], 5],
        ["f_FD_Hose", "inh", "FD_Hose", "item", 5, [
            ["Rubber", 1]
        ], 3],
        ["f_Net", "inh", "net", "item", 5, [
            ["Plastic", 5]
        ], 10],
        ["f_Bucket_Empty", "inh", "bucket_empty", "item", 5, [
            ["Plastic", 1]
        ], 5],
        ["f_Camper_Light", "inh", "Camper_Light", "item", 5, [
            ["Steel", 5],
            ["CanisterOil", 5]
        ], 10],
        ["f_RocketB", "inh", "rocket_blue", "item", 5, [
            ["Plastic", 3],
            ["Gunpowder", 2],
            ["Sulphur_Powder", 1]
        ], 3],
        ["f_RocketR", "inh", "rocket_red", "item", 5, [
            ["Plastic", 3],
            ["Gunpowder", 2],
            ["Sulphur_Powder", 1]
        ], 3],
        ["f_RocketG", "inh", "rocket_green", "item", 5, [
            ["Plastic", 3],
            ["Gunpowder", 2],
            ["Sulphur_Powder", 1]
        ], 3],
        ["f_RocketY", "inh", "rocket_yellow", "item", 5, [
            ["Plastic", 3],
            ["Gunpowder", 2],
            ["Sulphur_Powder", 1]
        ], 3]
    ],

    ["Fabrica de Peças de Veiculos", [11816.7, 9296, 0],
        ["f_Engine", "inh", "Engine", "item", 5, [
            ["Steel_Pellet", 2]
        ], 1],
        ["f_Trans", "inh", "Trans", "item", 5, [
            ["Steel_Pellet", 1]
        ], 1],
        ["f_Radiator", "inh", "Radiator", "item", 5, [
            ["Steel_Pellet", 1]
        ], 1],
        ["f_BrakeRotors", "Freio (x4)", "BrakeRotors", "item", 5, [
            ["Steel_Pellet", 2]
        ], 4],
        ["f_Diff", "inh", "Diff", "item", 5, [
            ["Steel_Pellet", 1]
        ], 1],
        ["f_4WDDiff", "inh", "4WDDiff", "item", 5, [
            ["Aluminium_Pellet", 2]
        ], 1],
        ["f_FuelTank", "inh", "FuelTank", "item", 5, [
            ["Aluminium_Pellet", 1]
        ], 1],
        ["f_Chassis", "inh", "Chassis", "item", 5, [
            ["Aluminium_Pellet", 1]
        ], 1],
        ["f_DriveShaft", "inh", "DriveShaft", "item", 5, [
            ["Steel_Pellet", 2]
        ], 1],
        ["f_Exhaust", "Tubos de Escape (x2)", "Exhaust", "item", 5, [
            ["Aluminium_Pellet", 1]
        ], 2],
        ["f_Windows", "Janelas (x4)", "Windows", "item", 5, [
            ["Glass", 2]
        ], 4],
        ["f_SteelRims", "Aros de Aço (x10)", "SteelRims", "item", 5, [
            ["Steel_Pellet", 1]
        ], 10],
        ["f_AlloyRims", "Aros de Alumiino (x10)", "AlloyRims", "item", 5, [
            ["Aluminium_Pellet", 1]
        ], 10],
        ["f_Tyres", "Pneus (x8)", "Tyres", "item", 5, [
            ["Rubber", 4]
        ], 8],
        ["f_HEEngine", "inh", "HEEngine", "item", 5, [
            ["Aluminium_Pellet", 2]
        ], 1],
        ["f_HETrans", "inh", "HETrans", "item", 5, [
            ["Steel_Pellet", 2]
        ], 1],
        ["f_HERadiator", "inh", "HERadiator", "item", 5, [
            ["Steel_Pellet", 2]
        ], 1],
        ["f_HEBrakeRotors", "Freios de alta potência (x2)", "HEBrakeRotors", "item", 5, [
            ["Steel_Pellet", 4]
        ], 2],
        ["f_HEFuelTank", "Tanque de Combustivel de alta potência", "HEFuelTank", "item", 5, [
            ["Aluminium_Pellet", 2]
        ], 1],
        ["f_HEChassis", "inh", "HEChassis", "item", 5, [
            ["Aluminium_Pellet", 4]
        ], 1],
        ["f_HEDriveShaft", "inh", "HEDriveShaft", "item", 5, [
            ["Aluminium_Pellet", 2]
        ], 1],
        ["f_HEExhaust", "Tubos de Escape de alta potência (x2)", "HEExhaust", "item", 5, [
            ["Aluminium_Pellet", 2]
        ], 2],
        ["f_HEDiff", "inh", "HEDiff", "item", 5, [
            ["Steel_Pellet", 2]
        ], 1]
    ],
    ["Fabrica de Veiculos", [5555.16, 6811.24, 0.00161457],
        ["f_Cadillac", "inh", "alr_cadillac", "car", 900, [
            ["Engine", 1],
            ["Trans", 1],
            ["Radiator", 2],
            ["BrakeRotors", 4],
            ["4WDDiff", 1],
            ["FuelTank", 1],
            ["Chassis", 1],
            ["Exhaust", 2],
            ["Windows", 4],
            ["SteelRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_Mustang", "inh", "A3PL_Mustang", "car", 900, [
            ["HEEngine", 1],
            ["HETrans", 1],
            ["HERadiator", 1],
            ["HEBrakeRotors", 4],
            ["4WDDiff", 1],
            ["HEFuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 2],
            ["HEExhaust", 1],
            ["Windows", 4],
            ["AlloyRims", 4],
            ["Tyres", 4],
            ["Aluminium_Pellet", 16]
        ], 1],
        ["f_BMW_M3", "inh", "A3PL_BMW_M3", "car", 10, [
            ["Engine", 1],
            ["HETrans", 1],
            ["Radiator", 1],
            ["BrakeRotors", 4],
            ["HEDiff", 1],
            ["HEFuelTank", 1],
            ["Chassis", 1],
            ["HEDriveShaft", 1],
            ["Exhaust", 1],
            ["Windows", 4],
            ["AlloyRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_CVPI_rust", "Ford Crown Victoria (Rusted)", "A3PL_CVPI_Rusty", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["Windows", 4]
        ], 1],
        ["f_CVPI", "inh", "A3PL_CVPI", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["BrakeRotors", 4],
            ["FuelTank", 1],
            ["Exhaust", 1],
            ["Windows", 2],
            ["SteelRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_Tahoe", "inh", "A3PL_Tahoe", "car", 10, [
            ["Engine", 1],
            ["HETrans", 1],
            ["Radiator", 1],
            ["HEBrakeRotors", 1],
            ["4WDDiff", 1],
            ["HEFuelTank", 1],
            ["Chassis", 1],
            ["DriveShaft", 1],
            ["Exhaust", 1],
            ["Windows", 4],
            ["AlloyRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_Charger", "inh", "A3PL_Charger", "car", 10, [
            ["HEEngine", 1],
            ["HETrans", 1],
            ["Radiator", 1],
            ["BrakeRotors", 4],
            ["HEDiff", 1],
            ["HEFuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 1],
            ["HEExhaust", 1],
            ["Windows", 2],
            ["AlloyRims", 4],
            ["Tyres", 4],
            ["Aluminium_Pellet", 12]
        ], 1],
        ["f_150", "inh", "A3PL_F150", "car", 10, [
            ["Engine", 1],
            ["HETrans", 1],
            ["Radiator", 1],
            ["BrakeRotors", 4],
            ["4WDDiff", 1],
            ["FuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 1],
            ["Exhaust", 1],
            ["Windows", 2],
            ["AlloyRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_F150LB", "inh", "A3PL_F150_Marker", "car", 900, [
            ["Engine", 1],
            ["HETrans", 1],
            ["Radiator", 1],
            ["BrakeRotors", 4],
            ["4WDDiff", 1],
            ["FuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 1],
            ["Exhaust", 1],
            ["Windows", 2],
            ["AlloyRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_Ram", "inh", "A3PL_Ram", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["BrakeRotors", 4],
            ["Diff", 1],
            ["FuelTank", 1],
            ["Chassis", 1],
            ["SteelRims", 4],
            ["Windows", 2],
            ["Tyres", 4]
        ], 1],
        ["f_Wrangler", "inh", "A3PL_Wrangler", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["BrakeRotors", 4],
            ["Diff", 1],
            ["FuelTank", 1],
            ["Chassis", 1],
            ["Windows", 3],
            ["SteelRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_Gallardo", "inh", "A3PL_Gallardo", "car", 3600, [
            ["HEEngine", 1],
            ["HETrans", 1],
            ["HERadiator", 2],
            ["HEBrakeRotors", 4],
            ["4WDDiff", 1],
            ["HEFuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 2],
            ["HEExhaust", 1],
            ["Windows", 6],
            ["AlloyRims", 4],
            ["Tyres", 4],
            ["Titanium_Pellet", 35]
        ], 1],
        ["f_BMW_X5", "inh", "A3PL_BMW_X5", "car", 10, [
            ["Engine", 1],
            ["HETrans", 1],
            ["Radiator", 1],
            ["HEBrakeRotors", 2],
            ["4WDDiff", 1],
            ["HEFuelTank", 1],
            ["Chassis", 1],
            ["DriveShaft", 1],
            ["Exhaust", 1],
            ["Windows", 4],
            ["AlloyRims", 4],
            ["Tyres", 4],
            ["Aluminium_Pellet", 15]
        ], 1],
        ["f_Rover", "inh", "A3PL_Rover", "car", 10, [
            ["HEEngine", 1],
            ["HETrans", 1],
            ["HERadiator", 1],
            ["HEBrakeRotors", 4],
            ["4WDDiff", 1],
            ["HEFuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 2],
            ["HEExhaust", 1],
            ["Windows", 4],
            ["AlloyRims", 4],
            ["Tyres", 4],
            ["Aluminium_Pellet", 10]
        ], 1],
        ["f_Camaro", "inh", "A3PL_Camaro", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["Radiator", 1],
            ["BrakeRotors", 4],
            ["Diff", 1],
            ["FuelTank", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["Windows", 2],
            ["SteelRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_ZR1", "inh", "A3PL_VetteZR1", "car", 1800, [
            ["HEEngine", 1],
            ["HETrans", 1],
            ["HERadiator", 4],
            ["HEBrakeRotors", 4],
            ["4WDDiff", 1],
            ["HEFuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 2],
            ["HEExhaust", 1],
            ["Windows", 4],
            ["AlloyRims", 4],
            ["Tyres", 4],
            ["Titanium_Pellet", 25]
        ], 1],
        ["f_69Charger", "inh", "A3PL_Charger69", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["Radiator", 2],
            ["BrakeRotors", 4],
            ["Diff", 1],
            ["FuelTank", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["Windows", 4],
            ["SteelRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_HondaCRX", "inh", "A3PL_CRX", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["BrakeRotors", 4],
            ["FuelTank", 1],
            ["Exhaust", 1],
            ["Windows", 4],
            ["SteelRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_911GT2", "inh", "A3PL_911GT2", "car", 3600, [
            ["HEEngine", 1],
            ["HETrans", 1],
            ["HERadiator", 4],
            ["HEBrakeRotors", 4],
            ["4WDDiff", 1],
            ["HEFuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 2],
            ["HEExhaust", 1],
            ["Windows", 4],
            ["AlloyRims", 4],
            ["Tyres", 4],
            ["Titanium_Pellet", 30]
        ], 1],
        ["f_Silverado", "inh", "A3PL_Silverado", "car", 10, [
            ["HEEngine", 1],
            ["HETrans", 1],
            ["Radiator", 2],
            ["HEBrakeRotors", 4],
            ["4WDDiff", 1],
            ["FuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 1],
            ["Exhaust", 1],
            ["Windows", 4],
            ["AlloyRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_Challenger_Hellcat", "inh", "A3PL_Challenger_Hellcat", "car", 900, [
            ["HEEngine", 1],
            ["HETrans", 1],
            ["HERadiator", 2],
            ["HEBrakeRotors", 4],
            ["4WDDiff", 1],
            ["HEFuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 2],
            ["HEExhaust", 1],
            ["Windows", 4],
            ["AlloyRims", 4],
            ["Tyres", 4],
            ["Aluminium_Pellet", 18]
        ], 1],
        ["f_Charger15", "inh", "A3PL_Charger15", "car", 10, [
            ["HEEngine", 1],
            ["HETrans", 1],
            ["HERadiator", 1],
            ["HEBrakeRotors", 2],
            ["HEDiff", 1],
            ["HEFuelTank", 1],
            ["HEChassis", 1],
            ["HEDriveShaft", 1],
            ["HEExhaust", 1],
            ["Windows", 2],
            ["AlloyRims", 4],
            ["Tyres", 4],
            ["Aluminium_Pellet", 16]
        ], 1],
        ["f_scooter", "Scooter", "K_Scooter_DarkBlue", "car", 10, [
            ["Engine", 1],
            ["Trans", 1]
        ], 1],
        ["f_quad", "Quad", "C_Quadbike_01_F", "car", 10, [
            ["Engine", 1],
            ["Trans", 1]
        ], 1],
        ["f_CVPI_Taxi", "inh", "A3PL_CVPI_Taxi", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["Tyres", 4]
        ], 1],
        ["f_Tow_Truck", "inh", "A3PL_P362_TowTruck", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["Radiator", 2],
            ["BrakeRotors", 6],
            ["Diff", 2],
            ["HEFuelTank", 2],
            ["Chassis", 1],
            ["DriveShaft", 1],
            ["Windows", 2],
            ["SteelRims", 6],
            ["Tyres", 6]
        ], 1],
        ["f_Boat_Trailer", "inh", "A3PL_Boat_Trailer", "car", 10, [
            ["BrakeRotors", 4],
            ["Steel", 6],
            ["Tyres", 8]
        ], 1],
        ["f_Car_Trailer", "inh", "A3PL_Car_Trailer", "car", 10, [
            ["Steel", 180],
            ["Aluminium", 60],
            ["Tyres", 4]
        ], 1],
        ["f_Mini_Excavator", "inh", "A3PL_MiniExcavator", "car", 10, [
            ["HEEngine", 1],
            ["Trans", 1],
            ["Radiator", 1],
            ["BrakeRotors", 4],
            ["4WDDiff", 1],
            ["FuelTank", 1],
            ["Chassis", 1],
            ["DriveShaft", 1],
            ["Exhaust", 1],
            ["Windows", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Steel_Pellet", 5]
        ], 1],
        ["f_Box_Trailer", "inh", "A3PL_Box_Trailer", "car", 10, [
            ["BrakeRotors", 6],
            ["Diff", 2],
            ["Chassis", 1],
            ["SteelRims", 6],
            ["Tyres", 6]
        ], 1],
        ["f_Lowloader", "inh", "A3PL_Lowloader", "car", 10, [
            ["BrakeRotors", 6],
            ["Diff", 2],
            ["Chassis", 1],
            ["SteelRims", 6],
            ["Tyres", 6]
        ], 1],
        ["f_Tanker_Trailer", "inh", "A3PL_Tanker_Trailer", "car", 10, [
            ["BrakeRotors", 4],
            ["Diff", 2],
            ["Chassis", 1],
            ["SteelRims", 4],
            ["Tyres", 4]
        ], 1],
        ["f_Drill_Trailer", "inh", "A3PL_Drill_Trailer", "car", 10, [
            ["Engine", 1],
            ["Radiator", 2],
            ["SteelRims", 2],
            ["Tyres", 2]
        ], 1],
        ["f_Small_boat_trailer", "inh", "A3PL_Small_Boat_Trailer", "car", 10, [
            ["BrakeRotors", 2],
            ["Diff", 1],
            ["Chassis", 1],
            ["SteelRims", 2],
            ["Tyres", 2]
        ], 1],
        ["f_mailtruck", "inh", "A3PL_MailTruck", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["Radiator", 1],
            ["Windows", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["BrakeRotors", 4],
            ["DriveShaft", 1],
            ["Exhaust", 1]
        ], 1],
        ["f_Fuel_Van", "inh", "A3PL_Fuel_Van", "car", 10, [
            ["Engine", 1],
            ["Trans", 1],
            ["Radiator", 1],
            ["Windows", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["BrakeRotors", 4],
            ["DriveShaft", 1],
            ["Exhaust", 1]
        ], 1],
        ["f_p362", "inh", "A3PL_P362", "car", 10, [
            ["HEEngine", 1],
            ["Trans", 1],
            ["Radiator", 2],
            ["HEBrakeRotors", 6],
            ["Diff", 2],
            ["HEFuelTank", 2],
            ["Chassis", 1],
            ["DriveShaft", 1],
            ["Exhaust", 1],
            ["Windows", 3],
            ["SteelRims", 6],
            ["Tyres", 6]
        ], 1]
    ],

    ["Fabrica de Barcos", [3785.61,7590.345, 27.899],
        ["f_RHIB", "inh", "A3PL_RHIB", "car", 5, [
            ["Fibreglass", 50],
            ["HEEngine", 4],
            ["Rubber", 10]
        ], 1],
        ["f_Rebreather", "inh", "V_RebreatherB", "vest", 5, [
            ["Rubber", 2],
            ["Fibreglass", 8],
            ["Plastic", 10]
        ], 1],
        ["f_Motorboat", "inh", "A3PL_Motorboat", "car", 5, [
            ["Engine", 1],
            ["Fibreglass", 12]
        ], 1],
        ["f_Motorboat_USCG", "inh", "A3PL_Motorboat_Rescue", "car", 5, [
            ["Fibreglass", 12],
            ["Blueprint_Boat_Civil_01_rescue", 1]
        ], 1],
        ["f_RBM", "inh", "A3PL_RBM", "car", 5, [
            ["Aluminium_Pellet", 3],
            ["Glass", 5],
            ["Blueprint_RBM", 1]
        ], 1],
        ["f_LuxuryYatch", "inh", "A3PL_Yacht", "car", 1800, [
            ["Aluminium_Pellet", 100],
            ["Glass", 50],
            ["Titanium", 100],
            ["Fibreglass", 50],
            ["Steel", 100]
        ], 1],
        ["f_jetski", "Jet ski", "C_Scooter_Transport_01_F", "car", 10, [
            ["Engine", 1],
            ["Trans", 1]
        ], 1]
    ],
    ["Fabrica de Aeronaves", [2606.28, 5321.7, 1],
        ["f_Goose", "inh", "A3PL_Goose_Base", "plane", 5, [
            ["Aluminium_Pellet", 35],
            ["Steel", 50]
        ], 1],
        ["f_Heli", "inh", "Heli_Medium01_H", "plane", 5, [
            ["Aluminium_Pellet", 100],
            ["Glass", 40],
            ["Titanium", 20],
            ["Fibreglass", 40],
            ["Steel", 75]
        ], 1],
        ["f_CG_Heli", "inh", "Heli_Medium01_Coastguard_H", "plane", 5, [
            ["Aluminium_Pellet", 100],
            ["Glass", 40],
            ["Titanium", 20],
            ["Fibreglass", 40],
            ["Steel", 75]
        ], 1],
        ["f_Luxury_Heli", "inh", "Heli_Medium01_Luxury_H", "plane", 5, [
            ["Aluminium_Pellet", 100],
            ["Glass", 40],
            ["Titanium", 20],
            ["Fibreglass", 40],
            ["Steel", 75]
        ], 1],
        ["f_Military_Heli", "inh", "Heli_Medium01_Military_H", "plane", 5, [
            ["Aluminium_Pellet", 100],
            ["Glass", 40],
            ["Titanium", 20],
            ["Fibreglass", 40],
            ["Steel", 75]
        ], 1],
        ["f_Veteran_Heli", "inh", "Heli_Medium01_Veteran_H", "plane", 5, [
            ["Aluminium_Pellet", 100],
            ["Glass", 40],
            ["Titanium", 20],
            ["Fibreglass", 40],
            ["Steel", 75]
        ], 1],
        ["f_Goose_USCG", "inh", "A3PL_Goose_USCG", "plane", 5, [
            ["Aluminium_Pellet", 35],
            ["Steel", 50],
            ["Blueprint_Goose", 1]
        ], 1],
        ["f_Jayhawk_USCG", "inh", "A3PL_Jayhawk", "plane", 5, [
            ["Aluminium_Pellet", 30],
            ["Titanium_Pellet", 5],
            ["Glass", 6],
            ["Blueprint_Jayhawk", 1]
        ], 1],
        ["f_Heli_Medium01_Sheriff_H", "inh", "Heli_Medium01_Sheriff_H", "plane", 5, [
            ["Aluminium_Pellet", 30],
            ["Titanium_Pellet", 5],
            ["Glass", 6],
            ["Blueprint_CopHeli", 1]
        ], 1],
        ["f_Cessna172", "inh", "A3PL_Cessna172", "plane", 5, [
            ["Aluminium_Pellet", 30],
            ["Steel", 25]
        ], 1]
    ],
    ["Fabrica de Veiculos Facção", [5555.16, 6811.24, 0.00161457],
        ["f_f450", "inh", "jonzie_ambulance", "car", 5, [
            ["Engine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_f450", 1]
        ], 1],
        ["f_e350", "inh", "A3PL_E350", "car", 5, [
            ["Engine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_e350", 1]
        ], 1],
        ["f_tahoe_FD", "inh", "A3PL_Tahoe_FD", "car", 5, [
            ["Engine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_tahoe_FD", 1]
        ], 1],
        ["f_ladder", "inh", "A3PL_Pierce_Ladder", "car", 5, [
            ["HEEngine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 6],
            ["Tyres", 6],
            ["Windows", 4],
            ["Blueprint_ladder", 1]
        ], 1],
        ["f_hladder", "inh", "A3PL_Pierce_Heavy_Ladder", "car", 5, [
            ["HEEngine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 6],
            ["Tyres", 6],
            ["Windows", 4],
            ["Blueprint_ladder", 1]
        ], 1],
        ["f_pumper", "inh", "A3PL_Pierce_Pumper", "car", 5, [
            ["HEEngine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 6],
            ["Tyres", 6],
            ["Windows", 4],
            ["Blueprint_pumper", 1]
        ], 1],
        ["f_cvpi_PD", "inh", "A3PL_CVPI_PD", "car", 5, [
            ["Engine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_cvpi_PD", 1]
        ], 1],
        ["f_cvpi_PDST", "Ford Crown Victoria (Slicktop)", "A3PL_CVPI_PD_Slicktop", "car", 5, [
            ["Engine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_cvpi_PDST", 1]
        ], 1],
        ["f_tahoe_PD", "inh", "A3PL_Tahoe_PD", "car", 5, [
            ["Engine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_tahoe_PD", 1]
        ], 1],
        ["f_tahoe_PDST", "Chevrolet Tahoe (Slicktop)", "A3PL_Tahoe_PD_Slicktop", "car", 5, [
            ["Engine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_tahoe_PDST", 1]
        ], 1],
        ["f_mustang_PD", "inh", "A3PL_Mustang_PD", "car", 5, [
            ["HEEngine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_mustang_PD", 1]
        ], 1],
        ["f_mustang_PDST", "Ford Mustang (Slicktop)", "A3PL_Mustang_PD_Slicktop", "car", 5, [
            ["HEEngine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_mustang_PDST", 1]
        ], 1],
        ["f_charger_PD", "inh", "A3PL_Charger_PD", "car", 5, [
            ["Engine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_charger_PD", 1]
        ], 1],
        ["f_charger_PDST", "Dodge Charger (Slicktop)", "A3PL_Charger_PD_Slicktop", "car", 5, [
            ["Engine", 1],
            ["Chassis", 1],
            ["Exhaust", 1],
            ["SteelRims", 4],
            ["Tyres", 4],
            ["Windows", 4],
            ["Blueprint_charger_PDST", 1]
        ], 1]
    ],

    ["Admin Tools", [11816.7, 9296, 0],
        ["f_A3PL_FBI_Vest", "inh", "A3PL_FBI_Vest", "vest", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_FBI_Vest_Grey", "inh", "A3PL_FBI_Vest_Grey", "vest", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_FBI_Agent_Suit_Uniform", "inh", "A3PL_FBI_Agent_Suit_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_FBI_Suit_Tie_Uniform", "inh", "A3PL_FBI_Suit_Tie_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_FBI_Ballcap", "inh", "A3PL_FBI_Ballcap", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_GhostBusters_Grey_Uniform", "ish", "A3PL_GhostBusters_Grey_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_GhostBusters_Cap", "ish", "A3PL_GhostBusters_Cap", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Ghostbusters_Belt", "ish", "A3PL_Ghostbusters_Belt", "vest", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Red_Pball_Jersey_Uniform", "ish", "A3PL_Red_Pball_Jersey_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Blue_Pball_Jersey_Uniform", "ish", "A3PL_Blue_Pball_Jersey_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Pball_Larry_Jersey_Uniform", "ish", "A3PL_Pball_Larry_Jersey_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Pink_Pball_Jersey_Uniform", "ish", "A3PL_Pink_Pball_Jersey_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Green_Pball_Jersey_Uniform", "ish", "A3PL_Green_Pball_Jersey_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Purple_Pball_Jersey_Uniform", "ish", "A3PL_Purple_Pball_Jersey_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_U_B_Protagonist_VR", "ish", "U_B_Protagonist_VR", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_U_O_Protagonist_VR", "ish", "U_O_Protagonist_VR", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_U_I_Protagonist_VR", "ish", "U_I_Protagonist_VR", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_CamelTow_Uniform", "ish", "A3PL_CamelTow_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_CamelTow_Cap", "ish", "A3PL_CamelTow_Cap", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Exterminator_Uniform", "ish", "A3PL_Exterminator_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Exterminator_Cap", "ish", "A3PL_Exterminator_Cap", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Waste_Manage_Uni_Uniform", "ish", "A3PL_Waste_Manage_Uni_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Waste_Manage_Cap", "ish", "A3PL_Waste_Manage_Cap", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Waste_Manage_Vest", "ish", "A3PL_Waste_Manage_Vest", "vest", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Mining_Uniform", "ish", "A3PL_Mining_Uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Piratehat", "ish", "A3PL_Piratehat", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Conehat", "ish", "A3PL_Conehat", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Cowboy", "ish", "A3PL_Cowboy", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Crown", "ish", "A3PL_Crown", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Partyhat", "ish", "A3PL_Partyhat", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_rangehat", "ish", "A3PL_rangehat", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Russianhat", "ish", "A3PL_Russianhat", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Sargehat", "ish", "A3PL_Sargehat", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Sombrero", "ish", "A3PL_Sombrero", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Horse_Mask", "ish", "A3PL_Horse_Mask", "headgear", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Bikinigirl_uniform", "ish", "A3PL_Bikinigirl_uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Jumpsuit_uniform", "ish", "A3PL_Jumpsuit_uniform", "uniform", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_drill_bit", "ish", "drill_bit", "item", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Backpack_Drill", "ish", "A3PL_Backpack_Drill", "backpack", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_A3PL_Backpack_Money", "ish", "A3PL_Backpack_Money", "backpack", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_seedmarijuana", "ish", "seed_marijuana", "item", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_marijuana", "ish", "marijuana", "item", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_beer", "ish", "beer", "item", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_beer_gold", "ish", "beer_gold", "item", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_cocaine", "ish", "cocaine", "item", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_shrooms", "ish", "shrooms", "item", 0, [
            ["taxidriver", 1]
        ], 1],
        ["f_Burger", "ish", "burger_full_cooked", "item", 0, [
            ["taxidriver", 1]
        ], 5],
        ["f_Taco", "ish", "taco_cooked", "item", 0, [
            ["taxidriver", 1]
        ], 5],
        ["f_meatpie", "ish", "meatpie", "item", 0, [
            ["taxidriver", 1]
        ], 5],
        ["f_jerrycan", "ish", "jerrycan", "item", 0, [
            ["taxidriver", 1]
        ], 1]
    ]
];
publicVariable "Config_Factories";
