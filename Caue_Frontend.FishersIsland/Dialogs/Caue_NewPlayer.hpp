class Caue_NewPlayer {
	idd = 111;
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	onUnload = "";

	class controls
	{
		class background: IGUIBack
		{
			idc = -1;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class header: RscStructuredText
		{
			idc = -1;
			text = "Bem-vindo a Fishers Island!<br/>Nosso sistema detectou que você é um novo jogador<br/>Por favor, digite o primeiro e último nome do seu novo personagem!";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class firstname: RscText
		{
			idc = -1;
			text = "Nome:";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lastname: RscText
		{
			idc = -1;
			text = "Sobrenome:";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.49 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class age: RscText
		{
			idc = -1;
			text = "Idade:";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class sex: RscText
		{
			idc = -1;
			text = "Sexo:";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class edit_firstname: RscEdit
		{
			idc = 1400;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class edit_lastname: RscEdit
		{
			idc = 1401;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.49 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class edit_age: RscEdit
		{
			idc = 1402;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.53 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class edit_sex: RscEdit
		{
			idc = 1403;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class button: RscButton
		{
			idc = 1600;
			text = "Enviar"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.62 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			action = "[] call Caue_Gear_NewPlayerSubmit;";
		};
	};
};
