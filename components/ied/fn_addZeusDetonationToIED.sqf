// Allows Zeus to detonate the IED by setting its HP to 0 (done by way of a trigger)
// In so doing, also prevents the object from taking damage (so that stray bullets don't detonate it!)

params ["_object", "_isLarge"];
_object allowDamage false;
_object setVariable ["isLargeIED", _isLarge];
_object addEventHandler ["Killed", {
	params ["_unit", "_killer"];
	[_unit, _unit getVariable ["isLargeIED", false]] call f_fnc_iedBoom;
}];