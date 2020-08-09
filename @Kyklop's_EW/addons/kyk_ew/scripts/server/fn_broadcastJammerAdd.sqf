/*
	Author: KyklopCZ
	
	Description:
	Sets specified object as a non-directional jammer.

	Parameter(s):
		0: OBJECT - Object which will become a jammer
		1: NUMBER - Radio jamming range of the jammer
		2: NUMBER - GSM jamming range of the jammer
		3: NUMBER - RF Detonator jamming range of the jammer
		4: NUMBER - Drone jamming range of the jammer
		5: NUMBER - GPS jamming range of the jammer
		6: NUMBER - Radar jamming range of the jammer

	Returns:
	Nothing
*/

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