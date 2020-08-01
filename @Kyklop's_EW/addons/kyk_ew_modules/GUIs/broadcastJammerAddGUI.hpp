////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by KyklopCZ, v1.063, #Cisyzu)
////////////////////////////////////////////////////////

class kyk_ew_RscBackground: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0,0,0,0.7)";
	x = 0.335272 * safezoneW + safezoneX;
	y = 0.289953 * safezoneH + safezoneY;
	w = 0.316277 * safezoneW;
	h = 0.434097 * safezoneH;
};
class kyk_ew_RscEditRadioJammingRange: RscEdit
{
	idc = 1400;
	text = "0"; //--- ToDo: Localize;
	x = 0.513178 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.105426 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscTextRadioJammingRange: RscText
{
	idc = 1001;
	text = "Radio jamming range (m):"; //--- ToDo: Localize;
	x = 0.374807 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.138371 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscTextGsmJammingRange: RscText
{
	idc = 1000;
	text = "GSM jamming range (m):"; //--- ToDo: Localize;
	x = 0.374807 * safezoneW + safezoneX;
	y = 0.373972 * safezoneH + safezoneY;
	w = 0.138371 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscTextRfDetJammingRange: RscText
{
	idc = 1002;
	text = "RF Det. jamming range (m):"; //--- ToDo: Localize;
	x = 0.374807 * safezoneW + safezoneX;
	y = 0.429984 * safezoneH + safezoneY;
	w = 0.138371 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscTextDroneJammingRange: RscText
{
	idc = 1003;
	text = "Drone jamming range (m):"; //--- ToDo: Localize;
	x = 0.374807 * safezoneW + safezoneX;
	y = 0.485997 * safezoneH + safezoneY;
	w = 0.138371 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscTextGpsJammingRange: RscText
{
	idc = 1004;
	text = "GPS jamming range (m):"; //--- ToDo: Localize;
	x = 0.374807 * safezoneW + safezoneX;
	y = 0.542009 * safezoneH + safezoneY;
	w = 0.138371 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscTextRadarJammingRange: RscText
{
	idc = 1005;
	text = "Radar jamming range (m):"; //--- ToDo: Localize;
	x = 0.374807 * safezoneW + safezoneX;
	y = 0.598022 * safezoneH + safezoneY;
	w = 0.138371 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscEditGsmJammingRange: RscEdit
{
	idc = 1401;
	text = "0"; //--- ToDo: Localize;
	x = 0.513178 * safezoneW + safezoneX;
	y = 0.373972 * safezoneH + safezoneY;
	w = 0.105426 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscEditRfDetJammingRange: RscEdit
{
	idc = 1402;
	text = "0"; //--- ToDo: Localize;
	x = 0.513178 * safezoneW + safezoneX;
	y = 0.429984 * safezoneH + safezoneY;
	w = 0.105426 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscEditDroneJammingRange;: RscEdit
{
	idc = 1403;
	text = "0"; //--- ToDo: Localize;
	x = 0.513178 * safezoneW + safezoneX;
	y = 0.485997 * safezoneH + safezoneY;
	w = 0.105426 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscEditGpsJammingRange: RscEdit
{
	idc = 1404;
	text = "0"; //--- ToDo: Localize;
	x = 0.513178 * safezoneW + safezoneX;
	y = 0.542009 * safezoneH + safezoneY;
	w = 0.105426 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscEditRadarJammingRange: RscEdit
{
	idc = 1405;
	text = "0"; //--- ToDo: Localize;
	x = 0.513178 * safezoneW + safezoneX;
	y = 0.598022 * safezoneH + safezoneY;
	w = 0.105426 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscButtonOk: RscButton
{
	idc = 1600;
	text = "OK"; //--- ToDo: Localize;
	x = 0.473644 * safezoneW + safezoneX;
	y = 0.654034 * safezoneH + safezoneY;
	w = 0.0593019 * safezoneW;
	h = 0.0420094 * safezoneH;
	action = "kyk_ew_modules_dialogOK = true; closeDialog 0;";
};
class kyk_ew_RscButtonCancel: RscButton
{
	idc = 1601;
	text = "Cancel"; //--- ToDo: Localize;
	x = 0.552713 * safezoneW + safezoneX;
	y = 0.654034 * safezoneH + safezoneY;
	w = 0.0593019 * safezoneW;
	h = 0.0420094 * safezoneH;
	action = "kyk_ew_modules_dialogOK = false; closeDialog 0;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
