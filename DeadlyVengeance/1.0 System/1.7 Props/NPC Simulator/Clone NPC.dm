mob
	Monster
		Clone_Simulator_NPC
			name = "{NPC} Clone Simulator Fighter"
			layer = 8
			speed = 5
			critical = 2
			race = "AI"
			zenni = 200
			pk = 1
			exp = 100
			tnl = 100000
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
					sleep(17)*/