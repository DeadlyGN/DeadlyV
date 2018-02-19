mob/var/tmp/sim_delay = 0
obj/NPC_Generator
	Computer
		icon = 'Generator.dmi'
		density = 1
		verb
			Start_Simulation()
				set category = "Training"
				set src in oview(3)
				if(!usr.pk){ usr<<"<font color=blue>Error: </font>You must be a combatent first!"; return; }
				if(usr.sim_delay)
					usr<< "<font color=blue>Error: </font>You must wait before making another simulation"
					return
				switch(alert(usr,"Do you wish to create a Simulation Fighter?","Simulator","Yes","No"))
					if("Yes")
						if(usr.sim_delay) return
						usr.sim_delay ++
						spawn(200){ if(usr.sim_delay){ usr.sim_delay -- }}
						var/npc_level = input("What Level do you wish to make the Simulation Fighter?")as num
						if(npc_level > usr.level)
							usr<<"<font color=white>AI:</font> Requested setting too high, lowering..."
							npc_level=usr.level
							usr<<"<font color=white>AI:</font> Enemy level set to <font color=blue>[npc_level]"
						var/mob/Monster/Simulator_NPC/N = new
						N.Give_Levels(npc_level-1)
						N.speed = 1.2
						var/race = rand(1,5)
						var/skin = rand(1,3)
						var/hair = rand(1,6)
						switch(race)
							if(1)
								N.icon = 'Bebi - Form 1.dmi'
							if(2)
								N.icon = 'Bio Android - Form 1.dmi'
							if(3)
								N.icon = 'Changling - Form 1.dmi'
							if(4)
								N.icon = 'Namek - Normal.dmi'
							if(5)
								N.icon = 'Majin - Form 1.dmi'
							if(6)
								switch(skin)
									if(1)
										N.icon = 'Male - White.dmi'
									if(2)
										N.icon = 'Male - Tan.dmi'
									if(3)
										N.icon = 'Male - Dark.dmi'
								switch(hair)
									if(1)
										N.overlays += N.goku_hair
									if(2)
										N.overlays += N.vegeta_hair
									if(3)
										N.overlays += N.gohan_teen_hair
									if(4)
										N.overlays += N.gohan_adult_hair
									if(5)
										N.overlays += N.future_gohan_hair
									if(6)
										N.overlays += N.trunks_long_hair
						N.loc = locate(usr.x,usr.y-1,usr.z)
						N.spawnin = null
							/*if("Clone")
								var/mob/Monster/Clone_Simulator_NPC/N = new
								N.level = usr.level
								N.name = "{NPC} [usr.name]'s Clone"
								N.powerlevel = usr.powerlevel
								N.powerlevel_max = usr.powerlevel_max
								N.ki = usr.ki
								N.ki_max = usr.ki_max
								N.strength = usr.strength
								N.strength_max = usr.strength_max
								N.defence = usr.defence
								N.defence_max = usr.defence_max
								N.exp = 500 * usr.level
								N.tnl = 175 * usr.level
								N.speed = usr.speed
								N.icon = usr.icon
								N.overlays = usr.overlays
								N.underlays = usr.underlays
								N.zanzoken = usr.zanzoken
								N.race = usr.race
								N.hair = usr.hair
								N.loc = locate(usr.x,usr.y-1,usr.z)
								N.spawnin
					if("No")
						return*/