class CfgPatches {
	class Caue_MapMarkers {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"A3_Ui_F"};
	};
};

class CfgMarkers {
	class Flag;

	class Caue26_MapMarker: Flag {
		size = 32;
		scope = 2;
		shadow = 0;
		color[] = {1, 1, 1, 1};
		markerClass = "Flags";
	};

	class Caue_MapMarker_Farms_Coal: Caue26_MapMarker {
		name = "Caue26 Coal Mine";
		icon = "\cauedev.github.io\markers\data\Farms\coal.paa";
		texture = "\cauedev.github.io\markers\data\Farms\coal.paa";
	};

	class Caue_MapMarker_Farms_Copper: Caue26_MapMarker {
		name = "Caue26 Coal Mine";
		icon = "\cauedev.github.io\markers\data\Farms\copper.paa";
		texture = "\cauedev.github.io\markers\data\Farms\copper.paa";
	};

	class Caue_MapMarker_Farms_Farm: Caue26_MapMarker {
		name = "Caue26 Farm";
		icon = "\cauedev.github.io\markers\data\Farms\farm.paa";
		texture = "\cauedev.github.io\markers\data\Farms\farm.paa";
	};

	class Caue_MapMarker_Farms_FarmIlegal: Caue26_MapMarker {
		name = "Caue26 Ilegal Farm";
		icon = "\cauedev.github.io\markers\data\Farms\farmilegal.paa";
		texture = "\cauedev.github.io\markers\data\Farms\farmilegal.paa";
	};

	class Caue_MapMarker_Farms_Hunting: Caue26_MapMarker {
		name = "Caue26 Hunting Area";
		icon = "\cauedev.github.io\markers\data\Farms\hunting.paa";
		texture = "\cauedev.github.io\markers\data\Farms\hunting.paa";
	};

	class Caue_MapMarker_Farms_Iron: Caue26_MapMarker {
		name = "Caue26 Iron Mine";
		icon = "\cauedev.github.io\markers\data\Farms\iron.paa";
		texture = "\cauedev.github.io\markers\data\Farms\iron.paa";
	};

	class Caue_MapMarker_Farms_Oil: Caue26_MapMarker {
		name = "Caue26 Oil Mine";
		icon = "\cauedev.github.io\markers\data\Farms\oil.paa";
		texture = "\cauedev.github.io\markers\data\Farms\oil.paa";
	};

	class Caue_MapMarker_Farms_Radioative: Caue26_MapMarker {
		name = "Caue26 Radioative";
		icon = "\cauedev.github.io\markers\data\Farms\radioative.paa";
		texture = "\cauedev.github.io\markers\data\Farms\radioative.paa";
	};

	class Caue_MapMarker_Farms_Sand: Caue26_MapMarker {
		name = "Caue26 Sand Mine";
		icon = "\cauedev.github.io\markers\data\Farms\sand.paa";
		texture = "\cauedev.github.io\markers\data\Farms\sand.paa";
	};

	class Caue_MapMarker_Farms_Sulfur: Caue26_MapMarker {
		name = "Caue26 Sulfur Mine";
		icon = "\cauedev.github.io\markers\data\Farms\sulfur.paa";
		texture = "\cauedev.github.io\markers\data\Farms\sulfur.paa";
	};

	class Caue_MapMarker_Farms_Wood: Caue26_MapMarker {
		name = "Caue26 Forest";
		icon = "\cauedev.github.io\markers\data\Farms\wood.paa";
		texture = "\cauedev.github.io\markers\data\Farms\wood.paa";
	};

	class Caue_MapMarker_Refines_Coal: Caue26_MapMarker {
		name = "Caue26 Refine Coal";
		icon = "\cauedev.github.io\markers\data\Refines\refinecoal.paa";
		texture = "\cauedev.github.io\markers\data\Refines\refinecoal.paa";
	};

	class Caue_MapMarker_Refines_Copper: Caue26_MapMarker {
		name = "Caue26 Refine Copper";
		icon = "\cauedev.github.io\markers\data\Refines\refinecopper.paa";
		texture = "\cauedev.github.io\markers\data\Refines\refinecopper.paa";
	};

	class Caue_MapMarker_Refines_Ilegal: Caue26_MapMarker {
		name = "Caue26 Refine Ilegal";
		icon = "\cauedev.github.io\markers\data\Refines\refineilegal.paa";
		texture = "\cauedev.github.io\markers\data\Refines\refineilegal.paa";
	};

