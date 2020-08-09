/*
	Author: KyklopCZ
	
	Description:
	Initializes the ACRE jamming compatibility.

	Parameter(s):
	None

	Returns:
	Nothing
*/

waitUntil {kyk_ew_initComplete};

[kyk_ew_acre_fnc_signalFunction] call acre_api_fnc_setCustomSignalFunc;

if(isServer) then
{
	[] spawn kyk_ew_acre_fnc_script;
};