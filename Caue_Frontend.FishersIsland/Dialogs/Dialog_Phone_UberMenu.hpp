/* #Xexara
$[
	1.063,
	["UberMenu",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"",[1,"",["0.422656 * safezoneW + safezoneX","0.258 * safezoneH + safezoneY","0.159844 * safezoneW","0.484 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.5],[-1,-1,-1,-1],"","-1"],[]],
	[1609,"",[1,"Drive",["0.510312 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.061875 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1613,"",[1,"Request Uber",["0.432969 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.061875 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"",[2,"#(argb,8,8,3)color(1,1,1,1)",["13.5 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","13.5 * GUI_GRID_W","17.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class Dialog_Phone_UberMenu
{
	idd = 5020;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	onUnload = "";

	class controls
	{
		class mainframe: RscPicture
		{
			idc = 5520;
			text = "\A3PL_Common\phone\base\blackphone.paa";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.737 * safezoneH;
		};
		class background: RscPicture
		{
			idc = 5521;
			text = "";
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.737 * safezoneH;
		};
		class backbutton: RscButtonEmpty
		{
			idc = 5522;
			text = "";
			x = 0.486078 * safezoneW + safezoneX;
			y = 0.75498 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.0466666 * safezoneH;
			action = "closedialog 0";
		};
		//--------------HEADER------------------
		class batterypic: RscPicture
		{
			idc = 5523;
			text = "\A3PL_Common\phone\base\100bat.paa";
			x = 0.564427 * safezoneW + safezoneX;
			y = 0.252444 * safezoneH + safezoneY;
			w = 0.0144271 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class precentage: RscText
		{
			idc = 5524;
			text = "100%"; //--- ToDo: Localize;
			x = 0.544427 * safezoneW + safezoneX;
			y = 0.252 * safezoneH + safezoneY;
			w = 0.0195833 * safezoneW;
			h = 0.011 * safezoneH;
			style = ST_RIGHT;  // defined constant
			sizeEx = "0.015 * safezoneH";
		};
		class time: RscText
		{
			idc = 5525;
			text = ""; //--- ToDo: Localize;
			x = 0.508229 * safezoneW + safezoneX;
			y = 0.254296 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = "0.03 * safezoneH";
		};
		class connection: RscText
		{
			idc = 5526;
			text = "Z-MOBILE 4G"; //--- ToDo: Localize;
			x = 0.445835 * safezoneW + safezoneX;
			y = 0.252 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.011 * safezoneH;
			sizeEx = "0.015 * safezoneH";
			font = "PuristaSemiBold";
		};
		class connectdot1: RscPicture
		{
			idc = 5527;
			text = "\A3PL_Common\phone\base\connection.paa";
			x = 0.419792 * safezoneW + safezoneX;
			y = 0.255556 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.00637039 * safezoneH;
		};
		class connectdot2: RscPicture
		{
			idc = 5528;
			text = "\A3PL_Common\phone\base\connection.paa";
			x = 0.42552 * safezoneW + safezoneX;
			y = 0.255555 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.00637039 * safezoneH;
		};
		class connectdot3: RscPicture
		{
			idc = 5529;
			text = "\A3PL_Common\phone\base\connection.paa";
			x = 0.431406 * safezoneW + safezoneX;
			y = 0.255222 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.00637039 * safezoneH;
		};
		class connectdot4: RscPicture
		{
			idc = 5530;
			text = "\A3PL_Common\phone\base\noconnection.paa";
			x = 0.436979 * safezoneW + safezoneX;
			y = 0.255555 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.00637039 * safezoneH;
		};
		class connectdot5: RscPicture
		{
			idc = 5531;
			text = "\A3PL_Common\phone\base\noconnection.paa";
			x = 0.442708 * safezoneW + safezoneX;
			y = 0.255555 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.00637039 * safezoneH;
		};

		class RscButton_1609: RscButton
		{
			idc = 1609;
			text = "Dirigir"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = "0.015 * safezoneH";
		};
		class RscButton_1613: RscButton
		{
			idc = 1613;
			text = "Solicitar Uber"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = "0.015 * safezoneH";
		};
	};
};
