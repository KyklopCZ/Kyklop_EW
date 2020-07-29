[{
	params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];

	private _returnValue = true;

	if (_triggerItem == "ace_m26_clacker" || _triggerItem == "ace_cellphone") then
	{
		{
			if(_triggerItem == "ace_cellphone" && _x getVariable ["kyk_ew_jammingActiveGSM", false] && _x distance _explosive <= _x getVariable ["kyk_ew_jammingDistanceGSM", 0]) then
			{
				_returnValue = false;
				[_x, _unit, _triggerItem] remoteExecCall ["kyk_ew_fnc_explosionAttemptNotice", 2, false];
			};
			if(_triggerItem == "ace_m26_clacker" && _x getVariable ["kyk_ew_jammingActiveRFDetonator", false] && _x distance _explosive <= _x getVariable ["kyk_ew_jammingDistanceRFDetonator", 0]) then
			{
				_returnValue = false;
				[_x, _unit, _triggerItem] remoteExecCall ["kyk_ew_fnc_explosionAttemptNotice", 2, false];
			};
		} forEach kyk_ew_jammerArrayBroadcast;
		
		{
			_directionFromJammer = getPos _x getDir getPos _explosive;
			
			if(_triggerItem == "ace_cellphone" && _x getVariable ["kyk_ew_jammingActiveGSM", false] && _x distance player <= _x getVariable ["kyk_ew_jammingDistanceGSM", 0]) then
			{
				if(_x getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
				{
					if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
					{
						_returnValue = false;
						[_x, _unit, _triggerItem] remoteExecCall ["kyk_ew_fnc_explosionAttemptNotice", 2, false];
					};
				}
				else
				{
					if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
					{
						_returnValue = false;
						[_x, _unit, _triggerItem] remoteExecCall ["kyk_ew_fnc_explosionAttemptNotice", 2, false];
					};
				};
			};
			if(_triggerItem == "ace_m26_clacker" && _x getVariable ["kyk_ew_jammingActiveRFDetonator", false] && _x distance player <= _x getVariable ["kyk_ew_jammingDistanceRFDetonator", 0]) then
			{
				if(_x getVariable ["kyk_ew_isAngleAcrossNorth", false]) then
				{
					if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] || _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
					{
						_returnValue = false;
						[_x, _unit, _triggerItem] remoteExecCall ["kyk_ew_fnc_explosionAttemptNotice", 2, false];
					};
				}
				else
				{
					if(_directionFromJammer > _x getVariable ["kyk_ew_jammingAngleLimitLower", 0] && _directionFromJammer < _x getVariable ["kyk_ew_jammingAngleLimitUpper", 0]) then
					{
						_returnValue = false;
						[_x, _unit, _triggerItem] remoteExecCall ["kyk_ew_fnc_explosionAttemptNotice", 2, false];
					};
				};
			};
		} forEach kyk_ew_jammerArrayDirected;
	};

	if(true) exitWith { _returnValue };
	
}] call ace_explosives_fnc_addDetonateHandler;