/*
	Author: KyklopCZ
	
	Description:
	Initializes the TFAR jamming compatibility.

	Parameter(s):
	None

	Returns:
	Nothing
*/

if(isServer) then
{
	waitUntil {kyk_ew_initComplete};
	[] spawn kyk_ew_tfar_fnc_script;
};