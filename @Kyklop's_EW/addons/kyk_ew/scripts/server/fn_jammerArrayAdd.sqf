/*
	Author: KyklopCZ
	
	Description:
	Adds an object into an array of active jammers and sets or updates it's effective ranges.

	Parameter(s):
		0: OBJECT - Object which is to be added to the array
		1: NUMBER - Type of jammer which is to be activated
			Values:
				0 - All available jammers
				1 - Radio jammer
				2 - GSM jammer
				3 - RF Detonator jammer
				4 - Drone jammer
				5 - GPS jammer
				6 - Radar jammer

	Returns:
	Nothing
*/

params [
	["_object", objNull, [objNull]],
	["_jammingType", 7, [0]]	//jammingType: 0-all, 1-radio, 2-GSM, 3-RFDet, 4-Drone, 5-GPS, 6-Radar
	];

#include "macros.hpp"

if(isServer) then
{
	private _jammer = _object;
	
	if(_jammingType == 0) then
	{
		private _index = -1;
		
		if(_object isKindOf "Man") then
		{
			_index = kyk_ew_jammersType1 find backpack _object;
		}
		else
		{ _index = kyk_ew_jammersType1 find typeOf _object; };
		
		if(_index != -1) then
		{
			if((kyk_ew_jammersType1Properties select _index) select 0 == 0) then
			{
				[_object,
				(kyk_ew_jammersType1Properties select _index) select 1,
				(kyk_ew_jammersType1Properties select _index) select 2,
				(kyk_ew_jammersType1Properties select _index) select 3,
				(kyk_ew_jammersType1Properties select _index) select 4,
				(kyk_ew_jammersType1Properties select _index) select 5,
				(kyk_ew_jammersType1Properties select _index) select 6] call kyk_ew_fnc_broadcastJammerAdd;
				
				SET_JAMMER_BACKPACK;
			}
			else
			{
				[_object,
				(kyk_ew_jammersType1Properties select _index) select 1,
				(kyk_ew_jammersType1Properties select _index) select 2,
				(kyk_ew_jammersType1Properties select _index) select 3,
				(kyk_ew_jammersType1Properties select _index) select 4,
				(kyk_ew_jammersType1Properties select _index) select 5,
				(kyk_ew_jammersType1Properties select _index) select 6,
				getDir _object,
				(kyk_ew_jammersType1Properties select _index) select 9,
				true] call kyk_ew_fnc_directedJammerAdd;
				
				SET_JAMMER_BACKPACK;
			};
		};
	}
	else
	{
		private _index = -1;
		
		if(_object isKindOf "Man") then
		{
			_index = kyk_ew_jammersType2 find backpack _object;
		}
		else
		{ _index = kyk_ew_jammersType2 find typeOf _object; };
		
		if(_index != -1) then
		{
			switch (_jammingType) do
			{
				case 1:
				{
					_object setVariable ["kyk_ew_jammingActiveRadio", true, true];
					_object setVariable ["kyk_ew_jammingDistanceRadio", (kyk_ew_jammersType2Properties select _index) select 1, true];
					
					SET_JAMMER_BACKPACK;
				};
				
				case 2:
				{
					_object setVariable ["kyk_ew_jammingActiveGSM", true, true];
					_object setVariable ["kyk_ew_jammingDistanceGSM", (kyk_ew_jammersType2Properties select _index) select 2, true];
					
					SET_JAMMER_BACKPACK;
				};
				
				case 3:
				{
					_object setVariable ["kyk_ew_jammingActiveRFDetonator", true, true];
					_object setVariable ["kyk_ew_jammingDistanceRFDetonator", (kyk_ew_jammersType2Properties select _index) select 3, true];
					
					SET_JAMMER_BACKPACK;
				};
				
				case 4:
				{
					_object setVariable ["kyk_ew_jammingActiveDrone", true, true];
					_object setVariable ["kyk_ew_jammingDistanceDrone", (kyk_ew_jammersType2Properties select _index) select 4, true];
					
					SET_JAMMER_BACKPACK;
				};
				
				case 5:
				{
					_object setVariable ["kyk_ew_jammingActiveGPS", true, true];
					_object setVariable ["kyk_ew_jammingDistanceGPS", (kyk_ew_jammersType2Properties select _index) select 5, true];
					
					SET_JAMMER_BACKPACK;
				};
				
				case 6:
				{
					_object setVariable ["kyk_ew_jammingActiveRadar", true, true];
					_object setVariable ["kyk_ew_jammingDistanceRadar", (kyk_ew_jammersType2Properties select _index) select 6, true];
					
					SET_JAMMER_BACKPACK;
				};
			};
			
			if((kyk_ew_jammersType2Properties select _index) select 0 == 0) then
			{
				if(kyk_ew_jammerArrayBroadcast find _object == -1) then
				{
					kyk_ew_jammerArrayBroadcast append [_object];
					publicVariable "kyk_ew_jammerArrayBroadcast";
				};
			}
			else
			{
				if(kyk_ew_jammerArrayDirected find _object == -1) then
				{
					kyk_ew_jammerArrayDirected append [_object];
					publicVariable "kyk_ew_jammerArrayDirected";
					
					_object setVariable ["kyk_ew_effectiveAngle", (kyk_ew_jammersType2Properties select _index) select 9];
					_object setVariable ["kyk_ew_updateAngle", true];
				};
			};
		};
	};
};