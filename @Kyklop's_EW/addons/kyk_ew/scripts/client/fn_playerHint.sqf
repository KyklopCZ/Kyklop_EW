params [
	["_jammer", objNull, objNull],
	["_message", "", ""]
	];

if(hasInterface) then
{
	if(player == _jammer || vehicle player == _jammer) then
	{
		hint _message;
	};
};