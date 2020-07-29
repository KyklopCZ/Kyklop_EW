params ["_jammer", "_message"];

if(hasInterface) then
{
	if(player == _jammer || vehicle player == _jammer) then
	{
		hint _message;
	};
};