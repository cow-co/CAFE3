// CA - Respawn briefing section
// ====================================================================================

_briefing = "";
_side = side player;

_respawnModeTimedText = format ["%1", RESPAWN_MODE_TIMED];
_respawnModeTimedTicketsText = format ["%1", RESPAWN_MODE_TIMED_TICKETS];
_respawnModeTimedWavesText = format ["%1", RESPAWN_MODE_TIMED_WAVES];
_respawnModeTicketsText = format ["%1", RESPAWN_MODE_TICKETS];
_respawnModeTimedWavesTicketsText = format ["%1", RESPAWN_MODE_TIMED_WAVES_TICKETS];
_respawnModeTriggeredWavesText = format ["%1", RESPAWN_MODE_TRIGGERED_WAVES];
_respawnModeTriggeredWavesTicketsText = format ["%1", RESPAWN_MODE_TRIGGERED_WAVES_TICKETS];

// Defaults for if macros are not defined
_delay = "Not set";
_modeName = "Not set";
_sideTickets = "Not set";
_individualTickets = "Not set";
_mode = null;

if (_side == west) then {
#ifdef RESPAWN_DELAY_BLUFOR
	_delay = RESPAWN_DELAY_BLUFOR;
#endif
#ifdef RESPAWN_MODE_BLUFOR
	_mode = format ["%1", RESPAWN_MODE_BLUFOR];
#endif
#ifdef RESPAWN_SIDE_TICKETS_BLUFOR
	_sideTickets = RESPAWN_SIDE_TICKETS_BLUFOR;
#endif
#ifdef RESPAWN_PLAYER_TICKETS_BLUFOR
	_individualTickets = RESPAWN_PLAYER_TICKETS_BLUFOR;
#endif
};

if (_side == east) then {
#ifdef RESPAWN_DELAY_OPFOR
	_delay = RESPAWN_DELAY_OPFOR;
#endif
#ifdef RESPAWN_MODE_OPFOR
	_mode = format ["%1", RESPAWN_MODE_OPFOR];
#endif
#ifdef RESPAWN_SIDE_TICKETS_OPFOR
	_sideTickets = RESPAWN_SIDE_TICKETS_OPFOR;
#endif
#ifdef RESPAWN_PLAYER_TICKETS_OPFOR
	_individualTickets = RESPAWN_PLAYER_TICKETS_OPFOR;
#endif
};

if (_side == independent) then {
#ifdef RESPAWN_DELAY_INDFOR
	_delay = RESPAWN_DELAY_INDFOR;
#endif
#ifdef RESPAWN_MODE_INDFOR
	_mode = format ["%1", RESPAWN_MODE_INDFOR];
#endif
#ifdef RESPAWN_SIDE_TICKETS_INDFOR
	_sideTickets = RESPAWN_SIDE_TICKETS_INDFOR;
#endif
#ifdef RESPAWN_PLAYER_TICKETS_INDFOR
	_individualTickets = RESPAWN_PLAYER_TICKETS_INDFOR;
#endif
};

if (_side == civilian) then {
#ifdef RESPAWN_DELAY_CIVILIAN
	_delay = RESPAWN_DELAY_CIVILIAN;
#endif
#ifdef RESPAWN_MODE_CIVILIAN
	_mode = format ["%1", RESPAWN_MODE_CIVILIAN];
#endif
#ifdef RESPAWN_SIDE_TICKETS_CIVILIAN
	_sideTickets = RESPAWN_SIDE_TICKETS_CIVILIAN;
#endif
#ifdef RESPAWN_PLAYER_TICKETS_CIVILIAN
	_individualTickets = RESPAWN_PLAYER_TICKETS_CIVILIAN;
#endif
};

if (_mode == _respawnModeTimedText) then {
	_modeName = RESPAWN_MODE_NAME_TIMED;
}; 
if (_mode == _respawnModeTimedTicketsText) then {
	_modeName = RESPAWN_MODE_NAME_TIMED_TICKETS;
};
if (_mode == _respawnModeTimedWavesText) then {
	_modeName = RESPAWN_MODE_NAME_TIMED_WAVES;
}; 
if (_mode == _respawnModeTicketsText) then {
	_modeName = RESPAWN_MODE_NAME_TICKETS;
}; 
if (_mode == _respawnModeTimedWavesTicketsText) then {
	_modeName = RESPAWN_MODE_NAME_TIMED_WAVES_TICKETS;
}; 
if (_mode == _respawnModeTriggeredWavesText) then {
	_modeName = RESPAWN_MODE_NAME_TRIGGERED_WAVES;
};
if (_mode == _respawnModeTriggeredWavesTicketsText) then {
	_modeName = RESPAWN_MODE_NAME_TRIGGERED_WAVES_TICKETS;
};

_briefing = _briefing + format ["
	Respawn Mode: %1
	<br/>
	Respawn Delay: %2
	<br/>
	Respawn Tickets (Side): %3
	<br/>
	Respawn Tickets (Per-Player): %4
	<br/>
", _modeName, _delay, _sideTickets, _individualTickets];

player createDiaryRecord ["CAFE", ["Current Respawn Settings", _briefing]];