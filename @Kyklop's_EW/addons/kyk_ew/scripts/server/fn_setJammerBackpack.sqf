/*
	Author: KyklopCZ

	Description:
	Updates the backpack a unit uses as a jammer

	Parameter(s):
		0: OBJECT - Unit whose backpack is to be updated

	Returns:
	Nothing
*/

params [
	["_jammerObject", objNull, [objNull]]
	];

if(isServer) then
{
	if(_jammerObject isKindOf "Man") then
	{
		_jammerObject setVariable ["kyk_ew_jammerBackpack", backpack _jammerObject];
	};
};