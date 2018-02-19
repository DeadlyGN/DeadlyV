mob/var
 kk_quest_start = 0
 kk_quest_complete = 0
 kk_quest_training = 0
 kk_quest2_start = 0
 kk_quest2_complete = 0
 Kai_levels = 0
 learn_spirit_bomb = 0
mob/AI/
	King_Kai
		name = "{NPC} King Kai"
		icon = 'King Kai.dmi'
		energy_code = 2215368
		verb/Talk()
			set src in oview(1)
			set category = null
			if(!usr.kk_quest_start)
				usr<< "<font color = white>King Kai:</font> Greetings [usr.name]. I see your quiet a strong warrior. Would you like me to aid your training?"
				sleep(15)
				switch(alert(usr,"Begin your Training?","Quest: Warrior's Worth","Yes","Not Yet"))
					if("Yes")
						usr.kk_quest_start = 1
						usr.contents += new/obj/Quests/King_Kai/A_Warriors_Worth
						usr<< "<font color = white>King Kai:</font> Good to Hear! I'll teach you a skill called the <font color = red>Kaio Ken</red>, but only if you can prove yourself!"
						usr<< "<font color = white>King Kai:</font> If you can Catch Bubbles and Hit Gregory, then I will consider you worth enough."
					else usr<< "<font color = white>King Kai:</font> Ohh, that's unfortunant to hear"
			else
				if(!usr.kk_quest_complete)
					if(usr.gregory_hit && usr.bubbles_caught)
						usr<< "<font color = white>King Kai:</font> Great work! You truely are worthy of such a powerful Technique"
						usr.kk_quest_complete = 1
						usr.learn_kaioken = 1
						usr.verbs += new/mob/learn/verb/Kaioken
						for(var/obj/Quests/King_Kai/A_Warriors_Worth/Q)
							del(Q)
					else usr<< "<font color = white>King Kai:</font> You still aren't ready, keep Training!"
			if(usr.kk_quest_complete)
				var/talk = input("King Kai: What do you need, [usr.name]?","") in list ("I want to be revived","I want to go to Supreme Kai's","I want more training","Never Mind")
				switch(talk)
					if("I want to be revived")
						if(src in oview(2))
							usr<< "<font color = white>King Kai:</white> I see you're ready to go, let me revive you."
							usr.overlays -= halo
							usr.overlays -= halo
							usr.dead = 0
							usr.loc = locate(23,215,9)
							usr.overlays -= halo
							usr.safe = 1
					if("I want to go to Supreme Kai's")
						if(src in oview(2))
							usr<< "<font color = white>King Kai:</white> Very well"
							usr.loc = locate(135,155,8)
					if("I want more training")
						if(src in view(2))
							if(usr.kk_quest_complete)
								if(!usr.kk_quest2_start)
									usr<< "<font color = white>King Kai:</font> Greetings [usr.name]. I see your quiet a strong warrior. Would you like me to aid your training?"
									sleep(15)
									switch(alert(usr,"Begin your Training?","Quest: The Spirit Bomb","Yes","Not Yet"))
										if("Yes")
											usr.kk_quest2_start = 1
											usr.contents += new/obj/Quests/King_Kai/The_Spirit_Bomb
											usr<< "<font color = white>King Kai:</font> Good to Hear! I'll teach you a skill called the <font color = #3399cc>Spirit Bomb</red>, but only if you can prove yourself!"
											usr<< "<font color = white>King Kai:</font> If you can achieve 35% pure karma and train 25 levels, then I will consider you worth enough."
										else usr<< "<font color = white>King Kai:</font> Ohh, that's unfortunant to hear"
								else
									if(!usr.kk_quest2_complete)
										if(usr.karma == "Good" && usr.karma_rating >= 35)
											usr<< "<font color = white>King Kai:</font> Great work! You truely are worthy of such a powerful Technique"
											usr.kk_quest2_complete = 1
											usr.learn_spirit_bomb = 1
											usr.verbs += new/mob/learn/verb/Spirit_Bomb
											for(var/obj/Quests/King_Kai/The_Spirit_Bomb/L)
												del(L)
										else usr<< "<font color = white>King Kai:</font> You still aren't ready, keep Training!"
							else usr<< "<font color = white>King Kai:</font> You still aren't ready, keep Training!"
			usr:QuestMedal()