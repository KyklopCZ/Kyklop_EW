/*
	Author: KyklopCZ
	
	Description:
	Adds an ACE detonate handler, which enables jamming of a detonation signal, to a player

	Parameter(s):
	None

	Returns:
	Nothing
*/

[{
	params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];

	private _returnValue = true;
	_triggerItem = toLower _triggerItem;
	
	if(_triggerItem in kyk_ew_clackers) then
	{
		private _properties = kyk_ew_clackersProperties select (kyk_ew_clackers find _triggerItem);
		
		private _jammers = [_explosive, _properties select 0] call kyk_ew_fnc_isJammed;
		
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