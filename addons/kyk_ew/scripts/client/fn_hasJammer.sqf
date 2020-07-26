params ["_className", "_jammingType"];

private _index = kyk_ew_jammersType2 find _className;
private _type = 0;

if(_index == -1) then
{
	_index = kyk_ew_jammersType1 find _className;
	
	if(_index != -1) then
	{ _type = 1; };
}
else
{ _type = 2; };

if(_type == 0) exitWith {false;};

if(_type == 1) then
{
	if((kyk_ew_jammersType1Properties select _index) select _jammingType == 0) then
	{false;}
	else
	{true;};
}
else
{
	if((kyk_ew_jammersType2Properties select _index) select _jammingType == 0) then
	{false;}
	else
	{true;};
};