Config_Vehicle_Cars = [
    "A3PL_Mustang","A3PL_BMW_M3","A3PL_CVPI_Rusty","A3PL_CVPI","A3PL_Tahoe","A3PL_Charger","A3PL_F150","A3PL_Ram","A3PL_Wrangler","A3PL_Gallardo","A3PL_BMW_X5","A3PL_Rover","A3PL_Camaro","A3PL_VetteZR1","A3PL_CVPI_Taxi","A3PL_MailTruck","A3PL_Tahoe_FD","A3PL_Tahoe_PD","A3PL_Charger_PD","A3PL_CVPI_PD","A3PL_CVPI_PD_Slicktop","A3PL_Tahoe_PD_Slicktop","A3PL_Mustang_PD","A3PL_Mustang_PD_Slicktop","A3PL_Charger_PD_Slicktop","A3PL_Silverado_PD","A3PL_VetteZR1_PD","alr_cadillac","A3PL_Charger69","A3PL_CRX","A3PL_911GT2","A3PL_Challenger_Hellcat","A3PL_Charger15","K_Scooter_DarkBlue","C_Quadbike_01_F","A3PL_Silverado","A3PL_F150_Marker"
];
publicVariable "Config_Vehicle_Cars";

Config_Vehicle_Trucks = [
    "A3PL_MiniExcavator","A3PL_P362","A3PL_P362_TowTruck","A3PL_Boat_Trailer","A3PL_Box_Trailer","A3PL_Lowloader","A3PL_Tanker_Trailer","A3PL_Drill_Trailer","A3PL_Small_Boat_Trailer","A3PL_Pierce_Ladder","A3PL_Pierce_Heavy_Ladder","A3PL_Pierce_Pumper","A3PL_P362_Garbage_Truck","A3PL_Car_Trailer","A3PL_E350","jonzie_ambulance","A3PL_Fuel_Van"
];
publicVariable "Config_Vehicle_Trucks";

Config_Vehicle_Boats = [
    "A3PL_Motorboat","A3PL_RHIB","A3PL_RBM","A3PL_Motorboat_Rescue","A3PL_Yacht","C_Scooter_Transport_01_F"
];
publicVariable "Config_Vehicle_Boats";

Config_Vehicle_Planes = [
    "A3PL_Goose_Base","A3PL_Cessna172","Heli_Medium01_Medic_H","Heli_Medium01_Veteran_H","Heli_Medium01_Sheriff_H","A3PL_Jayhawk","Heli_Medium01_Coastguard_H","Heli_Medium01_Luxury_H","Heli_Medium01_H","Heli_Medium01_Military_H","A3PL_Goose_USCG"
];
publicVariable "Config_Vehicle_Planes";

