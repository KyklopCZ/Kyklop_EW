/*
	Author: KyklopCZ
	
	Description:
	Deactivates object's active jammer and removes it from the active jammer array if none jammers remain active.

	Parameter(s):
		0: OBJECT - Object which is to have it's jammer deactivated
		1: NUMBER - Type of jammer which is to be deactivated
			Values:
				0 - All jammers
				1 - Radio jammer
				2 - GSM jammer
				3 - RF Detonator jammer
				4 - Drone jammer
				5 - GPS jammer
				6 - Radar jammer

	Returns:
	Nothing
*/

params [
	["_jammerObject", objNull, [objNull]],
	["_jammingType", 7, [0]]
	];

if(isServer) then
{
	switch (_jammingType) do
	{
		case (0):
		{
			_jammerObject setVariable ["kyk_ew_jammingActiveRadio", false, true];
			_jammerObject setVariable ["kyk_ew_jammingActiveGSM", false, true];
			_jammerObject setVariable ["kyk_ew_jammingActiveRFDetonator", false, true];
			_jammerObject setVariable ["kyk_ew_jammingActiveDrone", false, true];
			_jammerObject setVariable ["kyk_ew_jammingActiveGPS", false, true];
			_jammerObject setVariable ["kyk_ew_jammingActiveRadar", false, true];
		};
		
		case (1):
		{
			_jammerObject setVariable ["kyk_ew_jammingActiveRadio", false, true];
		};
		
		case (2):
		{
			_jammerObject setVariable ["kyk_ew_jammingActiveGSM", false, true];
		};
		
		case (3):
		{
			_jammerObject setVariable ["kyk_ew_jammingActiveRFDetonator", false, true];
		};
		
		case (4):
		{
			_jammerObject setVariable ["kyk_ew_jammingActiveDrone", false, true];
		};
		
		case (5):
		{
			_jammerObject setVariable ["kyk_ew_jammingActiveGPS", false, true];
		};
		
		case (6):
		{
			_jammerObject setVariable ["kyk_ew_jammingActiveRadar", false, true];
		};
	};
	
	//Removal from arrays
	if(!(_jammerObject getVariable ["kyk_ew_jammingActiveRadio", false] ||
	   	 _jammerObject getVariable ["kyk_ew_jammingActiveGSM", false] ||
	     _jammerObject getVariable ["kyk_ew_jammingActiveRFDetonator", false] ||
	     _jammerObject getVariable ["kyk_ew_jammingActiveDrone", false] ||
	     _jammerObject getVariable ["kyk_ew_jammingActiveGPS", false] ||
	     _jammerObject getVariable ["kyk_ew_jammingActiveRadar", false])) then
	{
		while{kyk_ew_jammerArrayBroadcast find _jammerObject != -1} do
		{
			kyk_ew_jammerArrayBroadcast deleteAt (kyk_ew_jammerArrayBroadcast find _jammerObject);
		};

		while{kyk_ew_jammerArrayDirected find _jammerObject != -1} do
		{
			kyk_ew_jammerArrayDirected deleteAt (kyk_ew_jammerArrayDirected find _jammerObject);
		};

		publicVariable "kyk_ew_jammerArrayBroadcast";
		publicVariable "kyk_ew_jammerArrayDirected";
	};
};