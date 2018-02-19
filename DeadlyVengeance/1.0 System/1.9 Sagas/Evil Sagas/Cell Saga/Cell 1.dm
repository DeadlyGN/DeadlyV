mob
	Saga
		Cell_1
			name = "{Saga} Cell"
			icon = 'Cell 1.dmi'
			it_lock = 1
			powerlevel = 18000000000
			powerlevel_max = 18000000000
			ki = 10000000000
			ki_max = 10000000000
			speed = 2.5
			strength = 1276000000
			defence = 1276000000
			critical = 20
			karma = "Evil"
			race = "Bio-Android"
			level = 300
			zenni = 500
			pk = 1
			exp = 22000
			tnl = 22000
mob
	Monster
		Cell_1
			name = "{NPC} Cell"
			icon = 'Cell 1.dmi'
			density = 1
			powerlevel = 18000000
			powerlevel_max = 18000000
			ki = 10000000
			ki_max = 10000000
			speed = 2.5
			strength = 1276000
			defence = 1276000
			critical = 20
			karma = "Evil"
			race = "Bio-Android"
			level = 300
			zenni = 500
			pk = 1
			exp = 22000
			tnl = 22000
			/*Wander()
				while(src)
					var/Found = FALSE
					for(P in oview(7))
						if(prob(10 && src.ki > (round(src.ki_max * 0.25))))
							view(4) << "<font color = white>[src.name]:</font> Lets see how you handle this!"
							Kamehameha_Shoot()
						step_towards(src,P)
						if(P in oview(1))continue
						else src.Ki_Blast_Shoot()
						Found = TRUE
						break
					if(Found != TRUE)
						sleep(17)
					sleep(17)*/