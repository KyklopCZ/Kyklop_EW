/*
	Author: KyklopCZ
	
	Description:
	Return values on a client to a state before jamming.

	Parameter(s):
	None

	Returns:
	Nothing
*/

{
	player enableUAVConnectability [_x, true];
} forEach allUnitsUAV;