params ["_classname", "_properties"];

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