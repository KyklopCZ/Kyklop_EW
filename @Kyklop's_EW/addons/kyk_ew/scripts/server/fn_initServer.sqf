if(isServer) then
{
	kyk_ew_jammerScriptEnabled = true;
	kyk_ew_jammerUpdateInterval = 5;

	kyk_ew_jammerArrayBroadcast = [];
	kyk_ew_jammerArrayDirected = [];
	kyk_ew_radarVehiclesArray = [];

	publicVariable "kyk_ew_jammerArrayBroadcast";
	publicVariable "kyk_ew_jammerArrayDirected";

	call kyk_ew_fnc_jammerDefinition;
	
	call kyk_ew_fnc_clackerListDefinition;
	
	kyk_ew_initComplete = true;
};