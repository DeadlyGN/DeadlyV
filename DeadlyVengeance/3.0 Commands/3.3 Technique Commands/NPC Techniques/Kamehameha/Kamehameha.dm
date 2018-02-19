mob/var/
 guto=0
 learn_kamehameha = 0
 learn_cont_kame = 0
 kamehameha_charge = 'Kamehameha Charge.dmi'
mob/learn/
	verb
		Kamehameha()
			set category = "Techniques"
			if(src.doing)
				src<< "You're already doing something!"
				return
			if(src.monkey)
				src<< "You cannot use this skill at the moment."
				return
			if(src.wrapped)
				src<< "Your ki has been contained in the goo!"
				return
			if(src.buku) return
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
			for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/King_Kai/D in view(6))
				src<< "They're in a Safe Zone!"
				return
			Kamehameha_Shoot()
			if(src.tourny) GiveMedal("Gotta use the Original",src)
			src.afk_time = 0
mob/learn/
	verb
		Continuous_Kamehameha()
			set category = "Techniques"
			if(src.doing)
				src<< "You're already doing something!"
				return
			if(src.monkey)
				src<< "You cannot use this skill at the moment."
				return
			if(src.wrapped)
				src<< "Your ki has been contained in the goo!"
				return
			if(src.safe||src.dead||src.buku)return
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
			switch(alert(usr,"How Many?","Continuous Kamehameha","3","4","5"))
				if("3")
					Kamehameha_Shoot()
					Cont_Kame()
					Cont_Kame()
				if("4")
					Kamehameha_Shoot()
					Cont_Kame()
					Cont_Kame()
					Cont_Kame()
				if("5")
					Kamehameha_Shoot()
					Cont_Kame()
					Cont_Kame()
					Cont_Kame()
					Cont_Kame()
			src.afk_time = 0
mob
	proc
		Kamehameha_Shoot()
			var/obj/tech/H = new/obj/tech/Kamehameha(o=src)
			H.ki_damage = round(src.powerlevel_max * 0.75)
			var/ki_cost = round(src.ki_max * 0.59)
			if(src.ki >= ki_cost)
				if(!src.doing)
					src.ki_lock = 1
					spawn(20) src.ki_lock = 0
					if(!src.doing) src.doing ++
					src.ki -= ki_cost
					src.overlays += kamehameha_charge
					view(6) << "<font color = white>[src]:</font> Ka..."
					sleep(13)
					view(6) << "<font color = white>[src]:</font> Me..."
					sleep(13)
					view(6) << "<font color = white>[src]:</font> Ha..."
					sleep(13)
					view(6) << "<font color = white>[src]:</font> ME..."
					sleep(13)
					view(6) << "<font color = white>[src]:</font> HA!!!"
					src.overlays -= kamehameha_charge
					src.Icon_State("attack")
					sleep(3)
					src.Icon_State("")
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					if(!H)return
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
								M << "\red [src.name]'s Kamehawave slams into you"
								src<<"\red Your Kamehawave slams into [M]!"
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
											src<<"\red Your Kamehawave was absorbed by [M]!"
											M.gooda+=1
											M.UTBA()
											M.ki += H.ki_damage; if(M.ki>M.ki_max*1300){ M.KiExplosion() }
											return
										else M << "\red You tried to absorb [src]'s Kamehawave, but it was too strong!"
								M.Damage(H.ki_damage)
								M.BigKiDeathCheck(src)
							del(H)
						sleep(1)
mob
	proc
		Cont_Kame()
			var/obj/tech/H = new/obj/tech/Kamehameha(o=src)
			H.ki_damage = round(src.powerlevel_max * 0.75)
			var/ki_cost = round(src.ki_max * 0.12)
			if(src.ki >= ki_cost)
				src.ki_lock = 1
				spawn(20) src.ki_lock = 0
				if(!src.doing) src.doing ++
				src.ki -= ki_cost
				src.overlays += kamehameha_charge
				view(6) << "<font color = white>[src]:</font> HA!!!"
				src.overlays -= kamehameha_charge
				if(src.doing) src.doing --
				spawn(5) src.frozen = 0
				if(!H)return
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
							M << "\red [src.name]'s Kamehawave slams into you"
							src<<"\red Your Kamehawave slams into [M]!"
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
										src<<"\red Your Kamehawave was absorbed by [M]!"
										M.gooda+=1
										M.UTBA()
										M.ki += H.ki_damage; if(M.ki>M.ki_max*1300){ M.KiExplosion() }
										return
									else M << "\red You tried to absorb [src]'s Kamehawave, but it was too strong!"
							M.Damage(H.ki_damage)
							M.BigKiDeathCheck(src)
						del(H)
					sleep(1)
obj/tech/Kamehameha
	icon = 'Kamehameha.dmi'