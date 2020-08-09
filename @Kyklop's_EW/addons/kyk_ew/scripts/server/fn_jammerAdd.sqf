/*
	Author: KyklopCZ
	
	Description:
	Defines jamming and detection capabilites a vehicle or a backpack. This function can be used to either define a new jammer or edit the properties of an already existing one.

	Parameter(s):
		0: STRING - Classname of a vehicle or backpack which jamming properties will be changed
		1: NUMBER - Type of a jammer
			Values can be 1 or 2 (if 1, jammer is only capable of turning on/off, if 2, jammer is able to turn on/off specific jamming types (Drone, Radar, Radio,...))
		2: ARRAY - An array with jammer's properties
			0: NUMBER - 0 if jammer is non-directional, 1 if it's directional
			1: NUMBER - Radio jamming range of a jammer
			2: NUMBER - GSM jamming range of a jammer
			3: NUMBER - RF Detonator jamming range of a jammer
			4: NUMBER - Drone jamming range of a jammer
			5: NUMBER - GPS jamming range of a jammer
			6: NUMBER - Radar jamming range of a jammer
			7: NUMBER - 1 if jammer has a jammer detector, 0 if not
			8: NUMBER - 1 if jammer has a trigger signal detector, 0 if not
			9 (Optional): NUMBER - Effective angle of a directional jammer

	Returns:
	Nothing or false if unsuccessful
*/

params [
	["_jammerClassname", "", ""],
	["_type", 1, 0],
	["_properties", [0,0,0,0,0,0,0,0,0], [], [9, 10]]
	];

if (!(_type == 1 || _type == 2)) exitWith { ["The jammer type must be 1 or 2."] call BIS_fnc_error; false };
if (_properties select 0 == 1 && count _properties != 10) exitWith { ["Invalid number of properties for a directional jammer."] call BIS_fnc_error; false };

if(isServer) then
{
	if(typename _properties == "ARRAY") then
	{
		if((_properties select 0 == 0 && count _properties >= 9) || (_properties select 0 == 1 && count _properties >= 10)) then
		{
			if(_type == 1) then
			{
				if(kyk_ew_jammersType1 find _jammerClassname == -1) then
				{
					kyk_ew_jammersType1 append [_jammerClassname];
					kyk_ew_jammersType1Properties append [_properties];
				}
				else
				{
					kyk_ew_jammersType1Properties set [kyk_ew_jammersType1 find _jammerClassname, _properties];
				};
				
				publicVariable "kyk_ew_jammersType1";
				publicVariable "kyk_ew_jammersType1Properties";
			}
			else
			{
				if(_type == 2) then
				{
					if(kyk_ew_jammersType2 find _jammerClassname == -1) then
					{
						kyk_ew_jammersType2 append [_jammerClassname];
						kyk_ew_jammersType2Properties append [_properties];
					}
					else
					{
						kyk_ew_jammersType2Properties set [kyk_ew_jammersType2 find _jammerClassname, _properties];
					};
					
					publicVariable "kyk_ew_jammersType2";
					publicVariable "kyk_ew_jammersType2Properties";
				};
			};
		};
	};
};