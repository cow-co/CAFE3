params ["_object", "_isLarge"];
_failed = {
	params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
	_bomb = _args select 0;
	_isLarge = _args select 1;
	[_bomb, _isLarge] call f_fnc_iedBoom;
};

_condition_power = {
	_canDefuse = [_player, "ACE_DefusalKit" ] call BIS_fnc_hasItem;
	_isDefused = _target getVariable ["defused_power", false];
	(_canDefuse == true) and (_isDefused == false);
};
_finish_power = {
	params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
	_bomb = _args select 0;
	_bomb setVariable ["defused_power", true, true];
};
_statement_power = {
    params ["_target", "_player", "_params"];
	_finish_code = _params select 0;
	_failed_code = _params select 1;
	_isLarge = _params select 2;
	[60, [_target, _isLarge], _finish_code, _failed_code, "Defusing Power Source..."] call ace_common_fnc_progressBar;
};

_action_power = ["Defuse Power Source", "Defuse Power Source", "", _statement_power, _condition_power, {}, [_finish_power, _failed, _isLarge]] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action_power] call ace_interact_menu_fnc_addActionToObject;

_condition_init = {
	_canDefuse = [_player, "ACE_DefusalKit" ] call BIS_fnc_hasItem;
	_isDefused = _target getVariable ["defused_init", false];
	(_canDefuse == true) and (_isDefused == false);
};
_finish_init = {
	params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
	_bomb = _args select 0;
	_bomb setVariable ["defused_init", true, true];
};
_statement_init = {
    params ["_target", "_player", "_params"];
	_finish_code = _params select 0;
	_failed_code = _params select 1;
	_isLarge = _params select 2;
	_previousStepDone = _target getVariable ["defused_power", false];
	if (_previousStepDone == false) then {
		_target setDamage 1;
	} else {
		[60, [_target, _isLarge], _finish_code, _failed_code, "Defusing Initiator..."] call ace_common_fnc_progressBar;
	};
};

_action_init = ["Defuse Initiator", "Defuse Initiator", "", _statement_init, _condition_init, {}, [_finish_init, _failed, _isLarge]] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action_init] call ace_interact_menu_fnc_addActionToObject;

_condition_det = {
	_canDefuse = [_player, "ACE_DefusalKit" ] call BIS_fnc_hasItem;
	_isDefused = _target getVariable ["defused", false];
	(_canDefuse == true) and (_isDefused == false);
};
_finish_det = {
	params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
	_bomb = _args select 0;
	_bomb setVariable ["defused", true, true];
};
_statement_det = {
    params ["_target", "_player", "_params"];
	_finish_code = _params select 0;
	_failed_code = _params select 1;
	_isLarge = _params select 2;
	_previousStepDone = _target getVariable ["defused_init", false];
	if (_previousStepDone == false) then {
		_target setDamage 1;
	} else {
		[60, [_target, _isLarge], _finish_code, _failed_code, "Defusing Detonator..."] call ace_common_fnc_progressBar;
	};
};

_action_det = ["Defuse Detonator", "Defuse Detonator", "", _statement_det, _condition_det, {}, [_finish_det, _failed, _isLarge]] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action_det] call ace_interact_menu_fnc_addActionToObject;
