////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by KyklopCZ, v1.063, #Coqacu)
////////////////////////////////////////////////////////

#include "broadcastJammerAddGUI.hpp"

class kyk_ew_RscTextJammerBearing: RscText
{
	idc = 1006;
	text = "Jammer bearing: "; //--- ToDo: Localize;
	x = 0.374807 * safezoneW + safezoneX;
	y = 0.205934 * safezoneH + safezoneY;
	w = 0.138371 * safezoneW;
	h = 0.0280062 * safezoneH;
};
class kyk_ew_RscEditJammerBearing: RscEdit
{
	idc = 1406;
	text = "0"; //--- ToDo: Localize;
	x = 0.513178 * safezoneW + safezoneX;
	y = 0.205934 * safezoneH + safezoneY;
	w = 0.105426 * safezoneW;
	h = 0.0280062 * safezoneH;
	tooltip = "The bearing which the directional jammer will be facing"; //--- ToDo: Localize;
};
class kyk_ew_RscEditEffectiveAngle: RscEdit
{
	idc = 1407;
	text = "0"; //--- ToDo: Localize;
	x = 0.513178 * safezoneW + safezoneX;
	y = 0.261947 * safezoneH + safezoneY;
	w = 0.105426 * safezoneW;
	h = 0.0280062 * safezoneH;
	tooltip = "Sets how big angle will be jammed"; //--- ToDo: Localize;
};
class kyk_ew_RscTextEffectiveAngle: RscText
{
	idc = 1007;
	text = "Effective angle:"; //--- ToDo: Localize;
	x = 0.374807 * safezoneW + safezoneX;
	y = 0.261947 * safezoneH + safezoneY;
	w = 0.138371 * safezoneW;
	h = 0.0280062 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
