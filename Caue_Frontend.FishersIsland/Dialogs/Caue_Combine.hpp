class Caue_Combine {
	idd = 9;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	onUnload = "";

	class controls {
		class static_bg: IGUIBack
		{
			idc = 2200;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class lb_items: RscListbox
		{
			idc = 1500;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.176 * safezoneH;
		};
		class static_requires: RscText
		{
			idc = 1000;
			text = "Requer:";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class static_itemstext: RscText
		{
			idc = 1001;
			text = "Items:";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class lb_required: RscListbox
		{
			idc = 1501;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class button_combine: RscButton
		{
			idc = 1600;
			text = "Criar";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class edit_amount: RscEdit
		{
			idc = 1400;
			text = "1";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class static_amount: RscText
		{
			idc = 1002;
			text = "Quantia:";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.038 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
