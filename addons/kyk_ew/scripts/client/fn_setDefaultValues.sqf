player setVariable ["tf_sendingDistanceMultiplicator", 1];
player setVariable ["tf_receivingDistanceMultiplicator", 1];
showChat true;

{
	player enableUAVConnectability [_x, true];
} forEach allUnitsUAV;