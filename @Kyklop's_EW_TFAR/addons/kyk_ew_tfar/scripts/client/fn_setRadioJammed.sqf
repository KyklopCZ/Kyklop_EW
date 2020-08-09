/*
	Author: KyklopCZ
	
	Description:
	Sets the TFAR parameters based on strength of the radio jamming signal

	Parameter(s):
		0: BOOL - Whether the player is jammed
		1: NUMBER - Radio jamming signal strength expressed as a number between 0 and 1

	Returns:
	Nothing
*/

params ["_jammed", "_signalStrength"];

if(_jammed) then
{
	if(_signalStrength >= 0.50) then
	{
		player setVariable ["tf_sendingDistanceMultiplicator", 0];
		player setVariable ["tf_receivingDistanceMultiplicator", 50];
	}
	else
	{
		player setVariable ["tf_sendingDistanceMultiplicator", 1];
		player setVariable ["tf_receivingDistanceMultiplicator", _signalStrength * 100];	//100 = 2 * 50
	};
}
else
{
	player setVariable ["tf_sendingDistanceMultiplicator", 1];
	player setVariable ["tf_receivingDistanceMultiplicator", 1];
};

showChat !_jammed;