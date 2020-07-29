class CfgPatches
{
	class kyk_ew_tfar
	{
		units[] = {};
		requiredAddons[] = { "kyk_ew", "tfar_core" };
		author = "KyklopCZ";
		version = 1.1.0;
		versionStr = "1.1.0";
		versionAr[] = {1,1,0};
	};
};

class CfgFunctions
{
	class kyk_ew_tfar
	{
		class general
		{
			file = "kyk_ew_tfar\scripts";
			
			class startInit { recompile = 1; postInit = 1; };
			class init { recompile = 1; };
		};
		
		class server
		{
			file = "kyk_ew_tfar\scripts\server";
			
			class script { recompile = 1; };
		};
		
		class client
		{
			file = "kyk_ew_tfar\scripts\client";
			
			class setRadioJammed { recompile = 1; };
		};
	};
};