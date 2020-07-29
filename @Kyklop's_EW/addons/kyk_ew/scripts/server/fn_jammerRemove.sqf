//_jammerClassname is classname of vehicle/backpack you want to remove jamming capabilities from

params ["_jammerClassname"];

if(isServer) then
{
	if(kyk_ew_jammersType1 find _jammerClassname != -1) then
	{
		private _index = kyk_ew_jammersType1 find _jammerClassname;
		kyk_ew_jammersType1 deleteAt (_index);
		kyk_ew_jammersType1Properties deleteAt (_index);
		
		publicVariable "kyk_ew_jammersType1";
		publicVariable "kyk_ew_jammersType1Properties";
	};
	
	if(kyk_ew_jammersType2 find _jammerClassname != -1) then
	{
		private _index = kyk_ew_jammersType2 find _jammerClassname;
		kyk_ew_jammersType2 deleteAt (_index);
		kyk_ew_jammersType2Properties deleteAt (_index);
		
		publicVariable "kyk_ew_jammersType2";
		publicVariable "kyk_ew_jammersType2Properties";
	};
};