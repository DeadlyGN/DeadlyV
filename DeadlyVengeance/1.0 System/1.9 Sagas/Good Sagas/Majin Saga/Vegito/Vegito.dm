mob
	Saga
		Vegito
			name = "{Saga} Vegito"
			icon = 'Vegito.dmi'
			it_lock = 1
			powerlevel = 150000000000
			powerlevel_max = 150000000000
			ki = 100000000000
			ki_max = 100000000000
			speed = 2
			strength = 15000000000
			defence = 90000000000
			critical = 20
			karma = "Good"
			race = "Saiyan"
			level = 440000
			zenni = 500000
			pk = 1
			exp = 45
			tnl = 4
			chromosome = "Legend"
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
						sleep(14)
					sleep(11)*/
			Del()
				if(form=="Super Saiyan 3") return ..()
				loc = oldloc
				doing=0
				KO=0
				powerlevel=1
				Saiyan_Trans()