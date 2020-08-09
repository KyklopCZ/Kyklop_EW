/*
	Author: KyklopCZ
	
	Description:
	Sets specified object as a directional jammer.

	Parameter(s):
		0: OBJECT - Object which will become a jammer
		1: NUMBER - Radio jamming range of the jammer
		2: NUMBER - GSM jamming range of the jammer
		3: NUMBER - RF Detonator jamming range of the jammer
		4: NUMBER - Drone jamming range of the jammer
		5: NUMBER - GPS jamming range of the jammer
		6: NUMBER - Radar jamming range of the jammer
		7: NUMBER - The direction the jammer should face
		8: NUMBER - The effective angle of the jammer
		9: BOOL - Whether to automatically update jammer's direction

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
	["_radarDistance", 0, 0],
	["_direction", 0, 0],
	["_effectiveAngle", 0, 0],
	["_updateAngle", false, false]
	];

#include "macros.hpp"

if(isServer) then
{
	SET_JAMMER_PROPERTIES;

	SET_JAMMER_ANGLES;
	
	if(kyk_ew_jammerArrayDirected find _jammer == -1) then
	{
		kyk_ew_jammerArrayDirected append [_jammer];
		publicVariable "kyk_ew_jammerArrayDirected";
	};
	
	_jammer setVariable ["kyk_ew_effectiveAngle", _effectiveAngle];
	_jammer setVariable ["kyk_ew_updateAngle", _updateAngle];
	
	[_jammer] call kyk_ew_fnc_setJammerBackpack;
};