class Dialog_Factory {
	idd = 45;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	onUnload = "";

	class controls {
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "\A3PL_Common\GUI\A3PL_Factory.paa";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
		};
		class struc_type: RscStructuredText
		{
			idc = 1100;
			text = "Factory Type";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.464062 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class progress_crafting: RscProgress
		{
			idc = 1105;
			x = 0.594531 * safezoneW + safezoneX;
			y = 0.727185 * safezoneH + safezoneY;
			w = 0.13099 * safezoneW;
			h = 0.0275555 * safezoneH;
		};
		class button_craft: RscButtonEmpty
		{
			idc = 1600;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.665926 * safezoneH + safezoneY;
			w = 0.165521 * safezoneW;
			h = 0.0339259 * safezoneH;
		};
		class list_recipes: RscListbox
		{
			idc = 1500;
			x = 0.28552 * safezoneW + safezoneX;
			y = 0.253481 * safezoneH + safezoneY;
			w = 0.195573 * safezoneW;
			h = 0.288889 * safezoneH;
		};
		class list_requires: RscListbox
		{
			idc = 1501;
			x = 0.526302 * safezoneW + safezoneX;
			y = 0.252444 * safezoneH + safezoneY;
			w = 0.196458 * safezoneW;
			h = 0.294333 * safezoneH;
		};
		class list_storage: RscListbox
		{
			idc = 1502;
			x = 0.424636 * safezoneW + safezoneX;
			y = 0.618222 * safezoneH + safezoneY;
			w = 0.145313 * safezoneW;
			h = 0.211408 * safezoneH;
		};
		class struc_info: RscStructuredText
		{
			idc = 1103;
			text = "Item Information";
			x = 0.576823 * safezoneW + safezoneX;
			y = 0.549445 * safezoneH + safezoneY;
			w = 0.165677 * safezoneW;
			h = 0.108148 * safezoneH;
		};
		class struc_status: RscStructuredText
		{
			idc = 1104;
			text = "Craft Information";
			x = 0.577343 * safezoneW + safezoneX;
			y = 0.770259 * safezoneH + safezoneY;
			w = 0.165365 * safezoneW;
			h = 0.079296 * safezoneH;
		};
		class button_close: RscButtonEmpty
		{
			idc = 1602;
			x = 0.710313 * safezoneW + safezoneX;
			y = 0.134222 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
			action = "closeDialog 0;";
		};
		class list_inventory: RscListbox
		{
			idc = 1503;
			x = 0.257032 * safezoneW + safezoneX;
			y = 0.617074 * safezoneH + safezoneY;
			w = 0.145313 * safezoneW;
			h = 0.212334 * safezoneH;
		};
		class button_moveToStorage: RscButtonEmpty
		{
			idc = 1601;
			x = 0.403646 * safezoneW + safezoneX;
			y = 0.675296 * safezoneH + safezoneY;
			w = 0.0183334 * safezoneW;
			h = 0.0262962 * safezoneH;
		};
		class button_moveToInventory: RscButtonEmpty
		{
			idc = 1603;
			x = 0.403958 * safezoneW + safezoneX;
			y = 0.728444 * safezoneH + safezoneY;
			w = 0.0183334 * safezoneW;
			h = 0.0262962 * safezoneH;
		};
		class edit_amount: RscEdit
		{
			idc = 1400;
			text = "1";
			x = 0.39026 * safezoneW + safezoneX;
			y = 0.844444 * safezoneH + safezoneY;
			w = 0.0452084 * safezoneW;
			h = 0.0192221 * safezoneH;
		};
		class craftamounttext: RscText
		{
			idc = -1;
			text = "Quantia:";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.6276 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class craftamountedit: RscEdit
		{
			idc = 1526;
			text = "1";
			x = 0.625812 * safezoneW + safezoneX;
			y = 0.6298 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
