mob/var
 warrior_quest_start = 0
 warrior_quest_complete = 0
 strength_test_start = 0
 strength_test_complete = 0
 green_kills = 0
 blue_kills = 0
 red_kills = 0
 black_kills = 0
 white_kills = 0
mob/AI/Yamcha
	icon = 'Yamcha.dmi'
	name = "{NPC} Yamcha"
	energy_code = 1356437
	verb/Talk()
		set category = null
		set src in oview(7)
		if(!usr.warrior_quest_start&&!usr.warrior_quest_complete)
			usr<< "<font color = white>Yamcha:</font> Greetings [usr.name]. I'm so weak but you're weaker for trying to look help from me."
			sleep(15)
			switch(alert(usr,"Begin your Training?","Quest: Warrior's Path","Yes","Not Yet"))
				if("Yes")
					usr.warrior_quest_start = 1
					usr.contents += new/obj/Quests/Yamcha/A_Warriors_Path
					usr<< "<font color = white>Yamcha:</font> Good to Hear! I'll teach you a method when your ready to help your training!"
				else usr<< "<font color = white>Yamcha:</font> Ohh, that's unfortunant to hear"
		else
			if(!usr.warrior_quest_complete)
				if(usr.level >= 500)
					usr<< "<font color = white>Yamcha:</font> Great, your learning fast! To help your training more, I'll give you some power!"
					usr<< "<font color = white>Yamcha:</font> All done, if you need training just talk to me!"
					usr.warrior_quest_complete = 1
					usr.Give_Levels(10000)
					src.verbs += new/mob/learn/verb/Wolf
					for(var/obj/Quests/Yamcha/A_Warriors_Path/Q in usr.contents)
						del(Q)
				else usr<< "<font color = white>Yamcha:</font> You still aren't ready, keep training!"
			else
				switch(alert(usr,"Hi [usr.name]. What can I do for you today?","Yamcha","Do you have any quest available?","Nothing","Use Training Points"))
					if("Do you have any quest available?")
						if(!usr.strength_test_start)
							usr<< "<font color = white>Yamcha:</font> Greetings again [usr.name]. I have another Task for you if your are Interested?"
							sleep(15)
							switch(alert(usr,"Begin your Training?","Quest: A Test of Strength","Yes","Not Yet"))
								if("Yes")
									usr.strength_test_start = 1
									usr.contents += new/obj/Quests/Yamcha/A_Test_of_Strength
									usr<< "<font color = white>Yamcha:</font> Good to Hear! What I want you to do is <font color = red>Kill 5 Saibamen</font>"
								else usr<< "<font color = white>Yamcha:</font> Ohh, that's unfortunant to hear"
						else
							if(usr.green_kills >= 5)
								usr<< "<font color = white>Yamcha:</font> Great work, your proving to be a Strong Warrior!"
								usr.green_kills = 0
								usr.Give_Levels(500)
								usr.strength_test_start = 0
								for(var/obj/Quests/Yamcha/A_Test_of_Strength/Q in usr.contents)
									del(Q)
							else usr<< "<font color = white>Yamcha:</font> You still aren't done, keep Training!"
					if("Use Training Points")
						usr.Train()
		usr:QuestMedal()