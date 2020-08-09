/*
	Author: KyklopCZ
	
	Description:
	Adds actions to ACE interaction menu.

	Parameter(s):
	None

	Returns:
	Nothing
*/

#include "macros.hpp"

_kyk_ew_jammerActionParent = ["JammingBackpack", "Electronic warfare", "kyk_ew\icons\ace\EW.paa", {;}, {BACKPACK_CONDITION_1 || BACKPACK_CONDITION_2}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionParentVehicle = ["Jamming", "Electronic warfare", "kyk_ew\icons\ace\EW.paa", {;}, {(VEHICLE_CONDITION_1 || VEHICLE_CONDITION_2) && GAZ_CONDITION}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionZeus = ["JammingZeus", "Electronic warfare", "kyk_ew\icons\ace\EW.paa", {;}, {true}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionDetectZeus = ["DetectJammersZeus", "Scan for jammers", "kyk_ew\icons\ace\Scan for jammers.paa", {[_player] remoteExecCall ["kyk_ew_fnc_detectJammers", 2, false];}, {true}] call ace_interact_menu_fnc_createAction;



_kyk_ew_jammerActionDetectVehicle = ["Scan for jammers", "Scan for jammers", "kyk_ew\icons\ace\Scan for jammers.paa", {
	[_player] remoteExecCall ["kyk_ew_fnc_detectJammers", 2, false];
},
{[backpack player, 7] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionCheckVehicle = ["Check jammer state", "Check jammer state", "kyk_ew\icons\ace\Check state.paa", {
	[player, clientOwner] remoteExecCall ["kyk_ew_fnc_jammingStatus", 0, false];
}, {BACKPACK_CONDITION_1 || BACKPACK_CONDITION_2}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicle = ["Jammer", "Jammer", "kyk_ew\icons\ace\Jammer.paa", {;}, {BACKPACK_CONDITION_1}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[player, 0] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>Jammer </t><t color='#ff0000'>disabled</t>";
}, {BACKPACK_CONDITION_1}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[player, 0] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>Jammer </t><t color='#00ff00'>enabled</t>";
}, {BACKPACK_CONDITION_1}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleRadio = ["Radio jammer", "Radio jammer", "kyk_ew\icons\ace\Radio.paa", {;}, {RADIO_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRadioOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[player, 1] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>Radio jammer </t><t color='#ff0000'>disabled</t>";
}, {RADIO_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRadioOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[player, 1] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>Radio jammer </t><t color='#00ff00'>enabled</t>";
}, {RADIO_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleGSM = ["GSM jammer", "GSM jammer", "kyk_ew\icons\ace\Phone.paa", {;}, {GSM_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleGSMOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[player, 2] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>GSM jammer </t><t color='#ff0000'>disabled</t>";
}, {GSM_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleGSMOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[player, 2] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>GSM jammer </t><t color='#00ff00'>enabled</t>";
}, {GSM_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleRFDetonator = ["RFDet jammer", "RFDet jammer", "kyk_ew\icons\ace\RF Detonator.paa", {;}, {RFDET_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRFDetonatorOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[player, 3] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>RF Detonator jammer </t><t color='#ff0000'>disabled</t>";
}, {RFDET_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRFDetonatorOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[player, 3] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>RF Detonator jammer </t><t color='#00ff00'>enabled</t>";
}, {RFDET_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleDrone = ["Drone jammer", "Drone jammer", "kyk_ew\icons\ace\Drone.paa", {;}, {DRONE_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleDroneOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[player, 4] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>Drone jammer </t><t color='#ff0000'>disabled</t>";
}, {DRONE_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleDroneOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[player, 4] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>Drone jammer </t><t color='#00ff00'>enabled</t>";
}, {DRONE_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleGPS = ["GPS jammer", "GPS jammer", "kyk_ew\icons\ace\GPS.paa", {;}, {GPS_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleGPSOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[player, 5] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>GPS jammer </t><t color='#ff0000'>disabled</t>";
}, {GPS_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleGPSOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[player, 5] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>GPS jammer </t><t color='#00ff00'>enabled</t>";
}, {GPS_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleRadar = ["Radar jammer", "Radar jammer", "kyk_ew\icons\ace\Radar.paa", {;}, {RADAR_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRadarOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[player, 6] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>Radar jammer </t><t color='#ff0000'>disabled</t>";
}, {RADAR_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRadarOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[player, 6] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>Radar jammer </t><t color='#00ff00'>enabled</t>";
}, {RADAR_CONDITION_PLAYER}] call ace_interact_menu_fnc_createAction;



["Man", 1, ["ACE_SelfActions"], _kyk_ew_jammerActionParent, true] call ace_interact_menu_fnc_addActionToClass;

["Man", 1, ["ACE_SelfActions", "JammingBackpack"], _kyk_ew_jammerActionCheckVehicle, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack"], _kyk_ew_jammerActionDetectVehicle, true] call ace_interact_menu_fnc_addActionToClass;

["Man", 1, ["ACE_SelfActions", "JammingBackpack"], _kyk_ew_jammerActionToggleVehicle, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "Jammer"], _kyk_ew_jammerActionToggleVehicleOn, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "Jammer"], _kyk_ew_jammerActionToggleVehicleOff, true] call ace_interact_menu_fnc_addActionToClass;

["Man", 1, ["ACE_SelfActions", "JammingBackpack"], _kyk_ew_jammerActionToggleVehicleRadio, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "Radio jammer"], _kyk_ew_jammerActionToggleVehicleRadioOn, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "Radio jammer"], _kyk_ew_jammerActionToggleVehicleRadioOff, true] call ace_interact_menu_fnc_addActionToClass;

["Man", 1, ["ACE_SelfActions", "JammingBackpack"], _kyk_ew_jammerActionToggleVehicleGSM, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "GSM jammer"], _kyk_ew_jammerActionToggleVehicleGSMOn, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "GSM jammer"], _kyk_ew_jammerActionToggleVehicleGSMOff, true] call ace_interact_menu_fnc_addActionToClass;

["Man", 1, ["ACE_SelfActions", "JammingBackpack"], _kyk_ew_jammerActionToggleVehicleRFDetonator, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "RFDet jammer"], _kyk_ew_jammerActionToggleVehicleRFDetonatorOn, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "RFDet jammer"], _kyk_ew_jammerActionToggleVehicleRFDetonatorOff, true] call ace_interact_menu_fnc_addActionToClass;

["Man", 1, ["ACE_SelfActions", "JammingBackpack"], _kyk_ew_jammerActionToggleVehicleDrone, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "Drone jammer"], _kyk_ew_jammerActionToggleVehicleDroneOn, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "Drone jammer"], _kyk_ew_jammerActionToggleVehicleDroneOff, true] call ace_interact_menu_fnc_addActionToClass;

["Man", 1, ["ACE_SelfActions", "JammingBackpack"], _kyk_ew_jammerActionToggleVehicleGPS, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "GPS jammer"], _kyk_ew_jammerActionToggleVehicleGPSOn, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "GPS jammer"], _kyk_ew_jammerActionToggleVehicleGPSOff, true] call ace_interact_menu_fnc_addActionToClass;

["Man", 1, ["ACE_SelfActions", "JammingBackpack"], _kyk_ew_jammerActionToggleVehicleRadar, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "Radar jammer"], _kyk_ew_jammerActionToggleVehicleRadarOn, true] call ace_interact_menu_fnc_addActionToClass;
["Man", 1, ["ACE_SelfActions", "JammingBackpack", "Radar jammer"], _kyk_ew_jammerActionToggleVehicleRadarOff, true] call ace_interact_menu_fnc_addActionToClass;



_kyk_ew_jammerActionDetectVehicle = ["Scan for jammers", "Scan for jammers", "kyk_ew\icons\ace\Scan for jammers.paa", {
	[_player] remoteExecCall ["kyk_ew_fnc_detectJammers", 2, false];
},
{[typeOf vehicle player, 7] call kyk_ew_fnc_hasJammer;}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionCheckVehicle = ["Check jammer state", "Check jammer state", "kyk_ew\icons\ace\Check state.paa", {
	[vehicle player, clientOwner] remoteExecCall ["kyk_ew_fnc_jammingStatus", 0, false];
}, {VEHICLE_CONDITION_1 || VEHICLE_CONDITION_2}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicle = ["Jammer", "Jammer", "kyk_ew\icons\ace\Jammer.paa", {;}, {VEHICLE_CONDITION_1}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[vehicle player, 0] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>Jammer </t><t color='#ff0000'>disabled</t>";
}, {VEHICLE_CONDITION_1}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[vehicle player, 0] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>Jammer </t><t color='#00ff00'>enabled</t>";
}, {VEHICLE_CONDITION_1}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleRadio = ["Radio jammer", "Radio jammer", "kyk_ew\icons\ace\Radio.paa", {;}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 1] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRadioOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[vehicle player, 1] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>Radio jammer </t><t color='#ff0000'>disabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 1] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRadioOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[vehicle player, 1] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>Radio jammer </t><t color='#00ff00'>enabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 1] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleGSM = ["GSM jammer", "GSM jammer", "kyk_ew\icons\ace\Phone.paa", {;}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 2] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleGSMOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[vehicle player, 2] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>GSM jammer </t><t color='#ff0000'>disabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 2] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleGSMOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[vehicle player, 2] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>GSM jammer </t><t color='#00ff00'>enabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 2] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleRFDetonator = ["RFDet jammer", "RFDet jammer", "kyk_ew\icons\ace\RF Detonator.paa", {;}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 3] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRFDetonatorOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[vehicle player, 3] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>RF Detonator jammer </t><t color='#ff0000'>disabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 3] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRFDetonatorOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[vehicle player, 3] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>RF Detonator jammer </t><t color='#00ff00'>enabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 3] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleDrone = ["Drone jammer", "Drone jammer", "kyk_ew\icons\ace\Drone.paa", {;}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 4] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleDroneOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[vehicle player, 4] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>Drone jammer </t><t color='#ff0000'>disabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 4] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleDroneOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[vehicle player, 4] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>Drone jammer </t><t color='#00ff00'>enabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 4] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleGPS = ["GPS jammer", "GPS jammer", "kyk_ew\icons\ace\GPS.paa", {;}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 5] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleGPSOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[vehicle player, 5] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>GPS jammer </t><t color='#ff0000'>disabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 5] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleGPSOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[vehicle player, 5] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>GPS jammer </t><t color='#00ff00'>enabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 5] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;

