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