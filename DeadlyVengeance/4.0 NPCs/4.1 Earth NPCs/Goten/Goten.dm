mob/var/obtained_helmet = 0
mob
	AI
		Goten
			name = "{NPC} Goten"
			icon = 'Goten.dmi'
			powerlevel_max = 100
			ki = 0
			ki_max = 0
			karma = "Good"
			race = "Half Saiyan"
			level = 5
			exp = 175
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
						sleep(13)
					sleep(13)
			verb/Talk()
				set src in oview(4)
				set category = "Actions"
				if(src in get_step(usr,usr.dir))
					if(usr.obtained_helmet)
						usr<< "<font color = white>Goten:</font> Hiya [usr.name]!"
					else
						src.frozen = 1
						usr<< "<font color = white>Goten:</font> Hi [usr.name]! So Gohan needs their helmet back?"
						sleep(17)
						usr<< "<I>\white Goten lets out a long sigh as he hands you the helmet"
						src.icon = 'Goten No Helmet.dmi'
						sleep(17)
						usr<< "<font color = white>Goten:</font> There you go. Big brother always spoils my fun"
						usr.obtained_helmet = 1
						src.frozen = 0
						spawn(300) src.icon = 'Goten.dmi'