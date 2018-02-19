mob/var/
 bulma_quest2_start = 0
 bulma_quest2_complete = 0
 killed_cell = 0
mob
	AI
		Future_Bulma
			name = "{NPC} Future Bulma"
			icon = 'Bulma.dmi'
			powerlevel = 100
			it_lock = 1
			verb
				Talk_To_Bulma()
					set src in oview(1)
					if(!usr.bulma_quest2_start)
						usr<< "<font color = white>Bulma:</font> Oh my! [usr]! You look just how I remember you! Trunks must've sent you.."
						sleep(15)
						switch(alert(usr,"Cell is trying to steal the space ship, you have to stop him!","Quest: Time Emergency!","Of course!","Not at the moment.."))
							if("Of course!")
								usr.bulma_quest2_start = 1
								usr.contents += new/obj/Quests/Future_Bulma/Time_Emergency
								usr<< "<font color = white>Bulma:</font> Thank you! The last time I saw cell, he was around building."
							else usr<< "<font color = white>Bulma:</font> Oh.. Well, I guess we will have to hope Trunks comes back quick and stops him.."
					else
						if(!usr.bulma_quest2_complete)
							if(usr.killed_cell)
								usr.bulma_quest2_complete = 1
								usr<< "<font color = white>Bulma:</font> Thanks, [usr.name]! We are very grateful to you, for saving us."
								GiveMedal("Your Friendly Neighborhood Time Traveler",usr)
								usr<< "<font color = white>Bulma:</font> Take this old radar I have, maybe it will still work in your time and help you out."
								usr.contents += new/obj/Equipment/Consumable/Namek_Radar
								usr<< "<font color=white><center>..:: You've obtained Namek Radar ::..</center></font>"
								usr.zenni += 5000
								for(var/obj/Quests/Future_Bulma/Time_Emergency/Q)del(Q)
							else usr<< "<font color = white>Bulma:</font> Cell is still alive, can you please kill him!"
					usr:QuestMedal()