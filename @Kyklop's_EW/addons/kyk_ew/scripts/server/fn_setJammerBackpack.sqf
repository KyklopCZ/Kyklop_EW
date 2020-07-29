params ["_jammerObject"];

if(isServer) then
{
	if(_jammerObject isKindOf "Man") then
	{
		_jammerObject setVariable ["kyk_ew_jammerBackpack", backpack _jammerObject];
	};
};