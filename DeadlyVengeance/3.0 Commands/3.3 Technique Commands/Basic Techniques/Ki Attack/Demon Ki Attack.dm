mob/learn
	verb/Demon_Ki_Blast()
		set category = "Techniques"
		set name = "Hell Blitz"
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.safe||src.dead)
			src<< "You're currently safe and cannot attack."
			return
		if(src.ki_lock)
			src<< "Cannot use this Technique at this time"
			return
		if(!src.pk)
			src<< "You're not a Combatant!"
			return
		for(var/area/house/S in view(4))
			src<< "They're in a Safe Zone!"
			return
		if(prob(30))
			view(6) << "<font color=white>[src.name]: </font>Ha!"
		spawn() Demon_Ki_Blast_Shoot()
		src.afk_time = 0
mob
	proc
		Demon_Ki_Blast_Shoot()
			var/obj/tech/H = new/obj/tech/Demon_Ki_Blast(o=src)
			H.ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 0.40)
			var/ki_cost = round(src.ki_max * 0.24)
			if(src.ki >= ki_cost)
				if(!src.doing)
					if(!src.doing) src.doing ++
					src.Icon_State("attack")
					sleep(11)
					src.Icon_State("")
					src.ki -= ki_cost
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					if(H) H:dir = src.dir
					if(H) H:loc = src.loc
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
							//var/absorb_max = round(M.powerlevel_max)
							//var/ki_absorbed = round(M.ki_shield_strength - H.ki_damage)
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
							if(M == src && src == M)
								del(H)
								del H
								return
							if(!M.dead && !M.safe && M.pk)
								M.Damage(round(H.ki_damage))
								if(prob(30))
									M << "\red [src.name]'s Hell Blitz slams into you"
								M.SmallKiDeathCheck(src)
								if(src.doing) src.doing --
								src.frozen = 0
								return
							else del(H)
						sleep(2)
obj/tech/Demon_Ki_Blast
	icon = 'kiatc.dmi'