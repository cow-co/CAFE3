// Allows Zeus to detonate the IED by setting its HP to 0 (done by way of a trigger)
// In so doing, also prevents the object from taking damage (so that stray bullets don't detonate it!)
#include "macros.hpp"
params ["_object", "_isLarge"];
SERVER_ONLY;
_object allowDamage false;
_object setVariable ["isLargeIED", _isLarge];
private _trg = createTrigger ["EmptyDetector", getPos _object];
_trg setVariable ["iedObj", _object];
private _onAct = "private _obj = thisTrigger getVariable ""iedObj""; [_obj, _obj getVariable ""isLargeIED""] call f_fnc_iedBoom;";
private _cond = "private _obj = thisTrigger getVariable ""iedObj""; damage _obj >= 1;";
_trg setTriggerStatements [_cond, _onAct, ""];