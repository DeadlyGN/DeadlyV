mob/var/
 roshi_quest_start = 0
 roshi_quest_complete = 0
 got_rock = 0
mob
	AI
		Master_Roshi
			name = "{NPC} Master Roshi"
			icon = 'Roshi.dmi'
			energy_code = 9987654
			verb
				Talk()
					set src in oview(1)
					if(!usr.roshi_quest_start)
						usr<< "<font color = white>Master Roshi:</font> Greetings [usr.name]. I have an intersting skill to teach, if you have the time?"
						switch(alert(usr,"You want to learn the Kamehameha Wave??","Quest: The Masters Technique","Yes","Not at the moment.."))
							if("Yes")
								usr.roshi_quest_start = 1
								usr.contents += new/obj/Quests/Master_Roshi/Masters_Technique
								usr<< "<font color = white>Master Roshi:</font> Good to Hear! I'll need you to find this Rock i'll throw somewhere in the world!"
							else usr<< "<font color = white>Master Roshi:</font> Ohh, that's unfortunant to hear"
					else
						if(!usr.roshi_quest_complete)
							if(usr.got_rock)
								usr<< "<font color = white>Master Roshi:</font> Good work [usr.name]! Now I shall teach you the \blue Kamehameha Wave"
								usr.roshi_quest_complete = 1
								usr.zenni += 1350
								usr.verbs += new/mob/learn/verb/Kamehameha
								usr.learn_kamehameha = 1
								for(var/obj/Quests/Master_Roshi/Masters_Technique/Q) del(Q)
							else usr<< "<font color = white>Master Roshi:</font> You haven't found the rock yet!"
					usr:QuestMedal()