/*
	Author: KyklopCZ
	
	Description:
	Sets a signal strength of a radio jamming that is being done to a player.

	Parameter(s):
		0: NUMBER - The strength of a jamming signal from 0 to 1

	Returns:
	Nothing
*/

params ["_jammingSignalStrength"];

if(_jammingSignalStrength == 0) then
{
	showChat true;
}
else
{
	showChat false;
};

player setVariable ["kyk_ew_acre_jammingSignalStrength", _jammingSignalStrength];