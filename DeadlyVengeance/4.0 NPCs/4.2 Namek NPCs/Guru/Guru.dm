mob/var/guru_quest_start = 0
mob/var/guru_quest_complete = 0
mob/var/thug_kills = 0
mob/AI/
	Guru
		name = "{NPC} Guru"
		icon = 'Guru.dmi'
		energy_code = 6678554
		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.karma == "Good")
				if(!usr.guru_quest_start)
					usr<< "<font color = white>Guru:</font> Greetings [usr.name]. My time is near, but I have one last request. Will you help me?"
					sleep(15)
					switch(alert(usr,"Begin your Training?","Quest: Dying Namek","Yes","Not Yet"))
						if("Yes")
							usr.guru_quest_start = 1
							usr.contents += new/obj/Quests/Guru/Dying_Namek
							usr<< "<font color = white>Guru:</font> Thank you. There's a village nearby that is being attacked by Frieza's Thugs. Please, help them."
				else
					if(!usr.guru_quest_complete)
						if(usr.thug_kills >= 3)
							usr.guru_quest_complete = 1
							usr<< "<font color = white>Guru:</font> All of Namek thanks you, [usr.name]"
							usr<< "<font color = white><I>Guru smiles softly at you, as he takes their last breath, then their body lies motionless..."
							usr.powerlevel_max += usr.powerlevel_max/12
							usr.ki_max += usr.ki_max/12
							usr.strength_max += usr.strength_max/12
							usr.defence_max += usr.defence_max/12
							usr.strength = usr.strength_max
							usr.defence = usr.defence_max
							for(var/obj/Quests/Guru/Dying_Namek/Q) del(Q)
						else usr<< "<font color = white>Guru:</font> You must stop Frieza's Thugs..."
					else usr<< "\white <I>You look at the body of the once Leader of the Namekians as it lays there, lifelessly..."
			usr:QuestMedal()