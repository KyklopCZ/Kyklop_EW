params [
	["_jammerObject", objNull, [objNull]]
	];

if(isServer) then
{
	if(_jammerObject isKindOf "Man") then
	{
		_jammerObject setVariable ["kyk_ew_jammerBackpack", backpack _jammerObject];
	};
};