	class Caue_MapMarker_Refines_Iron: Caue26_MapMarker {
		name = "Caue26 Refine Iron";
		icon = "\cauedev.github.io\markers\data\Refines\refineiron.paa";
		texture = "\cauedev.github.io\markers\data\Refines\refineiron.paa";
	};

	class Caue_MapMarker_Refines_Oil: Caue26_MapMarker {
		name = "Caue26 Refine Oil";
		icon = "\cauedev.github.io\markers\data\Refines\refineoil.paa";
		texture = "\cauedev.github.io\markers\data\Refines\refineoil.paa";
	};

	class Caue_MapMarker_Refines_Sand: Caue26_MapMarker {
		name = "Caue26 Refine Sand";
		icon = "\cauedev.github.io\markers\data\Refines\refinesand.paa";
		texture = "\cauedev.github.io\markers\data\Refines\refinesand.paa";
	};

	class Caue_MapMarker_Refines_Sulfur: Caue26_MapMarker {
		name = "Caue26 Refine Sulfur";
		icon = "\cauedev.github.io\markers\data\Refines\refinesulfur.paa";
		texture = "\cauedev.github.io\markers\data\Refines\refinesulfur.paa";
	};

	class Caue_MapMarker_Refines_Wood: Caue26_MapMarker {
		name = "Caue26 Refine Wood";
		icon = "\cauedev.github.io\markers\data\Refines\refinewood.paa";
		texture = "\cauedev.github.io\markers\data\Refines\refinewood.paa";
	};

	class Caue_MapMarker_Traders_Drugdealer: Caue26_MapMarker {
		name = "Caue26 Drugdealer";
		icon = "\cauedev.github.io\markers\data\Traders\drugdealer.paa";
		texture = "\cauedev.github.io\markers\data\Traders\drugdealer.paa";
	};

	class Caue_MapMarker_Traders_Farmer: Caue26_MapMarker {
		name = "Caue26 Farmer";
		icon = "\cauedev.github.io\markers\data\Traders\farmer.paa";
		texture = "\cauedev.github.io\markers\data\Traders\farmer.paa";
	};

	class Caue_MapMarker_Traders_Moonshine: Caue26_MapMarker {
		name = "Caue26 Trader Moonshine";
		icon = "\cauedev.github.io\markers\data\Traders\moonshine.paa";
		texture = "\cauedev.github.io\markers\data\Traders\moonshine.paa";
	};

	class Caue_MapMarker_Traders_Coal: Caue26_MapMarker {
		name = "Caue26 Trader Coal";
		icon = "\cauedev.github.io\markers\data\Traders\tradercoal.paa";
		texture = "\cauedev.github.io\markers\data\Traders\tradercoal.paa";
	};

	class Caue_MapMarker_Traders_Copper: Caue26_MapMarker {
		name = "Caue26 Trader Copper";
		icon = "\cauedev.github.io\markers\data\Traders\tradercopper.paa";
		texture = "\cauedev.github.io\markers\data\Traders\tradercopper.paa";
	};

	class Caue_MapMarker_Traders_Ilegal: Caue26_MapMarker {
		name = "Caue26 Trader Ilegal";
		icon = "\cauedev.github.io\markers\data\Traders\traderilegal.paa";
		texture = "\cauedev.github.io\markers\data\Traders\traderilegal.paa";
	};

	class Caue_MapMarker_Traders_Iron: Caue26_MapMarker {
		name = "Caue26 Trader Iron";
		icon = "\cauedev.github.io\markers\data\Traders\traderiron.paa";
		texture = "\cauedev.github.io\markers\data\Traders\traderiron.paa";
	};

	class Caue_MapMarker_Traders_Oil: Caue26_MapMarker {
		name = "Caue26 Trader Oil";
		icon = "\cauedev.github.io\markers\data\Traders\traderoil.paa";
		texture = "\cauedev.github.io\markers\data\Traders\traderoil.paa";
	};

	class Caue_MapMarker_Traders_Sand: Caue26_MapMarker {
		name = "Caue26 Trader Sand";
		icon = "\cauedev.github.io\markers\data\Traders\tradersand.paa";
		texture = "\cauedev.github.io\markers\data\Traders\tradersand.paa";
	};

