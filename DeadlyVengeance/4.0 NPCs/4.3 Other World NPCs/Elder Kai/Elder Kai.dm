mob/var
 mystic = 0
 mysticing = 0
mob/AI/Elder_Kai
	icon = 'Elder Kai.dmi'
	name = "{NPC} Elder Kai"
	it_lock = 1
	verb/Talk()
		set category = null
		set src in oview(1)
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "The Elder Kai is busy channeling their energy to you"
			return
		if(usr.z_sword_quest)
			if(usr.karma == "Good" && usr.karma_rating >= 45 && usr.level >= 15000)
				if(usr.race == "Half Saiyan")
					if(usr.mystic <= 0)
						if(!src.doing) src.doing ++
						usr<< "<font color = white>Elder Kai:</font> Ahhh, I see you're the one who set me free!"
						sleep(25)
						usr<< "<font color = white>Elder Kai:</font> You know, I used to train some of the Galaxies Strongest fighters?"
						sleep(25)
						usr<< "<font color = white>Elder Kai:</font> If you want, for releasing me, I can teach you how to unlock a Power Deep within?"
						sleep(17)
						switch(alert(usr,"Do you wish to learn the Mystic ability from Elder Kai? (This full process will take a while!)","Mystic Boost","Yes","No"))
							if("Yes")
								if(usr.mystic)
									usr<< "You can only go mystic once"
									return
								usr.mystic = 1
								usr<< "<font color = white>Elder Kai:</font> Sit child. The training shall begin..."
								if(usr.race == "Half Saiyan")
									usr.Half_Saiyan_Revert()
								sleep(15)
								usr.frozen = 1
								usr.safe = 1
								usr.mysticing ++
								usr.powerlevel_max += 30000000
								usr.ki_max += 30000000
								usr.strength_max += 50000000
								usr.defence_max += 50000000
								usr<< "\white You feel some of your true power begin to flow through you..."
								switch(alert(usr,"Keep Training?","Mystic","Yes","No"))
									if("No")
										Explode(new /Effect/BasicBoom(src.loc,1,4))
										usr.frozen = 0
										usr.safe = 0
										usr.critical_max += rand(1,3)
										usr.dodge_max += rand(1,3)
										usr.reflect_max += rand(1,3)
										usr.block_max += rand(1,3)
										usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
										usr.powerlevel = usr.powerlevel_max
										usr.ki = usr.ki_max
										usr.strength = usr.strength_max
										usr.defence = usr.defence_max
										usr.critical = usr.critical_max
										usr.dodge = usr.dodge_max
										usr.reflect = usr.reflect_max
										usr.block = usr.block_max
										usr.mysticing = 0
										usr.overlays += mystic_elec
										usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
										if(src.doing) src.doing --
										del(src)
									if("Yes")
										if(usr.mysticing)
											usr.mysticing ++
											sleep(300)
											usr.powerlevel_max += 250000
											usr.ki_max += 250000
											usr.strength_max += 500000
											usr.defence_max += 500000
											usr<< "\white You feel more of your true power begin to flow through you..."
											switch(alert(usr,"Keep Training?","Mystic","Yes","No"))
												if("No")
													usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
													Explode(new /Effect/BasicBoom(src.loc,1,4))
													usr.frozen = 0
													usr.safe = 0
													usr.critical_max += rand(1,3)
													usr.dodge_max += rand(1,3)
													usr.reflect_max += rand(1,3)
													usr.block_max += rand(1,3)
													usr.powerlevel = usr.powerlevel_max
													usr.ki = usr.ki_max
													usr.strength = usr.strength_max
													usr.defence = usr.defence_max
													usr.critical = usr.critical_max
													usr.dodge = usr.dodge_max
													usr.reflect = usr.reflect_max
													usr.block = usr.block_max
													usr.overlays += mystic_elec
													usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
													if(src.doing) src.doing --
													del(src)
												if("Yes")
													if(usr.mysticing == 2)
														usr.mysticing ++
														sleep(600)
														usr.powerlevel_max += 250000
														usr.ki_max += 250000
														usr.strength_max += 500000
														usr.defence_max += 500000
														usr<< "\white You feel more of your true power begin to flow through you..."
														switch(alert(usr,"Keep Training?","Mystic","Yes","No"))
															if("No")
																usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
																Explode(new /Effect/BasicBoom(src.loc,1,4))
																usr.frozen = 0
																usr.safe = 0
																usr.critical_max += rand(1,3)
																usr.dodge_max += rand(1,3)
																usr.reflect_max += rand(1,3)
																usr.block_max += rand(1,3)
																usr.powerlevel = usr.powerlevel_max
																usr.ki = usr.ki_max
																usr.strength = usr.strength_max
																usr.defence = usr.defence_max
																usr.critical = usr.critical_max
																usr.dodge = usr.dodge_max
																usr.reflect = usr.reflect_max
																usr.block = usr.block_max
																usr.overlays += mystic_elec
																usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
																if(src.doing) src.doing --
																del(src)
															if("Yes")
																if(usr.mysticing == 3)
																	usr.mysticing ++
																	sleep(900)
																	usr.powerlevel_max += rand(100000,300000)
																	usr.ki_max += rand(100000,300000)
																	usr.strength_max += rand(40000,80000)
																	usr.defence_max += rand(40000,80000)
																	usr<< "\white You feel a surge of power flow through you..."
																	switch(alert(usr,"Keep Training?","Mystic","Yes","No"))
																		if("No")
																			usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
																			Explode(new /Effect/BasicBoom(src.loc,1,4))
																			usr.frozen = 0
																			usr.safe = 0
																			usr.critical_max += rand(1,3)
																			usr.dodge_max += rand(1,3)
																			usr.reflect_max += rand(1,3)
																			usr.block_max += rand(1,3)
																			usr.powerlevel = usr.powerlevel_max
																			usr.ki = usr.ki_max
																			usr.strength = usr.strength_max
																			usr.defence = usr.defence_max
																			usr.critical = usr.critical_max
																			usr.dodge = usr.dodge_max
																			usr.reflect = usr.reflect_max
																			usr.block = usr.block_max
																			usr.overlays += mystic_elec
																			usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
																			if(src.doing) src.doing --
																			del(src)
																		if("Yes")
																			if(usr.mysticing == 4)
																				usr.mysticing = 5
																				sleep(900)
																				usr.powerlevel_max += rand(250000,4000000)
																				usr.ki_max += rand(250000,4000000)
																				usr.strength_max += rand(80000,1000000)
																				usr.defence_max += rand(80000,1000000)
																				usr<< "\white The ground shakes as your true power is finally unleashed..."
																				Explode(new /Effect/BasicBoom(src.loc,1,4))
																				usr.frozen = 0
																				usr.mystic = 1
																				usr.safe = 0
																				usr.critical_max += rand(5,8)
																				usr.dodge_max += rand(5,8)
																				usr.reflect_max += rand(5,8)
																				usr.block_max += rand(5,8)
																				usr.powerlevel = usr.powerlevel_max
																				usr.ki = usr.ki_max
																				usr.strength = usr.strength_max
																				usr.defence = usr.defence_max
																				usr.critical = usr.critical_max
																				usr.dodge = usr.dodge_max
																				usr.reflect = usr.reflect_max
																				usr.block = usr.block_max
																				usr.overlays += mystic_elec
																				usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
																				if(src.doing) src.doing --
																				del(src)
							if("No")
								if(src.doing) src.doing --
			else
				usr<< "<font color = white>Elder Kai:</font> Your heart is not pure enough for my teachings!<i>45% GOOD karma, 15,000 levels</i>."
				if(src.doing) src.doing --
				del(src)
