params ["_jammer", "_radioDistance", "_gsmDistance", "_rfDetDistance", "_droneDistance", "_gpsDistance", "_radarDistance", "_direction", "_effectiveAngle", "_updateAngle"];

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