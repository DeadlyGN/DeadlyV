mob/var/tmp//provided by good ol' Lummox JR
    turf/last_xp_area
    turf/last_kill_area
    xp_area_gains = 0
    kill_area_gains = 0
mob/proc/CanGainXP()
    if(!loc) return 0
    if(!last_xp_area || last_xp_area.z!=loc.z || \
      get_dist(last_xp_area,loc) > 10)
        last_xp_area = loc
        xp_area_gains = 1
        return 1
    if(xp_area_gains >= 1500) return 0
    ++xp_area_gains
    return 1
mob/proc/CanGainKill()
    if(!loc) return 0
    if(!last_kill_area || last_kill_area.z!=loc.z || \
      get_dist(last_kill_area,loc) > 15)
        last_kill_area = loc
        kill_area_gains = 1
        return 1
    if(kill_area_gains >= 25) return 0
    ++kill_area_gains
    return 1