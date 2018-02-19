obj/Hench_3_Corpse
	icon = 'Henchman 3.dmi'
	icon_state = "Loot"
	verb
		Loot()
			set src in oview(1)
			set category = null
			if(src.looter == usr.name)
				if(src.contents != null && usr.inven_min < usr.inven_max)
					for(var/obj/O in src.contents)
						usr<< "You loot: <I>\blue [O.name]</I>"
					usr.contents += src.contents
					sleep(17)
					del(src)
			else
				usr<< "You do not have permission to loot that corpse!"
				return
mob
	Monster
		Goon_3
			name = "{NPC} Frieza's Henchman"
			icon = 'Henchman 3.dmi'
			powerlevel = 2500000
			powerlevel_max = 2500000
			ki = 0
			ki_max = 0
			speed = 2
			strength = 1250000
			defence = 1250000
			critical = 3
			karma = "Evil"
			race = "Henchman"
			level = 25
			zenni = 500
			pk = 1
			exp = 750
			tnl = 750
			Del()
				if(prob(0.5))
					var/obj/M = new/obj/Hench_3_Corpse
					M.loc = src.loc
					M.looter = src.killer
					var/obj/Equipment/Chest/Gi/O = new
					var/type = rand(1,4)
					if(type)
						O.name = "Gi of Strength"
						O.icon = 'Gi of Strength.dmi'
						O.gi = 'Gi of Strength.dmi'
						O.str_bonus += 5000
					if(type == 2)
						O.name = "Gi of Defence"
						O.icon = 'Gi of Defence.dmi'
						O.gi = 'Gi of Defence.dmi'
						O.def_bonus += 5000
					if(type == 3)
						O.name = "Gi of Power"
						O.icon = 'Gi of Power.dmi'
						O.gi = 'Gi of Power.dmi'
						O.pl_bonus += 20000
					if(type == 4)
						O.name = "Gi of Ki"
						O.icon = 'Gi of Ki.dmi'
						O.gi = 'Gi of Ki.dmi'
						O.ki_bonus += 20000
					O.has_stats = 1
					M.contents += O
				..()

			/*Wander()
				while(src)
					var/Found = FALSE
					for(P in oview(7))
						step_towards(src,P)
						Found = TRUE
						break
					if(Found != TRUE)
						sleep(17)
					sleep(17)*/