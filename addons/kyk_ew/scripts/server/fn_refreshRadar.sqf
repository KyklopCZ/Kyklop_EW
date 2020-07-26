if(isServer) then
{
	kyk_ew_radarVehiclesArray = [];

	{
		if(listVehicleSensors _x select 0 find "ActiveRadarSensorComponent" != -1) then
		{
			_x setVariable ["kyk_ew_hasRadar", true];
		};
		
		if(_x getVariable "kyk_ew_hasRadar") then
		{
			kyk_ew_radarVehiclesArray append [_x];
		};
	} forEach vehicles;
};