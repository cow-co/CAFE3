// Adds event handlers to the given unit, to track various stats for viewing on the debriefing.
// These event handlers are local to the client, and the data they collect is relevant only 
// to the client, so we don't need to sync the data across the network.

// TODO Ensure these do run locally and not globally

if (hasInterface) then {
	["ace_firedPlayer", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
		systemChat "Player fired";
		_currentShots = missionNamespace getVariable ["playerShots", createHashMap];
		_currentCount = _currentShots getOrDefault [_ammo, 0];
		_updated = _currentCount + 1;
		_currentShots set [_ammo, _updated];
		missionNamespace setVariable ["playerShots", _currentShots, false];
	}] call CBA_fnc_addEventHandler;

	["ace_unconscious", {
		params ["_unit", "_state"];

		if (_unit == player) then {
			_currentUncons = missionNamespace getVariable ["playerUncons", 0];
			_updated = _currentUncons + 1;
			missionNamespace setVariable ["playerUncons", _updated, false];
		};
	}] call CBA_fnc_addEventHandler;

	addMissionEventHandler ["Ended",
	{
		systemChat "Ending";
		_currentShots = missionNamespace getVariable ["playerShots", createHashMap];
		_currentHits = missionNamespace getVariable ["playerHits", createHashMap];
		_uncons = missionNamespace getVariable ["playerUncons", 0];
		_text = "";
		{
			_ammo = _x;
			_shots = _y;
			_text = _text + format ["%1 | Fired: %2<br/>", _ammo, _shots];
		} forEach _currentShots;
		_text = _text + format ["You went unconscious %1 times<br/>", _uncons];_playersKills = createHashMap;

		// _playersKills = createHashMap;
		// _killLogs = profileNamespace getVariable [FULL_KILL_LOG_KEY_CLIENT, []];
		// if (isNil 'f_var_currentKillLogIndex') then
		// {
		// 	f_var_currentKillLogIndex = count _killLogs;
		// };
		// _killTracking = _killLogs select f_var_currentKillLogIndex;

		// {

		// 	_entry = _x;
		// 	_entryType = _entry select 0;

		// 	if (_entryType isEqualTo "Killed") then
		// 	{
		// 		_killer = _entry select 3;
		// 		_killerName = _killer select 2;
		// 		_killerSide = _killer select 1;
		// 		_killerType = _killer select 0;

		// 		_playerLoadouts = ["CO", "SL", "med", "ftl", "eng", "gren", "mk", "mmg", "ammg", "rif", "ar"];	// TODO get the actual list of defined loadouts
		// 		_isPlayerLoadout = (_playerLoadouts findIf { tolower _x == _killerType } > -1);
		// 		_isBlufor = (_killerSide == west);
				
		// 		if (_isPlayerLoadout == true) then {
		// 			if (_isBlufor == true) then {
		// 				_currentKills = _playersKills getOrDefault [_killerName, 0];
		// 				_currentKills = _currentKills + 1;
		// 				_playersKills set [_killerName, _currentKills];
		// 			};
		// 		};
		// 	};

		// } forEach _killTracking;

		// _killsText = "";
		// {
		// 	_killsText = _killsText + format ["%1 got %2 kills<br/>", _x, _y];
		// } forEach _playersKills;
		missionNamespace setVariable ["cafe_playerStatsStr", _text, false];
		// missionNamespace setVariable ["cafe_killsListStr", _killsText, false];
	}];
};
