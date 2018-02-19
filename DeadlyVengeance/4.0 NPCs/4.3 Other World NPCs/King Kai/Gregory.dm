mob/var/gregory_hit = 0
mob
	AI
		Gregory
			name = "{NPC} Gregory"
			icon = 'npcs.dmi'
			icon_state = "Gregory"
			karma = "Good"
			race = "Buggy"
			level = 5
			exp = -9000000000000
			tnl = 175
			var/mob/PC/P
			New()
				. = ..()
				spawn()
					Wander()
			proc/Wander()
				while(src)
					var/Found = FALSE
					for(P in oview(7)).
						step_away(src,P)
						Found = TRUE
						break
					if(Found != TRUE)
						sleep(9)
					sleep(7)
			verb/Hit()
				set src in oview(8)
				set category = "Actions"
				if(src in get_step(usr,usr.dir))
					if(usr.gregory_hit)
						usr<< "You have already hit Gregory!"
					else
						usr<< "You hit Gregory!"
						usr.strength_max += 250000
						usr.kk_quest_training ++
						usr.gregory_hit = 1