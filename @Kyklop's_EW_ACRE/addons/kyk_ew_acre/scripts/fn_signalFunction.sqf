/*
	Author: ACRE2Team & KyklopCZ
	
	Description:
	The function that is used to calculate the signal and the effects of jamming on it
	All of the code between lines 17 and 96 was created by the ACRE2Team, changes made by KyklopCZ are described in the last comment of each changed line

	Parameter(s):
	Refer to ACRE2Team's code below

	Returns:
	Refer to ACRE2Team's code below
*/

//ACRE2Team code start - All credit for this part of code goes to ACRE2 Team (Original code: https://github.com/IDI-Systems/acre2/blob/master/addons/sys_signal/fnc_getSignal.sqf#L11 )

#include "\idi\acre\addons\sys_signal\script_component.hpp"	//The "\idi\acre\addons\sys_signal" part wasn't added by ACRE2Team, but was necessary for this reference to work
/*
 * Author: ACRE2Team
 * Wrapper function for calling the signal calculation (extension).
 *
 * Arguments:
 * 0: Frequency <NUMBER>
 * 1: Power <NUMBER>
 * 2: Receiving Radio ID <STRING>
 * 3: Transmitting Radio ID <STRING>
 *
 * Return Value:
 * Tuple of power and maximum signal strength <ARRAY>
 *
 * Example:
 * [30, 5000, "ACRE_PRC343_ID_1", "ACRE_PRC343_ID_2"] call acre_sys_signal_fnc_getSignal
 *
 * Public: No
 */

//if (!isNil QGVAR(customSignalFunc)) exitWith { _this call GVAR(customSignalFunc); };	//This comment wasn't done by ACRE2TEAM, but was necessary as it's absence would create an infinite loop

params ["_f", "_mW", "_receiverClass", "_transmitterClass"];

private _count = (missionNamespace getVariable [_transmitterClass + "_running_count", 0]) max 0;
if (_count == 0) then {
    private _rxAntennas = [_receiverClass] call EFUNC(sys_components,findAntenna);
    private _txAntennas = [_transmitterClass] call EFUNC(sys_components,findAntenna);

    {
        private _txAntenna = _x;
        {
            private _rxAntenna = _x;
            private _model = GVAR(signalModel); // TODO: Change models on the fly if compatible (underwater, better frequency matching)

            // Make sure ITWOM is not used for the moment
            if (_model > SIGNAL_MODEL_ITWOM || {_model < SIGNAL_MODEL_CASUAL}) then {
                _model = SIGNAL_MODEL_LOS_MULTIPATH;  // Default to LOS Multipath if the model is out of range
                GVAR(signalModel) = _model;           // And make sure we do not use an invalid mode next time
            };

            _count = _count + 1;
            private _id = format ["%1_%2_%3_%4", _transmitterClass, (_txAntenna select 0), _receiverClass, (_rxAntenna select 0)];
            [
                "process_signal",
                [
                    _model,
                    _id,
                    (_txAntenna select 2),
                    (_txAntenna select 3),
                    (_txAntenna select 0),
                    (_rxAntenna select 2),
                    (_rxAntenna select 3),
                    (_rxAntenna select 0),
                    _f,
                    _mW,
                    GVAR(terrainScaling),
                    diag_tickTime,
                    ACRE_SIGNAL_DEBUGGING,
                    GVAR(omnidirectionalRadios)
                ],
                2,
                FUNC(handleSignalReturn),
                [_transmitterClass, _receiverClass]
            ] call EFUNC(sys_core,callExt);
        } forEach _rxAntennas;
    } forEach _txAntennas;
    missionNamespace setVariable [_transmitterClass + "_running_count", _count];
};
private _maxSignal = missionNamespace getVariable [_transmitterClass + "_best_signal", -992];
private _Px = missionNamespace getVariable [_transmitterClass + "_best_px", 0];

if (ACRE_SIGNAL_DEBUGGING > 0) then {
    private _signalTrace = missionNamespace getVariable [_transmitterClass + "_signal_trace", []];
    _signalTrace pushBack _maxSignal;
    missionNamespace setVariable [_transmitterClass + "_signal_trace", _signalTrace];
};


[_Px, _maxSignal];

//ACRE2Team code end

//private _debug = "Original Px, Signal: " + str [_Px, _maxSignal];

private _jammingSignalStrength = player getVariable ["kyk_ew_acre_jammingSignalStrength", 0];

//_debug = _debug + "\nJamming strength: " + str _jammingSignalStrength;

if(_jammingSignalStrength == 0) exitWith {
	//hint _debug;
	[_Px, _maxSignal];
};

_Px = 1 - (3 * (_jammingSignalStrength * _jammingSignalStrength));

//_debug = _debug + "\nNew Px, Signal: " + str [_Px, _maxSignal];
//hint _debug;

[_Px, _maxSignal];