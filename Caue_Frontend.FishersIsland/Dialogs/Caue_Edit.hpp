class Caue_Edit {
	idd = 8320;
	movingEnable = 0;
	enableSimulation = 1;

	class controls {
		class RscText_1000: RscText
		{
			idc = 8321;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscEdit_1400: RscEdit
		{
			idc = 8322;
			text = "";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 8323;
			text = "";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
