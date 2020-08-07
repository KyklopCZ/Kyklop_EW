#define SET_JAMMER_BACKPACK if(_jammer isKindOf "Man") then \
{\
	[_jammer] call kyk_ew_fnc_setJammerBackpack;\
}

#define SET_JAMMER_PROPERTIES _kyk_ew_jammingActiveRadio = (_radioDistance > 0); \
	_kyk_ew_jammingActiveGSM = (_gsmDistance > 0); \
	_kyk_ew_jammingActiveRFDetonator = (_rfDetDistance > 0); \
	_kyk_ew_jammingActiveDrone = (_droneDistance > 0); \
	_kyk_ew_jammingActiveGPS = (_gpsDistance > 0); \
	_kyk_ew_jammingActiveRadar = (_radarDistance > 0); \
\
	_jammer setVariable ["kyk_ew_jammingActiveRadio", _kyk_ew_jammingActiveRadio, true]; \
	_jammer setVariable ["kyk_ew_jammingActiveGSM", _kyk_ew_jammingActiveGSM, true]; \
	_jammer setVariable ["kyk_ew_jammingActiveRFDetonator", _kyk_ew_jammingActiveRFDetonator, true]; \
	_jammer setVariable ["kyk_ew_jammingActiveDrone", _kyk_ew_jammingActiveDrone, true]; \
	_jammer setVariable ["kyk_ew_jammingActiveGPS", _kyk_ew_jammingActiveGPS, true]; \
	_jammer setVariable ["kyk_ew_jammingActiveRadar", _kyk_ew_jammingActiveRadar, true]; \
 \
	_jammer setVariable ["kyk_ew_jammingDistanceRadio", _radioDistance, true]; \
	_jammer setVariable ["kyk_ew_jammingDistanceGSM", _gsmDistance, true]; \
	_jammer setVariable ["kyk_ew_jammingDistanceRFDetonator", _rfDetDistance, true]; \
	_jammer setVariable ["kyk_ew_jammingDistanceDrone", _droneDistance, true]; \
	_jammer setVariable ["kyk_ew_jammingDistanceGPS", _gpsDistance, true]; \
	_jammer setVariable ["kyk_ew_jammingDistanceRadar", _radarDistance, true]
	
#define SET_JAMMER_ANGLES private _kyk_ew_jammingAngleLimitLower = (_direction - (_effectiveAngle / 2)) % 360; \
			private _kyk_ew_jammingAngleLimitUpper = (_direction + (_effectiveAngle / 2)) % 360; \
 \
			if(_kyk_ew_jammingAngleLimitLower < 0) then {_kyk_ew_jammingAngleLimitLower = _kyk_ew_jammingAngleLimitLower + 360}; \
			if(_kyk_ew_jammingAngleLimitUpper < 0) then {_kyk_ew_jammingAngleLimitUpper = _kyk_ew_jammingAngleLimitUpper + 360}; \
 \
			if(_kyk_ew_jammingAngleLimitLower > _kyk_ew_jammingAngleLimitUpper) then \
			{ \
				_jammer setVariable ["kyk_ew_isAngleAcrossNorth", true, true]; \
			} \
			else \
			{ \
				_jammer setVariable ["kyk_ew_isAngleAcrossNorth", false, true]; \
			}; \
 \
			_jammer setVariable ["kyk_ew_jammingAngleLimitLower", _kyk_ew_jammingAngleLimitLower, true]; \
			_jammer setVariable ["kyk_ew_jammingAngleLimitUpper", _kyk_ew_jammingAngleLimitUpper, true]