_kyk_ew_jammerActionToggleVehicleRadar = ["Radar jammer", "Radar jammer", "kyk_ew\icons\ace\Radar.paa", {;}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 6] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRadarOff = ["Turn off", "Turn off", "kyk_ew\icons\ace\Off.paa", {
	[vehicle player, 6] remoteExecCall ["kyk_ew_fnc_jammerArrayRemove", 0, false];
	hint parseText "<t>Radar jammer </t><t color='#ff0000'>disabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 6] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;
_kyk_ew_jammerActionToggleVehicleRadarOn = ["Turn on", "Turn on", "kyk_ew\icons\ace\On.paa", {
	[vehicle player, 6] remoteExecCall ["kyk_ew_fnc_jammerArrayAdd", 0, false];
	hint parseText "<t>Radar jammer </t><t color='#00ff00'>enabled</t>";
}, {VEHICLE_CONDITION_2 && [typeOf vehicle player, 6] call kyk_ew_fnc_hasJammer}] call ace_interact_menu_fnc_createAction;




[["ACE_ZeusActions"], _kyk_ew_jammerActionZeus] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "JammingZeus"], _kyk_ew_jammerActionDetectZeus] call ace_interact_menu_fnc_addActionToZeus;

["LandVehicle", 1, ["ACE_SelfActions"], _kyk_ew_jammerActionParentVehicle, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 1, ["ACE_SelfActions"], _kyk_ew_jammerActionParentVehicle, true] call ace_interact_menu_fnc_addActionToClass;
["Ship", 1, ["ACE_SelfActions"], _kyk_ew_jammerActionParentVehicle, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming"], _kyk_ew_jammerActionCheckVehicle, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming"], _kyk_ew_jammerActionDetectVehicle, true] call ace_interact_menu_fnc_addActionToClass;

