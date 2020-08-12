/*
	Author: KyklopCZ
	
	Description:
	Displays an alert with information about attempted detonation which the jammer jammed.

	Parameter(s):
		0: OBJECT - The object that jammed the detonation and the alert is to be displayed to
		1: OBJECT - The unit which attempted the detonation (and failed miserably)
		2: STRING - The classname of the clacker which was used to send the detonation signal

	Returns:
	Nothing
*/

params [
	["_jammer", objNull, [objNull]],
	["_unit", objNull, [objNull]],
	["_detonator", "", [""]]
	];

if(isServer) then
{
	private _properties = kyk_ew_clackersProperties select (kyk_ew_clackers find _detonator);
	
	if(_properties select 1 == 0) exitWith { false; };	//if information level = 0, exit
	
	private _direction = getPos _jammer getDir getPos _unit;
	private _message = "<t size='1.5' color='#ff0000'>Jammer alert!</t><br /><t>Detected detonation attempt from </t>";
	
	switch(_properties select 1) do
	{
		case 1:
		{
			_message = _message + "<t>Unknown</t>";
		};
		
		case 2:
		{
			if(_direction > 315 || _direction <= 45) then
			{
				_message = _message + "<t>North</t>";
			}
			else
			{
				if(_direction > 45 && _direction <= 135) then
				{
					_message = _message + "<t>East</t>";
				}
				else
				{
					if(_direction > 135 && _direction <= 225) then
					{
						_message = _message + "<t>South</t>";
					}
					else
					{
						_message = _message + "<t>West</t>";
					};
				};
			};
		};
		
		case 3:
		{
			_direction = _direction + random [-15, 0, 15];
			_direction = round _direction;
			
			if(_direction >= 360) then
			{
				_direction = _direction - 360;
			}
			else
			{
				if(_direction < 0) then
				{
					_direction = _direction + 360;
				};
			};
			
			_message = _message + "<t>" + str _direction + "°</t>";
		};
		
		default { _message = _message + "<t color='#ff0000'>Error</t>"; };
	};

	_message = _message + "<br /><t>Detonation mechanism: </t><t color='#00ff00'>" + (_properties select 2) + "</t>";

	_message = parseText _message;
	
	if(_jammer isKindOf "Man") then
	{
		if([backpack _jammer, 8] call kyk_ew_fnc_hasJammer) then
		{
			[_jammer, _message] remoteExecCall ["kyk_ew_fnc_playerHint", owner _jammer, false];
		};
	}
	else
	{
		if([typeOf _jammer, 8] call kyk_ew_fnc_hasJammer) then
		{
			private _crew = crew _jammer;
			
			{
				[_jammer, _message] remoteExecCall ["kyk_ew_fnc_playerHint", owner _x, false];
			} forEach _crew;
		};
	};
};