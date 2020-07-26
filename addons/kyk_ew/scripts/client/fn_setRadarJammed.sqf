params ["_unit", "_jammed"];

_unit enableVehicleSensor ["ActiveRadarSensorComponent", (!_jammed)];