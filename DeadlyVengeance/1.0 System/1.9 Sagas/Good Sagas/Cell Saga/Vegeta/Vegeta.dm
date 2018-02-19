mob
	Saga
		Vegeta_4
			name = "{Saga} Vegeta"
			icon = 'Vegeta SSJ.dmi'
			it_lock = 1
			powerlevel = 55000000000
			powerlevel_max = 55000000000
			ki = 43000000000
			ki_max = 43000000000
			speed = 3.5
			strength = 5270000000
			defence = 3000000000
			critical = 20
			karma = "Good"
			race = "Saiyan"
			level = 300
			zenni = 500
			pk = 1
			exp = 28000
			tnl = 28000
			/*Wander()
				while(src) //While the mob is still here...
					var/Found = FALSE  //False is a predefined variable that means 0.  True means 1.  This is the same as putting var/Found = 0
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