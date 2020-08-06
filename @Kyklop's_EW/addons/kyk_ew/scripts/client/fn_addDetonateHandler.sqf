[{
	params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];

	private _returnValue = true;
	
	if (_triggerItem == "ace_m26_clacker" || _triggerItem == "ace_cellphone") then
	{
		private _jammers = [];
		
		if(_triggerItem == "ace_m26_clacker") then
		{
			_jammers = [_explosive, 3] call kyk_ew_fnc_isJammed;
		}
		else
		{
			if(_triggerItem == "ace_cellphone") then
			{
				_jammers = [_explosive, 2] call kyk_ew_fnc_isJammed;
			};
			//Add custom clackers later
		};
		
		if(count _jammers > 0) then
		{
			_returnValue = false;
			
			{
				[_x, _unit, _triggerItem] remoteExecCall ["kyk_ew_fnc_explosionAttemptNotice", 2, false];
			} forEach _jammers;
		};
	};

	_returnValue;
	
}] call ace_explosives_fnc_addDetonateHandler;