params [
	["_jammerObject", objNull, objNull],
	["_jammingType", 7, 0]	//jammingType: 0-all, 1-radio, 2-GSM, 3-RFDet, 4-Drone, 5-GPS, 6-Radar
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