/*
======================================================================================
    Positioning Macros
======================================================================================
*/

#define PIXELSCALE 0.50
#define GRID_W (pixelW * pixelGrid * PIXELSCALE)
#define GRID_H (pixelH * pixelGrid * PIXELSCALE)

#define CENTER_X ((getResolution select 2) * 0.5 * pixelW)
#define CENTER_Y ((getResolution select 3) * 0.5 * pixelH)

#define SIZE_XXS 2
#define SIZE_XS	3.5
#define SIZE_S 4
#define SIZE_M 5
#define SIZE_L 5
#define SIZE_XL 6

#define GAP_H (1.5 * GRID_H)
#define GAP_W (1.5 * GRID_W)

#define FOOTER_EXTRA 2
#define TAB_H 1

/*
======================================================================================
    Control Type Macros
======================================================================================
*/

#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_EDIT 2
#define CT_SLIDER 3
#define CT_COMBO 4
#define CT_LISTBOX 5
#define CT_TOOLBOX 6
#define CT_CHECKBOXES 7
#define CT_PROGRESS 8
#define CT_HTML 9
#define CT_STATIC_SKEW 10
#define CT_ACTIVETEXT 11
#define CT_TREE 12
#define CT_STRUCTURED_TEXT 13
#define CT_CONTEXT_MENU 14
#define CT_CONTROLS_GROUP 15
#define CT_SHORTCUTBUTTON 16
#define CT_XKEYDESC 40
#define CT_XBUTTON 41
#define CT_XLISTBOX 42
#define CT_XSLIDER 43
#define CT_XCOMBO 44
#define CT_ANIMATED_TEXTURE 45
#define CT_MENU 46
#define CT_MENU_STRIP 47
#define CT_CHECKBOX 77
#define CT_OBJECT 80
#define CT_OBJECT_ZOOM 81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK 98
#define CT_ANIMATED_USER 99
#define CT_MAP 100
#define CT_MAP_MAIN 101
#define CT_LISTNBOX 102
#define CT_ITEMSLOT 103

/*
======================================================================================
    Static Styles
======================================================================================
*/

#define ST_POS 0x0F
#define ST_HPOS 0x03
#define ST_VPOS 0x0C
#define ST_LEFT 0x00
#define ST_RIGHT 0x01
#define ST_CENTER 0x02
#define ST_DOWN 0x04
#define ST_UP 0x08
#define ST_VCENTER 0x0c
#define ST_UPPERCASE 192

#define ST_TYPE 0xF0
#define ST_SINGLE 0
#define ST_MULTI 16
#define ST_TITLE_BAR 32
#define ST_PICTURE 48
#define ST_FRAME 64
#define ST_BACKGROUND 80
#define ST_GROUP_BOX 96
#define ST_GROUP_BOX2 112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE 176

#define ST_SHADOW 0x100
#define ST_NO_RECT 0x200
#define ST_KEEP_ASPECT_RATIO 0x800

#define ST_TITLE ST_TITLE_BAR + ST_CENTER

/* Progress Bar */
#define ST_VERTICAL 0x01
#define ST_HORIZONTAL 0

/*
======================================================================================
    Slider Styles
======================================================================================
*/

#define SL_DIR 0x400
#define SL_VERT 0
#define SL_HORZ 1024
#define SL_TEXTURES 0x10

/*
======================================================================================
    Listbox Macros
======================================================================================
*/

#define LB_TEXTURES 0x10
#define LB_MULTI 0x20

/* Tree styles */
#define TR_SHOWROOT 1
#define TR_AUTOCOLLAPSE 2

/* MessageBox styles */
#define MB_BUTTON_OK 1
#define MB_BUTTON_CANCEL 2
#define MB_BUTTON_USER 4

/*
======================================================================================
    Colours
======================================================================================
*/

#define COLOUR_MAINBACKGROUND {0, 0, 0, 0.5}
#define COLOUR_HEADER {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "1"}
#define COLOUR_EMPTY {0, 0, 0, 0}
#define COLOUR_WHITE {1, 1, 1, 1}

#define COLOUR_PROGRESSBAR {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "1"}
#define COLOUR_PROGRESSBAR_BACKGROUND {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"}

#define COLOUR_AREABACKGROUND {0.2, 0.2, 0.2, 1}
#define COLOUR_CONTENTTITLE {0.05, 0.05, 0.05, 1}
#define COLOUR_CONTENTBACKGROUND {0, 0, 0, 0.5}
#define COLOUR_INPUT {0, 0, 0, 0.4}
#define COLOUR_MAIN_PROFILENAMESPACE {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"}

/*
======================================================================================
    Button Macros
======================================================================================
*/

#define COLOUR_DEFAULTBUTTON {0, 0, 0, 1}
#define COLOUR_DEFAULTBUTTONACTIVE {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1}
#define COLOUR_DEFAULTBUTTONDISABLED {0, 0, 0, 0.5}

#define COLOUR_CONTENTBUTTON {0, 0, 0, 1}
#define COLOUR_CONTENTBUTTONACTIVE {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1}
#define COLOUR_CONTENTBUTTONBLINK {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1}
#define COLOUR_CONTENTBUTTONDISABLED {0, 0, 0, 0.5}

#define TEXT_SIZE_CONTENTBUTTON "0.018 * safezoneH"
#define SIZE_BLOCK_CONTENTBUTTON "0.0198 * safezoneH"

/*
======================================================================================
    Fonts
======================================================================================
*/

#define FONT_LIGHT "PuristaLight"
#define FONT_HEAVY "PuristaMedium"
#define FONT_BOLD "PuristaBold"
#define FONT_ALT_LIGHT "RobotoCondensedLight"
#define FONT_ALT_NORMAL "RobotoCondensed"
#define FONT_ALT_BOLD "RobotoCondensedBold"
#define FontM "Zeppelin32"

/*
======================================================================================
    Text Sizes
======================================================================================
*/

#define TEXT_SMALL "0.01 * safezoneH"
#define TEXT_SMALL1 "0.015 * safezoneH"
#define TEXT_SMALL2 "0.018 * safezoneH"
#define TEXT_NORMAL "0.02 * safezoneH"
#define TEXT_NORMAL1 "0.025 * safezoneH"
#define TEXT_BIG "0.03 * safezoneH"
#define TEXT_VERYBIG "0.04 * safezoneH"

#define TEXT_SIZE_HEADER "0.020 * safezoneH"
#define TEXT_SIZE_SUBHEADER "0.018 * safezoneH"

#define TEXT_SIZE_TEXTBOX "0.0175 * safezoneH"

/* Block Sizes */
#define SIZE_BLOCK_HEADER 0.033 * safezoneH
#define SIZE_BLOCK_HEADER2 0.022 * safezoneH

/*
======================================================================================
    RscControls
======================================================================================
*/

class Caue_ScrollBar {
	color[] 			= {1, 1, 1, 0.6};
	colorActive[] 		= {1, 1, 1, 1};
	colorDisabled[] 	= {1, 1, 1, 0.3};
	thumb 				= "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty 			= "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull 			= "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border 				= "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow 				= 0;
	scrollSpeed 		= 0.06;
	width 				= 0;
	height 				= 0;
	autoScrollEnabled 	= 0;
	autoScrollSpeed 	= -1;
	autoScrollDelay 	= 5;
	autoScrollRewind 	= 0;
};

class Caue_RscFrame {
	type = 0;
	idc = -1;
	deletable = 0;
	style = 64;
	shadow = 2;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "RobotoCondensed";
	sizeEx = 0.02;
	text = "";
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.3;
};

class Caue_RscText {
	x 					= 0;
	y 					= 0;
	h 					= 0.037;
	w 					= 0.30000001;
	style 				= 0;
	type 				= 0;
	shadow 				= 0;
    text 				= "";
	colorShadow[] 		= {0, 0, 0, 0.5};
	font 				= "PuristaMedium";
	SizeEx 				= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] 		= {1, 1, 1, 1};
	colorBackground[] 	= {0, 0, 0, 0};
	linespacing 		= 1;
	tooltipColorText[] 	= {1, 1, 1, 1};
	tooltipColorBox[] 	= {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.64999998};
};

class Caue_RscPicture {
	shadow 					= 0;
	colorText[] 			= {1, 1, 1, 1};
	colorBackground[] 		= {-1, -1, -1, -1};
	style 					= 48;
	x 						= 0;
	y 						= 0;
	w 						= 0.2;
	h 						= 0.15000001;
	type 					= 0;
	tooltipColorText[] 		= {1, 1, 1, 1};
	tooltipColorBox[] 		= {1, 1, 1, 1};
	tooltipColorShade[] 	= {0, 0, 0, 0.64999998};
	font 					= "PuristaMedium";
	sizeEx 					= -1;
};
class Caue_RscPictureKeepAspect: Caue_RscPicture {
	style = "0x30 + 0x800";
};

class Caue_RscProgress {
	type 				= 8;
	style 				= 0;
	x 					= 0.344;
	y 					= 0.619;
	w 					= 0.313726;
	h 					= 0.0261438;
	texture				= "";
	shadow 				= 0;
	colorFrame[] 		= {0, 0, 0, 1};
	colorBackground[] 	= {0, 0, 0, 0.7};
	colorBar[] 			= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
};