Config_Garage_Upgrade = [
    ["A3PL_BMW_X5", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_Camaro", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_CVPI", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_CVPI_Taxi", ["Taxi_Sign", "addon", "Taxi_Sign", "Taxi Sign 1", "Taxi Sign for the roof", [0, 0, 0.7],
            [0, 2, 0], 0, ["Steel", 1]
        ],
        ["Taxi_Sign_Ad", "addon", "Taxi_Sign_Ad", "Taxi Sign 2", "Taxi Sign with advertisement for the roof", [0, 0, 0.7],
            [0, 2, 0], 0, ["Steel", 1]
        ],
        ["Driver_Guard", "addon", "Driver_Guard", "Driver Guard", "Partition between front and rear seats", [0, 0, 0.7],
            [0, 2, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_CVPI_PD", ["Spotlight_Addon", "addon", "Spotlight_Addon", "Spotlight", "Shines light onto criminals", "Spotlight1", [0.89, 1.5, -0.5], 0, ["Glass", 1]],
        ["Pushbar_Addon", "addon", "Pushbar_Addon", "Front pushbar", "Protect front from collisions", [0, 3, -1],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_CVPI_PD_Slicktop", ["Spotlight_Addon", "addon", "Spotlight_Addon", "Spotlight", "Shines light onto criminals", "Spotlight1", [0.89, 1.5, -0.5], 0, ["Glass", 1]],
        ["Pushbar_Addon", "addon", "Pushbar_Addon", "Front pushbar", "Protect front from collisions", [0, 3, -1],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_F150", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_F150_Marker", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_Gallardo", ["Spoiler1", "addon", "Spoiler1", "Wing Type 1", "Aftermarket Rear Wing 1", [0, -2, 0],
            [2, 0.2, 1], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Ram", ["Roof_Rack", "addon", "Roof_Rack", "Roof Rack", "Cargo rack for the roof", "trunkInside2", [0, 0, 0], 0, ["Steel", 1]],
        ["Roll_Bar", "addon", "Roll_Bar", "Roll Bar", "Protect occupants when the vehicle rolls over", "trunkInside2", [0, 0, 0], 0, ["Steel", 1]],
        ["Roof_Lights", "addon", "Roof_Lights", "Roof Lights", "Lights mounted on the roof", [0, 0, 0.7],
            [0, 2, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Lightbar", "addon", "Lightbar", "Lightbar", "Bar of lights mounted on the roof", [0, 0, 0.7],
            [0, 2, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spair_Tire", "addon", "Spair_Tire", "Spare Tire", "Only cosmetic", [0, -2, 0],
            [2, 0.2, 1], 0, ["Steel", 1]
        ],
        ["Bull_Bar", "addon", "Bull_Bar", "Bull Bar", "Protect front from collisions", [0, 3, 0],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Driving_Lights", "addon", "Driving_Lights", "Driving Lights", "Driving Lights mounted on Bull Bar", [0, 3, 0],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Ram_Rusty", ["Roof_Rack", "addon", "Roof_Rack", "Roof Rack", "Cargo rack for the roof", "trunkInside2", [0, 0, 0], 0, ["Steel", 1]],
        ["Roll_Bar", "addon", "Roll_Bar", "Roll Bar", "Protect occupants when the vehicle rolls over", "trunkInside2", [0, 0, 0], 0, ["Steel", 1]],
        ["Roof_Lights", "addon", "Roof_Lights", "Roof Lights", "Lights mounted on the roof", [0, 0, 0.7],
            [0, 2, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Lightbar", "addon", "Lightbar", "Lightbar", "Bar of lights mounted on the roof", [0, 0, 0.7],
            [0, 2, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spair_Tire", "addon", "Spair_Tire", "Spare Tire", "Only cosmetic", [0, -2, 0],
            [2, 0.2, 1], 0, ["Steel", 1]
        ],
        ["Bull_Bar", "addon", "Bull_Bar", "Bull Bar", "Protect front from collisions", [0, 3, 0],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Driving_Lights", "addon", "Driving_Lights", "Driving Lights", "Driving Lights mounted on Bull Bar", [0, 3, 0],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Rover", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]],
        ["Roof_Rack", "addon", "Roof_Rack", "Roof Rack", "Cargo rack for the roof", [0, 0, 1.5],
            [0, 2, 1], 0, [
                ["Steel", 1]
            ]
        ],
        ["Camping_Equipment", "addon", "Camping_Equipment", "Camping Equipment", "Camping Equipment for roof rack", [0, 0, 1.5],
            [0, 2, 1], 0, [
                ["Steel", 1]
            ]
        ],
        ["Roof_Lights", "addon", "Roof_Lights", "Roof Lights", "", [0, 0, 1.5],
            [0, 2, 1], 0, [
                ["Steel", 1]
            ]
        ],
        ["Ladder", "addon", "Ladder", "Ladder", "Ladder mounted on the back of the vehicle", [0, -2, 1],
            [2, 0.2, 1.5], 0, ["Steel", 1]
        ],
        ["Snorkel", "addon", "Snorkel", "Snorkel", "Only cosmetic", [0, 0, 1.1],
            [0, 2, 1], 0, [
                ["Steel", 1]
            ]
        ],
        ["Winch", "addon", "Winch", "Winch", "Only cosmetic", [0, 3, 1.5],
            [0, 1, 1], 0, ["Steel", 1]
        ],
        ["Bull_Bar", "addon", "Bull_Bar", "Bull Bar", "Protect front from collisions", [0, 3, 1.5],
            [0, 1, 1], 0, ["Steel", 1]
        ],
        ["Lightbar", "addon", "Lightbar", "Lightbar", "Bar of lights mounted on the roof", [0, 0, 1.1],
            [0, 2, 1], 0, [
                ["Steel", 1]
            ]
        ],
        ["Bumper_Guard", "addon", "Bumper_Guard", "Bumper Guard", "Protects rear bumper from damage", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]],
        ["Brakelight_Guards", "addon", "Brakelight_Guards", "Tail light protectors", "Protects your tail lights from those bumper cars", [0, -2, 1],
            [2, 0.2, 1.5], 0, ["Steel", 1]
        ]
    ],
    ["A3PL_VetteZR1", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_Wrangler", ["Bull_Bar", "addon", "Bull_Bar", "Bull Bar", "Protect front from collisions", [0, 2.5, 0],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Winch", "addon", "Winch", "Winch", "Only cosmetic", [0, 2.5, 0],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Driving_Lights", "addon", "Driving_Lights", "Driving Lights", "Driving Lights mounted on Bull Bar", [0, 2.5, 0],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Roof_Rack", "addon", "Roof_Rack", "Roof Rack", "Cargo rack for the roof", [0, 0, 1.5],
            [0, 2, 1], 0, ["Steel", 1]
        ],
        ["Lightbar", "addon", "Lightbar", "Lightbar", "", [0, 0, 1.5],
            [0, 2, 1], 0, ["Steel", 1]
        ],
        ["Roll_Bar", "addon", "Roll_Bar", "Roll Cage", "Protect occupants when the vehicle rolls over", [0, 0, 1.5],
            [0, 2, 1], 0, ["Steel", 1]
        ],
        ["Spair_Tire", "addon", "Spair_Tire", "Spare Tire", "Only cosmetic", [0, -2, 0],
            [2, 0.2, 1], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Charger", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_Charger_PD", ["Spotlight_Addon", "addon", "Spotlight_Addon", "Spotlight", "Shines light onto criminals", "Spotlight1", [0.89, 1.5, -0.5], 0, ["Glass", 1]],
        ["Pushbar_Addon", "addon", "Pushbar_Addon", "Front pushbar", "Protect front from collisions", [0, 3, -1],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Charger_PD_Slicktop", ["Spotlight_Addon", "addon", "Spotlight_Addon", "Spotlight", "Shines light onto criminals", "Spotlight1", [0.89, 1.5, -0.5], 0, ["Glass", 1]],
        ["Pushbar_Addon", "addon", "Pushbar_Addon", "Front pushbar", "Protect front from collisions", [0, 3, -1],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Tahoe", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_Tahoe_FD", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_Tahoe_PD", ["Spotlight_Addon", "addon", "Spotlight_Addon", "Spotlight", "Shines light onto criminals", "Spotlight1", [0.89, 1.5, -0.5], 0, ["Glass", 1]],
        ["Pushbar_Addon", "addon", "Pushbar_Addon", "Front pushbar", "Protect front from collisions", [0, 3, -1],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Tahoe_PD_Slicktop", ["Spotlight_Addon", "addon", "Spotlight_Addon", "Spotlight", "Shines light onto criminals", "Spotlight1", [0.89, 1.5, -0.5], 0, ["Glass", 1]],
        ["Pushbar_Addon", "addon", "Pushbar_Addon", "Front pushbar", "Protect front from collisions", [0, 3, -1],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_BMW_M3", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_Mustang", ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]],
    ["A3PL_Mustang_Tahoe_PD", ["Spotlight_Addon", "addon", "Spotlight_Addon", "Spotlight", "Shines light onto criminals", "Spotlight1", [0.89, 1.5, -0.5], 0, ["Glass", 1]],
        ["Pushbar_Addon", "addon", "Pushbar_Addon", "Front pushbar", "Protect front from collisions", [0, 3, -1],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Mustang_PD_Slicktop", ["Spotlight_Addon", "addon", "Spotlight_Addon", "Spotlight", "Shines light onto criminals", "Spotlight1", [0.89, 1.5, -0.5], 0, ["Glass", 1]],
        ["Pushbar_Addon", "addon", "Pushbar_Addon", "Front pushbar", "Protect front from collisions", [0, 3, -1],
            [0, 1, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_911GT2", ["Stock_Bonnet", "addon", "Stock_Bonnet", "Stock Hood", "Original Hood", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Front_Bumper", "addon", "Stock_Front_Bumper", "Stock Front Bumper", "Original Front Bumper", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Rear_Bumper", "addon", "Stock_Rear_Bumper", "Stock Rear Bumper", "Original Rear Bumper", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Exhaust", "addon", "Stock_Exhaust", "Stock Exhaust", "Original Exhaust", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Spoiler", "addon", "Stock_Spoiler", "Stock Spoiler", "Original Spoiler", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Roll_Cage", "addon", "Roll_Cage", "Roll Cage", "Protect occupants when the vehicle rolls over", [0, 0, 1.5],
            [0, 2, 1], 0, ["Steel", 1]
        ],
        ["Front_Bumper1", "addon", "Front_Bumper1", "Front Bumper Type 1", "Aftermarket Front Bumper 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Front_Bumper2", "addon", "Front_Bumper2", "Front Bumper Type 2", "Aftermarket Front Bumper 2", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Rear_Bumper1", "addon", "Rear_Bumper1", "Rear Bumper Type 1", "Aftermarket Rear Bumper 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spoiler1", "addon", "Spoiler1", "Wing Type 1", "Aftermarket Rear Wing 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spoiler2", "addon", "Spoiler2", "Wing Type 2", "Aftermarket Rear Wing 2", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spoiler3", "addon", "Spoiler3", "Wing Type 3", "Aftermarket Rear Wing 3", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Charger69", ["Stock_Bonnet", "addon", "Stock_Bonnet", "Stock Hood", "Original Hood", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Front_Bumper", "addon", "Stock_Front_Bumper", "Stock Front Bumper", "Original Front Bumper", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Rear_Bumper", "addon", "Stock_Rear_Bumper", "Stock Rear Bumper", "Original Rear Bumper", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Exhaust", "addon", "Stock_Exhaust", "Stock Exhaust", "Original Exhaust", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Roll_Cage", "addon", "Roll_Cage", "Roll Cage", "Protect occupants when the vehicle rolls over", [0, 0, 1.5],
            [0, 2, 1], 0, ["Steel", 1]
        ],
        ["Bonnet1", "addon", "Bonnet1", "Reverse Cowl Scoop", "", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Bonnet2", "addon", "Bonnet2", "Bonnet Scoop", "", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Front_Bumper1", "addon", "Front_Bumper1", "Front Bumper Type 1", "Aftermarket Front Bumper 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spoiler1", "addon", "Spoiler1", "Wing Type 1", "Aftermarket Rear Wing 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["General_Lee", "addon", "General_Lee", "General Lee", "Outfit with Pushbar, Antenna and Roll Cage", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_CRX", ["Stock_Bonnet", "addon", "Stock_Bonnet", "Stock Hood", "Original Hood", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Front_Bumper", "addon", "Stock_Front_Bumper", "Stock Front Bumper", "Original Front Bumper", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Rear_Bumper", "addon", "Stock_Rear_Bumper", "Stock Rear Bumper", "Original Rear Bumper", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Exhaust", "addon", "Stock_Exhaust", "Stock Exhaust", "Original Exhaust", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Side_Skirt", "addon", "Stock_Side_Skirt", "Stock Side Skirt", "Original Side Skirt", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Spoiler", "addon", "Stock_Spoiler", "Stock Spoiler", "Original Spoiler", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Roll_Cage", "addon", "Roll_Cage", "Roll Cage", "Protect occupants when the vehicle rolls over", [0, 0, 1.5],
            [0, 2, 1], 0, ["Steel", 1]
        ],
        ["Student_Driver", "addon", "Student_Driver", "Driving School", "DMV Driving School", [0, 0, 1.5],
            [0, 2, 1], 0, ["Steel", 1]
        ],
        ["Front_Bumper1", "addon", "Front_Bumper1", "Front Bumper Type 1", "Aftermarket Front Bumper 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Front_Bumper2", "addon", "Front_Bumper2", "Front Bumper Type 2", "Aftermarket Front Bumper 2", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Front_Bumper3", "addon", "Front_Bumper3", "Front Bumper Type 3", "Aftermarket Front Bumper 3", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Front_Bumper4", "addon", "Front_Bumper4", "Front Bumper Type 4", "Aftermarket Front Bumper 4", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Front_Bumper5", "addon", "Front_Bumper5", "Front Bumper Type 5", "Aftermarket Front Bumper 5", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Side_Skirt1", "addon", "Side_Skirt1", "Side Skirt Type 1", "Aftermarket Side Skirt 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Side_Skirt2", "addon", "Side_Skirt2", "Side Skirt Type 2", "Aftermarket Side Skirt 2", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Side_Skirt3", "addon", "Side_Skirt3", "Side Skirt Type 3", "Aftermarket Side Skirt 3", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Rear_Bumper1", "addon", "Rear_Bumper1", "Rear Bumper Type 1", "Aftermarket Rear Bumper 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spoiler1", "addon", "Spoiler1", "Wing Type 1", "Aftermarket Rear Wing 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spoiler2", "addon", "Spoiler2", "Wing Type 2", "Aftermarket Rear Wing 2", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spoiler3", "addon", "Spoiler3", "Wing Type 3", "Aftermarket Rear Wing 3", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spoiler4", "addon", "Spoiler4", "Wing Type 4", "Aftermarket Rear Wing 4", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Exhaust1", "addon", "Exhaust1", "Exhaust Type 1", "Aftermarket Exhaust 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Exhaust2", "addon", "Exhaust2", "Exhaust Type 2", "Aftermarket Exhaust 2", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Exhaust3", "addon", "Exhaust3", "Exhaust Type 3", "Aftermarket Exhaust 3", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Silverado", ["Bed_Cover", "addon", "Bed_Cover", "Bed Cover", "Protect cargo in the bed", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Toolbox", "addon", "Toolbox", "Toolbox", "Two tool boxes in bed (Only cosmetic)", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Silverado_PD", ["Bed_Cover", "addon", "Bed_Cover", "Bed Cover", "Protect cargo in the bed", [0, 0, 0],
            [0, 0, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Toolbox", "addon", "Toolbox", "Toolbox", "Two tool boxes in bed (Only cosmetic)", [0, 0, 0],
            [0, 0, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Pushbar_Addon", "addon", "Pushbar_Addon", "Front pushbar", "Protect front from collisions", [0, 0, 0],
            [0, 0, 0], 0, ["Steel", 1]
        ],
        ["Antenna", "addon", "Antenna", "", "", [0, 0, 0],
            [0, 0, 0], 0, ["Steel", 1]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ],
    ["A3PL_Challenger_Hellcat", ["Stock_Bonnet", "addon", "Stock_Bonnet", "Stock Hood", "Original Hood", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Exhaust", "addon", "Stock_Exhaust", "Stock Exhaust", "Original Exhaust", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Stock_Spoiler", "addon", "Stock_Spoiler", "Stock Spoiler", "Original Spoiler", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Roll_Cage", "addon", "Roll_Cage", "Roll Cage", "Protect occupants when the vehicle rolls over", [0, 0, 1.5],
            [0, 2, 1], 0, ["Steel", 1]
        ],
        ["Front_Bumper1", "addon", "Front_Bumper1", "Front Bumper Type 1", "Aftermarket Front Bumper 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spoiler1", "addon", "Spoiler1", "Wing Type 1", "Aftermarket Rear Wing 1", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Spoiler2", "addon", "Spoiler2", "Wing Type 2", "Aftermarket Rear Wing 2", [0.3, 5.2, 0.9],
            [0, 1, 0], 0, [
                ["Steel", 1]
            ]
        ],
        ["Towbar_Addon", "addon", "Towbar_Addon", "Add towbar", "Allows you to hitch trailers", "Towbar_Cam", [1, 0, 0], 0, ["Steel", 1]]
    ]
];
publicVariable "Config_Garage_Upgrade";

Config_Garage_Repair = [
    ["engine", "Motor"],
    ["body", "Lataria"],
    ["wheel_1_1_steering", "Roda da frente esquerda"],
    ["wheel_1_2_steering", "Roda de trás esquerda"],
    ["wheel_2_1_steering", "Roda da frente direita"],
    ["wheel_2_2_steering", "Roda de trás direita"],
    ["glass1", "Janela da frente"],
    ["glass2", "Janela da frente esquerda"],
    ["glass3", "Janela de trás esquerda"],
    ["glass4", "Janela da frente direita"],
    ["glass5", "Janela de trás direita"],
    ["glass6", "Janela traseira"],
    ["l svetlo", "Farol esquerdo"],
    ["p svetlo", "Farol direito"],
    ["spotlight_hit", "Holofote"]
];
publicVariable "Config_Garage_Repair";

Config_Police_Vehs = [
    "A3PL_Police_Charger_Default",
    "K_Tahoe_Police_Normal",
    "A3PL_Police_Mustang_SE",
    "A3PL_Police_Mustang_Default",
    "K_Tahoe_Police_Black",
    "A3PL_F150_Police_Normal",
    "A3PL_Engine",
    "A3PL_Rescue",
    "A3PL_Ladder",
    "K_F450_normal",
    "Jonzie_Ambulance",
    "A3PL_CVPI_PD",
    "A3PL_CVPI_PD_Slicktop",
    "A3PL_Pierce_Ladder",
    "A3PL_Pierce_Heavy_Ladder",
    "A3PL_Tahoe_FD",
    "A3PL_Tahoe_PD",
    "A3PL_Tahoe_PD_Slicktop",
    "A3PL_Mustang_PD",
    "A3PL_Mustang_PD_Slicktop",
    "A3PL_Charger_PD",
    "A3PL_Charger_PD_Slicktop",
    "A3PL_Pierce_Pumper",
    "A3PL_P362_TowTruck",
    "A3PL_RBM",
    "A3PL_F150_Marker",
    "A3PL_F150_PD",
    "A3PL_Silverado_PD",
    "A3PL_VetteZR1_PD",
    "A3PL_E350"
];
publicVariable "Config_Police_Vehs";

Config_Shops_VehicleColours = [
    ["A3PL_Ski", ["Base"]],
    ["A3PL_Goose", ["Base", "Radar", "USCG"]],
    ["A3PL_C", ["Plane_Civil_01_F"]],
    ["C", ["Heli_Light_01_civil_F", "Scooter_Transport_01_F", "Quadbike_01_F"]],
    ["A3PL_Drill", ["Trailer"]],
    ["A3PL_Tanker", ["Trailer"]],
    ["A3PL_Small_Boat", ["Trailer"]],
    ["A3PL_Box", ["Trailer"]],
    ["A3PL_Boat", ["Trailer"]],
    ["Jonzie", ["Ambulance"]],
    ["A3PL_Pierce", ["Ladder", "Pumper", "Heavy_Ladder"]],
    ["A3PL", ["Silverado_PD", "Silverado", "911GT2", "Charger15", "Charger69", "Jayhawk", "VetteZR1", "VetteZR1_PD", "Mailtruck", "Gallardo", "MobileCrane", "Cessna172", "Lowloader", "Mustang", "F150", "F150_Marker", "F150_Marker_PD", "Ram", "Wrangler", "Charger", "E350", "Tahoe_FD", "Tahoe_PD", "Tahoe_PD_Slicktop", "Tahoe", "CVPI", "CVPI_Taxi", "CVPI_Rusty", "CVPI_PD", "CVPI_PD_Slicktop", "Mustang_PD", "Mustang_PD_Slicktop", "Charger_PD", "Charger_PD_Slicktop", "P362", "P362_TowTruck", "P362_Garbage_Truck", "Rover", "Camaro", "RBM", "Motorboat", "RHIB", "Fuel_Van", "Transport_Van", "Stinger", "MiniExcavator", "TowingTractor", "Aircraft_Dolly", "CRX"]],
    ["ALR", ["Cadillac", "Tesla"]],
    ["A3PL", ["Ram_Rusty"]],
    ["A3PL", ["Car_Trailer"]],
    ["A3PL_BMW", ["X5", "M3"]],
    ["Heli_Medium01", ["H", "Coastguard_H", "Sheriff_H", "Luxury_H", "Medic_H", "Military_H", "Veteran_H"]]
];
publicVariable "Config_Shops_VehicleColours";
