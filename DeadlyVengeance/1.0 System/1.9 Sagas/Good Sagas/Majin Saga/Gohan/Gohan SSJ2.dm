mob
	Saga
		Gohan_5
			name = "{Saga} Gohan"
			icon = 'Gohan Adult SSJ2.dmi'
			it_lock = 1
			powerlevel = 70000000000
			powerlevel_max = 70000000000
			ki = 75000000000
			ki_max = 75000000000
			speed = 2
			strength = 1127000000
			defence = 727000000
			critical = 20
			karma = "Good"
			race = "Half Saiyan"
			level = 350
			zenni = 500
			pk = 1
			exp = 38000
			tnl = 38000
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