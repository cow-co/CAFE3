private _newPlayerPos = getPos player;
private _displacement = _newPlayerPos vectorDiff cafe_playerPos;
private _magnitude = vectorMagnitude _displacement;

if (_magnitude < cafe_teleportDistThreshold) then {
	if (cafe_playerInVic) then {
		cafe_playerVicDistance =  cafe_playerVicDistance + _magnitude;
	};

	if (!cafe_playerInVic) then {
		cafe_playerFootDistance =  cafe_playerFootDistance + _magnitude;
	};
};

cafe_playerPos = _newPlayerPos;