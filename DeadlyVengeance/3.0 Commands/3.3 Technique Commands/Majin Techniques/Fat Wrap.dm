mob/var/tmp/
 icon/fat_wrap = 'Fat Wrapped.dmi'
 wrapped = 0
 wrap_lock = 0
 WRAP_delay = 0
obj/Techniques/Majin/Fat_Wrap
	verb/Fat_Wrap()
		set category = "Techniques"
		if(usr.doing)
			usr<< "You're already doing something!"
			return
		if(usr.buku) return
		if(usr.safe||usr.dead)
			usr<< "You're currently safe and cannot attack."
			return
		if(usr.wrap_lock)
			usr<< "Your body is still recovering."
			return
		if(usr.ki_lock)
			usr<< "Cannot use this Technique at this time"
			return
		if(!usr.pk)
			usr<< "You're not a Combatant!"
			return
		for(var/area/house/S in view(4))
			usr<< "They're in a Safe Zone!"
			return
		for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6))
			usr<< "They're in a Safe Zone!"
			return
		for(var/turf/Planet_Gravitys/King_Kai/D in view(6))
			usr<< "They're in a Safe Zone!"
			return
		usr.WRAP_delay++
		usr.wrap_lock = 1
		usr.Fat_Wrap_Shoot()
		spawn(usr.WRAP_delay*10)
			if(usr.WRAP_delay>0) usr.WRAP_delay--
			usr.wrap_lock=0
		usr.afk_time = 0
mob
	proc
		Fat_Wrap_Shoot()
			var/obj/H = new/obj/Fat_Wrap
			var/ki_cost = round(src.ki_max * 0.15)
			if(src.ki >= ki_cost)
				if(!src.doing)
					if(!src.doing) src.doing ++
					src.ki -= ki_cost
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					H:dir = src.dir
					H:loc = src.loc
					spawn(50) src.wrap_lock = 0
					while(H)
						step(H,H:dir)
						if(!H)return
						var/T = H:loc
						var/turf/K=T
						var/obj/L=T
						var/area/U=T
						if((U.density||K.density||L.density)&&!istypemulti(K,/turf/Island_Edge/,/turf/Namek_Island_Edge/))
							del(H)
							break
						if(istype(U,/area/house/))
							del(H)
							break
						for(var/mob/M as mob in T)
							for(var/area/house/S in view(1,M))
								del(H)
								del H
								return
							for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(1,M))
								del(H)
								del H
								return
							for(var/turf/Planet_Gravitys/King_Kai/D in view(1,M))
								del(H)
								del H
								return
							if(M.dead||M.safe)
								del(H)
								del H
								return
							if(M == src && src == M)
								del(H)
								del H
								return
							if(!M.dead && !M.safe && M.pk && !M.tourny)
								M.overlays += fat_wrap
								M << "\red [src.name]'s Fat Wrap tangles around your Body!"
								M.frozen = 1
								M.wrapped = 1
								del(H)
								sleep(150)
								if(!M)return
								M.frozen = 0
								M.wrapped = 0
								M.overlays -= fat_wrap
								return
							del(H)
						sleep(1)
obj/Fat_Wrap
	icon = 'Fat Wrap.dmi'