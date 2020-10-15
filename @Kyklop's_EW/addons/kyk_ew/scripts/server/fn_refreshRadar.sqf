/*
	Author: KyklopCZ
	
	Description:
	Updates the list of vehicles with a radar in a mission
	
	Parameter(s):
	None

	Returns:
	Nothing
*/

if(isServer) then
{
	kyk_ew_radarVehiclesArray = [];

	{
		if(!(_x getVariable ["kyk_ew_hasRadar", false])) then
		{
			private _sensors = listVehicleSensors _x;
			private _vehicle = _x;
			scopeName "SensorSearch";
			
			{
				if(_x select 0 == "ActiveRadarSensorComponent") then
				{
					_vehicle setVariable ["kyk_ew_hasRadar", true];
					breakOut "SensorSearch";
				};
			} forEach _sensors;
			
			if(_x getVariable "kyk_ew_hasRadar") then
			{
				kyk_ew_radarVehiclesArray append [_x];
			};
		};
	} forEach vehicles;
};