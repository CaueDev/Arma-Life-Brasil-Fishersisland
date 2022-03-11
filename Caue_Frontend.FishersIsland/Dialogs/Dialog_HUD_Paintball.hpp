/* #Mugyxe
$[
	1.063,
	["a",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1100,"",[1,"",["0.824844 * safezoneW + safezoneX","0.038 * safezoneH + safezoneY","0.180469 * safezoneW","0.242 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"",[1,"<t font='EtelkaNarrowMediumPro' color='#8efdff' size='2.5' align='center'>Mission begins in: 10</t>",["0.29375 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.4125 * safezoneW","0.088 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"playerlist",[1,"",["0.840312 * safezoneW + safezoneX","0.324 * safezoneH + safezoneY","0.0876563 * safezoneW","0.33 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1800,"",[1,"",["0.840312 * safezoneW + safezoneX","0.324 * safezoneH + safezoneY","0.139219 * safezoneW","0.33 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1802,"",[1,"",["0.95375 * safezoneW + safezoneX","0.324 * safezoneH + safezoneY","0.0257812 * safezoneW","0.33 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1803,"",[1,"",["0.927969 * safezoneW + safezoneX","0.324 * safezoneH + safezoneY","0.0257812 * safezoneW","0.33 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"",[1,"Kills",["0.927969 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.0257812 * safezoneW","0.011 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],
	[1001,"",[1,"Deaths",["0.95375 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.0257812 * safezoneW","0.011 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]],
	[1103,"deathlist",[1,"",["0.95375 * safezoneW + safezoneX","0.324 * safezoneH + safezoneY","0.0257812 * safezoneW","0.33 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"killlist",[1,"",["0.927969 * safezoneW + safezoneX","0.324 * safezoneH + safezoneY","0.0257812 * safezoneW","0.33 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"",[1,"Players",["0.840312 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.0309375 * safezoneW","0.011 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.7"],[]]
]
*/


class Dialog_HUD_Paintball
{
	idd = -1;
	duration = 1e+012;
	onLoad = "uiNamespace setVariable [""Dialog_HUD_Paintball"", _this select 0]";
	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Zannaza, v1.063, #Mugyxe)
		////////////////////////////////////////////////////////

		class killlog: RscStructuredText
		{
			idc = 1100;
			x = 0.824844 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			text = ""; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class RscFrame_1800: RscFrame
		{
			idc = 1800;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class RscFrame_1802: RscFrame
		{
			idc = 1802;
			x = 0.95375 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class RscFrame_1803: RscFrame
		{
			idc = 1803;
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Players"; //--- ToDo: Localize;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = 0.015 * safezoneH;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Kills"; //--- ToDo: Localize;
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = 0.015 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Deaths"; //--- ToDo: Localize;
			x = 0.95375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = 0.015 * safezoneH;
		};
		class playerlist: RscStructuredText
		{
			idc = 1102;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class deathlist: RscStructuredText
		{
			idc = 1103;
			x = 0.95375 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class killlist: RscStructuredText
		{
			idc = 1104;
			x = 0.927969 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.33 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};