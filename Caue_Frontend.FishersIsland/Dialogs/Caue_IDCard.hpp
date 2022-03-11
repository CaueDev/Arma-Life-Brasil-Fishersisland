class Caue_IDCard {
	idd = 12345;
	fadeout = 0;
	fadein = 0;
	duration = 1e+1000;
	onLoad = "disableSerialization; uiNamespace setVariable ['Caue_IDCard',_this select 0];";
	onUnload = "";

	class controlsBackground
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.0204713 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.242 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Nome:";
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "Idade:";
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1005: RscText
		{
			idc = 1005;
			text = "ID:";
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1007: RscText
		{
			idc = 1007;
			text = "Sexo:";
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1009: RscText
		{
			idc = 1009;
			text = "Criado:";
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1011: RscText
		{
			idc = 1011;
			text = "Facção:";
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1013: RscText
		{
			idc = 1013;
			text = "Licenças:";
			x = 0.0204687 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.04425 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls
	{
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "";
			x = 0.066875 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			text = "";
			x = 0.066875 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1006: RscText
		{
			idc = 1006;
			text = "";
			x = 0.066875 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1008: RscText
		{
			idc = 1008;
			text = "";
			x = 0.066875 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1010: RscText
		{
			idc = 1010;
			text = "";
			x = 0.066875 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1012: RscText
		{
			idc = 1012;
			text = "";
			x = 0.066875 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class text_licenses: RscText
		{
			idc = 1014;
			text = "";
			x = 0.066875 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
