mob
	Saga
		Android_18
			name = "{Saga} Android 18"
			icon = 'Android 18.dmi'
			it_lock = 1
			powerlevel = 13000000000
			powerlevel_max = 13000000000
			ki = 13000000000
			ki_max = 13000000000
			speed = 2.5
			strength = 850000000
			defence = 850000000
			critical = 20
			karma = "Evil"
			race = "Android"
			level = 250
			zenni = 500
			pk = 1
			exp = 17500
			tnl = 17500
mob
	Monster
		Android_18
			name = "{NPC} Android 18"
			icon = 'Android 18.dmi'
			powerlevel = 25000000
			powerlevel_max = 25000000
			ki = 10000000
			ki_max = 10000000
			speed = 2.5
			strength = 1250000
			defence = 1250000
			critical = 45
			karma = "Evil"
			race = "Android"
			level = 250
			zenni = 500
			pk = 1
			exp = 17500
			tnl = 17500
			/*Wander()
				while(src)
					var/Found = FALSE
					var/powering_up = 0
					for(P in oview(7))
						if(src.powerlevel < src.powerlevel_max * 0.10 && powering_up < 3)
							powering_up ++
							step_away(src,P)
							src.powering = 1
							if(!src.doing) src.doing ++
							src.Icon_State("enrage")
							src.overlays += src.aura
							src.Powering_PL()
						else
							step_towards(src,P)
							if(P in oview(1))continue
							else src.Ki_Blast_Shoot()
							Found = TRUE
							break
					if(Found != TRUE)
						sleep(17)
					sleep(11)*/