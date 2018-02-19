mob/var/bulma_quest_complete = 0
mob
	AI
		Dr_Briefs
			name = "{NPC} Dr Briefs"
			icon = 'Dr Briefs.dmi'
			energy_code = 1242351
			verb
				Talk()
					set src in oview(1)
					if(usr.bulma_quest_start && !usr.bulma_quest_complete)
						usr<< "<font color = white>Dr Briefs:</font> Greetings [usr.name]. I see you've brought the part I requested off Bulma!"
						sleep(15)
						usr.bulma_quest_complete = 1
						for(var/obj/Quests/Bulma/Malfunction/Q) del(Q)
						for(var/obj/Equipment/Consumable/Spanner/O) del(O)
						usr<< "<font color = white>Dr Briefs:</font> Thanks for your help [usr.name]! Here's a little something for your Trouble"
						usr.contents += new/obj/Equipment/Consumable/Capsule
					else usr<< "<font color = white>Dr Briefs:</font> Sorry [usr.name], I'm busy at the moment"
					usr:QuestMedal()