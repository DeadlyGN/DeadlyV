mob
	Saga
		Goku_SSJ4
			name = "{Saga} Goku"
			icon = 'Goku SSJ4.dmi'
			powerlevel = 250000000000
			powerlevel_max = 250000000000
			ki = 180000000000
			ki_max = 180000000000
			speed = 2
			strength = 50000000000
			defence = 35000000000
			critical = 20
			karma = "Good"
			race = "Saiyan"
			level = 1220
			zenni = 500
			pk = 1
			exp = 17500
			tnl = 17500
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