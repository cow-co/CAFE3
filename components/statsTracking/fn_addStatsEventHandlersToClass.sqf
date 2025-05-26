// Adds event handlers to the given unit, to track various stats for viewing on the debriefing.
// These event handlers are local to the client, and the data they collect is relevant only 
// to the client, so we don't need to sync the data across the network.
params ["_unit"];

if !(_unit isEqualTo player) exitWith {};

if (hasInterface) then 
{
	cafe_playerPos = getPos player;
	["ace_firedPlayer", 
	{
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

		if (_unit == player) then 
		{
			private _magName = getText (configFile >> "CfgMagazines" >> _magazine >> "displayName");
			private _currentCount = cafe_playerShots getOrDefault [_magName, 0];
			private _updated = _currentCount + 1;
			cafe_playerShots set [_magName, _updated];
		};
	}] call CBA_fnc_addEventHandler;

	["ace_unconscious", 
	{
		params ["_unit", "_state"];

		if (_unit == player && _state == true) then 
		{
			cafe_playerUncons = cafe_playerUncons + 1;
		};
	}] call CBA_fnc_addEventHandler;

	addMissionEventHandler ["Ended",
	{
		private _tableRows = [["Magazine", "| Rounds expended <br/>"]];
		private _text = "";

		{
			private _magName = _x;
			private _shots = format ["| %1 <br/>", _y];
			_tableRows pushBack [_magName, _shots];
		} forEach cafe_playerShots;

		_text = _text + (_tableRows call BIS_fnc_alignTabs);
		_text = _text + format ["<br/>You went unconscious %1 time(s)<br/>", cafe_playerUncons];
		_text = _text + format ["<br/>You have travelled %1 metres on foot<br/>", cafe_playerFootDistance];
		_text = _text + format ["<br/>You have travelled %1 metres in vehicles<br/>", cafe_playerVicDistance];

		missionNamespace setVariable ["cafe_playerStatsStr", _text, false];
	}];

	player addEventHandler ["GetInMan",
	{
		cafe_playerInVic = true;
	}];

	player addEventHandler ["GetOutMan",
	{
		cafe_playerInVic = false;
	}];


	while {true} do {
		private _until = diag_tickTime + 1 * 60;
		if (diag_tickTime > _until) then {
			hint "calling";
			call f_fnc_handleDistanceTravelled;
		};
	};
};