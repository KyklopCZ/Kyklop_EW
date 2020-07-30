params ["_jammingSignalStrength"];

if(_jammingSignalStrength == 0) then
{
	showChat true;
}
else
{
	showChat false;
};

player setVariable ["kyk_ew_acre_jammingSignalStrength", _jammingSignalStrength];