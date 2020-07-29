params ["_unit", "_jammedDrone", "_jammedGPS"];	//_unit = drone

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