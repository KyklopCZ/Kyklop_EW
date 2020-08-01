class CfgPatches
{
	class kyk_ew_modules
	{
		units[] = {"kyk_ew_ModuleBroadcastJammer"}; //, "kyk_ew_ModuleDirectionalJammer", "kyk_ew_ModuleRemoveJammer"};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F","kyk_ew"};
	};
};

class CfgFunctions
{
	class kyk_ew_modules
	{
		class scripts
		{
			file = "kyk_ew_modules\scripts";
			
			class broadcastJammerAdd { recompile = 1; };
			class directedJammerAdd { recompile = 1; };
			class removeJammer { recompile = 1; };
		};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class kyk_ew_modules: NO_CATEGORY
	{
		displayName = "Electronic warfare";
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;					// Default edit box (i.e., text input field)
			class Combo;				// Default combo box (i.e., drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Bool)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};
		
		class ModuleDescription
		{
			class Anything;
		};
	};
	
	class kyk_ew_ModuleBroadcastJammer: Module_F
	{
		// Standard object definitions
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Non-directional jammer"; // Name displayed in the menu
		icon = "";
		category = "kyk_ew_modules";

		// Name of function triggered once conditions are met
		//function = "kyk_ew_modules_fnc_broadcastJammerAdd";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 1;
		// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isGlobal = 0;
		// 1 for module waiting until all synced triggers are activated
		isTriggerActivated = 0;
		// 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
		isDisposable = 1;
		// 1 to run init function in Eden Editor as well
		is3DEN = 1;

		// Menu displayed when the module is placed or double-clicked on by Zeus
		curatorInfoType = "kyk_ew_modules_broadcastJammerDialog";

		// Module attributes, uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific
		class Attributes: AttributesBase
		{
			// Arguments shared by specific module type (have to be mentioned in order to be present)
			class Units: Units
			{
				property = "kyk_ew_ModuleBroadcastJammer";
			};
			// Module specific arguments
			class RadioRange: Edit
			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				property = "kyk_ew_ModuleBroadcastJammer_radioRange";
				displayName = "Radio jamming range (m): "; // Argument label
				tooltip = ""; // Tooltip description
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			};
			class GSMRange: Edit
			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				property = "kyk_ew_ModuleBroadcastJammer_gsmRange";
				displayName = "GSM jamming range (m): "; // Argument label
				tooltip = ""; // Tooltip description
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			};
			class RFDetRange: Edit
			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				property = "kyk_ew_ModuleBroadcastJammer_rfDetRange";
				displayName = "RF det. jamming range (m): "; // Argument label
				tooltip = ""; // Tooltip description
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			};
			class DroneRange: Edit
			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				property = "kyk_ew_ModuleBroadcastJammer_droneRange";
				displayName = "Drone jamming range (m): "; // Argument label
				tooltip = ""; // Tooltip description
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			};
			class GPSRange: Edit
			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				property = "kyk_ew_ModuleBroadcastJammer_gpsRange";
				displayName = "GPS jamming range (m): "; // Argument label
				tooltip = ""; // Tooltip description
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			};
			class RadarRange: Edit
			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				property = "kyk_ew_ModuleBroadcastJammer_radarRange";
				displayName = "Radar jamming range (m): "; // Argument label
				tooltip = ""; // Tooltip description
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			};
			
			//class ModuleDescription: ModuleDescription{}; // Module description should be shown last
			
			// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
			class ModuleDescription: ModuleDescription
			{
				description = "Creates a non-directional jammer from object"; // Short description, will be formatted as structured text
				sync[] = {"LocationArea_F"}; // Array of synced entities (can contain base classes)

				class LocationArea_F
				{
					position = 1; // Position is taken into effect
					direction = 0; // Direction is taken into effect
					optional = 1; // Synced entity is optional
					duplicate = 1; // Multiple entities of this type can be synced
					synced[] = {"Anything"}; // Pre-define entities like "AnyBrain" can be used. See the list below
				};
			};
		};
		/*
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Creates a non-directional jammer from object"; // Short description, will be formatted as structured text
			sync[] = {"LocationArea_F"}; // Array of synced entities (can contain base classes)

			class LocationArea_F
			{
				position = 1; // Position is taken into effect
				direction = 0; // Direction is taken into effect
				optional = 1; // Synced entity is optional
				duplicate = 1; // Multiple entities of this type can be synced
				synced[] = {"Anything"}; // Pre-define entities like "AnyBrain" can be used. See the list below
			};
		};
		*/
	};
};