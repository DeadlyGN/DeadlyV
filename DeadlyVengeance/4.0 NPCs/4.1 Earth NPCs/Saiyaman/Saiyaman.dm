mob/var/
 saiyaman_quest_start = 0
 saiyaman_quest_complete = 0
mob
	AI
		Saiyaman
			name = "{NPC} Saiyaman"
			icon = 'Saiyaman.dmi'
			verb
				Talk()
					set src in oview(1)
					if(!usr.saiyaman_quest_start)
						usr<< "<font color = white>Saiyaman:</font> Hello citizen [usr.name]! I require your assistance, can you lend it?"
						sleep(15)
						switch(alert(usr,"You able to help me out?","Quest: Lost Identity","Yes","Not at the moment.."))
							if("Yes")
								usr.saiyaman_quest_start = 1
								usr.contents += new/obj/Quests/Saiyaman/Lost_Identity
								usr<< "<font color = white>Saiyaman:</font> Awesome! As you see, I've lost my helmet. I think <font colour = red>Goten</font> was running around somewhere with it"
								usr<< "<font color = white>Saiyaman:</font> If you could grab it off him, that would be great!"
							else
								usr<< "<font color = white>Saiyaman:</font> Ohh, ok. I will have to find another person then."
					else
						if(!usr.saiyaman_quest_complete)
							if(usr.obtained_helmet)
								usr<< "<font color = white>Saiyaman:</font> Thanks for that [usr.name]! Now I can get back to fighting crime!"
								usr.saiyaman_quest_complete = 1
								usr.contents += new/obj/Equipment/Head/Helmet
								src.Icon_State("helmet")
								spawn(150) src.Icon_State("")
								for(var/obj/Quests/Saiyaman/Lost_Identity/Q)
									del(Q)
						else
							if(usr.level >= 600 && usr.karma == "Good")
								if(!usr.learn_cont_kame)
									usr<< "<font color = white>Saiyaman:</font> Greetings [usr.name]. With your power, I'm sure you can handle this technique."
									if(usr.tp >= 65000)
										usr.learn_cont_kame = 1
										usr.tp -= 65000
										usr<< "<font color = white>Saiyaman:</font> Great! You have enough points to learn this move!"
										sleep(17)
										usr<< "<center><font color=white>..:: You learned Continuous Kamehameha ::..</center></font>"
										usr.verbs += new/mob/learn/verb/Continuous_Kamehameha
									else usr<< "<font color=white>Saiyaman:</font> Come back with 65,000 training points and I will teach you this technique!"
								else usr<< "<font color=white>Saiyaman:</font> I have nothing else to teach you."
							else usr<< "<font color=white>Saiyaman:</font> You're not strong enough to learn my technique."
					usr:QuestMedal()