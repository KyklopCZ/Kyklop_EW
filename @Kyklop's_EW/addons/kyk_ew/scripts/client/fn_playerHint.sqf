/*
	Author: KyklopCZ
	
	Description:
	Checks whether a player should see a hint and displays it if so.

	Parameter(s):
		0: OBJECT - Unit to which the hint is to be displayed
		1: STRING - Hint to display

	Returns:
	Nothing
*/

params [
	["_jammer", objNull, objNull],
	["_message", "", ""]
	];

if(hasInterface) then
{
	if(player == _jammer || vehicle player == _jammer) then
	{
		hint _message;
	};
};