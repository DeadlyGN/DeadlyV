mob/var
 frieza_quest_start = 0
 frieza_quest_complete = 0
 frieza_quest2_start = 0
 frieza_quest2_complete = 0
 namek_kills = 0
 metal_converted = 0
 converting = 0
mob/AI/
	Frieza
		name = "{NPC} Frieza"
		icon = 'Changling - Form 1.dmi'
		energy_code = 9980776
		verb/Talk()
			set src in oview(1)
			set category = null
			switch(input("Frieza: What do you need [usr.race]?")in list("Convert To Metal(Changling and Cooler Only)","Do my Quest","Take on My Second Quest","Nothing"))
				if("Do my Quest")
					if(usr.karma == "Evil")
						if(!usr.frieza_quest_start)
							usr<< "<font color = white>Frieza:</font> Hmmm what do you want? Nothing? Good, but I have a Order for you!"
							sleep(15)
							switch(alert(usr,"Are you Ready?","Quest: Wraith of Frieza","Yes","Not Yet"))
								if("Yes")
									usr.frieza_quest_start = 1
									usr.contents += new/obj/Quests/Frieza/Wraith_of_Frieza
									usr<< "<font color = white>Frieza:</font> There's been pesky Namekian's harrasing my troops. Take care of them and I'll see to your reward."
						else
							if(!usr.frieza_quest_complete)
								if(usr.namek_kills >= 3)
									usr.frieza_quest_complete = 1
									usr<< "<font color = white>Frieza:</font> Perfect, now Namek will be mine! Hahahaha"
									if(prob(40))
										usr.powerlevel_max += usr.powerlevel_max/12
										usr.ki_max += usr.ki_max/12
										usr.strength_max += usr.strength_max/12
									usr.zenni += 2131
									usr.strength = usr.strength_max
									for(var/obj/Quests/Frieza/Wraith_of_Frieza/Q) del(Q)
								else usr<< "<font color = white>Frieza:</font> Don't come bacxk till you have fixed the problem!"
				if("Take on My Second Quest")
					if(usr.karma == "Evil")
						if(!usr.frieza_quest2_start)
							usr<< "<font color = white>Frieza:</font> Hmmm what do you want? Nothing? Good, but I have a Order for you!"
							sleep(15)
							switch(alert(usr,"Are you Ready?","Quest: Frieza's Might","Yes","Not Yet"))
								if("Yes")
									usr.frieza_quest2_start = 1
									usr.contents += new/obj/Quests/Frieza/Friezas_Might
									usr<< "<font color = white>Frieza:</font> There's been pesky Namekian's harrasing my troops. Take care of them and I'll see to your reward."
						else
							if(!usr.frieza_quest2_complete)
								if(usr:questnamekgoku_kill == 3 && usr:questnamekvegeta_kill == 1 && usr:questnamekgohan_kill)
									usr.frieza_quest2_complete = 1
									usr<< "<font color = white>Frieza:</font> Perfect, now Namek will be mine! Hahahaha"
									usr.Give_Levels(20000)
									usr.zenni += 5000
									for(var/obj/Quests/Frieza/Friezas_Might/L) del(L)
								else usr<< "<font color = white>Frieza:</font> Don't come bacxk till you have fixed the problem!"
				if("Convert To Metal(Changling and Cooler Only)")
					if(usr.majined)
						usr<<"You cannot accept this after being majin'd!"
						return
					if(!usr.metal_converted)
						if(usr.race == "Changling")
							if(usr.form=="True Final Form")
								switch(input("Frieza: do you wish to be converted to metal? You can't go majin after this")in list("Yes","No"))
									if("Yes")
										switch(alert(usr,"Frieza: This will be permanent, are your sure?","Convert","Yes","No"))
											if("Yes")
												if(!converting)
													if(usr.powerlevel <= usr.powerlevel_max) usr<< "\white Frieza: \font before converting, you must reach full power.Revert then Transform to 100%."
													else
														usr.converting = 1
														usr.metal_converted = 1
														usr.sight |= BLIND
														sleep(100)
														usr.converting = 0
														usr.sight &= ~BLIND
														usr.powerlevel_max += usr.powerlevel * 1.1
														usr.ki_max += usr.ki * 1.1
														usr.strength_max += usr.strength * 1.1
														usr.defence_max += usr.defence * 1.1
														usr.speed = 0.6
														usr.speed_max = 0.6
														usr.Power_Redefine()
														usr.icon = 'Changling - Form 6.dmi'
														alert(usr,"There, your transformation is complete, but you won't be able to get Majin boost now!")
						if(usr.race=="Cooler")
							if(usr.form=="Final Hidden Form")
								switch(input("Frieza: do you wish to be converted to metal? You can't go majin after this")in list("Yes","No"))
									if("Yes")
										switch(alert(usr,"Frieza: This will be permanent, are your sure?","Convert","Yes","No"))
											if("Yes")
												if(!converting)
													if(usr.powerlevel <= usr.powerlevel_max) usr<< "\white Frieza: \font before converting, you must reach full power.Revert then Transform to 100%."
													else
														usr.converting = 1
														usr.metal_converted = 1
														usr.sight |= BLIND
														sleep(100)
														usr.converting = 0
														usr.sight &= ~BLIND
														usr.powerlevel_max += usr.powerlevel * 1.1
														usr.ki_max += usr.ki * 1.1
														usr.strength_max += usr.strength * 1.1
														usr.defence_max += usr.defence * 1.1
														usr.speed = 0.6
														usr.speed_max = 0.6
														usr.Power_Redefine()
														usr.icon = 'Changling - Form 6.dmi'
														alert(usr,"There, your transformation is complete, but you won't be able to get Majin boost now!")
			usr:QuestMedal()