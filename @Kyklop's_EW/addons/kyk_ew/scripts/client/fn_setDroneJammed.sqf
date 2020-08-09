/*
	Author: KyklopCZ
	
	Description:
	Sets which systems of a drone are jammed and changes their availability.

	Parameter(s):
		0: OBJECT - Drone to which the values are being updated
		1: BOOL - Whether the drone's controls are being jammed
		2: BOOL - Whether the drone's navigation systems are being jammed

	Returns:
	Nothing
*/

params [
	["_unit", objNull, objNull],	//_unit = drone
	["_jammedDrone", false, false],
	["_jammedGPS", false, false]
	];

if(_jammedDrone) then
{
	player disableUAVConnectability [_unit, true];
	
	if(getConnectedUAV player == _unit) then
	{
		player connectTerminalToUAV objNull;
	};
}
else
{
	player enableUAVConnectability [_unit, true];
};

_unit enableUAVWaypoints !_jammedGPS;