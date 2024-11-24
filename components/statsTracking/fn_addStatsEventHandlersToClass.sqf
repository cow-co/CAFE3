// Adds event handlers to the given unit, to track various stats for viewing on the debriefing.
// These event handlers are local to the client, and the data they collect is relevant only 
// to the client, so we don't need to sync the data across the network.

// TODO Ensure these do run locally and not globally

if (hasInterface) then {
	["ace_firedPlayer", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
		if (_unit == player) then {
			_currentShots = missionNamespace getVariable ["cafe_playerShots", createHashMap];
			_currentCount = _currentShots getOrDefault [_ammo, 0];
			_updated = _currentCount + 1;
			_currentShots set [_ammo, _updated];
			missionNamespace setVariable ["cafe_playerShots", _currentShots, false];
		};
	}] call CBA_fnc_addEventHandler;

	["ace_unconscious", {
		params ["_unit", "_state"];

		if (_unit == player && _state == true) then {
			_currentUncons = missionNamespace getVariable ["cafe_playerUncons", 0];
			_updated = _currentUncons + 1;
			missionNamespace setVariable ["cafe_playerUncons", _updated, false];
		};
	}] call CBA_fnc_addEventHandler;

	addMissionEventHandler ["Ended",
	{
		systemChat "Ending";
		_currentShots = missionNamespace getVariable ["cafe_playerShots", createHashMap];
		_uncons = missionNamespace getVariable ["cafe_playerUncons", 0];
		_text = "";
		{
			_ammo = _x;
			_shots = _y;
			_text = _text + format ["%1 | Fired: %2<br/>", _ammo, _shots];
		} forEach _currentShots;
		_text = _text + format ["You went unconscious %1 times<br/>", _uncons];
		missionNamespace setVariable ["cafe_playerStatsStr", _text, false];
	}];
};
