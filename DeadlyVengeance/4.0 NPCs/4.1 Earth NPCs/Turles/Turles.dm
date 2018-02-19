mob
	AI
		Turles
			name = "{NPC} Turles"
			icon = 'Turles.dmi'
			energy_code = 4567579
			verb/Speak()
				set src in oview(1)
				set category = null
				if(usr.race == "Saiyan" || usr.race == "Half Saiyan"||usr.race=="Evil Saiyan"||usr.race=="Bardock"||usr.race=="Legend"||usr.race=="Xicor")
					switch(input("What do you need?") in list("Learn Skill","Nothing"))
						if("Learn Skill")
							if(usr.level >= 7500)
								if(!usr.learn_killdriver)
									usr<< "<font color = white>Turles:</font> Hey, I've got a powerful move to teach you!"
									if(usr.tp >= 15000)
										usr.tp -= 15000
										usr<< "<font color = white>Turles:</font> Alright! You have enough points to learn this move!"
										sleep(17)
										usr<< "<center><font color=white>..:: You learned Kill Driver ::..</center></font>"
										usr.verbs += new/mob/learn/verb/Kill_Driver
										usr.learn_killdriver = 1
									else usr<< "<font color=white>Turles:</font> Come back with 15000 training points, young saiyan, and I will teach you this technique!"
								else usr<< "<font color=white>Turles:</font> I have nothing else to teach you."
							else usr<< "<font color=white>Turles:</font> You're not strong enough to learn my technique."
				else usr<< "<font color = white>Turles: </font>I am sorry, I cannot teach you"