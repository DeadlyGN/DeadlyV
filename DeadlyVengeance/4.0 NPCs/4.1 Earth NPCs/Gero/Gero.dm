mob/var
 arms_implant 			= 0
 legs_implant 			= 0
 chest_implant 			= 0
 head_implant 			= 0
 chest_icon 			= 'Human Hybrid - Android Chest.dmi'
 head_icon 				= 'Human Hybrid - Android Head.dmi'
 arms_icon 				= 'Human Hybrid - Android Arms.dmi'
 legs_icon 				= 'Human Hybrid - Android Legs.dmi'
 learn_absorb 			= 0
 learn_scan 			= 0
 learn_selfdestruct 	= 0
 android_trans 			= 0
 chip 					= 0
mob
	AI
		Dr_Gero
			name = "{NPC} Dr Gero"
			icon = 'Dr Gero.dmi'
			powerlevel = 1400000000000
			powerlevel_max = 1400000000000
			it_lock = 1
			ki = 1400000000000
			ki_max = 1400000000000
			level = "???"
			race = "Android"
			karma = "Evil"
			verb
				Talk()
					set src in oview(1)
					set category = null
					if(usr.race == "Android")
						switch(input("Dr Gero: What do you need [usr]?")in list("Transform(25 Kills)","Nothing"))
							if("Transform(25 Kills)")
								if(usr.kills+usr.pkills >= 25)
									if(!usr.android_trans)
										usr.contents += new/obj/Transform/Transform
										usr.android_trans = 1
									else usr<< "<font color = white>Dr Gero:</font> I Already gave you this, now get out!"
								else usr<< "<font color = white>Dr Gero:</font> Go get me more kills!"
					if(usr.race == "Human"||usr.race=="Half Saiyan"||usr.race=="Konats")
						if(usr.karma == "Evil"&&!usr.majined)
							switch(input("Dr Gero: What do you need [usr]?")in list("Install Mechanical Parts","Nothing"))
								if("Install Mechanical Parts")
									if(src in oview(1))
										switch(input("Dr Gero: What Bio-Part do you want?")in list("Artificial Arms and Hands","Artificial Legs and Feet","Artificial Chest","Artificial Head"))
											if("Artificial Arms and Hands")
												if(usr.powerlevel_max >= 15000)
													if(!usr.arms_implant)
														usr.sight |= BLIND
														usr.arms_implant=1
														sleep(35)
														usr.frozen = 1
														usr.verbs += new/mob/learn/verb/Ki_Absorb
														usr.learn_absorb = 1
														usr.powerlevel_max *= rand(1.1,1.4)
														usr.ki_max *= rand(1.1,1.4)
														usr.strength_max *= rand(1.1,1.4)
														usr.block_max += 2
														usr.reflect_max += 7
														usr.reflect = usr.reflect_max
														usr.block = usr.block_max
														usr.overlays += usr.arms_icon
														usr.powerlevel = usr.powerlevel_max
														usr.strength = usr.strength_max
														usr.arms_implant = 1
														usr.sight &= ~BLIND
														usr.frozen = 0
														usr<< "<font color = white>Dr Gero:</font> Your Artificial Arms and Hands are installed!"
													else usr<< "<font color = white>Dr Gero:</font> You have this Implant Already!"
												else usr<< "<font color = white>Dr Gero:</font> You'ren't strong enough for this Implant"
											if("Artificial Legs and Feet")
												if(usr.powerlevel_max >= 25000)
													if(!usr.legs_implant)
														usr.sight |= BLIND
														usr.legs_implant=1
														sleep(50)
														usr.frozen = 1
														usr.powerlevel_max *= rand(1.1,1.4)
														usr.ki_max *= rand(1.1,1.4)
														usr.speed -= 2
														usr.dodge_max += 2
														usr.dodge = usr.dodge_max
														usr.overlays += usr.legs_icon
														usr.powerlevel = usr.powerlevel_max
														usr.legs_implant = 1
														usr.sight &= ~BLIND
														usr.frozen = 0
														usr<< "<font color = white>Dr Gero:</font> Your Artificial Legs and Feet are installed!"
													else usr<< "<font color = white>Dr Gero:</font> You have this Implant Already!"
												else usr<< "<font color = white>Dr Gero:</font> You'ren't strong enough for this Implant"
											if("Artificial Chest")
												if(usr.powerlevel_max >= 50000)
													if(!usr.chest_implant)
														usr.sight |= BLIND
														usr.chest_implant=1
														sleep(65)
														usr.frozen = 1
														usr.powerlevel_max *= rand(1.1,1.4)
														usr.ki_max *= rand(1.1,1.4)
														usr.defence_max *= rand(1.1,1.4)
														usr.verbs += new/mob/learn/verb/Self_Destruct
														usr.dodge_max -= 3
														usr.overlays += usr.chest_icon
														usr.learn_selfdestruct = 1
														usr.powerlevel = usr.powerlevel_max
														usr.defence = usr.defence_max
														usr.speed = usr.speed_max
														usr.chest_implant = 1
														usr.sight &= ~BLIND
														usr.frozen = 0
														usr<< "<font color = white>Dr Gero:</font> Your Artificial Chest has been installed!"
													else usr<< "<font color = white>Dr Gero:</font> You have this Implant Already!"
												else usr<< "<font color = white>Dr Gero:</font> You'ren't strong enough for this Implant"
											if("Artificial Head")
												if(usr.powerlevel_max >= 5000)
													if(!usr.head_implant)
														usr.sight |= BLIND
														usr.head_implant = 1
														sleep(125)
														usr.powerlevel_max *= rand(1.1,1.4)
														usr.frozen = 1
														usr.ki_max *= 5
														usr.verbs += new/mob/learn/verb/Scan
														usr.overlays += usr.head_icon
														usr.learn_scan = 1
														usr.ki = usr.ki_max
														usr.head_implant = 1
														usr.sight &= ~BLIND
														usr.frozen = 0
														usr<< "<font color = white>Dr Gero:</font> Your Android Conversion is Complete!"
													else usr<< "<font color = white>Dr Gero:</font> You have this Implant Already!"
												else usr<< "<font color = white>Dr Gero:</font> You'ren't strong enough for this Implant"
						else usr<< "<font color = white>Dr Gero:</font> Get out of here you filthy Do-Gooder!"
					else usr<< "<font color = white>Dr Gero:</font> Get out of here you filthy [usr.race]!"