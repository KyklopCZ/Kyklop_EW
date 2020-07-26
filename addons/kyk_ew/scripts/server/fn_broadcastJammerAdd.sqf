params ["_jammerObject", "_radioDistance", "_gsmDistance", "_rfDetDistance", "_droneDistance", "_gpsDistance", "_radarDistance"];

if(isServer) then
{
	_kyk_ew_jammingActiveRadio = (_radioDistance > 0);
	_kyk_ew_jammingActiveGSM = (_gsmDistance > 0);
	_kyk_ew_jammingActiveRFDetonator = (_rfDetDistance > 0);
	_kyk_ew_jammingActiveDrone = (_droneDistance > 0);
	_kyk_ew_jammingActiveGPS = (_gpsDistance > 0);
	_kyk_ew_jammingActiveRadar = (_radarDistance > 0);

	_jammerObject setVariable ["kyk_ew_jammingActiveRadio", _kyk_ew_jammingActiveRadio, true];
	_jammerObject setVariable ["kyk_ew_jammingActiveGSM", _kyk_ew_jammingActiveGSM, true];
	_jammerObject setVariable ["kyk_ew_jammingActiveRFDetonator", _kyk_ew_jammingActiveRFDetonator, true];
	_jammerObject setVariable ["kyk_ew_jammingActiveDrone", _kyk_ew_jammingActiveDrone, true];
	_jammerObject setVariable ["kyk_ew_jammingActiveGPS", _kyk_ew_jammingActiveGPS, true];
	_jammerObject setVariable ["kyk_ew_jammingActiveRadar", _kyk_ew_jammingActiveRadar, true];

	_jammerObject setVariable ["kyk_ew_jammingDistanceRadio", _radioDistance, true];
	_jammerObject setVariable ["kyk_ew_jammingDistanceGSM", _gsmDistance, true];
	_jammerObject setVariable ["kyk_ew_jammingDistanceRFDetonator", _rfDetDistance, true];
	_jammerObject setVariable ["kyk_ew_jammingDistanceDrone", _droneDistance, true];
	_jammerObject setVariable ["kyk_ew_jammingDistanceGPS", _gpsDistance, true];
	_jammerObject setVariable ["kyk_ew_jammingDistanceRadar", _radarDistance, true];

	if(kyk_ew_jammerArrayBroadcast find _jammerObject == -1) then
	{
		kyk_ew_jammerArrayBroadcast append [_jammerObject];
		publicVariable "kyk_ew_jammerArrayBroadcast";
	};
	
	if(_jammerObject isKindOf "Man") then
	{
		[_jammerObject] call kyk_ew_fnc_setJammerBackpack;
	};
};