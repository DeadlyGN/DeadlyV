mob
	Monster
		Simulator_NPC
			name = "{NPC} Simulator Fighter"
			powerlevel = 750
			powerlevel_max = 750
			ki = 0
			ki_max = 0
			speed = 5
			strength = 50
			defence = 15
			critical = 2
			race = "AI"
			level = 15
			zenni = 200
			pk = 1
			exp = 100
			tnl = 100
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
							if(src.attacker == P)
								step_towards(src,P)
								if(P in oview(1))continue
								else src.Ki_Blast_Shoot()
								Found = TRUE
								break
					if(Found != TRUE) sleep(17)
					sleep(11)*/