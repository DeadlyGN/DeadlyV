obj/tech
	var/ki_damage=0
	New(mob/o)
		..()
		src.Oowner=o
		spawn(113) del src
	Move()
		for(var/area/I in view(1,src))if(istype(I,/area/house/))del src
		return ..()
	Cross(atom/movable/A)
		if(!ismob(A)&&istype(A,/obj/tech/))
			Explode(new /Effect/BasicBoom(src.loc,1,3))
			for(var/mob/m in ExplodeDamage(src.loc,5,src.ki_damage))
				if(src.Oowner!=m) m.SmallKiDeathCheck(src.Oowner)
			Explode(new /Effect/BasicBoom(A.loc,1,3))
			for(var/mob/m in ExplodeDamage(src.loc,5,A:ki_damage))
				if(A:Oowner!=m) m.SmallKiDeathCheck(A:Oowner)
			del(A)
			del(src)
			return FALSE
		return ..()
obj/trail
	layer = 23
	New()
		animate(src,alpha=0,time=5)
		spawn(5) del src