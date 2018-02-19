mob/learn
	verb/Ki_Blast()
		set category = "Techniques"
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.ki_lock)
			src<< "Cannot use this Technique at this time"
			return
		if(src.safe||src.dead)
			src<< "You're currently safe and cannot attack."
			return
		if(!src.pk)
			src<< "You're not a Combatant!"
			return
		for(var/area/house/S in view(4))
			src<< "They're in a Safe Zone!"
			return
		for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6))
			src<< "They're in a Safe Zone!"
			return
		for(var/turf/Planet_Gravitys/King_Kai/D in view(6))
			src<< "They're in a Safe Zone!"
			return
		if(prob(30))view(6) << "<font color=white>[src.name]: </font>Ha!"
		spawn() Ki_Blast_Shoot()
		src.afk_time = 0
mob
	proc
		Ki_Blast_Shoot()
			var/obj/tech/H = new/obj/tech/Ki_Blast(o=src)
			H.ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 0.25)
			var/ki_cost = round(src.ki_max * 0.23)
			if(src.ki >= ki_cost)
				if(!src.doing)
					if(!src.doing) src.doing ++
					var/tmp/currentstate=src.icon_state
					src.Icon_State("attack")
					sleep(11)
					src.Icon_State(currentstate)
					src.ki -= ki_cost
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					if(H && isobj(H))
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
							var/absorb_max = round(M.powerlevel_max)
							var/ki_absorbed = round(M.ki_shield_strength - H.ki_damage)
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
								if(prob(M.reflect))
									src.Damage(round(H.ki_damage * 2))
									src<< "\red [M.name] deflects your ki blast right back a you!"
									M << "\green You deflect [src]'s ki blast right back at them!"
									src.SmallKiDeathCheck(src)
									if(src.doing) src.doing --
									src.frozen = 0
									return
								else
									if(M.ki_shield)
										if(ki_absorbed >= 1)
											src<< "<font color = #00C3ED>[M]'s ki shield absorbed the attack's damage!"
											M << "<font color = #00C3ED>Your ki shield absorbed [src]'s attack!"
										H.ki_damage=round(ki_absorbed)
										M.ki_shield_strength -= round(H.ki_damage)
									else
										if(M.absorbing)
											if(absorb_max > H.ki_damage)
												M << "\red [src]'s attack hits you, but you managed to absorb the energy!"
												src<<"\red Your ki blast was absorbed by [M]!"
												M.gooda+=1
												M.UTBA()
												M.ki += H.ki_damage; if(M.ki>M.ki_max*1300){ M.KiExplosion() }
												return
											else M << "\red You tried to absorb [src]'s ki blast, but it was too strong!"
								M.Damage(H.ki_damage)
								M.SmallKiDeathCheck(src)
								if(src.doing) src.doing --
								src.frozen = 0
							del(H)
						sleep(1)
obj/tech/Ki_Blast
	icon = 'Ki Attack.dmi'