#define BACKPACK_CONDITION_1 kyk_ew_jammersType1 find backpack player != -1

#define BACKPACK_CONDITION_2 kyk_ew_jammersType2 find backpack player != -1

#define VEHICLE_CONDITION_1 kyk_ew_jammersType1 find typeOf vehicle player != -1

#define VEHICLE_CONDITION_2 kyk_ew_jammersType2 find typeOf vehicle player != -1

#define GAZ_CONDITION ((vehicle player isKindOf "rhs_gaz66_r142_base" && fuel vehicle player == 0) || !(vehicle player isKindOf "rhs_gaz66_r142_base"))

#define RADIO_CONDITION_PLAYER BACKPACK_CONDITION_2 && [backpack player, 1] call kyk_ew_fnc_hasJammer

#define GSM_CONDITION_PLAYER BACKPACK_CONDITION_2 && [backpack player, 2] call kyk_ew_fnc_hasJammer

#define RFDET_CONDITION_PLAYER BACKPACK_CONDITION_2 && [backpack player, 3] call kyk_ew_fnc_hasJammer

#define DRONE_CONDITION_PLAYER BACKPACK_CONDITION_2 && [backpack player, 4] call kyk_ew_fnc_hasJammer

#define GPS_CONDITION_PLAYER BACKPACK_CONDITION_2 && [backpack player, 5] call kyk_ew_fnc_hasJammer

#define RADAR_CONDITION_PLAYER BACKPACK_CONDITION_2 && [backpack player, 6] call kyk_ew_fnc_hasJammer