	class Caue_MapMarker_Traders_Sulfur: Caue26_MapMarker {
		name = "Caue26 Trader Sulfur";
		icon = "\cauedev.github.io\markers\data\Traders\tradersulfur.paa";
		texture = "\cauedev.github.io\markers\data\Traders\tradersulfur.paa";
	};

	class Caue_MapMarker_Traders_Wood: Caue26_MapMarker {
		name = "Caue26 Trader Wood";
		icon = "\cauedev.github.io\markers\data\Traders\traderwood.paa";
		texture = "\cauedev.github.io\markers\data\Traders\traderwood.paa";
	};

	class Caue_MapMarker_Stores_AH: Caue26_MapMarker {
		name = "Caue26 Auction House";
		icon = "\cauedev.github.io\markers\data\Stores\AH.paa";
		texture = "\cauedev.github.io\markers\data\Stores\AH.paa";
	};

	class Caue_MapMarker_Stores_Clothing: Caue26_MapMarker {
		name = "Caue26 Clothing Store";
		icon = "\cauedev.github.io\markers\data\Stores\clothing.paa";
		texture = "\cauedev.github.io\markers\data\Stores\clothing.paa";
	};

	class Caue_MapMarker_Stores_Furniture: Caue26_MapMarker {
		name = "Caue26 Furniture Store";
		icon = "\cauedev.github.io\markers\data\Stores\furniture.paa";
		texture = "\cauedev.github.io\markers\data\Stores\furniture.paa";
	};

	class Caue_MapMarker_Stores_Gunstore: Caue26_MapMarker {
		name = "Caue26 Gun Store";
		icon = "\cauedev.github.io\markers\data\Stores\gunstore.paa";
		texture = "\cauedev.github.io\markers\data\Stores\gunstore.paa";
	};

	class Caue_MapMarker_Stores_Heli: Caue26_MapMarker {
		name = "Caue26 Helicopter Store";
		icon = "\cauedev.github.io\markers\data\Stores\heli.paa";
		texture = "\cauedev.github.io\markers\data\Stores\heli.paa";
	};

	class Caue_MapMarker_Stores_Licenses: Caue26_MapMarker {
		name = "Caue26 Licenses Store";
		icon = "\cauedev.github.io\markers\data\Stores\licenses.paa";
		texture = "\cauedev.github.io\markers\data\Stores\licenses.paa";
	};

	class Caue_MapMarker_Stores_Market: Caue26_MapMarker {
		name = "Caue26 Market";
		icon = "\cauedev.github.io\markers\data\Stores\market.paa";
		texture = "\cauedev.github.io\markers\data\Stores\market.paa";
	};

	class Caue_MapMarker_Stores_Mechanic: Caue26_MapMarker {
		name = "Caue26 Mechanic";
		icon = "\cauedev.github.io\markers\data\Stores\mechanic.paa";
		texture = "\cauedev.github.io\markers\data\Stores\mechanic.paa";
	};

	class Caue_MapMarker_Stores_NormalCar: Caue26_MapMarker {
		name = "Caue26 Normal Car Store";
		icon = "\cauedev.github.io\markers\data\Stores\normalcar.paa";
		texture = "\cauedev.github.io\markers\data\Stores\normalcar.paa";
	};

	class Caue_MapMarker_Stores_Rebel: Caue26_MapMarker {
		name = "Caue26 Rebel";
		icon = "\cauedev.github.io\markers\data\Stores\rebel.paa";
		texture = "\cauedev.github.io\markers\data\Stores\rebel.paa";
	};

	class Caue_MapMarker_Stores_Ship: Caue26_MapMarker {
		name = "Caue26 Ship Store";
		icon = "\cauedev.github.io\markers\data\Stores\ship.paa";
		texture = "\cauedev.github.io\markers\data\Stores\ship.paa";
	};

	class Caue_MapMarker_Stores_Store: Caue26_MapMarker {
		name = "Caue26 General Store";
		icon = "\cauedev.github.io\markers\data\Stores\store.paa";
		texture = "\cauedev.github.io\markers\data\Stores\store.paa";
	};

	class Caue_MapMarker_Stores_SuperCar: Caue26_MapMarker {
		name = "Caue26 Super Car Store";
		icon = "\cauedev.github.io\markers\data\Stores\supercar.paa";
		texture = "\cauedev.github.io\markers\data\Stores\supercar.paa";
	};

