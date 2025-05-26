params ["_unit", "_instigator"];

//if !(_unit == _instigator) then {
	if (side _unit == side _instigator) then {
		private _shooter = name _instigator;
		_unit sideChat format ["I dun got hit by %1", _shooter];
		private _currentCount = cafe_playerFriendlyFires getOrDefault [_shooter, 0];
		private _newCount = _currentCount + 1;
		cafe_playerFriendlyFires set [_shooter, _newCount];
	};
//};