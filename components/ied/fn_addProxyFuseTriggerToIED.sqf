/*
	Created By: JC
*/
#include "macros.hpp"
params ["_object", "_isLarge", "_proxySide", "_proxyRange"];
private _proxy = createTrigger ["EmptyDetector", getPos _object];
// TODO Test when multiplee proxy-fused IEDs are on field
_proxy setVariable ["iedObj", _object];
_proxy setTriggerActivation [str _proxySide, "PRESENT", false];
_proxy setTriggerArea [_proxyRange, _proxyRange, 0, false, _proxyRange * 2];	// *2 because the z axis goes above and below the ground
private _onAct = "thisTrigger getVariable ""iedObj"" setDamage 1;";
private _cond = "thisList findIf {_x != thisTrigger getVariable ""iedObj""} > -1";
_proxy setTriggerStatements [_cond, _onAct, ""];