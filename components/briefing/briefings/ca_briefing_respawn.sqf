// CA - Framework briefing section
// ====================================================================================

_briefing = "";
_side = side player;
_delay = 0;
_mode = RESPAWN_MODE_TIMED_WAVES_TICKETS;
_sideTickets = 0;
_individualTickets = 0;

if (_side == west) then {
	_delay = RESPAWN_DELAY_BLUFOR;
	_mode = RESPAWN_MODE_BLUFOR;
	_sideTickets = RESPAWN_SIDE_TICKETS_BLUFOR;
	_individualTickets = RESPAWN_PLAYER_TICKETS_BLUFOR;
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
", _mode, _delay, _sideTickets, _individualTickets];

player createDiaryRecord ["CAFE", ["Current Respawn Settings", _briefing]];