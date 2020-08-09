params [
	["_unit", objNull, objNull],
	["_jammed", false, false]
	];

_unit enableVehicleSensor ["ActiveRadarSensorComponent", (!_jammed)];