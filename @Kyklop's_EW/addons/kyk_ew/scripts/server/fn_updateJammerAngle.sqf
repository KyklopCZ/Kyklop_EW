if(isServer) then
{
	{
		if(_x getVariable ["kyk_ew_updateAngle", false]) then
		{
			private _direction = getDir _x;
			private _effectiveAngle = _x getVariable ["kyk_ew_effectiveAngle", 0];
			
			private _kyk_ew_jammingAngleLimitLower = (_direction - (_effectiveAngle / 2)) % 360;
			private _kyk_ew_jammingAngleLimitUpper = (_direction + (_effectiveAngle / 2)) % 360;

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
};