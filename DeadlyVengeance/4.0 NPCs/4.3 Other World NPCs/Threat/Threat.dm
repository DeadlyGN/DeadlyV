mob
	Monster
		Threat
			name = "{NPC} Yakon"
			icon = 'npcs.dmi'
			icon_state = "Majin"
			powerlevel = 550000000000
			powerlevel_max = 5500000000
			ki = 50000000000000
			ki_max = 50000000000000
			speed = 500000000000
			strength = 40000000000
			defence = 30000000000
			critical = 30
			karma = "Evil"
			race = "Threat"
			level = 85
			zenni = 1500
			pk = 1
			exp = 150
			tnl = 150
			/*Wander()
				while(src)
					var/Found = FALSE
					for(P in oview(7))
						step_towards(src,P)
						if(P in oview(1))continue
						else src.Ki_Blast_Shoot()
						Found = TRUE
						break
					if(Found != TRUE)
						sleep(17)
					seep(17)*/