/*
	Author: KyklopCZ
	
	Description:
	Removes a specified clacker from the list of jammable clackers.

	Parameter(s):
		0: STRING - Classname of a clacker that is to be removed from the clacker list

	Returns:
	Nothing
*/

params [
	["_classname", "", [""]]
	];

if(isServer) then
{
	_classname = toLower _classname;
	
	private _index = kyk_ew_clackers find _classname;
	
	if(_index != -1) then
	{
		kyk_ew_clackers deleteAt _index;
		kyk_ew_clackersProperties deleteAt _index;
		
		publicVariable "kyk_ew_clackers";
		publicVariable "kyk_ew_clackersProperties";
	};
};