class Caue_RscShortcutButton {
	idc					= -1;
	style				= 0;
	default 			= 0;
	shadow				= 0;
	w					= 0.183825;
	h					= "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	color[] 			= {1, 1, 1, 1};
	colorFocused[]		= {1, 1, 1, 1};
	color2[]			= {0.94999999, 0.94999999, 0.94999999, 1};
	colorDisabled[]     = {1, 1, 1, 0.25};
	colorBackground[] = {
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorBackgroundFocused[] = {
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	textureNoShortcut               = "";
	colorBackground2[]				= {1, 1, 1, 1};
	textSecondary					= "";
	colorSecondary[]				= {1, 1, 1, 1};
	colorFocusedSecondary[]			= {1, 1, 1, 1};
	color2Secondary[]				= {0.94999999, 0.94999999, 0.94999999, 1};
	colorDisabledSecondary[]		= {1, 1, 1, 0.25};
	sizeExSecondary					= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary					= "PuristaLight";
	animTextureDefault				= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal				= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled				= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver					= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused				= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed				= "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus						= 1.2;
	periodOver						= 0.80000001;
	class HitZone {
		left   = 0;
		top    = 0;
		right  = 0;
		bottom = 0;
	};
	class ShortcutPos {
		left = 0;
		top  = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w    = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h    = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos {
		left   = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top    = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right  = 0.0049999999;
		bottom = 0;
	};
	period = 0.40000001;
	font   = "PuristaLight";
	size   = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text   = "";
	url    = "";
	soundEnter[] = {
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.090000004,
		1
	};
	soundPush[] = {
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.090000004,
		1
	};
	soundClick[] = {
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.090000004,
		1
	};
	soundEscape[] = {
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.090000004,
		1
	};
	action="";
	class Attributes {
		font   = "PuristaLight";
		color  = "#E5E5E5";
		align  = "left";
		shadow = "true";
	};
	class AttributesImage {
		font  = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
	};
};
class Caue_RscButtonMenu: Caue_RscShortcutButton {
	idc						= -1;
	type					= 16;
	style					= "0x02 + 0xC0";
	default					= 0;
	shadow					= 0;
	x						= 0;
	y						= 0;
	w						= 0.095588997;
	h						= 0.039216001;
	animTextureNormal		= "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled		= "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver			= "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused		= "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed		= "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault		= "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[]		= {0,0,0,0.80000001};
	colorBackgroundFocused[]= {1,1,1,1};
	colorBackground2[]		= {0.75,0.75,0.75,1};
	color[]					= {1,1,1,1};
	colorFocused[]			= {0,0,0,1};
	color2[]				= {0,0,0,1};
	colorText[]				= {1,1,1,1};
	colorDisabled[]			= {1,1,1,0.25};
	textSecondary			= "";
	colorSecondary[]		= {1,1,1,1};
	colorFocusedSecondary[]	= {0,0,0,1};
	color2Secondary[]		= {0,0,0,1};
	colorDisabledSecondary[]= {1,1,1,0.25};
	sizeExSecondary			= "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary			= "PuristaLight";
	period					= 1.2;
	periodFocus				= 1.2;
	periodOver				= 1.2;
	size					= "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx					= "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[]		= {1,1,1,1};
	tooltipColorBox[]		= {1,1,1,1};
	tooltipColorShade[]		= {0,0,0,0.64999998};
	class TextPos {
		left	= "0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top		= "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right	= 0.0049999999;
		bottom	= 0;
	};
	class Attributes {
		font	 = "PuristaLight";
		color    = "#E5E5E5";
		align    = "left";
		shadow   = "false";
	};
	class ShortcutPos {
		left	= "5.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top		= 0;
		w		= "1 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		h		= "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	};
	soundEnter[] = {
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.090000004,
		1
	};
	soundPush[] = {
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.090000004,
		1
	};
	soundClick[] = {
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.090000004,
		1
	};
	soundEscape[] = {
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.090000004,
		1
	};
};

class Caue_RscCombo {
	style 						= "0x10 + 0x200";
	font 						= "PuristaLight";
	sizeEx 						= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow 						= 0;
	type						= 4;
	maxHistoryDelay 			= 0.5;
	x 							= 0;
	y 							= 0;
	w 							= 0.12;
	h 							= 0.035;
	colorSelect[] 				= {0, 0, 0, 1};
	colorText[] 				= {1, 1, 1, 1};
	colorBackground[] 			= {0, 0, 0, 1};
	colorSelectBackground[] 	= {1, 1, 1, 0.69999999};
	colorScrollbar[] 			= {1, 0, 0, 1};
	arrowEmpty 					= "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull 					= "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight 				= 0.44999999;
	colorActive[] 				= {1, 0, 0, 1};
	colorDisabled[] 			= {1, 1, 1, 0.25};
	colorPicture[] 				= {1, 1, 1, 1};
	colorPictureSelected[] 		= {1, 1, 1, 1};
	colorPictureDisabled[] 		= {1, 1, 1, 0.25};
	colorPictureRight[] 		= {1, 1, 1, 1};
	colorPictureRightSelected[] = {1, 1, 1, 1};
	colorPictureRightDisabled[] = {1, 1, 1, 0.25};
	colorTextRight[] 			= {1, 1, 1, 1};
	colorSelectRight[] 			= {0, 0, 0, 1};
	colorSelect2Right[] 		= {0, 0, 0, 1};
	tooltipColorText[] 			= {1, 1, 1, 1};
	tooltipColorBox[] 			= {1, 1, 1, 1};
	tooltipColorShade[] 		= {0, 0, 0, 0.64999998};
	soundSelect[] =	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	soundExpand[] = {
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[] = {
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	class ComboScrollBar: Caue_ScrollBar {
		color[] = {1,1,1,1};
	};
};

class Caue_RscListBox {
	x 								= 0;
	y 								= 0;
	w 								= 0.30000001;
	h 								= 0.30000001;
	style 							= 16;
	type							= 5;
	rowHeight 						= 0.04;
	font 							= "PuristaLight";
	sizeEx 							= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow 							= 0;
	colorShadow[] 					= {0, 0, 0, 0.5};
	colorText[] 					= {1, 1, 1, 1};
	colorDisabled[] 				= {1, 1, 1, 0.25};
	colorScrollbar[] 				= {1, 0, 0, 0};
	colorSelect[] 					= {0, 0, 0, 1};
	colorSelect2[] 					= {0, 0, 0, 1};
	colorSelectBackground[]			= {0.94999999, 0.94999999, 0.94999999, 1};
	colorSelectBackground2[]		= {1, 1, 1, 0.5};
	period							= 1.2;
	colorBackground[]				= {0, 0, 0, 0.30000001};
	maxHistoryDelay					= 1;
	colorPicture[]					= {1, 1, 1, 1};
	colorPictureSelected[]			= {1, 1, 1, 1};
	colorPictureDisabled[]			= {1, 1, 1, 0.25};
	colorPictureRight[]				= {1, 1, 1, 1};
	colorPictureRightSelected[]     = {1, 1, 1, 1};
	colorPictureRightDisabled[]     = {1, 1, 1, 0.25};
	colorTextRight[]				= {1, 1, 1, 1};
	colorSelectRight[]				= {0, 0, 0, 1};
	colorSelect2Right[]				= {0, 0, 0, 1};
	tooltipColorText[]				= {1, 1, 1, 1};
	tooltipColorBox[]				= {1, 1, 1, 1};
	tooltipColorShade[]				= {0, 0, 0, 0.64999998};
	soundSelect[] =	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.090000004,
		1
	};
	class ListScrollBar: Caue_ScrollBar {
		color[]			  = {1,1,1,1};
		autoScrollEnabled = 1;
	};
};

class Caue_RscStructuredText {
	x 			= 0;
	y		 	= 0;
	h 			= 0.035;
	w 			= 0.1;
	type 		= 13;
	style 		= 0;
	text 		= "";
	size 		= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[]	= {1,1,1,1};
	shadow		= 0;
	class Attributes {
		font		= "RobotoCondensed";
		color		= "#ffffff";
		colorLink	= "#D09B43";
		align 		= "left";
		shadow		= 0;
	};
};

class Caue_RscControlsGroup {
	type 	= 15;
	idc 	= -1;
	x 		= 0;
	y 		= 0;
	w 		= 1;
	h 		= 1;
	shadow 	= 0;
	style 	= 16;
	class Caue_VScrollbar: Caue_ScrollBar {
		width 			  = 0.021;
		autoScrollEnabled = 1;
	};
	class Caue_HScrollbar: Caue_ScrollBar {
		height = 0.028;
	};
	class Controls {};
};

class Caue_RscControlsGroupNoScrollbars: Caue_RscControlsGroup {
	class VScrollbar: Caue_VScrollbar {
		width = 0;
	};
	class HScrollbar: Caue_HScrollbar {
		height = 0;
	};
};

class Caue_RscControlsGroupNoHScrollbars: Caue_RscControlsGroup {
	class HScrollbar: Caue_HScrollbar {
		height = 0;
	};
};

class Caue_RscControlsGroupNoVScrollbars: Caue_RscControlsGroup {
	class VScrollbar: Caue_VScrollbar {
		width = 0;
	};
};

class Caue_RscEdit {
	access 				= 0;
    type 				= CT_EDIT;
    style 				= ST_LEFT + ST_FRAME + ST_NO_RECT;
    x 					= 0;
    y 					= 0;
    h 					= 0.04;
    w 					= 0.2;
    colorBackground[] 	= {0, 0, 0, 0};
    colorText[] 		= {1, 1, 1, 1};
    colorSelection[] 	= {1, 1, 1, 0.25};
	colorDisabled[]		= {0, 0, 0, 0};
    font 				= "PuristaLight";
    sizeEx 				= 0.04;
    autocomplete 		= "";
    text 				= "";
    size 				= 0;
    shadow 				= 0;
};

class Caue_RscTree {
	type 						= CT_TREE;
	style 						= ST_LEFT;
	text						= "";
	font 						= FONT_ALT_NORMAL;
	sizeEx 						= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) - 0.005";
	expandedTexture 			= "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
	hiddenTexture 				= "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
	maxHistoryDelay 			= 0;
	x 							= 0;
	y 							= 0;
	w 							= 0.1;
	h 							= 0.2;
	rowHeight 					= 0.0439091;
	colorMarkedSelected[] 		= {1, 0.5, 0, 1};
	colorMarkedText[] 			= {1, 1, 1, 1};
	colorMarked[] 				= {1, 0.5, 0, 0.5};
	colorArrow[] 				= {0, 0, 0, 0};
	colorText[] 				= {1, 1, 1, 1.0};
	colorSearch[] 				= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
	colorSelect[] 				= {1, 1, 1, 0.7};
	colorSelectText[] 			= {0, 0, 0, 1};
	colorBackground[] 			= {0, 0, 0, 0};
	colorSelectBackground[] 	= {0, 0, 0, 0.5};
	colorBorder[] 				= {0, 0, 0, 0};
	colorDisabled[] 			= {1, 1, 1, 0.25};
	colorLines[] 				= {0, 0, 0, 0};
	borderSize 					= 0;
	expandOnDoubleclick 		= 1;
	colorPicture[] 				= {1, 1, 1, 1};
	colorPictureSelected[] 		= {0, 0, 0, 1};
	colorPictureDisabled[] 		= {1, 1, 1, 0.25};
	colorPictureRight[] 		= {1, 1, 1, 1};
	colorPictureRightSelected[] = {0, 0, 0, 1};
	colorPictureRightDisabled[] = {1, 1, 1, 0.25};
	class ScrollBar: Caue_ScrollBar {};
};

class Caue_RscTiles: Caue_RscControlsGroupNoScrollbars {
	idc                 = 115099;
	x                   = "safezoneX";
	y                   = "safezoneY";
	w                   = "safezoneW";
	h                   = "safezoneH";
	disableCustomColors = 1;
	onLoad              = "[ctrlParent (_this select 0), 'Caue_displayPause'] call (uiNamespace getVariable 'BIS_fnc_guiEffectTiles')";
	class Controls {
		class TileFrame: Caue_RscFrame {
			idc             = 114999;
			x               = 0;
			y               = 0;
			w               = "safezoneW";
			h               = "safezoneH";
			colortext[]     = {0, 0, 0, 1};
		};
		class Tile_0_0: Caue_RscText {
			idc                 = 115000;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(0 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_0_1: Caue_RscText {
			idc                 = 115001;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(1 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_0_2: Caue_RscText {
			idc                 = 115002;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(2 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_0_3: Caue_RscText {
			idc                 = 115003;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(3 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_0_4: Caue_RscText {
			idc                 = 115004;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(4 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_0_5: Caue_RscText {
			idc                 = 115005;
			x                   = "(0 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_0: Caue_RscText {
			idc                 = 115010;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(0 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_1: Caue_RscText {
			idc                 = 115011;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(1 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_2: Caue_RscText {
			idc                 = 115012;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(2 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_3: Caue_RscText {
			idc                 = 115013;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(3 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_4: Caue_RscText {
			idc                 = 115014;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(4 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_1_5: Caue_RscText {
			idc                 = 115015;
			x                   = "(1 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_0: Caue_RscText {
			idc                 = 115020;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(0 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_1: Caue_RscText {
			idc                 = 115021;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(1 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_2: Caue_RscText {
			idc                 = 115022;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(2 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_3: Caue_RscText {
				idc                 = 115023;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(3 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_4: Caue_RscText {
			idc                 = 115024;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(4 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_2_5: Caue_RscText {
			idc                 = 115025;
			x                   = "(2 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_0: Caue_RscText {
			idc                 = 115030;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(0 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_1: Caue_RscText {
			idc                 = 115031;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(1 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_2: Caue_RscText {
			idc                 = 115032;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(2 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_3: Caue_RscText {
			idc                 = 115033;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(3 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_4: Caue_RscText {
			idc                 = 115034;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(4 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_3_5: Caue_RscText {
			idc                 = 115035;
			x                   = "(3 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_4_0: Caue_RscText {
			idc                 = 115040;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(0 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_4_1: Caue_RscText {
			idc                 = 115041;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(1 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0,0,0.1};
		};
		class Tile_4_2: Caue_RscText {
			idc                 = 115042;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(2 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_4_3: Caue_RscText {
			idc                 = 115043;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(3 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_4_4: Caue_RscText {
			idc                 = 115044;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(4 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_4_5: Caue_RscText {
			idc                 = 115045;
			x                   = "(4 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
		class Tile_5_0: Caue_RscText {
			idc                = 115050;
			x                  = "(5 * 1/6) * safezoneW";
			y                  = "(0 * 1/6) * safezoneH";
			w                  = "1/6 * safezoneW";
			h                  = "1/6 * safezoneH";
			colorBackground[]  = {0, 0, 0, 0.1};
		};
		class Tile_5_1: Caue_RscText {
			idc                = 115051;
			x                  = "(5 * 1/6) * safezoneW";
			y                  = "(1 * 1/6) * safezoneH";
			w                  = "1/6 * safezoneW";
			h                  = "1/6 * safezoneH";
			colorBackground[]  = {0, 0, 0, 0.1};
		};
		class Tile_5_2: Caue_RscText {
			idc                = 115052;
			x                  = "(5 * 1/6) * safezoneW";
			y                  = "(2 * 1/6) * safezoneH";
			w                  = "1/6 * safezoneW";
			h                  = "1/6 * safezoneH";
			colorBackground[]  = {0, 0, 0, 0.1};
		};
		class Tile_5_3: Caue_RscText {
			idc                    = 115053;
			x                      = "(5 * 1/6) * safezoneW";
			y                      = "(3 * 1/6) * safezoneH";
			w                      = "1/6 * safezoneW";
			h                      = "1/6 * safezoneH";
			colorBackground[]      = {0, 0, 0, 0.1};
		};
		class Tile_5_4: Caue_RscText {
			idc                = 115054;
			x                  = "(5 * 1/6) * safezoneW";
			y                  = "(4 * 1/6) * safezoneH";
			w                  = "1/6 * safezoneW";
			h                  = "1/6 * safezoneH";
			colorBackground[]  = {0, 0, 0, 0.1};
		};
		class Tile_5_5: Caue_RscText {
			idc                 = 115055;
			x                   = "(5 * 1/6) * safezoneW";
			y                   = "(5 * 1/6) * safezoneH";
			w                   = "1/6 * safezoneW";
			h                   = "1/6 * safezoneH";
			colorBackground[]   = {0, 0, 0, 0.1};
		};
	};
};

class Caue_RscCheckBox {
	idc 							= -1;
	type 							= CT_CHECKBOX;
	deletable 						= 0;
	style 							= 0;
	checked 						= 1;
	x 								= "0.375 * safezoneW + safezoneX";
	y 								= "0.36 * safezoneH + safezoneY";
	w 								= "0.025 * safezoneW";
	h 								= "0.04 * safezoneH";
	color[] 						= {1, 1, 1, 0.7};
	colorFocused[] 					= {1, 1, 1, 1};
	colorHover[] 					= {1, 1, 1, 1};
	colorPressed[] 					= {1, 1, 1, 1};
	colorDisabled[] 				= {1, 1, 1, 0.2};
	colorBackground[] 				= {0, 0, 0, 0};
	colorBackgroundFocused[] 		= {0, 0, 0, 0};
	colorBackgroundHover[] 			= {0, 0, 0, 0};
	colorBackgroundPressed[] 		= {0, 0, 0, 0};
	colorBackgroundDisabled[] 		= {0, 0, 0, 0};
	textureChecked 					= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureUnchecked				= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureFocusedChecked 			= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureFocusedUnchecked 		= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureHoverChecked 			= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureHoverUnchecked 			= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	texturePressedChecked 			= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	texturePressedUnchecked 		= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureDisabledChecked 			= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureDisabledUnchecked		= "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	tooltipColorText[] 				= {1, 1, 1, 1};
	tooltipColorBox[] 				= {1, 1, 1, 1};
	tooltipColorShade[] 			= {0, 0, 0, 0.65};
	soundEnter[] 					= {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush", 0.09, 1};
	soundPush[] 					= {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush", 0.09, 1};
	soundClick[] 					= {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush", 0.09, 1};
	soundEscape[] 					= {"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush", 0.09, 1};
};

class Caue_RscMapControl {
    access 							= 0;
    type 							= 101;
    idc 							= 51;
    style 							= 48;
    colorBackground[] 				= {0.969, 0.957, 0.949, 1};
    colorOutside[] 					= {0, 0, 0, 1};
    colorText[] 					= {0, 0, 0, 1};
    font 							= "PuristaLight";
    sizeEx 							= 0.04;
    colorSea[] 						= {0.467, 0.631, 0.851, 0.5};
    colorForest[] 					= {0.624, 0.78, 0.388, 0.5};
    colorRocks[]					= {0, 0, 0, 0.3};
    colorCountlines[] 				= {0.572, 0.354, 0.188, 0.25};
    colorMainCountlines[] 			= {0.572, 0.354, 0.188, 0.5};
    colorCountlinesWater[] 			= {0.491, 0.577, 0.702,0.3};
    colorMainCountlinesWater[] 		= {0.491, 0.577, 0.702, 0.6};
    colorForestBorder[] 			= {0, 0, 0, 0};
    colorRocksBorder[] 				= {0, 0, 0, 0};
    colorPowerLines[] 				= {0.1, 0.1, 0.1, 1};
    colorRailWay[] 					= {0.8, 0.2, 0, 1};
    colorNames[] 					= {0.1, 0.1, 0.1, 0.9};
    colorInactive[] 				= {1, 1, 1, 0.5};
    colorLevels[] 					= {0.286, 0.177, 0.094, 0.5};
    colorTracks[] 					= {0.84, 0.76, 0.65, 0.15};
    colorRoads[] 					= {0.7, 0.7, 0.7, 1};
    colorMainRoads[] 				= {0.9, 0.5, 0.3, 1};
    colorTracksFill[]				= {0.84, 0.76, 0.65, 1};
    colorRoadsFill[] 				= {1, 1, 1, 1};
    colorMainRoadsFill[] 			= {1, 0.6, 0.4, 1};
    colorGrid[] 					= COLOUR_CONTENTBACKGROUND;
    colorGridMap[]					= COLOUR_CONTENTBACKGROUND;
    stickX[] 						= {0.2, {"Gamma", 1, 1.5}};
    stickY[] 						= {0.2, {"Gamma", 1, 1.5}};
	moveOnEdges 					= 0;
    x 								= "SafeZoneXAbs";
    y 								= "SafeZoneY + 1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    w 								= "SafeZoneWAbs";
    h 								= "SafeZoneH - 1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    shadow 							= 0;
    ptsPerSquareSea 				= 5;
    ptsPerSquareTxt 				= 3;
    ptsPerSquareCLn 				= 10;
    ptsPerSquareExp 				= 10;
    ptsPerSquareCost 				= 10;
    ptsPerSquareFor 				= 9;
    ptsPerSquareForEdge 			= 9;
    ptsPerSquareRoad 				= 6;
    ptsPerSquareObj 				= 9;
    showCountourInterval 			= 0;
    scaleMin 						= 0.001;
    scaleMax 						= 1;
    scaleDefault 					= 0.16;
    maxSatelliteAlpha 				= 0.85;
    alphaFadeStartScale 			= 0.35;
    alphaFadeEndScale 				= 0.4;
    fontLabel 						= "PuristaMedium";
    sizeExLabel 					= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontGrid 						= "TahomaB";
    sizeExGrid 						= 0.02;
    fontUnits 						= "TahomaB";
    sizeExUnits 					= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontNames 						= "PuristaMedium";
    sizeExNames 					= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
    fontInfo 						= "PuristaMedium";
    sizeExInfo 						= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontLevel 						= "TahomaB";
    sizeExLevel 					= 0.02;
    text 							= "#(argb,8,8,3)color(1,1,1,1)";
    class Legend {
        colorBackground[] 	= {1, 1, 1,0 .5};
        color[] 			= {0, 0, 0, 1};
        x 					= "SafeZoneX + (((safezoneW / safezoneH) min 1.2) / 40)";
        y 					= "SafeZoneY + safezoneH - 4.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        w 					= "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
        h 					= "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        font 				= "PuristaMedium";
        sizeEx 				= "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    };
    class ActiveMarker {
        color[] 			= {0.3, 0.1, 0.9, 1};
        size 				= 50;
    };
    class Command {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size 				= 18;
        importance			= 1;
        coefMin 			= 1;
        coefMax 			= 1;
    };
    class Task {
        colorCreated[] 		= {1, 1, 1, 1};
        colorCanceled[] 	= {0.7, 0.7, 0.7, 1};
        colorDone[] 		= {0.7, 1, 0.3, 1};
        colorFailed[] 		= {1, 0.3, 0.2, 1};
        color[] 			= {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
        icon 				= "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
        iconCreated 		= "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
        iconCanceled 		= "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
        iconDone 			= "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
        iconFailed			= "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
        size 				= 27;
        importance 			= 1;
        coefMin 			= 1;
        coefMax 			= 1;
    };
    class CustomMark {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 1;
        coefMax 			= 1;
    };
    class Tree {
        color[] 			= {0.45, 0.64, 0.33, 0.4};
        icon 				= "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size 				= 12;
        importance 			= "0.9 * 16 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class SmallTree {
        color[] 			= {0.45, 0.64, 0.33, 0.4};
        icon 				= "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size 				= 12;
        importance 			= "0.6 * 12 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class Bush {
        color[] 			= {0.45, 0.64, 0.33, 0.4};
        icon 				= "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size 				= "14/2";
        importance 			= "0.2 * 14 * 0.05 * 0.05";
        coefMin				= 0.25;
        coefMax 			= 4;
    };
    class Church {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Chapel {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Cross {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin				= 0.85;
        coefMax 			= 1;
    };
    class Rock {
        color[] 			= {0.1, 0.1, 0.1, 0.8};
        icon 				= "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        size 				= 12;
        importance 			= "0.5 * 12 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class Bunker {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size 				= 14;
        importance 			= "1.5 * 14 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class Fortress {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size 				= 16;
        importance 			= "2 * 16 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class Fountain {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        size 				= 11;
        importance 			= "1 * 12 * 0.05";
        coefMin 			= 0.25;
        coefMax 			= 4;
    };
    class ViewTower {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        size 				= 16;
        importance 			= "2.5 * 16 * 0.05";
        coefMin 			= 0.5;
        coefMax 			= 4;
    };
    class Lighthouse {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Quay {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Fuelstation {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
        size				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Hospital {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class BusStop {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Transmitter {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Stack {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        size 				= 20;
        importance 			= "2 * 16 * 0.05";
        coefMin				= 0.9;
        coefMax 			= 4;
    };
    class Ruin {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        size 				= 16;
        importance 			= "1.2 * 16 * 0.05";
        coefMin 			= 1;
        coefMax 			= 4;
    };
    class Tourism {
        color[] 			= {0, 0, 0, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        size 				= 16;
        importance 			= "1 * 16 * 0.05";
        coefMin 			= 0.7;
        coefMax 			= 4;
    };
    class Watertower {
        color[] 			= {1, 1, 1, 1};
        icon 				= "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
    };
    class Waypoint {
        color[] 			= {0, 0, 0, 1};
        size 				= 24;
        importance 			= 1;
        coefMin 			= 1;
        coefMax 			= 1;
        icon 				= "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
    };
    class WaypointCompleted {
        color[] 			= {0, 0, 0, 1};
        size 				= 24;
        importance 			= 1;
        coefMin 			= 1;
        coefMax 			= 1;
        icon 				= "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
    };
    class Power {
        icon 				= "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
        color[] 			= {1, 1, 1, 1};
    };
    class Powersolar {
        icon 				= "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
        color[] 			= {1, 1, 1, 1};
    };
    class Powerwave {
        icon 				= "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
        color[] 			= {1, 1, 1, 1};
    };
    class Powerwind {
        icon 				= "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
        color[] 			= {1, 1, 1, 1};
    };
    class Shipwreck {
        icon 				= "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
        size 				= 24;
        importance 			= 1;
        coefMin 			= 0.85;
        coefMax 			= 1;
        color[]				= {1, 1, 1, 1};
    };
    class LineMarker {
        lineDistanceMin  	 = 3e-005;
        lineLengthMin 		 = 5;
        lineWidthThick 		 = 0.014;
        lineWidthThin 		 = 0.008;
        textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
    };
};

class Caue_RscBackground: Caue_RscText {
	idc                = -1;
	x                  = "safezoneW + safezoneX";
	y                  = "safezoneH + safezoneY";
	w                  = "safezoneW";
	h                  = "safezoneH";
	colorBackground[]  = COLOUR_MAINBACKGROUND;
};

class Caue_RscSlider {
	x 				   = 0;
	y 				   = 0;
	w 				   = 0.3;
	h 				   = 0.025;
	color[] 	  	   = {1, 1, 1, 0.8};
	colorActive[] 	   = {1, 1, 1, 1};
};
class Caue_RscXSliderH {
	style 				= SL_HORZ;
    type 				= CT_XSLIDER;
	shadow 				= 0;
	x 					= 0;
	y 					= 0;
	h 					= 0.029412;
	w 					= 0.4;
	color[] 			= {1, 1, 1, 0.6};
	colorActive[] 		= {1, 1, 1, 1};
	colorDisabled[]		= {1, 1, 1, 0.2};
	arrowEmpty 			= "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull 			= "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border 				= "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb 				= "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
	tooltipColorText[] 	= {1, 1, 1, 1};
	tooltipColorBox[] 	= {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
};

class Caue_RscDefault {
	access 				= 0;
	idc 				= -1;
	style 				= 0;
	default 			= 0;
	show 				= 1;
	fade 				= 0;
	blinkingPeriod 		= 0;
	deletable 			= 0;
	x 					= 0;
	y 					= 0;
	w 					= 0;
	h 					= 0;
	tooltip 			= "";
	tooltipMaxWidth 	= 0.5;
	tooltipColorShade[] = {0, 0, 0, 1};
	tooltipColorText[] 	= {1, 1, 1, 1};
	tooltipColorBox[] 	= {0, 0, 0, 0};
	class ScrollBar {
		width 			= 0;
		height 			= 0;
		scrollSpeed 	= 0.06;
		arrowEmpty 		= "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull 		= "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border 			= "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb 			= "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[] 		= {1, 1, 1, 1};
	};
};
class Caue_RscDefaultButton: Caue_RscDefault {
	soundClick[] 		= {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
	soundEnter[] 		= {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
	soundPush[] 		= {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
	soundEscape[] 		= {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
	sizeEx 				= "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	font 				= "PuristaLight";
	shadow 				= 0;
};
class Caue_RscButton: Caue_RscDefaultButton {
	type 						= 1;
	style 						= "0x02 + 0xC0";
	colorBackground[] 			= {0, 0, 0, 1};
	colorBackgroundDisabled[] 	= {0, 0, 0, 0.5};
	colorBackgroundActive[] 	= {0.3, 0.3, 0.3, 0.5};//{"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorFocused[] 				= {0.3, 0.3, 0.3, 0.5};//{"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	font 						= "PuristaLight";
	text 						= "";
	colorText[] 				= {1, 1, 1, 1};
	colorDisabled[] 			= {1, 1, 1, 0.25};
	borderSize 					= 0;
	colorBorder[] 				= {0, 0, 0, 0};
	colorShadow[] 				= {0, 0, 0, 0};
	offsetX 					= 0;
	offsetY 					= 0;
	offsetPressedX 				= "pixelW";
	offsetPressedY 				= "pixelH";
	period 						= 0;
	periodFocus 				= 2;
	periodOver 					= 0.5;
	class KeyHints {
		class A {
			key 				= "0x00050000 + 0";
			hint				= "KEY_XBOX_A";
		};
	};
	onCanDestroy 				= "";
	onDestroy 					= "";
	onMouseEnter 				= "";
	onMouseExit 				= "";
	onSetFocus 					= "";
	onKillFocus					= "";
	onKeyDown 					= "";
	onKeyUp 					= "";
	onMouseButtonDown 			= "";
	onMouseButtonUp 			= "";
	onMouseButtonClick 			= "";
	onMouseButtonDblClick 		= "";
	onMouseZChanged 			= "";
	onMouseMoving 				= "";
	onMouseHolding				= "";
	onButtonClick 				= "";
	onButtonDown 				= "";
	onButtonUp 					= "";
};
class Caue_RscButtonPictureKeepAspect: Caue_RscButton {
	style 						= "0x02 + 0x30 + 0x800";
};
class Caue_RscButtonToolbar: Caue_RscButtonPictureKeepAspect {
	colorBackground[] 			= {0, 0, 0, 0};
	colorBackgroundDisabled[] 	= {0, 0, 0, 0};
};

/* Control Default */
class Caue_ctrlDefault {
    access = 0;
    idc = -1;
    style = 0;
    default = 0;
    show = 1;
    fade = 0;
    blinkingPeriod = 0;
    deletable = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    tooltip = "";
    tooltipMaxWidth = 0.5;
    tooltipColorShade[] = {0,0,0,1};
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {0,0,0,0};
    class ScrollBar
    {
        width = 0;
        height = 0;
        scrollSpeed = 0.06;
        arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
        arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
        border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
        thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
        color[] = {1,1,1,1};
    };
};

class Caue_ctrlDefaultText: Caue_ctrlDefault {
    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
    font = "RobotoCondensedLight";
    shadow = 1;
};

/* Control Static */
class Caue_ctrlStatic: Caue_ctrlDefaultText {
    idc                     = -1;
    type                    = CT_STATIC;
    colorBackground[]       = {0, 0, 0, 0};
    text                    = "";
    lineSpacing             = 1;
    fixedWidth              = 0;
    colorText[]             = {1, 1, 1, 1};
    colorShadow[]           = {0, 0, 0, 1};
    moving                  = 0;
    autoplay                = 0;
    loops                   = 0;
    tileW                   = 1;
    tileH                   = 1;
    onCanDestroy            = "";
    onDestroy               = "";
    onMouseEnter            = "";
    onMouseExit             = "";
    onSetFocus              = "";
    onKillFocus             = "";
    onKeyDown               = "";
    onKeyUp                 = "";
    onMouseButtonDown       = "";
    onMouseButtonUp         = "";
    onMouseButtonClick      = "";
    onMouseButtonDblClick   = "";
    onMouseZChanged         = "";
    onMouseMoving           = "";
    onMouseHolding          = "";
    onVideoStopped          = "";
    shadow                  = 0;
};

class Caue_ctrlStaticPicture: Caue_ctrlStatic {
    style = ST_LEFT + ST_MULTI + ST_TITLE_BAR;
};

class Caue_ctrlStaticPictureKeepAspect: Caue_ctrlStaticPicture {
    style = "0x30 + 0x800";
};

class Caue_ctrlStaticBackground: Caue_ctrlStatic {
    colorBackground[] = {0.2, 0.2, 0.2, 1};
};

class Caue_ctrlStaticFooter: Caue_ctrlStatic {
    colorBackground[] = {0.15, 0.15, 0.15, 1};
    h                 = "(5 + 2) * (pixelH * pixelGrid * 0.50)";
};

class Caue_ctrlStaticContent: Caue_ctrlStatic {
    colorBackground[] = {0, 0, 0, 0.5};
};

class Caue_ctrlStaticTitle: Caue_ctrlStatic {
    colorText[]       = {1, 1, 1, 1};
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
        1
    };
    h                 = "0.022 * safezoneH";
};

class Caue_ctrlStaticTitleMoving: Caue_ctrlStaticTitle {
    moving = 1;
};

class Caue_ctrlStaticHeader: Caue_ctrlStatic {
    colorText[]       = {1, 1, 1, 1};
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
        1
    };
    h                 = "5 * (pixelH * pixelGrid * 0.50)";
};

class Caue_ctrlStaticHeaderMoving: Caue_ctrlStaticHeader {
    moving            = 1;
};

class Caue_ctrlStaticPictureTile: Caue_ctrlStatic {
    style = 144;
};

class Caue_ctrlStaticBackgroundDisableTiles: Caue_ctrlStaticPictureTile {
    x = -4;
    y = -2;
    w = 8;
    h = 4;
    text = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
    tileW = "8 / (32 * pixelW)";
    tileH = "4 / (32 * pixelH)";
    colorText[] = {1,1,1,0.05};
};

/* Control Progress */
class Caue_ctrlProgress: Caue_ctrlDefault {
	type           = CT_PROGRESS;
    colorBar[]     = COLOUR_PROGRESSBAR;
    colorFrame[]   = COLOUR_EMPTY;

	texture        = "#(argb,8,8,3)color(1,1,1,1)";
	onCanDestroy   = "";
	onDestroy      = "";
};

/* Control Buttons */
class Caue_ctrlDefaultButton0: Caue_ctrlDefaultText {
    soundClick[] = {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEnter[] = {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundEscape[] = {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
};

class Caue_ctrlDefaultButton: Caue_ctrlDefaultButton0 {
    type						= CT_BUTTON;
    style 						= ST_CENTER;
    sizeEx 						= TEXT_SIZE_CONTENTBUTTON;
    colorBackground[] 			= COLOUR_DEFAULTBUTTON;
    colorBackgroundActive[] 	= COLOUR_DEFAULTBUTTONACTIVE;
    colorBackgroundDisabled[] 	= COLOUR_DEFAULTBUTTONDISABLED;
    font 						= FONT_LIGHT;
    h                 			= SIZE_BLOCK_CONTENTBUTTON;
    borderSize 					= 0;
    colorBorder[] 				= {0, 0, 0, 0};
    colorShadow[] 				= {0, 0, 0, 1};
    shadow						= 0;
    colorText[]					= {0.9, 0.9, 0.9, 1};
    colorDisabled[]	         	= {0.8, 0.8, 0.8, 1};
    colorFocused[] 				= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    offsetX 					= 0;
    offsetY 					= 0;
    offsetPressedX 				= pixelW;
    offsetPressedY 				= pixelH;
};

class Caue_ctrlFloatButton: Caue_ctrlDefaultButton0 {
    type						= CT_BUTTON;
    style 						= ST_CENTER;
    sizeEx 						= TEXT_SIZE_CONTENTBUTTON;
    colorBackground[] 			= {0, 0, 0, 1};
    colorBackgroundDisabled[] 	= {0, 0, 0, 0.5};
    colorBackgroundActive[] 	= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    colorFocused[] 				= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    font 						= FONT_LIGHT;
    h                 			= SIZE_BLOCK_CONTENTBUTTON;
    borderSize 					= 0;
    colorBorder[] 				= {0, 0, 0, 0};
    colorShadow[] 				= {0, 0, 0, 1};
    shadow						= 0;
    colorText[]					= {0.9, 0.9, 0.9, 1};
    colorDisabled[]	         	= {0.8, 0.8, 0.8, 1};
    offsetX 					= 0;
    offsetY 					= 0;
    offsetPressedX 				= pixelW;
    offsetPressedY 				= pixelH;
};

class Caue_ctrlContentAreaButton: Caue_ctrlDefaultButton {
    type						= CT_BUTTON;
    style 						= ST_CENTER;
    sizeEx 						= TEXT_SMALL2;
    colorBackground[] 			= COLOUR_CONTENTBUTTON;
    colorBackgroundActive[] 	= COLOUR_CONTENTBUTTONACTIVE;
    colorBackgroundDisabled[] 	= COLOUR_CONTENTBUTTONDISABLED;
    font 						= FONT_LIGHT;
    borderSize 					= 0;
    colorBorder[] 				= {0, 0, 0, 0};
    colorShadow[] 				= {0, 0, 0, 1};
    shadow						= 0;
    offsetX 					= 0;
    offsetY 					= 0;
    offsetPressedX 				= pixelW;
    offsetPressedY 				= pixelH;
};

class Caue_ctrlContentAreaTexturedButton: Caue_RscButtonMenu {
    animTextureDefault 			= "gui\data\displays\DISPLAYMenu\buttonTextureNormal.paa";
    animTextureDisabled 		= "gui\data\displays\DISPLAYMenu\buttonTextureNormal.paa";
    animTexturePressed 			= "gui\data\displays\DISPLAYMenu\buttonTextureNormal.paa";
    animTextureNormal 			= "gui\data\displays\DISPLAYMenu\buttonTextureNormal.paa";
    textureNoShortcut 			= "gui\data\displays\DISPLAYMenu\buttonTextureNormal.paa";
    animTextureFocused 			= "gui\data\displays\DISPLAYMenu\buttonTextureFocus.paa";
    animTextureOver 			= "gui\data\displays\DISPLAYMenu\buttonTextureFocus.paa";
    color2[] 					= {1, 1, 1, 0.5};
    color[] 					= {1, 1, 1, 1};
    colorBackground2[] 			= {1, 1, 1, 1};
    colorBackground[]			= {0.5, 0.5, 0.5, 1};
    colorBackgroundFocused[]	= {1, 1, 1, 1};
    colorDisabled[] 			= {1, 1, 1, 0.50};
    colorFocused[] 				= {1, 1, 1, 1};
    style 						= 2;
    tooltipColorBox[] 			= {0.5, 0.5, 0.5, 0.5};
    tooltipColorShade[] 		= {0.1, 0.1, 0.1, 0.1};
    tooltipColorText[] 			= {1, 1, 1, 1};
    class ShortcutPos {
        left 	= 0;
        top 	= 0;
        w 		= 0;
        h 		= 0;
    };
    class TextPos {
        left 	= "-0.30 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        top 	= "0.35 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        right 	= 0;
        bottom	= 0;
    };
};

class Caue_ctrlButton: Caue_ctrlDefaultButton {
    type = 1;
    style = "0x02 + 0xC0";
    colorBackground[] = {0, 0, 0, 1};
    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    font = FONT_LIGHT;
    text = "";
    colorText[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    borderSize = 0;
    colorBorder[] = {0,0,0,0};
    colorShadow[] = {0,0,0,0};
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = "pixelW";
    offsetPressedY = "pixelH";
    period = 0;
    periodFocus = 2;
    periodOver = 0.5;
    class KeyHints
    {
        class A
        {
            key = "0x00050000 + 0";
            hint = "KEY_XBOX_A";
        };
    };
    onCanDestroy = "";
    onDestroy = "";
    onMouseEnter = "";
    onMouseExit = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onButtonClick = "";
    onButtonDown = "";
    onButtonUp = "";
    h = "0.0198 * safezoneH";
};

class Caue_ctrlButtonPictureKeepAspect: Caue_ctrlButton {
    style = ST_CENTER + ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};

class Caue_ctrlButtonToolbar: Caue_ctrlButtonPictureKeepAspect {
    colorBackground[]           = {0, 0, 0, 0};
    colorBackgroundDisabled[]   = {0, 0, 0, 0};
    shadow                      = 0;
    colorShadow[]               = {0, 0, 0, 0};
};

class Caue_ctrlButtonCancel: Caue_ctrlButton {
    h                  = "0.022 * safezoneH";
    colorBackground[]  = COLOUR_EMPTY;
    text               = "X";
    tooltip            = "Fechar";
    offsetPressedX     = 0;
    offsetPressedY     = 0;
    onButtonClick      = "(ctrlParent (_this select 0)) closeDisplay 2";
};

class Caue_ctrlButtonSearch: Caue_ctrlButton {
    style       = "0x02 + 0x30 + 0x800";
    text        = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
    textSearch  = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
    tooltip     = "Resetar";
    w           = "5 * (pixelW * pixelGrid * 	0.50)";
    h           = "5 * (pixelH * pixelGrid * 	0.50)";
};

class Caue_ctrlButtonExpandAll: Caue_ctrlButtonToolbar {
    style       = "0x02 + 0x30 + 0x800";
    text        = "\a3\3DEN\Data\Displays\Display3DEN\tree_expand_ca.paa";
    tooltip     = "Expandir Tudo";
    w           = "5 * (pixelW * pixelGrid * 0.50)";
    h           = "5 * (pixelH * pixelGrid * 0.50)";
};

class Caue_ctrlButtonCollapseAll: Caue_ctrlButtonToolbar {
    style       = "0x02 + 0x30 + 0x800";
    text        = "\a3\3DEN\Data\Displays\Display3DEN\tree_collapse_ca.paa";
    tooltip     = "Reduzir Tudo";
    w           = "5 * (pixelW * pixelGrid * 0.50)";
    h           = "5 * (pixelH * pixelGrid * 0.50)";
};

class Caue_ctrlButtonClose: Caue_ctrlButtonToolbar {
    idc            = -1;
    style          = "0x02 + 0x30 + 0x800";
    text           = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
    tooltip        = "Fechar";
    onButtonClick  = "(ctrlParent (_this select 0)) closeDisplay 2";
    offsetPressedX = 0;
    offsetPressedY = 0;
};

class Caue_ctrlShortcutButton: Caue_ctrlDefaultButton {
    type = 16;
    style = ST_UPPERCASE;
    colorBackground[] = {0,0,0,1};
    colorBackground2[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
    text = "";
    size = "4.86 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
    shadow = 0;
    color[] = {1,1,1,1};
    color2[] = {1,1,1,1};
    colorFocused[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
    period = 1;
    periodFocus = 1;
    periodOver = 0.5;
    shortcuts[] = {"0x00050000 + 0",28,57,156};
    textureNoShortcut = "#(argb,8,8,3)color(1,1,1,1)";
    class Attributes
    {
        align = "center";
        color = "#ffffff";
        font = "PuristaLight";
        shadow = 0;
    };
    class HitZone
    {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class TextPos
    {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class ShortcutPos
    {
        left = 0;
        top = 0;
        w = 0;
        h = 0;
    };
    onCanDestroy = "";
    onDestroy = "";
    onMouseEnter = "";
    onMouseExit = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onButtonClick = "";
    onButtonDown = "";
    onButtonUp = "";
};

/* Control Edit */
class Caue_ctrlEdit: Caue_ctrlDefaultText {
	type                   = CT_EDIT;
	style				   = ST_LEFT + ST_FRAME;
	colorBackground[]      = {0, 0, 0, 0.3};
	text                   = "";
	colorText[]            = {1, 1, 1, 1};
	colorDisabled[]        = {1, 1, 1, 0.25};
	colorSelection[]       = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	canModify              = 1;
	autocomplete           = "";
	onCanDestroy           = "";
	onDestroy              = "";
	onSetFocus             = "";
	onKillFocus            = "";
	onKeyDown              = "";
	onKeyUp                = "";
	onMouseButtonDown      = "";
	onMouseButtonUp        = "";
	onMouseButtonClick     = "";
	onMouseButtonDblClick  = "";
	onMouseZChanged        = "";
	onMouseMoving          = "";
	onMouseHolding         = "";
};

class Caue_ctrlEditMulti: Caue_ctrlEdit {
	style = ST_MULTI;
};

class Caue_ctrlEditMultiCode: Caue_ctrlEdit {
	style 		 = ST_MULTI + ST_LEFT;
	autocomplete = "scripting";
	font 		 = "EtelkaMonospacePro";
};

class Caue_ctrlEditNoRect: Caue_ctrlEdit {
	style = ST_LEFT + ST_NO_RECT;
};

/* Control Listbox */
class Caue_ctrlListbox: Caue_ctrlDefaultText {
	type = 5;
	style = "0x00 + 0x10";
	colorBackground[] = {0,0,0,0.5};
	colorSelectBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorSelectBackground2[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorShadow[] = {0,0,0,0.5};
	colorDisabled[] = {1,1,1,0.25};
	colorText[] = {1,1,1,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorTextRight[] = {1,1,1,1};
	colorSelectRight[] = {1,1,1,1};
	colorSelect2Right[] = {1,1,1,1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	period = 1;
	rowHeight = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	itemSpacing = 0;
	maxHistoryDelay = 1;
	canDrag = 0;
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	class ListScrollBar: ScrollBar {};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onLBSelChanged = "";
	onLBDblClick = "";
	onLBDrag = "";
	onLBDragging = "";
	onLBDrop = "";
};

class Caue_ctrlXListbox: Caue_ctrlDefaultText {
	type 					= 42;
	style 					= "0x400 + 0x02 + 0x10";
	color[] 				= {1, 1, 1, 1};
	colorActive[] 			= {1, 1, 1, 1}; //{"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorText[] 			= {1, 1, 1, 1};
	colorSelect[] 			= {1, 1, 1, 1};
	colorDisabled[] 		= {1, 1, 1, 0.25};
	colorPicture[] 			= {1, 1, 1, 1};
	//colorSelect[] 		= {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	cycle 					= 1;
	arrowEmpty 				= "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull 				= "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border 					= "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	soundSelect[] 			= {"\A3\ui_f\data\sound\RscListbox\soundSelect", 0.09,1};
	onCanDestroy 			= "";
	onDestroy 				= "";
	onSetFocus 				= "";
	onKillFocus 			= "";
	onKeyDown 				= "";
	onKeyUp 				= "";
	onMouseButtonDown 		= "";
	onMouseButtonUp 		= "";
	onMouseButtonClick		= "";
	onMouseButtonDblClick 	= "";
	onMouseZChanged 		= "";
	onMouseMoving 			= "";
	onMouseHolding 			= "";
	onLBSelChanged 			= "";
	onLBDblClick 			= "";
	sizeEx 					= TEXT_SMALL2;
};

class Caue_ctrlListNBox: Caue_ctrlDefaultText {
	type = 102;
	style = "0x00 + 0x10";
	colorSelectBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorSelectBackground2[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorShadow[] = {0,0,0,0.5};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	columns[] = {0};
	drawSideArrows = 0;
	idcLeft = -1;
	idcRight = -1;
	period = 1;
	disableOverflow = 0;
	rowHeight = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	maxHistoryDelay = 1;
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	class ListScrollBar: ScrollBar{};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onLBSelChanged = "";
	onLBDblClick = "";
};

class Caue_ctrlCombo: Caue_ctrlDefaultText {
	type = 4;
	style = "0x00 + 0x10 + 0x200";
	colorBackground[] = {0.05,0.05,0.05,1};
	colorSelectBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelect[] = {0,0,0,1};
	colorTextRight[] = {1,1,1,1};
	colorSelectRight[] = {1,1,1,0.25};
	colorSelect2Right[] = {1,1,1,1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	arrowEmpty = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmpty_ca.paa";
	arrowFull = "\a3\3DEN\Data\Controls\ctrlCombo\arrowFull_ca.paa";
	wholeHeight = "12 * 	5 * (pixelH * pixelGrid * 	0.50)";
	maxHistoryDelay = 1;
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	class ComboScrollBar
	{
		width = 0;
		height = 0;
		scrollSpeed = 0.01;
		arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
		arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
		border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
		thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
		color[] = {1,1,1,1};
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onLBSelChanged = "";
};

/* Control Text */
class Caue_ctrlStructuredText: Caue_ctrlDefaultText {
    type               = 13;
    colorBackground[]  = {0, 0, 0, 0};
    size               = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
    text               = "";
    class Attributes {
        align     = "left";
        color     = "#ffffff";
        colorLink = "";
        size      = 1;
        font      = "RobotoCondensedLight";
    };
    onCanDestroy = "";
    onDestroy    = "";
};

/* Control Checkbox */
class Caue_ctrlCheckbox: Caue_ctrlDefault {
	type = 77;
	checked = 1;
	color[] = {1,1,1,0.7};
	colorFocused[] = {1,1,1,1};
	colorHover[] = {1,1,1,1};
	colorPressed[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0,0,0,0};
	colorBackgroundFocused[] = {0,0,0,0};
	colorBackgroundHover[] = {0,0,0,0};
	colorBackgroundPressed[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	textureChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureFocusedChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureFocusedUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureHoverChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureHoverUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	texturePressedChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	texturePressedUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	textureDisabledChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
	textureDisabledUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onCheckedChanged = "";
};

class Caue_ctrlCheckboxSquare: Caue_ctrlCheckbox {
	w                  = "5 * (pixelW * pixelGrid * 0.50)";
	h                  = "5 * (pixelH * pixelGrid * 0.50)";
};

/* Control ControlsGroup */
class Caue_ctrlControlsGroup: Caue_ctrlDefault {
    type = 15;
    style = 16;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    class VScrollBar: ScrollBar {
        width = "2 * (pixelW * pixelGrid * 	0.50)";
        height = 0;
        autoScrollEnabled = 0;
        autoScrollDelay = 1;
        autoScrollRewind = 1;
        autoScrollSpeed = 1;
    };
    class HScrollBar: ScrollBar {
        width = 0;
        height = "2 * (pixelH * pixelGrid * 	0.50)";
    };
    onCanDestroy = "";
    onDestroy = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
};

class Caue_ctrlControlsGroupNoScrollbars: Caue_ctrlControlsGroup {
    class VScrollbar: VScrollBar {
        width = 0;
    };
    class HScrollbar: HScrollBar {
        height = 0;
    };
};

/* Control Slider */
class Caue_ctrlSliderV: Caue_ctrlDefault {
	type = 3;
	style = 0;
	color[] = {0,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	sliderRange[] = {0,1};
	sliderPosition = 1;
	lineSize = 0.1;
	pageSize = 3;
	class Title {
		idc = -1;
		colorBase[] = {1,1,1,1};
		colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	};
	class Value {
		idc = -1;
		format = "%.f";
		type = "SPTPlain";
		colorBase[] = {1,1,1,1};
		colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onSliderPosChanged = "";
};

class Caue_ctrlSliderH: Caue_ctrlSliderV {
	style = 1024;
};

class Caue_ctrlXSliderV: Caue_ctrlDefault {
	type = 43;
	style = 0;
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	sliderRange[] = {0,1};
	sliderPosition = 1;
	lineSize = 0.1;
	arrowEmpty = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
	arrowFull = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
	border = "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
	thumb = "\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";
	class Title
	{
		idc = -1;
		colorBase[] = {1,1,1,1};
		colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	};
	class Value
	{
		idc = -1;
		format = "%.f";
		type = "SPTPlain";
		colorBase[] = {1,1,1,1};
		colorActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onSliderPosChanged = "";
};

class Caue_ctrlXSliderH: Caue_ctrlXSliderV {
	style = 1024;
};

/* Control Maps */
class Caue_ctrlMap: Caue_ctrlDefault {
	type = 101;
	style = 48;
	x = "safezoneXAbs";
	y = "safezoneY";
	w = "safezoneWAbs";
	h = "safezoneH";
	sizeEx = 0.05;
	font = "RobotoCondensedLight";
	colorText[] = {0,0,0,1};
	moveOnEdges = 1;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 20;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareObj = 9;
	scaleMin = 0.0001;
	scaleMax = 1.0;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0.85;
	alphaFadeStartScale = 2;
	alphaFadeEndScale = 2;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {0.969,0.957,0.949,1.0};
	colorOutside[] = {0.0,0.0,0.0,1.0};
	colorSea[] = {0.467,0.631,0.851,0.5};
	colorForest[] = {0.624,0.78,0.388,0.5};
	colorForestBorder[] = {0.0,0.0,0.0,0.0};
	colorRocks[] = {0.0,0.0,0.0,0.3};
	colorRocksBorder[] = {0.0,0.0,0.0,0.0};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	colorCountlines[] = {0.572,0.354,0.188,0.25};
	colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	colorPowerLines[] = {0.1,0.1,0.1,1.0};
	colorRailWay[] = {0.8,0.2,0.0,1.0};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorInactive[] = {1.0,1.0,1.0,0.5};
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorTracksFill[] = {0.84,0.76,0.65,1.0};
	colorRoads[] = {0.7,0.7,0.7,1.0};
	colorRoadsFill[] = {1.0,1.0,1.0,1.0};
	colorMainRoads[] = {0.9,0.5,0.3,1.0};
	colorMainRoadsFill[] = {1.0,0.6,0.4,1.0};
	colorTrails[] = {0.84,0.76,0.65,0.15};
	colorTrailsFill[] = {0.84,0.76,0.65,0.65};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	fontLabel = "RobotoCondensedLight";
	sizeExLabel = 0.05;
	fontGrid = "TahomaB";
	sizeExGrid = 0.02;
	fontUnits = "TahomaB";
	sizeExUnits = 0.05;
	fontNames = "EtelkaNarrowMediumPro";
	sizeExNames = 0.05;
	fontInfo = "RobotoCondensedLight";
	sizeExInfo = 0.05;
	fontLevel = "TahomaB";
	sizeExLevel = 0.02;
	showCountourInterval = 1;
	idcMarkerColor = -1;
	idcMarkerIcon = -1;
	textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
	showMarkers = "true";
	class LineMarker
	{
		lineWidthThin = 0.008;
		lineWidthThick = 0.014;
		lineDistanceMin = 3e-005;
		lineLengthMin = 5;
	};
	class Legend
	{
		x = 0.5;
		y = 0.5;
		w = 0.4;
		h = 0.1;
		color[] = {0,0,0,1};
		colorBackground[] = {1,1,1,0.5};
		font = "RobotoCondensedLight";
		sizeEX = "3.96 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
	};
	class Task
	{
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		color[] = {1,1,1,1};
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		colorCreated[] = {1,1,0,1};
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		colorCanceled[] = {0.7,0.7,0.7,1};
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		colorDone[] = {0.7,1,0.3,1};
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		colorFailed[] = {1,0.3,0.2,1};
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class ActiveMarker
	{
		color[] = {0,0,0,1};
		size = 2;
	};
	class Waypoint
	{
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		importance = 1;
		size = 24;
	};
	class WaypointCompleted: Waypoint
	{
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
	};
	class CustomMark: Waypoint
	{
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
	};
	class Command: Waypoint
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
	};
	class Bush: Waypoint
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = 0.007;
		size = 7;
	};
	class SmallTree: Bush
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = 0.36;
		size = 12;
	};
	class Tree: SmallTree
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = 0.72;
	};
	class Rock: SmallTree
	{
		color[] = {0.1,0.1,0.1,0.8};
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		importance = 0.3;
	};
	class BusStop: Bush
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
	};
	class FuelStation: Waypoint
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
	};
	class Hospital: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
	};
	class Church: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
	};
	class Lighthouse: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
	};
	class Power: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
	};
	class PowerSolar: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
	};
	class PowerWave: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
	};
	class PowerWind: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
	};
	class Quay: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
	};
	class Transmitter: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
	};
	class Watertower: FuelStation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
	};
	class Cross: Waypoint
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
	};
	class Chapel: Cross
	{
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
	};
	class Shipwreck: Cross
	{
		icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
	};
	class Bunker: Waypoint
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance = 1.05;
		size = 14;
	};
	class Fortress: Bunker
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance = 1.6;
		size = 16;
	};
	class Fountain: Bunker
	{
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		importance = 0.6;
		size = 11;
	};
	class Ruin: Waypoint
	{
		coefMax = 4;
		coefMin = 1;
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		importance = 0.96;
		size = 16;
	};
	class Stack: Waypoint
	{
		coefMax = 2;
		coefMin = 0.4;
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		importance = 1.6;
		size = 16;
	};
	class Tourism: Waypoint
	{
		coefMax = 4;
		coefMin = 0.7;
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		importance = 2.8;
		size = 16;
	};
	class ViewTower: Waypoint
	{
		coefMax = 4;
		coefMin = 0.5;
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		importance = 2;
		size = 16;
	};
	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onDraw = "";
};

class Caue_ctrlMapEmpty: Caue_ctrlMap {
	ptsPerSquareSea = 1000;
	ptsPerSquareTxt = 1000;
	ptsPerSquareCLn = 1000;
	ptsPerSquareExp = 1000;
	ptsPerSquareCost = 1000;
	ptsPerSquareFor = 1000;
	ptsPerSquareForEdge = 1000;
	ptsPerSquareRoad = 1000;
	ptsPerSquareObj = 1000;
	alphaFadeStartScale = 0;
	alphaFadeEndScale = 0;
	colorBackground[] = {1,1,1,1};
	colorOutside[] = {1,1,1,1};
	colorSea[] = {0,0,0,0};
	colorForest[] = {0,0,0,0};
	colorForestBorder[] = {0,0,0,0};
	colorRocks[] = {0,0,0,0};
	colorRocksBorder[] = {0,0,0,0};
	colorLevels[] = {0,0,0,0};
	colorMainCountlines[] = {0,0,0,0};
	colorCountlines[] = {0,0,0,0};
	colorMainCountlinesWater[] = {0,0,0,0};
	colorCountlinesWater[] = {0,0,0,0};
	colorPowerLines[] = {0,0,0,0};
	colorRailWay[] = {0,0,0,0};
	colorNames[] = {0,0,0,0};
	colorInactive[] = {0,0,0,0};
	colorGrid[] = {0,0,0,0};
	colorGridMap[] = {0,0,0,0};
	class Task: Task
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		iconCreated = "#(argb,8,8,3)color(0,0,0,0)";
		iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
		iconDone = "#(argb,8,8,3)color(0,0,0,0)";
		iconFailed = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		colorCreated[] = {0,0,0,0};
		colorCanceled[] = {0,0,0,0};
		colorDone[] = {0,0,0,0};
		colorFailed[] = {0,0,0,0};
		size = 0;
	};
	class Waypoint: Waypoint
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class WaypointCompleted: WaypointCompleted
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class CustomMark: CustomMark
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Command: Command
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Bush: Bush
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Rock: Rock
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class SmallTree: SmallTree
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Tree: Tree
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class busstop: BusStop
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class fuelstation: FuelStation
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class hospital: Hospital
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class church: Church
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class lighthouse: Lighthouse
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class power: Power
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class powersolar: PowerSolar
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class powerwave: PowerWave
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class powerwind: PowerWind
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class quay: Quay
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class shipwreck: Shipwreck
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class transmitter: Transmitter
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class watertower: Watertower
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Bunker: Bunker
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Cross: Cross
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Fortress: Fortress
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Fountain: Fountain
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Chapel: Chapel
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Ruin: Ruin
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Stack: Stack
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class Tourism: Tourism
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
	class ViewTower: ViewTower
	{
		icon = "#(argb,8,8,3)color(0,0,0,0)";
		color[] = {0,0,0,0};
		size = 0;
	};
};

class Caue_ctrlMapMain: Caue_ctrlMap {};

/* Control Toolboxes*/
class Caue_ctrlToolbox: Caue_ctrlDefaultText {
	type                    = 6;
	style                   = 2;
	colorBackground[]       = {0, 0, 0, 0.5};
	colorText[]             = {1, 1, 1, 1};
	colorTextSelect[]       = {1, 1, 1, 1};
	rows                    = 1;
	columns                 = 1;
	strings[]               = {};
	values[]                = {};
	color[]                 = {1, 0, 1, 1};
	colorSelect[]           = {0, 0, 0, 0};
	colorTextDisable[]      = {0, 0, 0, 0};
	colorDisable[]          = {0, 0, 0, 0};
	colorSelectedBg[]       = {0.2, 0.2, 0.2, 1};
	onCanDestroy            = "";
	onDestroy               = "";
	onMouseEnter            = "";
	onMouseExit             = "";
	onSetFocus              = "";
	onKillFocus             = "";
	onKeyDown               = "";
	onKeyUp                 = "";
	onMouseButtonDown       = "";
	onMouseButtonUp         = "";
	onMouseButtonClick      = "";
	onMouseButtonDblClick   = "";
	onMouseZChanged         = "";
	onMouseMoving           = "";
	onMouseHolding          = "";
	onToolBoxSelChanged     = "";
};
class Caue_ctrlToolboxPicture: Caue_ctrlToolbox {
	style                   = "0x02 + 0x30";
};
class Caue_ctrlToolboxPictureKeepAspect: Caue_ctrlToolbox {
	style                   = "0x02 + 0x30 + 0x800";
};

/* Control Prompt */
class Caue_ctrlPrompt: Caue_ctrlControlsGroupNoScrollbars {
    idd        = -1;
    x          = "safezoneX";
    y          = "safezoneY";
    w          = "safezoneW";
    h          = "safezoneH";
    class controls {
        class BACKGROUND: Caue_ctrlStatic {
            idc                 = -1;
            x                   = "0.29375 * safezoneW";
            y                   = "0.380556 * safezoneH";
            w                   = "0.4125 * safezoneW";
            h                   = "0.2398 * safezoneH";
            colorBackground[]   = COLOUR_AREABACKGROUND;
        };
        class HEADER: Caue_ctrlStatic {
            idc                 = -1;
            text                = "Confirm Action";
            x                   = "0.29375 * safezoneW";
            y                   = "0.357 * safezoneH";
            w                   = "0.412424 * safezoneW";
            h                   = SIZE_BLOCK_HEADER2;
            colorBackground[]   = COLOUR_HEADER;
            font                = FONT_ALT_NORMAL;
            sizeEx				= TEXT_SIZE_HEADER;
        };
        class BUTTON_NO: Caue_ctrlFloatButton {
            idc                = 1;
            text		       = "";
            x 				   = "0.649531 * safezoneW";
            y 				   = "0.621 * safezoneH";
            w                  = "0.0567187 * safezoneW";
        };
        class BUTTON_YES: Caue_ctrlFloatButton {
            idc                = 2;
            text		       = "";
            x                  = "0.592 * safezoneW";
            y                  = "0.621 * safezoneH";
            w                  = "0.0567187 * safezoneW";
        };
        class CONTENT_TITLE: Caue_ctrlStatic {
            idc                = 3;
            text               = "";
            x                  = "0.295812 * safezoneW";
            y                  = "0.384956 * safezoneH";
            w                  = "0.4083 * safezoneW";
            h                  = SIZE_BLOCK_HEADER2;
            colorBackground[]  = COLOUR_CONTENTTITLE;
            font               = FONT_ALT_NORMAL;
            sizeEx			   = TEXT_SIZE_SUBHEADER;
        };
        class CONTENT_TEXT: Caue_ctrlStatic {
            idc                = 4;
            text               = "";
            style			   = ST_LEFT + ST_MULTI;
            x                  = "0.295833 * safezoneW";
            y                  = "0.408333 * safezoneH";
            w                  = "0.4083 * safezoneW";
            h                  = "0.2068 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBACKGROUND;
            sizeEx			   = TEXT_SIZE_TEXTBOX;
        };
    };
};

class Caue_ctrlPromptSmall: Caue_ctrlControlsGroupNoScrollbars {
    idd        = -1;
    x          = "safezoneX";
    y          = "safezoneY";
    w          = "safezoneW";
    h          = "safezoneH";
    class controls {
        class HEADER: Caue_ctrlStaticTitle {
            idc 				= 3;
            x 					= "0.396354 * safezoneW";
            y 					= "0.4032 * safezoneH";
            w 					= "0.20625 * safezoneW";
            h 					= "0.0185185 * safezoneH";
        };
        class BACKGROUND: Caue_ctrlStaticBackground {
            x 					= "0.396359 * safezoneW";
            y 					= "0.420974 * safezoneH";
            w 					= "0.20625 * safezoneW";
            h 					= "0.110926 * safezoneH";
        };
        class FOOTER: Caue_ctrlStaticFooter {
            x 					= "0.396354 * safezoneW";
            y 					= "0.532407 * safezoneH";
            w 					= "0.20625 * safezoneW";
            h 					= "0.0259259 * safezoneH";
        };
        class CONTENT_TEXT: Caue_ctrlStatic {
            idc 				= 4;
            x 					= "0.398437 * safezoneW";
            y 					= "0.424852 * safezoneH";
            w 					= "0.202136 * safezoneW";
            h 					= "0.10363 * safezoneH";
            style			    = ST_LEFT + ST_MULTI + ST_NO_RECT;
        };
        class BUTTON_CANCEL: Caue_ctrlDefaultButton {
            idc					= 1;
            text				= "";
            x 					= "0.550521 * safezoneW";
            y 					= "0.535778 * safezoneH";
            w 					= "0.05 * safezoneW";
            h 					= "0.0185185 * safezoneH";
        };
        class BUTTON_OK: BUTTON_CANCEL {
            idc 				= 2;
            x 					= "0.498959 * safezoneW";
        };
    };
};

/* Control Tree */
class Caue_ctrlTree: Caue_ctrlDefaultText {
	type = 12;
	colorBorder[] = {0,0,0,0};
	colorLines[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	colorSelect[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorMarked[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",0.5};
	colorMarkedSelected[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorText[] = {1,1,1,1};
	colorSelectText[] = {1,1,1,1};
	colorMarkedText[] = {1,1,1,1};
	colorSearch[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	multiselectEnabled = 0;
	expandOnDoubleclick = 1;
	hiddenTexture = "\a3\3DEN\Data\Controls\ctrlTree\hiddenTexture_ca.paa";
	expandedTexture = "\a3\3DEN\Data\Controls\ctrlTree\expandedTexture_ca.paa";
	maxHistoryDelay = 1;
	disableKeyboardSearch = 0;
	class ScrollBar: ScrollBar
	{
		scrollSpeed = 0.05;
	};
	colorDisabled[] = {0,0,0,0};
	colorArrow[] = {0,0,0,0};
	onCanDestroy = "";
	onDestroy = "";
	onMouseEnter = "";
	onMouseExit = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";
	onTreeSelChanged = "";
	onTreeLButtonDown = "";
	onTreeDblClick = "";
	onTreeExpanded = "";
	onTreeCollapsed = "";
	onTreeMouseExit = "";
};

/* Control MapSort */
class Caue_ctrlButtonMapSort: Caue_ctrlButton {
    idc                = -1;
    text               = "PRESS TAB FOR SORT MENU";
    x                  = "0.870625 * safezoneW + safezoneX";
    y                  = "0.978326 * safezoneH + safezoneY";
    w                  = "0.127868 * safezoneW";
    h                  = SIZE_BLOCK_CONTENTBUTTON;
};

class Caue_ctrlMapSort: Caue_ctrlControlsGroupNoScrollbars {
    idc        = -1;
	x          = "safezoneX";
	y          = "safezoneY";
	w          = "safezoneW";
	h          = "safezoneH";
    class controls {
        class BACKGROUND: Caue_ctrlStaticBackground {
        	idc                = 1;
        	x                  = "0.870625 * safezoneW";
        	y                  = "0.586726 * safezoneH";
        	w                  = "0.127868 * safezoneW";
        	h                  = "0.390326 * safezoneH";
        };
        class HEADER: Caue_ctrlStaticTitle {
            idc                = 2;
            text               = "Map Sort";
            x                  = "0.870625 * safezoneW";
            y                  = "0.5638 * safezoneH";
            w                  = "0.127868 * safezoneW";
        };
        class SEARCHBUTTON_BACKGROUND: Caue_ctrlStatic {
            idc                = 4;
        	x                  = "0.872282 * safezoneW";
        	y                  = "0.5902 * safezoneH";
        	w                  = "0.0123751 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class BUTTON_SEARCHREFRESH: Caue_ctrlButtonPictureKeepAspect {
            idc                = 5;
        	text               = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
        	x                  = "0.873281 * safezoneW";
        	y                  = "0.591593 * safezoneH";
        	w                  = "0.0105209 * safezoneW";
        	h                  = "0.0188889 * safezoneH";
            colorBackground[]  = COLOUR_CONTENTBUTTON;
        };
        class INPUT_SEARCH: Caue_ctrlEdit {
            idc                = 6;
        	x                  = "0.885625 * safezoneW";
        	y                  = "0.589852 * safezoneH";
        	w                  = "0.111893 * safezoneW";
        	h                  = SIZE_BLOCK_HEADER2;
        	colorBackground[]  = COLOUR_INPUT;
        };
        class TREE: Caue_ctrlTree {
            idc                = 7;
            idcSearch          = 6;
        	x                  = "0.872396 * safezoneW";
        	y                  = "0.612963 * safezoneH";
        	w                  = "0.124781 * safezoneW";
        	h                  = "0.342852 * safezoneH";
        	colorBackground[]  = COLOUR_CONTENTBACKGROUND;
        };
        class BUTTON_FOCUSLOCATION: Caue_ctrlButton {
            idc                = 8;
            text               = "FOCUS"; // ToDo: Localize;
            x                  = "0.872396 * safezoneW";
            y                  = "0.95683 * safezoneH";
            w                  = "0.0618749 * safezoneW";
            h                  = SIZE_BLOCK_CONTENTBUTTON;
        };
        class BUTTON_FOCUSONPLAYER: Caue_ctrlButton {
            idc                = 9;
            text               = "PLAYER"; // ToDo: Localize;
            x                  = "0.934687 * safezoneW";
            y                  = "0.956555 * safezoneH";
            w                  = "0.0623958 * safezoneW";
            h                  = SIZE_BLOCK_CONTENTBUTTON;
        };
    };
};
