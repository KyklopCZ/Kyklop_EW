/*
	Author: KyklopCZ

	Description:
	Checks whether a player should see a hint and displays it if so.

	Parameter(s):
	None

	Returns:
	Nothing
*/

#include "macros.hpp"

if(isServer) then
{
	{
		if(_x getVariable ["kyk_ew_updateAngle", false]) then
		{
			private _direction = getDir _x;
			private _effectiveAngle = _x getVariable ["kyk_ew_effectiveAngle", 0];
			private _jammer = _x;
			
			SET_JAMMER_ANGLES;
		};
	} forEach kyk_ew_jammerArrayDirected;
};