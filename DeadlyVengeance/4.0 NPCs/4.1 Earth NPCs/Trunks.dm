mob/var/
 trunks_quest_start = 0
 trunks_quest_complete = 0
 killed_17 = 0
 killed_18 = 0
mob
	AI
		Trunks
			name = "{NPC} Trunks"
			icon = 'Trunks.dmi'
			energy_code = 7234561
			verb
				Talk()
					set category = null
					set src in oview(1)
					switch(input("what do you need [usr]?") in list("Learn Skills","Start Quest","Nothing"))
						if("Learn Skills")
							if(usr.level >= 6500)
								if(!usr.learn_burning_attack)
									switch(input("<font color = white>Trunks:</font> Greetings, [usr.name], I've got a powerful move to teach you if you're up for it.","New Technique")in list("Yes","No"))
										if("Yes")
											if(usr.tp >= 10000)
												usr.tp -= 10000
												usr<< "<font color = white>Trunks:</font> Great, glad to see someone so eager to learn!"
												usr<< "<center><font color=white>..:: You learned Burning Attack ::..</center></font>"
												usr.verbs += new/mob/learn/verb/Burning_Attack
												usr.learn_burning_attack = 1
											else usr<< "<font color=white>Trunks:</font> Come back with 10,000 training points and I will teach you this technique!"
								else usr<< "<font color=white>Trunks:</font> I have nothing else to teach you."
							else usr<< "<font color=white>Trunks:</font> You're not strong enough to learn my technique."
						if("Start Quest")
							if(!usr.trunks_quest_start)
								if(!usr.king_cold_wins){usr<< "<font color = white>Trunks:</font> [usr.name] I have a job, but you'll prove yourself by defeating King Cold first.";return;}
								usr<< "<font color = white>Trunks:</font> [usr.name] I am in need of your help!"
								sleep(17)
								switch(alert(usr,"Are you Ready?","Quest: Enemies Of Time","Yes","Not Yet"))
									if("Yes")
										usr.trunks_quest_start = 1
										usr.contents += new/obj/Quests/Trunks/Enemies_Of_Time
										usr<< "<font color = white>Trunks:</font> Androids are attacking my city, but I'm not strong enough to kill them myself."
										sleep(17)
										usr<< "<font color = white>Trunks:</font> Can you go to my time and take care of these beings."
							else
								if(!usr.trunks_quest_complete)
									if(usr.killed_18 && usr.killed_17)
										usr.trunks_quest_complete = 1
										usr<< "<font color = white>Trunks:</font> Thanks [usr.name], but I have just recieved an emergency call from my mother."
										sleep(17)
										usr<< "<font color=white>Trunks: </font>Go to the future and enter the capsule corp building to talk to my mother please.."
										sleep(15)
										usr<< "<font color=white><center>..:: You've gained entrance into the future's capsule corp ::..</center></font>"
										usr<< "<font color = white>Trunks:</font> Here, [usr.name], take my sword. It'll help you in your journey."
										usr.zenni += 5000
										usr.contents += new/obj/Equipment/weapon/Trunks_Sword
										usr<< "<font color=white><center>..:: You've obtained Trunks Sword ::..</center></font>"
										for(var/obj/Quests/Trunks/Enemies_Of_Time/Q) del(Q)
									else usr<< "<font color = white>Trunks:</font> Can you please do something about it."
					usr:QuestMedal()