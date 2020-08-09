/*
	Author: KyklopCZ
	
	Description:
	Removes all jammers from all classes currently defined with a jammer. (Clears jammer configuration)

	Parameter(s):
	None

	Returns:
	Nothing
*/

if(isServer) then
{
	kyk_ew_jammersType1 = [];
	kyk_ew_jammersType1Properties = [];
	
	kyk_ew_jammersType2 = [];
	kyk_ew_jammersType2Properties = [];
	
	publicVariable "kyk_ew_jammersType1";
	publicVariable "kyk_ew_jammersType1Properties";
	publicVariable "kyk_ew_jammersType2";
	publicVariable "kyk_ew_jammersType2Properties";
};