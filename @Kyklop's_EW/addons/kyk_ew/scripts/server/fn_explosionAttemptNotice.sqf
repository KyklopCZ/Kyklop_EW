params ["_jammer", "_unit", "_detonator"];

if(isServer) then
{
	_detonator = toLower _detonator;
	private _direction = getPos _jammer getDir getPos _unit;
	private _message = "<t size='1.5' color='#ff0000'>Jammer alert!</t><br /><t>Detected detonation attempt from </t>";
	
	switch(_detonator) do
	{
		case "ace_cellphone":
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
			
			_message = _message + "<br /><t>Detonation mechanism: </t><t color='#00ff00'>GSM</t>";
		};
		
		case "ace_m26_clacker":
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
			
			_message = _message + "<t>" + str _direction + "°</t><br /><t>Detonation mechanism: </t><t color='#00ff00'>RF Detonator</t>";
		};
		
		default { _message = _message + "<t color='#ffff00'>Unknown</t>"; };
	};
	
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