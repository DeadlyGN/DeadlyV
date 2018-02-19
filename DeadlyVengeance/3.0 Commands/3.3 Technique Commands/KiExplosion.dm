mob/proc/KiExplosion()
	var/damage=src.ki
	src.ki=0
	Explode(new /Effect/BasicBoom(src.loc,1,3))
	for(var/mob/m in ExplodeDamage(src.loc,5,damage)) spawn() if(src!=m) m.SmallKiDeathCheck(src)
proc/ExplodeDamage(var/turf/Center,var/Distance=0,var/damage=0)
	var/list/l=new()
	for(var/mob/M in view(Distance,Center))
		var/Dist=get_dist(M,Center)
		if(Dist) M.Damage(damage/Dist)
		else M.Damage(damage*2)
		l.Add(M)
	return l