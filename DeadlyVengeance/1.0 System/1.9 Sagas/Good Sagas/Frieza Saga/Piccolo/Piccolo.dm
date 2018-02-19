mob
	Saga
		Piccolo_3
			name = "{Saga} Piccolo"
			icon = 'Piccolo.dmi'
			it_lock = 1
			powerlevel = 650000000
			powerlevel_max = 650000000
			ki = 900000000
			ki_max = 900000000
			speed = 2
			strength = 70000000
			defence = 180000000
			critical = 15
			karma = "Good"
			race = "Namek"
			level = 65
			zenni = 150
			pk = 1
			exp = 5000
			tnl = 5000
			/*proc/Wander()
				while(src) //While the mob is still here...
					var/Found = FALSE  //False is a predefined variable that means 0.  True means 1.  This is the same as putting var/Found = 0
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
						sleep(17)
					sleep(11)*/