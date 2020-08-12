class CfgPatches
{
	class kyk_ew_acre
	{
		units[] = {};
		requiredAddons[] = { "kyk_ew", "acre_sys_signal", "acre_api" };
		author = "KyklopCZ";
		version = 1.2.1;
		versionStr = "1.2.1";
		versionAr[] = {1,2,1};
	};
};

class CfgFunctions
{
	class kyk_ew_acre
	{
		class general
		{
			file = "kyk_ew_acre\scripts";
			
			class startInit { recompile = 1; postInit = 1; };
			class init { recompile = 1; };
			class signalFunction { recompile = 1; };
		};
		
		class server
		{
			file = "kyk_ew_acre\scripts\server";
			
			class script { recompile = 1; };
		};
		
		class client
		{
			file = "kyk_ew_acre\scripts\client";
			
			class setRadioJammed { recompile = 1; };
		};
	};
};