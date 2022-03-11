class Dialog_Twitter {
	idd = 5125;
	name= "Dialog_Twitter";
	movingEnable = true;
	enableSimulation = true;
	duration = 500000;
	onLoad = "";
	onUnLoad = "736713 cutRsc [""Dialog_HUD_Twitter"", ""PLAIN""]; [] call Caue_Twitter_MsgDisplay;";
	objects[] = { };

	class controls {
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.744 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class listbox: RscListBoxnosel
		{
			idc = 5120;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.535 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.209 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "ENVIAR";
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.744 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			action = "[] spawn Caue_Twitter_Send;";
		};
	};
};
