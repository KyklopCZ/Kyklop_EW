/*
	Author: KyklopCZ
	
	Description:
	Starts the initialization of the mod while allowing the mission to be initialized and not have to wait for the mod initialization
	
	Parameter(s):
	None

	Returns:
	Nothing
*/

if(isServer) then
{
	[] spawn kyk_ew_fnc_init;
};