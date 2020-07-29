/*
	_jammerClassname is classname of vehicle/backpack you want to set as jammer
	
	_type is 1 or 2 (if 1 jammer is only able to turn on/off, if 2 jammer is able to turn on/off specific jamming types (Drone, Radar, Radio,...))
	
	_properties is array in format [directed, radioJammingRange, gsmJammingRange, rfDetJammingRange, droneJammingRange, gpsJammingRange, radarJammingRange, jammerDetector, triggerSignalDetector, effectiveAngle] where
		directed must be 0 (therefore jammer is non-directed, directed player-deployable jammers will be added later)
		radioJammingRange - radarJammingRange sets effective jamming ranges for specific types of jamming in meters (if you want to disable jammer, set it's range to 0)
		jammerDetector sets whether jammer will be able to discover other jammers (1) or not (0)
		triggerSignalDetector sets whether alert will be displayed whenever jammer jams remote-detonated explosives (1) or not (0)
		effectiveAngle sets effective angle of a directional jammer (has no effect with non-directional jammer)
		
	This function can also be used to update properties of already defined jammer, if it has the same _type value
*/

params ["_jammerClassname", "_type", "_properties"];

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