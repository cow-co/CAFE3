private _displacement = (getPos player) - cafe_playerPos;
private _magnitude = vectorMagnitude _displacement;

if (cafe_playerInVic) then {
	cafe_playerVicDistance =  cafe_playerVicDistance + _magnitude;
	hint format ["You have travelled %1 metres in a vehicle", cafe_playerVicDistance];
};



if (!cafe_playerInVic) then {
	cafe_playerFootDistance =  cafe_playerFootDistance + _magnitude;
	hint format ["You have travelled %1 metres on foot", cafe_playerFootDistance];
};