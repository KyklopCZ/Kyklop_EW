/*
	Author: KyklopCZ
	
	Description:
	The main script

	Parameter(s):
	None

	Returns:
	Nothing
*/

kyk_ew_jammerMasterSwitch = true;
kyk_ew_jammerScriptEnabled = true;
kyk_ew_jammerUpdateInterval = 5;
_refreshRadarIteration = 6;
_iteration = _refreshRadarIteration;

while {kyk_ew_jammerMasterSwitch} do
{
	while {kyk_ew_jammerScriptEnabled} do 
	{
		call kyk_ew_fnc_removeDestroyedJammers;
		
		call kyk_ew_fnc_updateJammerAngle;
		
		//Radar jamming start
		{
			private _jammers = [_x, 6] call kyk_ew_fnc_isJammed;
			
			if(count _jammers > 0) then
			{ [_x, true] remoteExecCall ["kyk_ew_fnc_setRadarJammed", 0, false]; }
			else
			{ [_x, false] remoteExecCall ["kyk_ew_fnc_setRadarJammed", 0, false]; };
			
		} forEach kyk_ew_radarVehiclesArray;
		//Radar jamming end
		
		{
			//Drone jamming start
			private _droneJammers = [_x, 4] call kyk_ew_fnc_isJammed;
			
			private _isDroneJammed = (count _droneJammers > 0);
			//Drone jamming end
			
			//GPS jamming start
			private _gpsJammers = [_x, 5] call kyk_ew_fnc_isJammed;
			
			private _isGpsJammed = (count _gpsJammers > 0);
			//GPS jamming end
			
			[_x, _isDroneJammed, _isGpsJammed] remoteExecCall ["kyk_ew_fnc_setDroneJammed", 0, false];
			
			if(_isGpsJammed) then
			{
				private _uavGroup = group _x;
				
				while{count waypoints _uavGroup > 0} do
				{
					deleteWaypoint [_uavGroup, 0];
				};
			};
			
		} forEach allUnitsUAV;
		
		//Radar refresh start
		if(_iteration >= _refreshRadarIteration) then
		{
			call kyk_ew_fnc_refreshRadar;
			_iteration = 0;
		}
		else
		{
			_iteration = _iteration + 1;
		};
		//Radar refresh end
		
		sleep kyk_ew_jammerUpdateInterval;
	};
	
	remoteExecCall ["kyk_ew_fnc_setDefaultValues", 0, false];
	
	{
		[_x, false] remoteExecCall ["kyk_ew_fnc_setRadarJammed", 0, false];
	} forEach kyk_ew_radarVehiclesArray;
	
	waitUntil
	{
		if(kyk_ew_jammerScriptEnabled) exitWith 
		{ true };
		if(!kyk_ew_jammerScriptEnabled && !kyk_ew_jammerMasterSwitch) exitWith
		{ true };
		
		sleep kyk_ew_jammerUpdateInterval;
		
		false;
	};
};