/*
	Created By: JC
*/
#include "macros.hpp"

// TODO Handle the case where we run this twice against the same object (set a var on the object saying "isIED"?)
params ["_object", "_isLarge", "_isProxy", "_proxySide", "_proxyRange"];
[_object, _isLarge] call f_fnc_addDefuseActionsToObject;
[_object, _isLarge] call f_fnc_addZeusDetonationToIED;

if (_isProxy == true) then {
	[_object, _isLarge, _proxySide, _proxyRange] call f_fnc_addProxyFuseTriggerToIED;
};