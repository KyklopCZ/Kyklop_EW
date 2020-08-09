/*
	Author: KyklopCZ
	
	Description:
	Initializes the TFAR jamming compatibility.

	Parameter(s):
	None

	Returns:
	Nothing
*/

waitUntil {kyk_ew_initComplete};

if(isServer) then
{
	[] spawn kyk_ew_tfar_fnc_script;
};