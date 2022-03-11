class Dialog_HUD {
	idd = 1234;
	fadeout = 0;
	fadein = 0;
	duration = 1e+1000;
	onLoad = "disableSerialization; uiNamespace setVariable ['A3PL_HUDDisplay',_this select 0];";
	onUnload = "";

	class controlsBackground {
		class RscText_1000: RscText
		{
			idc = 1000;
			text = ""; //--- ToDo: Localize;
			x = 0.628905 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = "0.05 * safezoneH";
			style = 0x01;
		};

		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "A3PL_Common\HUD\new\HealthIcon.paa";
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};

		class RscPicture_1202: RscPicture
		{
			idc = 1202;
			text = "A3PL_Common\HUD\hunger_icon.paa";
			x = 0.783594 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};

		class RscPicture_1203: RscPicture
		{
			idc = 1203;
			text = "A3PL_Common\HUD\thirst_icon.paa";
			x = 0.726875 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
		};

		class struc_system: RscStructuredText
		{
			idc = 1104;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.45937 * safezoneW;
			h = 0.4 * safezoneH;
		};

	};

	class controls
	{
		class RscPicture_1201: RscPicture
		{
			idc = 1201;
			text = "A3PL_Common\HUD\new\MBLoad_45.paa";
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0422916 * safezoneW;
			h = 0.077926 * safezoneH;
		};

		class RscPicture_1204: RscPicture
		{
			idc = 1204;
			text = "A3PL_Common\HUD\new\MBLoad_45.paa";
			x = 0.783333 * safezoneW + safezoneX;
			y = 0.840741 * safezoneH + safezoneY;
			w = 0.0422916 * safezoneW;
			h = 0.077926 * safezoneH;
		};

		class RscPicture_1205: RscPicture
		{
			idc = 1205;
			text = "A3PL_Common\HUD\new\MBLoad_45.paa";
			x = 0.727083 * safezoneW + safezoneX;
			y = 0.840741 * safezoneH + safezoneY;
			w = 0.0422916 * safezoneW;
			h = 0.077926 * safezoneH;
		};

		class background_stats: RscPicture
		{
			idc = 1500;
			text = "A3PL_Common\HUD\stats.paa";
			x = 0.876406 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.176 * safezoneH;
		};
		class stuc_name: RscStructuredText
		{
			idc = 1600;
			text = ""; //--- ToDo: Localize;
			x = 0.88724 * safezoneW + safezoneX;
			y = 0.674261 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class struc_job: RscStructuredText
		{
			idc = 1601;
			text = ""; //--- ToDo: Localize;
			x = 0.88724 * safezoneW + safezoneX;
			y = 0.689778 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class struc_money: RscStructuredText
		{
			idc = 1602;
			text = ""; //--- ToDo: Localize;
			x = 0.886719 * safezoneW + safezoneX;
			y = 0.725556 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class struc_info: RscStructuredText
		{
			idc = 1603;
			text = ""; //--- ToDo: Localize;
			x = 0.886198 * safezoneW + safezoneX;
			y = 0.758445 * safezoneH + safezoneY;
			w = 0.0830208 * safezoneW;
			h = 0.0715555 * safezoneH;
		};
		class Caue_TaskForceMode: RscText
    	{
        	idc = 1251;
        	text = "NORMAL";
        	x = 0.9200 * safezoneW + safezoneX;
        	y = 0.9752 * safezoneH + safezoneY;
        	w = 0.065 * safezoneW;
        	h = 0.022 * safezoneH;
        	font = "PuristaSemiBold";
        	SizeEx = 0.035;
    	};
	};
};
