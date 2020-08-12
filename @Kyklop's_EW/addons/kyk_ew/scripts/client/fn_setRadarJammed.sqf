/*
	Author: KyklopCZ
	
	Description:
	Disables vehicle's radar if it's being jammed and enables it if it isn't.

	Parameter(s):
		0: OBJECT - Unit to which the radar availability is to be updated
		1: BOOL - Whether unit's radar is jammed

	Returns:
	Nothing
*/

params [
	["_unit", objNull, [objNull]],
	["_jammed", false, [false]]
	];

_unit enableVehicleSensor ["ActiveRadarSensorComponent", (!_jammed)];