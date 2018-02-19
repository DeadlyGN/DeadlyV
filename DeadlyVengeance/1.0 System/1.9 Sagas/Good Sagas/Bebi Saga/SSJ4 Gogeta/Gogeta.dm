mob
	Monster
		Gogeta
			name = "{NPC} SSJ4 Gogeta"
			icon = 'Gogeta.dmi'
			powerlevel = 700000000000
			powerlevel_max = 700000000000
			ki = 400000000000
			ki_max = 400000000000
			speed = 1
			strength = 86000000000
			defence = 43000000000
			critical = 20
			karma = "Good"
			race = "Saiyan"
			level = 220000000
			zenni = 500000000
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