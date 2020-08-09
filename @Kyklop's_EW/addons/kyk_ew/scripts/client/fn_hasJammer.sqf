/*
	Author: KyklopCZ
	
	Description:
	Checks whether the given class has a certain jammer or detector

	Parameter(s):
		0: STRING - Classname of a class which jamming/detection capabilites are to be checked
		1: NUMBER - Number which represents ID of a jammer (1 - Radio, 2 - GSM, 3 - RFDet, 4 - Drone, 5 - GPS, 6 - Radar, 7 - Jammer detector, 8 - Trigger signal detector)

	Returns:
	BOOL
*/

params [
	["_className", "", ""],
	["_jammingType", 1, 0]
	];

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