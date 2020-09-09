/*
	Author: KyklopCZ
	
	Description:
	Initializes the ACRE jamming compatibility.

	Parameter(s):
	None

	Returns:
	Nothing
*/

if(isServer) then
{
	waitUntil {kyk_ew_initComplete};
	
	[kyk_ew_acre_fnc_signalFunction] remoteExecCall ["acre_api_fnc_setCustomSignalFunc", 0, true];
	[] spawn kyk_ew_acre_fnc_script;
};