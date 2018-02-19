mob/var/bubbles_caught = 0
mob
	AI
		Bubbles
			name = "{NPC} Bubbles"
			icon = 'npcs.dmi'
			icon_state = "Bubbles"
			karma = "Good"
			race = "Monkey"
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
						sleep(12)
					sleep(9)
			verb/Catch()
				set src in oview(8)
				set category = "Actions"
				if(src in get_step(usr,usr.dir))
					if(usr.bubbles_caught)
						usr<< "You have already caught Bubbles!"
					else
						usr<< "You have caught bubbles!"
						usr.fatigue_max += 25000
						usr.kk_quest_training ++
						usr.bubbles_caught = 1