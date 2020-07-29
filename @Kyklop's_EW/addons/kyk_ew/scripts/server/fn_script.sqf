kyk_ew_jammerMasterSwitch = true;
kyk_ew_jammerScriptEnabled = true;
kyk_ew_jammerUpdateInterval = 5;
_refreshRadarIteration = 6;
_iteration = _refreshRadarIteration;

while {kyk_ew_jammerMasterSwitch} do
{
	while {kyk_ew_jammerScriptEnabled} do 
	{
		//Destroyed jammer remove start
		{
			if(isNull _x) then
			{ kyk_ew_jammerArrayBroadcast deleteAt (kyk_ew_jammerArrayBroadcast find _x); };
			
			if(damage _x > 0.8 || (_x isKindOf "rhs_gaz66_r142_base" && fuel _x > 0) ) then
			{
				_x setVariable ["kyk_ew_jammingActiveRadio", false, true];
				_x setVariable ["kyk_ew_jammingActiveGSM", false, true];
				_x setVariable ["kyk_ew_jammingActiveRFDetonator", false, true];
				_x setVariable ["kyk_ew_jammingActiveDrone", false, true];
				_x setVariable ["kyk_ew_jammingActiveGPS", false, true];
				_x setVariable ["kyk_ew_jammingActiveRadar", false, true];
				kyk_ew_jammerArrayBroadcast deleteAt (kyk_ew_jammerArrayBroadcast find _x);
				
				[_x] call kyk_ew_fnc_jammerInoperableAlert;
			};
			
			if(_x isKindOf "Man") then
			{
				if(backpack _x != _x getVariable ["kyk_ew_jammerBackpack", backpack _x]) then
				{
					_x setVariable ["kyk_ew_jammingActiveRadio", false, true];
					_x setVariable ["kyk_ew_jammingActiveGSM", false, true];
					_x setVariable ["kyk_ew_jammingActiveRFDetonator", false, true];
					_x setVariable ["kyk_ew_jammingActiveDrone", false, true];
					_x setVariable ["kyk_ew_jammingActiveGPS", false, true];
					_x setVariable ["kyk_ew_jammingActiveRadar", false, true];
					kyk_ew_jammerArrayBroadcast deleteAt (kyk_ew_jammerArrayBroadcast find _x);
				};
			};
		} forEach kyk_ew_jammerArrayBroadcast;
		
		{
			if(isNull _x) then
			{ kyk_ew_jammerArrayDirected deleteAt (kyk_ew_jammerArrayDirected find _x); };
			
			if(damage _x > 0.8 || (_x isKindOf "rhs_gaz66_r142_base" && fuel _x > 0) ) then
			{
				_x setVariable ["kyk_ew_jammingActiveRadio", false, true];
				_x setVariable ["kyk_ew_jammingActiveGSM", false, true];
				_x setVariable ["kyk_ew_jammingActiveRFDetonator", false, true];
				_x setVariable ["kyk_ew_jammingActiveDrone", false, true];
				_x setVariable ["kyk_ew_jammingActiveGPS", false, true];
				_x setVariable ["kyk_ew_jammingActiveRadar", false, true];
				kyk_ew_jammerArrayDirected deleteAt (kyk_ew_jammerArrayDirected find _x);
				
				[_x] call kyk_ew_fnc_jammerInoperableAlert;
			};
		} forEach kyk_ew_jammerArrayDirected;
		//Destroyed jammer remove end
		
		//Directional jammers update angles start
		{
			if(_x getVariable ["kyk_ew_updateAngle", false]) then
			{
				_direction = getDir _x;
				_effectiveAngle = _x getVariable ["kyk_ew_effectiveAngle", 0];
				
				_kyk_ew_jammingAngleLimitLower = (_direction - (_effectiveAngle / 2)) % 360;
				_kyk_ew_jammingAngleLimitUpper = (_direction + (_effectiveAngle / 2)) % 360;

				if(_kyk_ew_jammingAngleLimitLower < 0) then {_kyk_ew_jammingAngleLimitLower = _kyk_ew_jammingAngleLimitLower + 360};
				if(_kyk_ew_jammingAngleLimitUpper < 0) then {_kyk_ew_jammingAngleLimitUpper = _kyk_ew_jammingAngleLimitUpper + 360};

				if(_kyk_ew_jammingAngleLimitLower > _kyk_ew_jammingAngleLimitUpper) then
				{
					_x setVariable ["kyk_ew_isAngleAcrossNorth", true, true];
				}
				else
				{
					_x setVariable ["kyk_ew_isAngleAcrossNorth", false, true];
				};

				_x setVariable ["kyk_ew_jammingAngleLimitLower", _kyk_ew_jammingAngleLimitLower, true];
				_x setVariable ["kyk_ew_jammingAngleLimitUpper", _kyk_ew_jammingAngleLimitUpper, true];
			};
		} forEach kyk_ew_jammerArrayDirected;
		//Directional jammers update angles end
		
		//Radar jamming start
		{
			private _radarNotJammed = true;
			
			for "_i" from 0 to count kyk_ew_jammerArrayBroadcast - 1 step 1 do
			{
				_jammer = kyk_ew_jammerArrayBroadcast select _i;
				
				if(_jammer getVariable ["kyk_ew_jammingActiveRadar", false] && _jammer distance _x <= _jammer getVariable ["kyk_ew_jammingDistanceRadar", 0]) exitWith
				{
					_radarNotJammed = false;
				};
			};
			
			if(_radarNotJammed) then
			{
				for "_i" from 0 to count kyk_ew_jammerArrayDirected - 1 step 1 do
				{
					_jammer = kyk_ew_jammerArrayDirected select _i;
					_directionFromJammer = getPos _jammer getDir getPos _x;
				
					if(_jammer getVariable ["kyk_ew_jammingActiveRadar", false] && _jammer distance _x <= _jammer getVariable ["kyk_ew_jammingDistanceRadar", 0]) then
					{
						if(_jammer getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
						{
							if(_directionFromJammer > _jammer getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _jammer getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
							{_radarNotJammed = false;};
						}
						else
						{
							if(_directionFromJammer > _jammer getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _jammer getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
							{_radarNotJammed = false;};
						};
					};
				};
			};
			
			[_x, !_radarNotJammed] remoteExecCall ["kyk_ew_fnc_setRadarJammed", 0, false];
			
		} forEach kyk_ew_radarVehiclesArray;
		//Radar jamming end
		
		{
			//Drone jamming start
			private _isDroneJammed = false;
			
			for "_i" from 0 to count kyk_ew_jammerArrayBroadcast - 1 step 1 do
			{
				_jammer = kyk_ew_jammerArrayBroadcast select _i;
				
				if(_jammer getVariable ["kyk_ew_jammingActiveDrone", false] && _jammer distance _x <= _jammer getVariable ["kyk_ew_jammingDistanceDrone", 0]) then
				{
					_isDroneJammed = true;
				};
			};
			
			if(!_isDroneJammed) then
			{
				for "_i" from 0 to count kyk_ew_jammerArrayDirected - 1 step 1 do
				{
					_jammer = kyk_ew_jammerArrayDirected select _i;
					_directionFromJammer = getPos _jammer getDir getPos _x;

					if(_jammer getVariable ["kyk_ew_jammingActiveDrone", false] && _jammer distance _x <= _jammer getVariable ["kyk_ew_jammingDistanceDrone", 0]) then
					{
						if(_jammer getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
						{
							if(_directionFromJammer > _jammer getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _jammer getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
							{_isDroneJammed = true;};
						}
						else
						{
							if(_directionFromJammer > _jammer getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _jammer getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
							{_isDroneJammed = true;};
						};
					};
				};
			};
			//Drone jamming end
			
			//GPS jamming start
			private _isGpsJammed = false;
			
			for "_i" from 0 to count kyk_ew_jammerArrayBroadcast - 1 step 1 do
			{
				_jammer = kyk_ew_jammerArrayBroadcast select _i;
				
				if(_jammer getVariable ["kyk_ew_jammingActiveGPS", false] && _jammer distance _x <= _jammer getVariable ["kyk_ew_jammingDistanceGPS", 0]) then
				{
					_isGpsJammed = true;
				};
			};
			
			if(!_isGpsJammed) then
			{
				for "_i" from 0 to count kyk_ew_jammerArrayDirected - 1 step 1 do
				{
					_jammer = kyk_ew_jammerArrayDirected select _i;
					_directionFromJammer = getPos _jammer getDir getPos _x;

					if(_jammer getVariable ["kyk_ew_jammingActiveGPS", false] && _jammer distance _x <= _jammer getVariable ["kyk_ew_jammingDistanceGPS", 0]) then
					{
						if(_jammer getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
						{
							if(_directionFromJammer > _jammer getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _jammer getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
							{_isGpsJammed = true;};
						}
						else
						{
							if(_directionFromJammer > _jammer getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _jammer getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
							{_isGpsJammed = true;};
						};
					};
				};
			};
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
		
		if(_iteration >= _refreshRadarIteration) then
		{
			call kyk_ew_fnc_refreshRadar;
			_iteration = 0;
		}
		else
		{
			_iteration = _iteration + 1;
		};
		
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