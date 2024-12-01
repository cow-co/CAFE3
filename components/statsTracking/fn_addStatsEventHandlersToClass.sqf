// Adds event handlers to the given unit, to track various stats for viewing on the debriefing.
// These event handlers are local to the client, and the data they collect is relevant only 
// to the client, so we don't need to sync the data across the network.
params ["_unit"];

if !(_unit isEqualTo player) exitWith {};

if (hasInterface) then {
	["ace_firedPlayer", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];
		if (_unit == player) then {
			private _currentShots = missionNamespace getVariable ["cafe_playerShots", createHashMap];
			private _magName = getText (configFile >> "CfgMagazines" >> _magazine >> "displayName");
			private _currentCount = _currentShots getOrDefault [_magName, 0];
			private _updated = _currentCount + 1;
			_currentShots set [_magName, _updated];
			missionNamespace setVariable ["cafe_playerShots", _currentShots, false];
		};
	}] call CBA_fnc_addEventHandler;

	["ace_unconscious", {
		params ["_unit", "_state"];

		if (_unit == player && _state == true) then {
			private _currentUncons = missionNamespace getVariable ["cafe_playerUncons", 0];
			private _updated = _currentUncons + 1;
			missionNamespace setVariable ["cafe_playerUncons", _updated, false];
		};
	}] call CBA_fnc_addEventHandler;

	addMissionEventHandler ["Ended",
	{
		systemChat "Ending";
		private _currentShots = missionNamespace getVariable ["cafe_playerShots", createHashMap];
		private _uncons = missionNamespace getVariable ["cafe_playerUncons", 0];
		private _tableRows = [["Magazine", "| Rounds expended <br/>"]];
		private _text = "";
		{
			private _magName = _x;
			private _shots = format ["| %1 <br/>", _y];
			_tableRows pushBack [_magName, _shots];
		} forEach _currentShots;
		_text = _text + (_tableRows call BIS_fnc_alignTabs);
		_text = _text + format ["<br/>You went unconscious %1 time(s)<br/>", _uncons];
		missionNamespace setVariable ["cafe_playerStatsStr", _text, false];
	}];
};