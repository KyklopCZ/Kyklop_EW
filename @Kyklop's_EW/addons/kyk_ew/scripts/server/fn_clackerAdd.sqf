/*
	Author: KyklopCZ
	
	Description:
	Adds a clacker to a list of jammable clackers

	Parameter(s):
		0: STRING - Classname of a clacker which is to be added to the list of jammable clackers
		1: ARRAY - An array in format which sets the parameters of the clacker, format:
			0: NUMBER - Type of jammer which is capable of jamming the clacker
				Values:
					1 - Radio
					2 - GSM
					3 - RFDet
					4 - Drone
					5 - GPS
					6 - Radar
			1: NUMBER - The level of information that is available to a jammer which detects the trigger signal
				Values:
					0 - Covert (not detectable)
					1 - Alert without any direction information
					2 - Alert with a North/East/South/West direction information
					3 - Alert with a direction information in degrees (with 15° uncertainty)
			2: STRING - The name of the detonation mechanism that will be displayed to a jammer that detects the trigger signal

	Returns:
	Nothing
*/

params [
	["_classname", "", [""]],
	["_properties", [0, 0, "Error"], [[]], [3]]
	];

if(isServer) then
{
	if(count _properties == 3) then
	{
		_classname = toLower _classname;
		
		if(_classname in kyk_ew_clackers) then
		{
			private _index = kyk_ew_clackers find _classname;
			
			kyk_ew_clackersProperties set [_index, _properties];
		}
		else
		{
			kyk_ew_clackers append [_classname];
			kyk_ew_clackersProperties append [_properties];
		};
		
		publicVariable "kyk_ew_clackers";
		publicVariable "kyk_ew_clackersProperties";
	};
};