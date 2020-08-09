/*
	Author: KyklopCZ
	
	Description:
	Displays a hint to a player whose jammer is inoperable

	Parameter(s):
		0: OBJECT - Jammer to which the alert will be displayed

	Returns:
	Nothing
*/

params [
	["_jammer", objNull, objNull]
	];

if(isServer) then
{
	private _message = parseText "<t size='1.5' color='#ff0000'>Jammer alert</t><br /><t>Jammer is now inoperable</t>";
	
	if(_jammer isKindOf "Man") then
	{
		[_jammer, _message] remoteExecCall ["kyk_ew_fnc_playerHint", owner _jammer, false];
	}
	else
	{
		private _crew = crew _jammer;
		
		{
			[_jammer, _message] remoteExecCall ["kyk_ew_fnc_playerHint", owner _x, false];
		} forEach _crew;
	};
};