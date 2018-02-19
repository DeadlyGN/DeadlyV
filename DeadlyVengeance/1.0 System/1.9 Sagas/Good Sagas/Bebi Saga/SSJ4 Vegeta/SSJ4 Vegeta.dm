mob
	Saga
		SSJ4_Vegeta
			name = "{Saga} SSJ4 Vegeta"
			icon = 'Vegeta Ss4.dmi'
			powerlevel = 70000000000
			powerlevel_max = 70000000000
			ki = 40000000000
			ki_max = 40000000000
			speed = 1.3
			strength = 8600000000
			defence = 4300000000
			critical = 20
			karma = "Good"
			race = "Saiyan"
			level = 2200000
			zenni = 5000000
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