["allVehicles", 1, ["ACE_SelfActions", "Jamming"], _kyk_ew_jammerActionToggleVehicle, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "Jammer"], _kyk_ew_jammerActionToggleVehicleOn, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "Jammer"], _kyk_ew_jammerActionToggleVehicleOff, true] call ace_interact_menu_fnc_addActionToClass;

["allVehicles", 1, ["ACE_SelfActions", "Jamming"], _kyk_ew_jammerActionToggleVehicleRadio, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "Radio jammer"], _kyk_ew_jammerActionToggleVehicleRadioOn, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "Radio jammer"], _kyk_ew_jammerActionToggleVehicleRadioOff, true] call ace_interact_menu_fnc_addActionToClass;

["allVehicles", 1, ["ACE_SelfActions", "Jamming"], _kyk_ew_jammerActionToggleVehicleGSM, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "GSM jammer"], _kyk_ew_jammerActionToggleVehicleGSMOn, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "GSM jammer"], _kyk_ew_jammerActionToggleVehicleGSMOff, true] call ace_interact_menu_fnc_addActionToClass;

["allVehicles", 1, ["ACE_SelfActions", "Jamming"], _kyk_ew_jammerActionToggleVehicleRFDetonator, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "RFDet jammer"], _kyk_ew_jammerActionToggleVehicleRFDetonatorOn, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "RFDet jammer"], _kyk_ew_jammerActionToggleVehicleRFDetonatorOff, true] call ace_interact_menu_fnc_addActionToClass;

["allVehicles", 1, ["ACE_SelfActions", "Jamming"], _kyk_ew_jammerActionToggleVehicleDrone, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "Drone jammer"], _kyk_ew_jammerActionToggleVehicleDroneOn, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "Drone jammer"], _kyk_ew_jammerActionToggleVehicleDroneOff, true] call ace_interact_menu_fnc_addActionToClass;

["allVehicles", 1, ["ACE_SelfActions", "Jamming"], _kyk_ew_jammerActionToggleVehicleGPS, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "GPS jammer"], _kyk_ew_jammerActionToggleVehicleGPSOn, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "GPS jammer"], _kyk_ew_jammerActionToggleVehicleGPSOff, true] call ace_interact_menu_fnc_addActionToClass;

["allVehicles", 1, ["ACE_SelfActions", "Jamming"], _kyk_ew_jammerActionToggleVehicleRadar, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "Radar jammer"], _kyk_ew_jammerActionToggleVehicleRadarOn, true] call ace_interact_menu_fnc_addActionToClass;
["allVehicles", 1, ["ACE_SelfActions", "Jamming", "Radar jammer"], _kyk_ew_jammerActionToggleVehicleRadarOff, true] call ace_interact_menu_fnc_addActionToClass;