	class Caue_MapMarker_Stores_Truck: Caue26_MapMarker {
		name = "Caue26 Truck Store";
		icon = "\cauedev.github.io\markers\data\Stores\truck.paa";
		texture = "\cauedev.github.io\markers\data\Stores\truck.paa";
	};

	class Caue_MapMarker_Misc_Anchor: Caue26_MapMarker {
		name = "Caue26 Anchor";
		icon = "\cauedev.github.io\markers\data\Misc\anchor.paa";
		texture = "\cauedev.github.io\markers\data\Misc\anchor.paa";
	};

	class Caue_MapMarker_Misc_Bandit: Caue26_MapMarker {
		name = "Caue26 Bandit";
		icon = "\cauedev.github.io\markers\data\Misc\bandit.paa";
		texture = "\cauedev.github.io\markers\data\Misc\bandit.paa";
	};

	class Caue_MapMarker_Misc_Bank: Caue26_MapMarker {
		name = "Caue26 Bank";
		icon = "\cauedev.github.io\markers\data\Misc\bank.paa";
		texture = "\cauedev.github.io\markers\data\Misc\bank.paa";
	};

	class Caue_MapMarker_Misc_Centrelink: Caue26_MapMarker {
		name = "Caue26 Centrelink";
		icon = "\cauedev.github.io\markers\data\Misc\centrelink.paa";
		texture = "\cauedev.github.io\markers\data\Misc\centrelink.paa";
	};

	class Caue_MapMarker_Misc_Cop: Caue26_MapMarker {
		name = "Caue26 Police";
		icon = "\cauedev.github.io\markers\data\Misc\cop.paa";
		texture = "\cauedev.github.io\markers\data\Misc\cop.paa";
	};

	class Caue_MapMarker_Misc_Evidence: Caue26_MapMarker {
		name = "Caue26 Evidence";
		icon = "\cauedev.github.io\markers\data\Misc\evidence.paa";
		texture = "\cauedev.github.io\markers\data\Misc\evidence.paa";
	};

	class Caue_MapMarker_Misc_Garage: Caue26_MapMarker {
		name = "Caue26 Garage";
		icon = "\cauedev.github.io\markers\data\Misc\garage.paa";
		texture = "\cauedev.github.io\markers\data\Misc\garage.paa";
	};

	class Caue_MapMarker_Misc_Hospital: Caue26_MapMarker {
		name = "Caue26 Hospital";
		icon = "\cauedev.github.io\markers\data\Misc\hospital.paa";
		texture = "\cauedev.github.io\markers\data\Misc\hospital.paa";
	};

	class Caue_MapMarker_Misc_House: Caue26_MapMarker {
		name = "Caue26 House";
		icon = "\cauedev.github.io\markers\data\Misc\house.paa";
		texture = "\cauedev.github.io\markers\data\Misc\house.paa";
	};

	class Caue_MapMarker_Misc_Jail: Caue26_MapMarker {
		name = "Caue26 Jail";
		icon = "\cauedev.github.io\markers\data\Misc\jail.paa";
		texture = "\cauedev.github.io\markers\data\Misc\jail.paa";
	};

	class Caue_MapMarker_Misc_QuestionMark: Caue26_MapMarker {
		name = "Caue26 Question Mark";
		icon = "\cauedev.github.io\markers\data\Misc\questionmark.paa";
		texture = "\cauedev.github.io\markers\data\Misc\questionmark.paa";
	};

	class Caue_MapMarker_Misc_ChopShop: Caue26_MapMarker {
		name = "Caue26 Chop Shop";
		icon = "\cauedev.github.io\markers\data\Misc\chopshop.paa";
		texture = "\cauedev.github.io\markers\data\Misc\chopshop.paa";
	};

	class Caue_MapMarker_Misc_Archaeologist: Caue26_MapMarker {
		name = "Caue26 Archaeologist";
		icon = "\cauedev.github.io\markers\data\Misc\archaeologist.paa";
		texture = "\cauedev.github.io\markers\data\Misc\archaeologist.paa";
	};

	class Caue_MapMarker_Misc_Ammo: Caue26_MapMarker {
		name = "Caue26 Ammo";
		icon = "\cauedev.github.io\markers\data\Misc\ammo.paa";
		texture = "\cauedev.github.io\markers\data\Misc\ammo.paa";
	};
};