mob/proc/mystic_cont()
	switch(alert(usr,"Keep Training?","Mystic","Yes","No"))
		if("No")
			usr.frozen = 0
			usr.safe = 0
			usr.critical_max += rand(5,18)
			usr.dodge_max += rand(5,18)
			usr.reflect_max += rand(5,18)
			usr.block_max += rand(5,18)
			usr.powerlevel = usr.powerlevel_max
			usr.ki = usr.ki_max
			usr.strength = usr.strength_max
			usr.defence = usr.defence_max
			usr.critical = usr.critical_max
			usr.dodge = usr.dodge_max
			usr.reflect = usr.reflect_max
			usr.block = usr.block_max
			usr.mysticing = 0
			usr.overlays += mystic_elec
			usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
		if("Yes")
			if(usr.mysticing)
				usr.mysticing ++
				sleep(3000)
				usr.powerlevel_max += 250000
				usr.ki_max += 250000
				usr.strength_max += 50000
				usr.defence_max += 50000
				usr<< "\white You feel more of your true power begin to flow through you..."
	switch(alert(usr,"Keep Training?","Mystic","Yes","No"))
		if("No")
			usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
			usr.frozen = 0
			usr.safe = 0
			usr.mysticing = 0
			usr.critical_max += rand(5,18)
			usr.dodge_max += rand(5,18)
			usr.reflect_max += rand(5,18)
			usr.block_max += rand(5,18)
			usr.powerlevel = usr.powerlevel_max
			usr.ki = usr.ki_max
			usr.strength = usr.strength_max
			usr.defence = usr.defence_max
			usr.critical = usr.critical_max
			usr.dodge = usr.dodge_max
			usr.reflect = usr.reflect_max
			usr.block = usr.block_max
			usr.overlays += mystic_elec
		if("Yes")
			if(usr.mysticing == 2)
				usr.mysticing ++
				usr.frozen = 1
				usr.doing ++
				usr.safe = 1
				sleep(6000)
				usr.powerlevel_max += 250000
				usr.ki_max += 250000
				usr.strength_max += 50000
				usr.defence_max += 50000
				usr<< "\white You feel more of your true power begin to flow through you..."
	switch(alert(usr,"Keep Training?","Mystic","Yes","No"))
		if("No")
			usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
			usr.frozen = 0
			usr.safe = 0
			usr.mysticing = 0
			usr.critical_max += rand(5,18)
			usr.dodge_max += rand(5,18)
			usr.reflect_max += rand(5,18)
			usr.block_max += rand(5,18)
			usr.powerlevel = usr.powerlevel_max
			usr.ki = usr.ki_max
			usr.strength = usr.strength_max
			usr.defence = usr.defence_max
			usr.critical = usr.critical_max
			usr.dodge = usr.dodge_max
			usr.reflect = usr.reflect_max
			usr.block = usr.block_max
			usr.overlays += mystic_elec
		if("Yes")
			if(usr.mysticing == 3)
				usr.mysticing ++
				usr.frozen = 1
				usr.doing ++
				usr.safe = 1
				sleep(9000)
				usr.powerlevel_max += rand(100000,300000)
				usr.ki_max += rand(100000,300000)
				usr.strength_max += rand(40000,80000)
				usr.defence_max += rand(40000,80000)
				usr<< "\white You feel a surge of power flow through you..."
	switch(alert(usr,"Keep Training?","Mystic","Yes","No"))
		if("No")
			usr.frozen = 0
			usr.safe = 0
			usr.mysticing = 0
			usr.critical_max += rand(5,18)
			usr.dodge_max += rand(5,18)
			usr.reflect_max += rand(5,18)
			usr.block_max += rand(5,18)
			usr.powerlevel = usr.powerlevel_max
			usr.ki = usr.ki_max
			usr.strength = usr.strength_max
			usr.defence = usr.defence_max
			usr.critical = usr.critical_max
			usr.dodge = usr.dodge_max
			usr.reflect = usr.reflect_max
			usr.block = usr.block_max
			usr.overlays += mystic_elec
			usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
			if(src.doing) src.doing --
		if("Yes")
			if(usr.mysticing == 4)
				usr.mysticing = 0
				usr.frozen = 1
				usr.doing ++
				usr.safe = 1
				sleep(9000)
				usr.powerlevel_max += rand(250000,400000)
				usr.ki_max += rand(250000,400000)
				usr.strength_max += rand(80000,100000)
				usr.defence_max += rand(80000,100000)
				usr<< "\white The ground shakes as your true power is finally unleashed..."
				usr.frozen = 0
				usr.safe = 0
				usr.critical_max += rand(5,18)
				usr.dodge_max += rand(5,18)
				usr.reflect_max += rand(5,18)
				usr.block_max += rand(5,18)
				usr.powerlevel = usr.powerlevel_max
				usr.ki = usr.ki_max
				usr.strength = usr.strength_max
				usr.defence = usr.defence_max
				usr.critical = usr.critical_max
				usr.dodge = usr.dodge_max
				usr.reflect = usr.reflect_max
				usr.block = usr.block_max
				usr.overlays += mystic_elec
				sleep(30)
				usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"
				if(src.doing) src.doing --
			else usr<< "<font color = white>Elder Kai:</font> Your training is now complete!"