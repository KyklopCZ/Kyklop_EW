params [
	["_jammer", objNull, objNull],
	["_radioDistance", 0, 0],
	["_gsmDistance", 0, 0],
	["_rfDetDistance", 0, 0],
	["_droneDistance", 0, 0],
	["_gpsDistance", 0, 0],
	["_radarDistance", 0, 0]
	];

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