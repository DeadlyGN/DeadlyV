obj/Namek_Corpse
	icon = 'Namekian Warrior.dmi'
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
			else usr<< "You do not have permission to loot that corpse!"
mob
	Monster
		Namek_Warrior
			name = "{NPC} Namekian Warrior"
			icon = 'Namekian Warrior.dmi'
			powerlevel = 7500000
			powerlevel_max = 7500000
			ki = 0
			ki_max = 0
			speed = 2
			strength = 850000
			defence = 2500000
			critical = 15
			karma = "Good"
			race = "Namekian Warrior"
			level = 50
			zenni = 50
			pk = 1
			exp = 1250
			tnl = 1250
			Del()
				if(prob(0.5))
					var/obj/M = new/obj/Namek_Corpse
					M.loc = src.loc
					M.looter = src.killer
					var/obj/Equipment/Chest/Gi/O = new
					var/type = rand(1,4)
					if(type)
						O.name = "Gi of Strength"
						O.icon = 'Gi of Strength.dmi'
						O.gi = 'Gi of Strength.dmi'
						O.str_bonus += 30000
					if(type == 2)
						O.name = "Gi of Defence"
						O.icon = 'Gi of Defence.dmi'
						O.gi = 'Gi of Defence.dmi'
						O.def_bonus += 30000
					if(type == 3)
						O.name = "Gi of Power"
						O.icon = 'Gi of Power.dmi'
						O.gi = 'Gi of Power.dmi'
						O.pl_bonus += 100000
					if(type == 4)
						O.name = "Gi of Ki"
						O.icon = 'Gi of Ki.dmi'
						O.gi = 'Gi of Ki.dmi'
						O.ki_bonus += 100000
					O.has_stats = 1
					M.contents += O
				..()
			Wander()
				while(src)
					var/Found = FALSE
					for(P in oview(7))
						if(P.karma == "Evil")
							step_towards(src,P)
							Found = TRUE
							break
					if(Found != TRUE) sleep(17)
					sleep(17)
mob
	AI
		Dead_Namek
			icon = 'npcs.dmi'
			icon_state = "Dying Namek"