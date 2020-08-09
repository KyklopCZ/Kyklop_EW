/*
	Author: KyklopCZ
	
	Description:
	Initializes the mod

	Parameter(s):
	None

	Returns:
	Nothing
*/

if(isServer) then
{
	remoteExecCall ["kyk_ew_fnc_initClient", 0, true];
	call kyk_ew_fnc_initServer;
	sleep 2;
	remoteExecCall ["kyk_ew_fnc_initClientActions", 0, true];
	sleep 1;
	"Kyklop's EW init complete" remoteExecCall ["systemChat", 0, true];
	
	[] spawn kyk_ew_fnc_script;
};