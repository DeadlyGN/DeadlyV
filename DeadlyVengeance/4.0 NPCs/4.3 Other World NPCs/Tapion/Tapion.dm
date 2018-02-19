mob/var
 Tapion_quest_start = 0
 Tapion_quest_complete = 0
 threat_kill = 0
 tapions_unlock = 0
mob/AI/
	Tapion
		name = "{NPC} Tapion"
		icon = 'npcs2.dmi'
		icon_state = "Tapion"
		energy_code = 1290876
		verb/Talk()
			set src in oview(1)
			set category = null
			switch(input("Tapion: What do you need [usr]?")in list("Unlock Potential","Quest","Nothing"))
				if("Unlock Potential")
					if(!usr.tapions_unlock)
						usr.tapions_unlock = 1
						usr<< "<font color = white>Tapion:</font> Hmm, I sense a power deep within your mind. Let me unlock it.."
						sleep(50)
						usr<< "<font color = white>You feel Tapion unlock your potential!"
						sleep(50)
						usr<< "<font color = white>Tapion:</white> There, do you feel stronger [usr.name]?"
						usr.powerlevel_max += 100000
						usr.ki_max += 750000
						usr.strength_max += 350000
						usr.defence_max += 350000
						usr.strength = usr.strength_max
						usr.defence = usr.defence_max
					else usr<< "<font color = white>Tapion:</font> Sorry [usr.name] I can only unlock your potential once."
				if("Quest")
					if(usr.karma == "Evil" || usr.karma == "Good")
						if(!usr.Tapion_quest_start)
							usr<< "<font color = white>Tapion:</font> [usr.name], I need your help!"
							sleep(17)
							switch(alert(usr,"Are you Ready?","Quest: World Threat","Yes","Not Yet"))
								if("Yes")
									usr.Tapion_quest_start = 1
									usr.contents += new/obj/Quests/Tapion/World_Threat
									usr<< "<font color = white>Tapion:</font> My people are under attack! Help them!"
						else
							if(!usr.Tapion_quest_complete)
								if(usr.threat_kill >= 1)
									usr.Tapion_quest_complete = 1
									usr<< "<font color = white>Tapion:</font> Thanks [usr.name] for taking care of that for me. I already gave my blade to another kind soul.. Here take my ocarina and this radar."
									sleep(20)
									usr.contents += new/obj/Equipment/Consumable/Black_Star_Dragon_Radar
									usr<< "<font color=white><center>..:: You've obtained a Black Star Dragon Radar ::..</center></font>"
									sleep(15)
									usr<< "<center><font color = white> .:: You learn to play the Ocarina  ::.</font></center></center>"
									usr.contents += new/obj/Equipment/weapon/Ocarina
									GiveMedal("Hello Stranger",usr)
									usr.zenni += 5000
									for(var/obj/Quests/Tapion/World_Threat/Q) del(Q)
								else usr<< "<font color = white>Tapion:</font> Hurry, you must save my people!"
			usr:QuestMedal()