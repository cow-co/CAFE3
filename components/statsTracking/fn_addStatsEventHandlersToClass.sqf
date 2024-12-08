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

	["ace_treatmentSucceded", {
		params ["_caller", "_target", "_selectionName", "_className", "_itemUser", "_usedItem", "_createLitter"];

		if (_unit == player) then {
			private _currentTreatments = missionNamespace getVariable ["cafe_playerTreatments", createHashMap];
			private _currentCount = _currentTreatments getOrDefault [_usedItem, 0];
			private _updated = _currentCount + 1;
			_currentTreatments set [_usedItem, _updated];
			missionNamespace setVariable ["cafe_playerTreatments", _currentTreatments, false];
		};
	}] call CBA_fnc_addEventHandler;

	addMissionEventHandler ["Ended",
	{
		private _text = "";

		private _currentShots = missionNamespace getVariable ["cafe_playerShots", createHashMap];
		private _ammoTableRows = [["Magazine", "| Rounds expended <br/>"]];
		{
			private _magName = _x;
			private _shots = format ["| %1 <br/>", _y];
			_ammoTableRows pushBack [_magName, _shots];
		} forEach _currentShots;
		_text = _text + (_ammoTableRows call BIS_fnc_alignTabs);
		
		private _currentTreatments = missionNamespace getVariable ["cafe_playerTreatments", createHashMap];
		private _medicalTableRows = [["Medical Item", "| Times Used <br/>"]];
		private _text = "";
		{
			private _itemName = _x;
			private _timesUsed = format ["| %1 <br/>", _y];
			_medicalTableRows pushBack [_itemName, _timesUsed];
		} forEach _currentShots;
		_text = _text + (_medicalTableRows call BIS_fnc_alignTabs);

		private _uncons = missionNamespace getVariable ["cafe_playerUncons", 0];
		_text = _text + format ["<br/>You went unconscious %1 time(s)<br/>", _uncons];
		missionNamespace setVariable ["cafe_playerStatsStr", _text, false];
	}];
};