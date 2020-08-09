/*
	Author: KyklopCZ
	
	Description:
	Displays information about jammers that are jamming the given detector

	Parameter(s):
		0: OBJECT - The detector the data will be taken from and displayed to

	Returns:
	Nothing
*/

params [
	["_requester", objNull, objNull]
	];

if(isServer) then
{
	private _radioJammers = [];
	private _GSMJammers = [];
	private _RFDetonatorJammers = [];
	private _droneJammers = [];
	private _gpsJammers = [];
	private _radarJammers = [];

	//Data gathering start
	{
		if(_x getVariable ["kyk_ew_jammingActiveRadio", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceRadio", 0]) then
		{
			_radioJammers append [_x];
		};
		
		if(_x getVariable ["kyk_ew_jammingActiveGSM", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceGSM", 0]) then
		{
			_GSMJammers append [_x];
		};
		
		if(_x getVariable ["kyk_ew_jammingActiveRFDetonator", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceRFDetonator", 0]) then
		{
			_RFDetonatorJammers append [_x];
		};
		
		if(_x getVariable ["kyk_ew_jammingActiveDrone", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceDrone", 0]) then
		{
			_droneJammers append [_x];
		};
		
		if(_x getVariable ["kyk_ew_jammingActiveGPS", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceGPS", 0]) then
		{
			_gpsJammers append [_x];
		};
		
		if(_x getVariable ["kyk_ew_jammingActiveRadar", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceRadar", 0]) then
		{
			_radarJammers append [_x];
		};
	} forEach kyk_ew_jammerArrayBroadcast;

	{
		private _directionFromJammer = getPos _x getDir getPos _requester;
		
		if(_x getVariable ["kyk_ew_jammingActiveRadio", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceRadio", 0]) then
		{
		   if(_x getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_radioJammers append [_x];
				};
			}
			else
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_radioJammers append [_x];
				};
			};
		};
		
		if(_x getVariable ["kyk_ew_jammingActiveGSM", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceGSM", 0]) then
		{
		   if(_x getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_GSMJammers append [_x];
				};
			}
			else
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_GSMJammers append [_x];
				};
			};
		};
		
		if(_x getVariable ["kyk_ew_jammingActiveRFDetonator", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceRFDetonator", 0]) then
		{
		   if(_x getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_RFDetonatorJammers append [_x];
				};
			}
			else
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_RFDetonatorJammers append [_x];
				};
			};
		};
		
		if(_x getVariable ["kyk_ew_jammingActiveDrone", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceDrone", 0]) then
		{
		   if(_x getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_droneJammers append [_x];
				};
			}
			else
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_droneJammers append [_x];
				};
			};
		};
		
		if(_x getVariable ["kyk_ew_jammingActiveGPS", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceGPS", 0]) then
		{
		   if(_x getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_gpsJammers append [_x];
				};
			}
			else
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_gpsJammers append [_x];
				};
			};
		};
		
		if(_x getVariable ["kyk_ew_jammingActiveRadar", false] && _x distance _requester <= _x getVariable ["kyk_ew_jammingDistanceRadar", 0]) then
		{
		   if(_x getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_radarJammers append [_x];
				};
			}
			else
			{
				if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
				{
					_radarJammers append [_x];
				};
			};
		};
	} forEach kyk_ew_jammerArrayDirected;
	//Data gathering end

	//Report start
	private _result = "<t size='1.5' color='#ffffff'>Detected Radio jammers:</t><br />";
	if(count _radioJammers > 0) then
	{
		{
			private _direction = getPos _requester getDir getPos _x;
			private _distanceTo_requester = _x distance _requester;
			private _jammingDistance = _x getVariable "kyk_ew_jammingDistanceRadio";
			private _signalStrength = 100 - (_distanceTo_requester / _jammingDistance * 100);
			_signalStrength = round _signalStrength;
			_result = _result + "<t align='left'>Direction: " + str round _direction + "°</t><t align='right'>Signal strength: " + str _signalStrength + "%</t><br />";
		} forEach _radioJammers;
	}
	else
	{
		_result = _result + "<t color='#00ff00'>None</t><br />";
	};

	_result = _result + "<br /><t size='1.5' color='#ffffff'>Detected GSM jammers:</t><br />";
	if(count _GSMJammers > 0) then
	{
		{
			private _direction = getPos _requester getDir getPos _x;
			private _distanceTo_requester = _x distance _requester;
			private _jammingDistance = _x getVariable "kyk_ew_jammingDistanceGSM";
			private _signalStrength = 100 - (_distanceTo_requester / _jammingDistance * 100);
			_signalStrength = round _signalStrength;
			_result = _result + "<t align='left'>Direction: " + str round _direction + "°</t><t align='right'>Signal strength: " + str _signalStrength + "%</t><br />";
		} forEach _GSMJammers;
	}
	else
	{
		_result = _result + "<t color='#00ff00'>None</t><br />";
	};

	_result = _result + "<br /><t size='1.5' color='#ffffff'>Detected RF Det. jammers:</t><br />";
	if(count _RFDetonatorJammers > 0) then
	{
		{
			private _direction = getPos _requester getDir getPos _x;
			private _distanceTo_requester = _x distance _requester;
			private _jammingDistance = _x getVariable "kyk_ew_jammingDistanceRFDetonator";
			private _signalStrength = 100 - (_distanceTo_requester / _jammingDistance * 100);
			_signalStrength = round _signalStrength;
			_result = _result + "<t align='left'>Direction: " + str round _direction + "°</t><t align='right'>Signal strength: " + str _signalStrength + "%</t><br />";
		} forEach _RFDetonatorJammers;
	}
	else
	{
		_result = _result + "<t color='#00ff00'>None</t><br />";
	};

	_result = _result + "<br /><t size='1.5' color='#ffffff'>Detected Drone jammers:</t><br />";
	if(count _droneJammers > 0) then
	{
		{
			private _direction = getPos _requester getDir getPos _x;
			private _distanceTo_requester = _x distance _requester;
			private _jammingDistance = _x getVariable "kyk_ew_jammingDistanceDrone";
			private _signalStrength = 100 - (_distanceTo_requester / _jammingDistance * 100);
			_signalStrength = round _signalStrength;
			_result = _result + "<t align='left'>Direction: " + str round _direction + "°</t><t align='right'>Signal strength: " + str _signalStrength + "%</t><br />";
		} forEach _droneJammers;
	}
	else
	{
		_result = _result + "<t color='#00ff00'>None</t><br />";
	};
	
	_result = _result + "<br /><t size='1.5' color='#ffffff'>Detected GPS jammers:</t><br />";
	if(count _gpsJammers > 0) then
	{
		{
			private _direction = getPos _requester getDir getPos _x;
			private _distanceTo_requester = _x distance _requester;
			private _jammingDistance = _x getVariable "kyk_ew_jammingDistanceRadio";
			private _signalStrength = 100 - (_distanceTo_requester / _jammingDistance * 100);
			_signalStrength = round _signalStrength;
			_result = _result + "<t align='left'>Direction: " + str round _direction + "°</t><t align='right'>Signal strength: " + str _signalStrength + "%</t><br />";
		} forEach _gpsJammers;
	}
	else
	{
		_result = _result + "<t color='#00ff00'>None</t><br />";
	};

	_result = _result + "<br /><t size='1.5' color='#ffffff'>Detected RADAR jammers:</t><br />";
	if(count _radarJammers > 0) then
	{
		{
			private _direction = getPos _requester getDir getPos _x;
			private _distanceTo_requester = _x distance _requester;
			private _jammingDistance = _x getVariable "kyk_ew_jammingDistanceRadar";
			private _signalStrength = 100 - (_distanceTo_requester / _jammingDistance * 100);
			_signalStrength = round _signalStrength;
			_result = _result + "<t align='left'>Direction: " + str round _direction + "°</t><t align='right'>Signal strength: " + str _signalStrength + "%</t><br />";
		} forEach _radarJammers;
	}
	else
	{
		_result = _result + "<t color='#00ff00'>None</t><br />";
	};
	//Report end
	
	_result = parseText _result;

	_result remoteExecCall ["hint", owner _requester, false];
};