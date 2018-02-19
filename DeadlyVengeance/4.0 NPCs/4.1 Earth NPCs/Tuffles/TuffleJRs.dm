mob
	Monster
		Tuffle_Infected
			name = "{NPC} Tuffle Infected"
			icon = 'Bebi.dmi'
			color = rgb(130,130,130)
			powerlevel = 1750000000
			powerlevel_max = 1750000000
			ki = 10000000
			ki_max = 10000000
			speed = 3
			strength = 5000000000
			defence = 1500000000
			critical = 2
			karma = "Evil"
			race = "Tuffle"
			level = 15000000
			zenni = 150000
			pk = 1
			exp = 10000
			tnl = 10000
			New()
				..()
				var/Boost=1
				verbs+=/mob/learn/verb/Trap_Shooter
				if(Boost>1) Level_Up(Boost)
				powerlevel*=Boost*100
				powerlevel_max*=Boost*100
				ki*=Boost*100
				ki_max*=Boost*100
				defence*=Boost*100
				defence_max*=Boost*100
				strength*=Boost*100
				strength_max*=Boost*100
			Wander()
				spawn()
					while(src)
						var{Found = FALSE}
						for(P in oview(7))
							if(!attacker||attacker == P)
								if(P in get_step(src,get_dir(src,P))) Attack2(P)
								else
									step_to(src,P,1)
									if(!get_dist(src,P)<=1&&dir<5) call(src,"Trap Shooter")()
								Found = TRUE
								break
						if(Found != TRUE){ sleep(18); if(src.loc!=src.spawnin) step_to(src,spawnin)}
						sleep(round(speed,0.1))