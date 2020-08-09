/*
	Author: KyklopCZ
	
	Description:
	Checks which jammers are jamming the specified object.

	Parameter(s):
		0: OBJECT - The object that will be checked
		1: NUMBER - The type of jamming that is to be checked
			Values:
				1 - Radio
				2 - GSM
				3 - RF Detonator
				4 - Drone
				5 - GPS
				6 - Radar

	Returns:
	ARRAY - An array of jammers which are jamming the object
*/

params [
	["_object", objNull, objNull],
	["_jammingType", 0, 0]
	];

private _type = "";

switch (_jammingType) do
{
	case 1:
	{
		_type = "Radio";
	};
	
	case 2:
	{
		_type = "GSM";
	};
	
	case 3:
	{
		_type = "RFDetonator";
	};
	
	case 4:
	{
		_type = "Drone";
	};
	
	case 5:
	{
		_type = "GPS";
	};
	
	case 6:
	{
		_type = "Radar";
	};
};

private _jammers = [];

{
	if(_x getVariable ["kyk_ew_jammingActive"+_type, false] && getPos _x distance getPos _object <= _x getVariable ["kyk_ew_jammingDistance"+_type, 0]) then
	{
		_jammers append [_x];
	};
} forEach kyk_ew_jammerArrayBroadcast;

{
	if(_x getVariable ["kyk_ew_jammingActive"+_type, false] && getPos _x distance getPos _object <= _x getVariable ["kyk_ew_jammingDistance"+_type, 0]) then
	{
		private _directionFromJammer = getPos _x getDir getPos _object;
		if(_x getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
		{
			if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
			{
				_jammers append [_x];
			};
		}
		else
		{
			if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
			{
				_jammers append [_x];
			};
		};
	};
} forEach kyk_ew_jammerArrayDirected;

_jammers;