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