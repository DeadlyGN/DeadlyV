mob/var/tmp/
 distructo_disk = 'Distructo Disk Charge.dmi'
 DD_delay= 0
mob/learn
	verb
		Distructo_Disk()
			set category = "Techniques"
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
				src<< "You must wait before using this!"
				return
			if(src.wrapped)
				src<< "Your ki has been contained in the goo!"
				return
			if(src.safe||src.dead)
				src<< "You're currently safe and cannot attack."
				return
			if(src.monkey)
				src<<"You cannot use this whilist in oozaru."
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
			for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/King_Kai/D in view(6))
				src<< "They're in a Safe Zone!"
				return
			spawn() Distructo_Disk_Shoot()
			src.afk_time = 0
mob
	proc
		Distructo_Disk_Shoot()
			var/obj/tech/H = new/obj/tech/Distructo_Disk(o=src)
			H.ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 0.25)
			var/ki_cost = round(src.ki_max * 0.34)
			if(src.ki >= ki_cost)
				if(!src.doing)
					if(!src.doing) src.doing ++
					src.ki_lock = 1
					spawn(10) src.ki_lock = 0
					src.DD()
					src.ki -= ki_cost
					src.overlays += distructo_disk
					view(6) << "<font color = white>[src]:</font> Distructo..."
					sleep(16)
					view(6) << "<font color = white>[src]:</font> DISK..."
					sleep(15)
					view(6) << "<font color = white>[src]:</font> HA!!!"
					src.overlays -= distructo_disk
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
							var/absorb_max = round(M.powerlevel_max)
							var/ki_absorbed = round(M.ki_shield_strength - H.ki_damage)
							if(M == src && src == M)
								del(H)
								del H
								return
							if(!M.dead && !M.safe && M.pk)
								M << "\red [src.name]'s Distructo Disk slams into you"
								src<<"\red Your Distructo Disk slams into [M]!"
								Explode(new /Effect/BasicBoom(M.loc,1,3))
								if(src.doing) src.doing --
								src.frozen = 0
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
											src<<"\red Your Distructo Disk was absorbed by [M]!"
											M.gooda+=1
											M.UTBA()
											M.ki += H.ki_damage; if(M.ki>M.ki_max*1300){ M.KiExplosion() }
											return
										else M << "\red You tried to absorb [src]'s Distructo Disk, but it was too strong!"
								M.Damage(H.ki_damage)
								M.BigKiDeathCheck(src)
							del(H)
						sleep(1)
obj/tech/Distructo_Disk
	icon = 'Distructo Disk.dmi'
mob/proc/DD()
	src.DD_delay = 1
	spawn(60)
	src.DD_delay = 0