
#define LOGI_VAR(NAME) CONCAT(f_logi_,NAME)
#define LOGIVIC_VAR(NAME,VAR) CONCAT3(LOGI_VAR(NAME),_,VAR)
#define LOGIVIC_VAR_DYNAMIC(NAME,VAR) (format ["f_logi_%1_%2", NAME, VAR])

#define LOGI_REGISTRY LOGI_VAR(registry)

#define BEGIN_LOGI_CONFIG LOGI_REGISTRY = []

#define GET_VAR(NAME,DEFAULT) (missionNamespace getVariable [#NAME, DEFAULT])
#define GET_OBJECT_VAR(OBJECT,NAME,DEFAULT) (OBJECT getVariable [#NAME, DEFAULT])
#define GET_VAR_DYNAMIC(VAR,DEFAULT) (missionNamespace getVariable [VAR, DEFAULT])
#define SET_VAR(NAME,VAL,GLOBAL) (missionNamespace setVariable [#NAME, VAL, GLOBAL])
#define SET_OBJECT_VAR(OBJECT,NAME,VALUE,GLOBAL) (OBJECT setVariable [#NAME, VALUE, GLOBAL])

#define ADD_LOGI_TO_REGISTRY(NAME) LOGI_REGISTRY pushBack #NAME
#define IS_REGISTERED_LOGI(NAME) (NAME in GET_VAR(LOGI_REGISTRY,[]))

#define GET_LOGITYPE(VIC) GET_OBJECT_VAR(VIC,LOGI_VAR(type),"")
#define SET_LOGITYPE(VIC,TYPE) SET_OBJECT_VAR(VIC,LOGI_VAR(type),TYPE,true)

#define LOGIVIC_IS_SPAWNING(VIC) GET_OBJECT_VAR(VIC,LOGI_VAR(isSpawning),false)
#define SET_LOGIVIC_SPAWNING(VIC,SPAWNING) SET_OBJECT_VAR(VIC,LOGI_VAR(isSpawning),SPAWNING,true)

#define VEHICLES_VAR(NAME) LOGIVIC_VAR(NAME,Vics)
#define SET_VEHICLES(NAME,VICSARRAY) SET_VAR(LOGIVIC_VAR(NAME,Vics),VICSARRAY,false)
#define GET_VEHICLES(NAME) GET_VAR(LOGIVIC_VAR(NAME,Vics),[])
#define GET_VEHICLES_DYNAMIC(VAR) GET_VAR_DYNAMIC(LOGIVIC_VAR_DYNAMIC(VAR,"Vics"),[])

#define ADD_VEHICLE(NAME,VICTYPE,AMOUNT)                        \
    _logiVicToAdd = [VICTYPE, AMOUNT, "", ""];                  \
    GET_VAR(LOGIVIC_VAR(NAME,Vics),[]) pushBack _logiVicToAdd

#define ADD_VEHICLE_WITH_GEAR(NAME,VICTYPE,AMOUNT,GEAR)         \
    _logiVicToAdd = [VICTYPE, AMOUNT, GEAR, ""];                \
    GET_VAR(LOGIVIC_VAR(NAME,Vics),[]) pushBack _logiVicToAdd

#define SET_CUSTOM_NAME(NAME) _logiVicToAdd set [3, NAME]

#define ROLES_VAR(NAME) LOGIVIC_VAR(NAME,Roles)
#define SET_ROLES(NAME,ROLESARRAY) SET_VAR(LOGIVIC_VAR(NAME,Roles),(ROLESARRAY apply {toLower _x}),false)
#define GET_ROLES(NAME) GET_VAR(LOGIVIC_VAR(NAME,Roles),[])
#define GET_ROLES_DYNAMIC(VAR) GET_VAR_DYNAMIC(LOGIVIC_VAR_DYNAMIC(VAR,"Roles"),[])
#define ADD_ROLE(NAME,ROLE) GET_VAR(LOGIVIC_VAR(NAME,Roles),[]) pushBack (toLower ROLE)

#define GROUPS_VAR(NAME) LOGIVIC_VAR(NAME,Groups)
#define SET_GROUPS(NAME,GROUPSARRAY) SET_VAR(LOGIVIC_VAR(NAME,Groups),(GROUPSARRAY apply {toLower _x}),false)
#define GET_GROUPS(NAME) GET_VAR(LOGIVIC_VAR(NAME,Groups),[])
#define GET_GROUPS_DYNAMIC(VAR) GET_VAR_DYNAMIC(LOGIVIC_VAR_DYNAMIC(VAR,"Groups"),[])
#define ADD_GROUP(NAME,CALLSIGN) GET_VAR(LOGIVIC_VAR(NAME,Groups),[]) pushBack (toLower CALLSIGN)

#define FACTION_VAR(NAME) LOGIVIC_VAR(NAME,Faction)
#define SET_FACTION(NAME,FACTION) SET_VAR(LOGIVIC_VAR(NAME,Faction),FACTION,false)
#define GET_FACTION(NAME) GET_VAR(LOGIVIC_VAR(NAME,Faction),"")
#define GET_FACTION_DYNAMIC(VAR) GET_VAR_DYNAMIC(LOGIVIC_VAR_DYNAMIC(VAR,"Faction"),"")

#define CREATE_LOGI_TYPE(NAME) \
    SET_ROLES(NAME,[]); \
    SET_GROUPS(NAME,[]); \
    SET_VEHICLES(NAME,[]); \
    ADD_LOGI_TO_REGISTRY(NAME)
