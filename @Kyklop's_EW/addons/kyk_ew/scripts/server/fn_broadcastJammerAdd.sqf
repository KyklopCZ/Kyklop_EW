params ["_jammer", "_radioDistance", "_gsmDistance", "_rfDetDistance", "_droneDistance", "_gpsDistance", "_radarDistance"];

#include "macros.hpp"

if(isServer) then
{
	SET_JAMMER_PROPERTIES;

	if(kyk_ew_jammerArrayBroadcast find _jammer == -1) then
	{
		kyk_ew_jammerArrayBroadcast append [_jammer];
		publicVariable "kyk_ew_jammerArrayBroadcast";
	};
	
	[_jammer] call kyk_ew_fnc_setJammerBackpack;
};