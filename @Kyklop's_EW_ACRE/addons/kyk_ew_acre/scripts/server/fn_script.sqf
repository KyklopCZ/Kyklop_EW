/*
	Author: KyklopCZ
	
	Description:
	The main script of the ACRE jamming compatibility.

	Parameter(s):
	None
	
	Returns:
	Nothing
*/

if(isServer) then
{
	kyk_ew_acre_jammerMasterSwitch = true;
	kyk_ew_acre_jammerScriptEnabled = true;
	kyk_ew_acre_jammerUpdateInterval = 5;
	
	while { kyk_ew_acre_jammerMasterSwitch } do
	{
		while { kyk_ew_acre_jammerScriptEnabled } do
		{
			private _players = call BIS_fnc_listPlayers;
			
			//Radio jamming start
			for "_i" from 0 to count _players - 1 step 1 do
			{
				private _currentPlayer = _players select _i;
				private _radioJammed = false;
				private _radioJammingSignalStrength = 0;
				
				{
					if(_x getVariable ["kyk_ew_jammingActiveRadio", false] && _x distance _currentPlayer <= _x getVariable ["kyk_ew_jammingDistanceRadio", 0]) then
					{
						_radioJammed = true;
						
						private _signalStrength = 1 - ((_x distance _currentPlayer) / (_x getVariable ["kyk_ew_jammingDistanceRadio", 1]));
						if(_signalStrength > _radioJammingSignalStrength) then
						{
							_radioJammingSignalStrength = _signalStrength;
						};
					};
				} forEach kyk_ew_jammerArrayBroadcast;
				
				{
					_directionFromJammer = getPos _x getDir getPos _currentPlayer;
					
					if(_x getVariable ["kyk_ew_jammingActiveRadio", false] && _x distance _currentPlayer <= _x getVariable ["kyk_ew_jammingDistanceRadio", 0]) then
					{
						if(_x getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
						{
							if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
							{
								_radioJammed = true;
								
								private _signalStrength = 1 - ((_x distance _currentPlayer) / (_x getVariable ["kyk_ew_jammingDistanceRadio", 1]));
								if(_signalStrength > _radioJammingSignalStrength) then
								{
									_radioJammingSignalStrength = _signalStrength;
								};
							};
						}
						else
						{
							if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
							{
								_radioJammed = true;
								
								private _signalStrength = 1 - ((_x distance _currentPlayer) / (_x getVariable ["kyk_ew_jammingDistanceRadio", 1]));
								if(_signalStrength > _radioJammingSignalStrength) then
								{
									_radioJammingSignalStrength = _signalStrength;
								};
							};
						};
					};
				} forEach kyk_ew_jammerArrayDirected;
				
				[_radioJammingSignalStrength] remoteExecCall ["kyk_ew_acre_fnc_setRadioJammed", _currentPlayer, false];
			};
			//Radio jamming end
			
			sleep kyk_ew_acre_jammerUpdateInterval;
		};
		
		private _players = call BIS_fnc_listPlayers;
		
		{
			_x setVariable ["kyk_ew_acre_jammingSignalStrength", 0];
			[false] remoteExecCall ["kyk_ew_acre_fnc_setRadioJammed", _x, false];
		} forEach _players;
		
		waitUntil {kyk_ew_acre_jammerScriptEnabled || !kyk_ew_acre_jammerMasterSwitch;};
	};
};