/*
	Author: KyklopCZ
	
	Description:
	Displays a hint with information about jamming and detection capabilities of a vehicle or backpack and it's current state to a player.

	Parameter(s):
		0: OBJECT - Unit which capabilites and state should be checked
		1: NUMBER - Number of a player who made the request and to who the hint will be displayed

	Returns:
	Nothing
*/

params [
	["_jammer", objNull, objNull],
	["_callerID", 2, 0]
	];

if(isServer) then
{
	private _status = "";
	
	private _jammerType = 1;
	private _index = -1;
	if(_jammer isKindOf "Man") then
	{
		_index = kyk_ew_jammersType1 find backpack _jammer;
	}
	else
	{ _index = kyk_ew_jammersType1 find typeOf _jammer; };
	
	if(_index == -1) then
	{
		if(_jammer isKindOf "Man") then
		{
			_index = kyk_ew_jammersType2 find backpack _jammer;
		}
		else
		{ _index = kyk_ew_jammersType2 find typeOf _jammer; };
		
		_jammerType = 2;
	};
	
	if(_index != -1) then
	{
		private _jammerProp = [];
		
		switch(_jammerType) do
		{
			case 1: { _jammerProp = kyk_ew_jammersType1Properties select _index; };
			
			case 2: { _jammerProp = kyk_ew_jammersType2Properties select _index; };
			
			default { _jammerProp = [0, "Error", "Error", "Error", "Error", "Error", "Error", "Error", "Error"]; };
		};
		
		_status = "";
		
		if(_jammerProp select 0 == 0) then
		{
			_status = _status + "<t>Jammer type: Non-directional</t>";
		}
		else
		{
			_status = _status + "<t>Jammer type: Directional</t><br />";
			_status = _status + "<t>Effective angle: " + str (_jammerProp select 9) + "°</t>";
		};
		_status = _status + "<br /><br />";
		
		_status = _status + "<t size='1.5'>Radio jammer</t><br /><t>Status: </t>";
		if(_jammer getVariable ["kyk_ew_jammingActiveRadio", false]) then
		{
			_status = _status + "<t color='#00ff00'>Active</t><br />";
		}
		else
		{
			_status = _status + "<t color='#ff0000'>Inactive</t><br />"
		};
		_status = _status + "<t>Range: " + str (_jammerProp select 1) + " m</t><br />";
		
		_status = _status + "<br /><t size='1.5'>GSM jammer</t><br /><t>Status: </t>";
		if(_jammer getVariable ["kyk_ew_jammingActiveGSM", false]) then
		{
			_status = _status + "<t color='#00ff00'>Active</t><br />";
		}
		else
		{
			_status = _status + "<t color='#ff0000'>Inactive</t><br />"
		};
		_status = _status + "<t>Range: " + str (_jammerProp select 2) + " m</t><br />";
		
		_status = _status + "<br /><t size='1.5'>RF Det. jammer</t><br /><t>Status: </t>";
		if(_jammer getVariable ["kyk_ew_jammingActiveRFDetonator", false]) then
		{
			_status = _status + "<t color='#00ff00'>Active</t><br />";
		}
		else
		{
			_status = _status + "<t color='#ff0000'>Inactive</t><br />"
		};
		_status = _status + "<t>Range: " + str (_jammerProp select 3) + " m</t><br />";
		
		_status = _status + "<br /><t size='1.5'>Drone jammer</t><br /><t>Status: </t>";
		if(_jammer getVariable ["kyk_ew_jammingActiveDrone", false]) then
		{
			_status = _status + "<t color='#00ff00'>Active</t><br />";
		}
		else
		{
			_status = _status + "<t color='#ff0000'>Inactive</t><br />"
		};
		_status = _status + "<t>Range: " + str (_jammerProp select 4) + " m</t><br />";
		
		_status = _status + "<br /><t size='1.5'>GPS jammer</t><br /><t>Status: </t>";
		if(_jammer getVariable ["kyk_ew_jammingActiveGPS", false]) then
		{
			_status = _status + "<t color='#00ff00'>Active</t><br />";
		}
		else
		{
			_status = _status + "<t color='#ff0000'>Inactive</t><br />"
		};
		_status = _status + "<t>Range: " + str (_jammerProp select 5) + " m</t><br />";
		
		_status = _status + "<br /><t size='1.5'>Radar jammer</t><br /><t>Status: </t>";
		if(_jammer getVariable ["kyk_ew_jammingActiveRadar", false]) then
		{
			_status = _status + "<t color='#00ff00'>Active</t><br />";
		}
		else
		{
			_status = _status + "<t color='#ff0000'>Inactive</t><br />"
		};
		_status = _status + "<t>Range: " + str (_jammerProp select 6) + " m</t><br />";
		
		_status = _status + "<br /><t size='1.5'>Other</t><br /><t>Jammer detector: </t>";
		if(_jammerProp select 7 == 0) then
		{ _status = _status + "<t color='#ff0000'>No</t>"; }
		else
		{ _status = _status + "<t color='#00ff00'>Yes</t>"; };
		_status = _status + "<br /><t>Trigger signal detector: </t>";
		if(_jammerProp select 8 == 0) then
		{ _status = _status + "<t color='#ff0000'>No</t>" }
		else
		{ _status = _status + "<t color='#00ff00'>Yes</t>" };
	}
	else
	{
		_status = "<t color='#ff0000'>Something went wrong, according to config this vehicle shouldn't have jammer</t>";
	};
	
	_status = parseText _status;
	
	_status remoteExecCall ["hint", _callerID, false];
};