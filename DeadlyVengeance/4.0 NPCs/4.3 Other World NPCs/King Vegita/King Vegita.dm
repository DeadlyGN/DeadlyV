mob
	AI
		King_Vegeta
			name = "{NPC} King Vegeta"
			icon = 'King Vegeta.dmi'
			energy_code = 4895754
			verb/Kneal()
				set src in oview(1)
				set category = null
				if(usr.race == "Saiyan" || usr.race == "Half Saiyan"||usr.race=="Evil Saiyan"||usr.race=="Bardock"||usr.race=="Legend"||usr.race=="Xicor")
					switch(input("What do you need, my young saiyan?") in list("Learn Skill","Nothing"))
						if("Learn Skill")
							if(usr.level >= 750)
								if(!usr.learn_finalgalickcannon)
									usr<< "<font color = white>King Vegeta:</font> Welcome saiyan. I've got a powerful move to teach you if you prove you're a true saiyan?"
									if(usr.tp >= 15000)
										usr.tp -= 15000
										usr<< "<font color = white>King Vegeta:</font> Great! You have enough points to learn this move!"
										sleep(17)
										usr<< "<center><font color=white>..:: You learned Final Galick Cannon ::..</center></font>"
										usr.verbs += new/mob/learn/verb/Final_Galick_Cannon
										usr.learn_finalgalickcannon = 1
									else usr<< "<font color=white>King Vegeta:</font> Come back with 15000 training points, young saiyan, and I will teach you this technique!"
								else usr<< "<font color=white>King Vegeta:</font> I have nothing else to teach you."
							else usr<< "<font color=white>King Vegeta:</font> You're not strong enough to learn my technique."
				else usr<< "<font color = white>King Vegeta: </font>You're not a saiyan, you pathetic low-class being! Leave this planet at once!"
mob
	AI
		Broly
			name = "{NPC} Broly"
			icon = 'npcs.dmi'
			icon_state = "Broly"
			energy_code = 4757371
			verb/Talk()
				set src in oview(1)
				set category = null
				if(usr.race == "Legend")
					switch(input("Kakarot must be killed. I'll show you how to do Omega Blaster") in list("Learn Skill","Nothing"))
						if("Learn Skill")
							if(usr.level >= 10000)
								if(!usr.learn_omegablaster)
									usr<< "<font color = white>Broly:</font> Destory Kakarot with this."
									if(usr.tp >= 15000)
										usr.tp -= 15000
										usr<< "<font color = white>Broly:</font>You have enough points to learn this move!"
										sleep(17)
										usr<< "<center><font color=white>..:: You learned Omega Blaster ::..</center></font>"
										usr.verbs += new/mob/learn/verb/Omega_Blaster
										usr.learn_omegablaster = 1
										usr<< "<font color = white>Broly:</font>All will fall on your feet!"
									else usr<< "<font color=white>Broly:</font> Come back with 15,000 training points, young saiyan, and I will teach you this technique!"
								else usr<< "<font color=white>Broly:</font> I have nothing else to teach you."
							else usr<< "<font color=white>Broly:</font> You're not strong enough to learn my technique."
				else usr<< "<font color = white>Broly: </font>You're not a Legend, you pathetic low-class being!"