class CfgPatches
{
	class kyk_ew
	{
		units[] = {};
		requiredAddons[] = { "ace_ui" };
		author = "KyklopCZ";
		version = 1.2.0;
		versionStr = "1.2.0";
		versionAr[] = {1,2,0};
	};
};

class CfgFunctions
{
	class kyk_ew
	{
		class general
		{
			file = "kyk_ew\scripts";
			
			class init { recompile = 1; };
			class startInit {
				recompile = 1;
				postInit = 1;
			};
			class jammerDefinition { recompile = 1; };
		};
		
		class server
		{
			file = "kyk_ew\scripts\server";
			
			class broadcastJammerAdd { recompile = 1; };
			class detectJammers { recompile = 1; };
			class directedJammerAdd { recompile = 1; };
			class explosionAttemptNotice { recompile = 1; };
			class initServer { recompile = 1; };
			class jammerArrayAdd { recompile = 1; };
			class jammerArrayRemove { recompile = 1; };
			class jammerAdd { recompile = 1; };
			class jammerRemove { recompile = 1; };
			class jammerInoperableAlert { recompile = 1; };
			class jammingStatus { recompile = 1; };
			class refreshRadar { recompile = 1; };
			class script { recompile = 1; };
			class scriptResume { recompile = 1; };
			class scriptStop { recompile = 1; };
			class scriptStopMaster { recompile = 1; };
			class setJammerBackpack { recompile = 1; };
			class removeAllJammers { recompile = 1; };
			class createInitCompleteValue { preInit = 1; };
			class isJammed { recompile = 1; };
			class updateJammerAngle { recompile = 1; };
			class removeDestroyedJammers { recompile = 1; };
			class clackerListDefinition { recompile = 1; };
			class clackerAdd { recompile = 1; };
			class clackerRemove { recompile = 1; };
		};
		
		class client
		{
			file = "kyk_ew\scripts\client";
			
			class addDetonateHandler { recompile = 1; };
			class hasJammer { recompile = 1; };
			class initClient { recompile = 1; };
			class initClientActions { recompile = 1; };
			class playerHint { recompile = 1; };
			class setDefaultValues { recompile = 1; };
			class setDroneJammed { recompile = 1; };
			class setRadarJammed { recompile = 1; };
		};
	};
};

/*
#include "ace_action_macro.hpp"

class CfgVehicles
{
	class LandVehicle;
	class LandVehicle : LandVehicle
	{
		_addActionsToVehicles;
	};
	
	class Air;
	class Air : Air
	{
		_addActionsToVehicles;
	};
	
	class Ship;
	class Ship : Ship
	{
		_addActionsToVehicles;
	};
	
	class Man;
	class Man : Man
	{
		class ACE_SelfActions
		{
			class Jamming
			{
				displayName = "Jamming";
				condition = "kyk_ew_jammerBackpacks find backpack player != -1";
				statement = "true;";
				
				class ScanForJammers
				{
					displayName = "Scan for jammers";
					condition = "kyk_ew_jammerBackpacks find backpack player != -1";
					statement = "[_player] remoteExecCall ['kyk_ew_fnc_detectJammers', 2, false];";
				};
				
				class CheckState
				{
					displayName = "Check jammer state";
					condition = "kyk_ew_jammerBackpacks find backpack player != -1";
					statement = "[vehicle player, clientOwner] remoteExecCall ['kyk_ew_fnc_jammingStatus', 2, false];"
				};
				
				class Jammer
				{
					displayName = "Jammer toggle";
					condition = "kyk_ew_jammerBackpacks find backpack player != -1";
					statement = "call kyk_ew_fnc_toggleJammer;";
				};
			};
		};
	};
};*/