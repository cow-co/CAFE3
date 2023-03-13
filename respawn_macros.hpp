#define RESPAWN_TIMED_WAVE "CAFE_Wave"
#define RESPAWN_TIMED "CAFE_Timed"
#define RESPAWN_TICKETS "CAFE_Tickets"
#define RESPAWN_TRIGGERED_WAVE "CAFE_TriggeredWave"

#define RESPAWN_MENU "MenuPosition"

#define RESPAWN_MODE_TIMED                  	{"CAFE_FixPlayerTickets", RESPAWN_MENU, "CAFE_WeaponSafety", "Spectator", RESPAWN_TIMED, "CAFE_Loadout", "CAFE_Squad"}
#define RESPAWN_MODE_TIMED_TICKETS              {"CAFE_FixPlayerTickets", RESPAWN_MENU, "CAFE_WeaponSafety", "Spectator", RESPAWN_TIMED, RESPAWN_TICKETS, "CAFE_Loadout", "CAFE_Squad"}
#define RESPAWN_MODE_TIMED_WAVES            	{"CAFE_FixPlayerTickets", RESPAWN_MENU, "CAFE_WeaponSafety", "Spectator", RESPAWN_TIMED_WAVE, "CAFE_Loadout", "CAFE_Squad"}
#define RESPAWN_MODE_TICKETS                	{"CAFE_FixPlayerTickets", RESPAWN_MENU, "CAFE_WeaponSafety", "Spectator", RESPAWN_TICKETS, "CAFE_Loadout", "CAFE_Squad"}
#define RESPAWN_MODE_TIMED_WAVES_TICKETS    	{"CAFE_FixPlayerTickets", RESPAWN_MENU, "CAFE_WeaponSafety", "Spectator", RESPAWN_TIMED_WAVE, RESPAWN_TICKETS, "CAFE_Loadout", "CAFE_Squad"}
#define RESPAWN_MODE_TRIGGERED_WAVES    		{"CAFE_FixPlayerTickets", RESPAWN_MENU, "CAFE_WeaponSafety", "Spectator", RESPAWN_TRIGGERED_WAVE, "CAFE_Loadout", "CAFE_Squad"}
#define RESPAWN_MODE_TRIGGERED_WAVES_TICKETS    {"CAFE_FixPlayerTickets", RESPAWN_MENU, "CAFE_WeaponSafety", "Spectator", RESPAWN_TRIGGERED_WAVE, RESPAWN_TICKETS, "CAFE_Loadout", "CAFE_Squad"}

#define RESPAWN_DEFAULTS "CAFE_FixPlayerTickets", RESPAWN_MENU, "CAFE_WeaponSafety", "Spectator", "CAFE_Loadout", "CAFE_Squad"

#define DEFAULT_RESPAWN_ARRAY {RESPAWN_DEFAULTS}