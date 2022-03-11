/* #Duxevi
$[
	1.063,
	["Shop",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1600,"button_browseleft",[1,"<",["0.29375 * safezoneW + safezoneX","0.709 * safezoneH + safezoneY","0.0773437 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"button_browseright",[1,">",["0.629427 * safezoneW + safezoneX","0.709 * safezoneH + safezoneY","0.0773437 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"struc_itemName",[1,"",["0.37625 * safezoneW + safezoneX","0.709 * safezoneH + safezoneY","0.2475 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"button_buy",[1,"Buy",["0.407187 * safezoneW + safezoneX","0.786 * safezoneH + safezoneY","0.0773437 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1603,"button_sell",[1,"Sell",["0.515469 * safezoneW + safezoneX","0.786 * safezoneH + safezoneY","0.0773437 * safezoneW","0.066 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"edit_amount",[1,"",["0.443281 * safezoneW + safezoneX","0.896 * safezoneH + safezoneY","0.113437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"static_amount",[1,"Amount",["0.483021 * safezoneW + safezoneX","0.852 * safezoneH + safezoneY","0.0464063 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1900,"slider_dir",[1,"",["0.402031 * safezoneW + safezoneX","0.687 * safezoneH + safezoneY","0.195937 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/




class Dialog_Shop
{
	idd = 20;
	name= "Dialog_Shop";
	movingEnable = false;
	enableSimulation = true;
	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Kane, v1.063, #Gawomi)
		////////////////////////////////////////////////////////

		class button_browseleft: RscButton
		{
			idc = 1600;
			text = "<"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class button_browseright: RscButton
		{
			idc = 1601;
			text = ">"; //--- ToDo: Localize;
			x = 0.629427 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class struc_itemName: RscStructuredText
		{
			idc = 1100;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class button_buy: RscButton
		{
			idc = 1602;
			text = "Comprar"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class button_sell: RscButton
		{
			idc = 1603;
			text = "Vender"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class edit_amount: RscEdit
		{
			idc = 1400;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class static_amount: RscText
		{
			idc = 1000;
			text = "Quantia"; //--- ToDo: Localize;
			x = 0.483021 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class slider_dir: RscSlider
		{
			idc = 1900;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};