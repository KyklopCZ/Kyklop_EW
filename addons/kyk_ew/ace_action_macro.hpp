#define _addActionsToVehicles class ACE_SelfActions\
		{\
			class Jamming\
			{\
				displayName = "Jamming";\
				condition = "kyk_ew_jammerVehiclesType1 find typeOf vehicle player != -1 || kyk_ew_jammerVehiclesType2 find typeOf vehicle player != -1";\
				statement = ";";\
				\
				class ScanForJammers\
				{\
					displayName = "Scan for jammers";\
					condition = "kyk_ew_jammerVehiclesType1 find typeOf vehicle player != -1 || kyk_ew_jammerVehiclesType2 find typeOf vehicle player != -1";\
					statement = "[_player] remoteExecCall ['kyk_ew_fnc_detectJammers', 2, false];";\
				};\
				\
				class CheckState\
				{\
					displayName = "Check jammer state";\
					condition = "kyk_ew_jammerVehiclesType1 find typeOf vehicle player != -1 || kyk_ew_jammerVehiclesType2 find typeOf vehicle player != -1";\
					statement = "[vehicle player, clientOwner] remoteExecCall ['kyk_ew_fnc_jammingStatus', 2, false];"\
				};\
				\
				class Jammer\
				{\
					displayName = "Jammer";\
					condition = "kyk_ew_jammerVehiclesType1 find typeOf vehicle player != -1";\
					statement = ";";\
					\
					class On\
					{\
						displayName = "Turn on";\
						condition = "kyk_ew_jammerVehiclesType1 find typeOf vehicle player != -1";\
						statement = "[vehicle player, 0] remoteExecCall ['kyk_ew_fnc_jammerArrayAdd', 2, false]; [0, true] call kyk_ew_fnc_jammerStateHint;";\
					};\
					\
					class Off\
					{\
						displayName = "Turn off";\
						condition = "kyk_ew_jammerVehiclesType1 find typeOf vehicle player != -1";\
						statement = "[vehicle player, 0] remoteExecCall ['kyk_ew_fnc_jammerArrayRemove', 2, false]; [0, false] call kyk_ew_fnc_jammerStateHint;";\
					};\
				};\
				\
				class RadioJammer\
				{\
					displayName = "Radio jammer";\
					condition = "kyk_ew_jammerVehiclesType2 find typeOf vehicle player != -1";\
					statement = ";";\
					\
					class On\
					{\
						displayName = "Turn on";\
						condition = "kyk_ew_jammerVehiclesType2 find typeOf vehicle player != -1";\
						statement = "[vehicle player, 1] remoteExecCall ['kyk_ew_fnc_jammerArrayAdd', 2, false]; [1, true] call kyk_ew_fnc_jammerStateHint;";\
					};\
					\
					class Off\
					{\
						displayName = "Turn off";\
						condition = "kyk_ew_jammerVehiclesType2 find typeOf vehicle player != -1";\
						statement = "[vehicle player, 1] remoteExecCall ['kyk_ew_fnc_jammerArrayRemove', 2, false]; [1, false] call kyk_ew_fnc_jammerStateHint;";\
					};\
				};\
				\
				class GSMJammer : RadioJammer\
				{\
					displayName = "GSM jammer";\
					\
					class On : On\
					{\
						statement = "[vehicle player, 2] remoteExecCall ['kyk_ew_fnc_jammerArrayAdd', 2, false]; [2, true] call kyk_ew_fnc_jammerStateHint;";\
					};\
					\
					class Off : Off\
					{\
						statement = "[vehicle player, 2] remoteExecCall ['kyk_ew_fnc_jammerArrayRemove', 2, false]; [2, false] call kyk_ew_fnc_jammerStateHint;;";\
					};\
				};\
				\
				class RFDetJammer : RadioJammer\
				{\
					displayName = "RF Det. jammer";\
					\
					class On : On\
					{\
						statement = "[vehicle player, 3] remoteExecCall ['kyk_ew_fnc_jammerArrayAdd', 2, false]; [3, true] call kyk_ew_fnc_jammerStateHint;";\
					};\
					\
					class Off : Off\
					{\
						statement = "[vehicle player, 3] remoteExecCall ['kyk_ew_fnc_jammerArrayRemove', 2, false]; [3, false] call kyk_ew_fnc_jammerStateHint;";\
					};\
				};\
				\
				class DroneJammer : RadioJammer\
				{\
					displayName = "Drone jammer";\
					\
					class On : On\
					{\
						statement = "[vehicle player, 4] remoteExecCall ['kyk_ew_fnc_jammerArrayAdd', 2, false]; [4, true] call kyk_ew_fnc_jammerStateHint;";\
					};\
					\
					class Off : Off\
					{\
						statement = "[vehicle player, 4] remoteExecCall ['kyk_ew_fnc_jammerArrayRemove', 2, false]; [4, false] call kyk_ew_fnc_jammerStateHint;";\
					};\
				};\
				\
				class GPSJammer : RadioJammer\
				{\
					displayName = "GPS jammer";\
					\
					class On : On\
					{\
						statement = "[vehicle player, 5] remoteExecCall ['kyk_ew_fnc_jammerArrayAdd', 2, false]; [5, true] call kyk_ew_fnc_jammerStateHint;";\
					};\
					\
					class Off : Off\
					{\
						statement = "[vehicle player, 5] remoteExecCall ['kyk_ew_fnc_jammerArrayRemove', 2, false]; [5, false] call kyk_ew_fnc_jammerStateHint;";\
					};\
				};\
				\
				class RadarJammer : RadioJammer\
				{\
					displayName = "Radar jammer";\
					\
					class On : On\
					{\
						statement = "[vehicle player, 6] remoteExecCall ['kyk_ew_fnc_jammerArrayAdd', 2, false]; [6, true] call kyk_ew_fnc_jammerStateHint;";\
					};\
					\
					class Off : Off\
					{\
						statement = "[vehicle player, 6] remoteExecCall ['kyk_ew_fnc_jammerArrayRemove', 2, false]; [6, false] call kyk_ew_fnc_jammerStateHint;";\
					};\
				};\
			};\
		}