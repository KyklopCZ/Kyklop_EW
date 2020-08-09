/*
	Author: KyklopCZ
	
	Description:
	Removes destroyed jammers and units which lost their jamming capabilities from the list of jammers

	Parameter(s):
	None

	Returns:
	Nothing
*/

if(isServer) then
{
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
				kyk_ew_jammerArrayDirected deleteAt (kyk_ew_jammerArrayDirected find _x);
			};
		};
	} forEach kyk_ew_jammerArrayDirected;
};