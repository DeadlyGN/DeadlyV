mob
	Saga
		Goku_10
			name = "{Saga} Kid Goku"
			icon = 'Goku SSJ3.dmi'
			powerlevel = 150000000000
			powerlevel_max = 150000000000
			ki = 100000000000
			ki_max = 100000000000
			speed = 2
			strength = 14000000000
			defence = 90000000000
			critical = 20
			karma = "Good"
			race = "Saiyan"
			level = 720
			zenni = 500
			pk = 1
			exp = 50000
			tnl = 50000
			/*proc/Wander()
				while(src)
					var/Found = FALSE
					var/powering_up = 0
					for(P in oview(6))
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
							Found = TRUE
							break
					if(Found != TRUE)
						sleep(14)
					sleep(11)*/