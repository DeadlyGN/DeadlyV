mob
	Monster
		Vegito
			name = "{NPC} Vegito"
			icon = 'Vegito.dmi'
			hair = "Vegeta"
			powerlevel = 60000000
			powerlevel_max = 60000000
			ki = 50000000
			ki_max = 50000000
			speed = 4
			strength = 50000000
			defence = 50000000
			critical = 3
			karma = "Good"
			level = 95
			zenni = 1500
			pk = 1
			exp = 1500
			tnl = 1500
			chromosome = "Legend"
			race = "Saiyan"
			/*Wander()
				while(src)
					var/Found = FALSE
					for(P in oview(7))
						step_towards(src,P)
						if(P in oview(1))continue
						else src.()
						Found = TRUE
						break
					if(Found != TRUE) sleep(17)
					sleep(17)*/
			Del()
				if(form=="Super Saiyan 2") return ..()
				doing=0
				KO=0
				powerlevel=1
				Saiyan_Trans()