mob
	AI
		Vegeta
			name = "{NPC} Vegeta"
			icon = 'npcs.dmi'
			icon_state = "Past Vegeta"
			energy_code = 7227361
			verb
				Talk()
					set category = null
					set src in oview(1)
					if(usr.level >= 950)
						if(!usr.learn_big_bang)
							usr<< "<font color = white>Vegeta:</font> Greetings [usr.name]. with your power, I'm sure you can handle this technique."
							if(usr.tp >= 40000)
								usr.learn_big_bang = 1
								usr.tp -= 40000
								usr<< "<font color = white>Vegeta:</font> Great! You have enough points to learn this move!"
								sleep(17)
								usr<< "<center><font color=white>..:: You learned Big Bang Attack ::..</center></font>"
								usr.verbs += new/mob/learn/verb/Big_Bang_Attack
							else usr<< "<font color=white>Vegeta:</font> Come back with 40,000 training points and I will teach you this technique!"
						else usr<< "<font color=white>Vegeta:</font> I have nothing else to teach you."
					else usr<< "<font color=white>Vegeta:</font> You're not strong enough to learn my technique."