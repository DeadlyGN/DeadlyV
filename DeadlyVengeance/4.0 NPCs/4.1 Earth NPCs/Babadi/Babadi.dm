mob/var/
 babadi_quest_start = 0
 babadi_quest_complete = 0
 babadi_levels = 0
mob
	AI
		Babadi
			name = "{NPC} Babadi"
			icon = 'Babidi.dmi'
			energy_code = 5533674
			var/mob/PC/P
			New()
				. = ..()
				spawn()
					Wander()
			proc/Wander()
				while(src)
					var/Found = FALSE
					for(P in oview(7)).
						step_away(src,P)
						Found = TRUE
						break
					if(Found != TRUE) sleep(18)
					sleep(13)
			verb
				Talk()
					set src in oview(4)
					if(usr.race == "Changling"||usr.race=="Cooler" && usr.metal_converted) usr<< "I can not help you!"
					else
						if(usr.race == "Saiyan" || usr.race == "Human" || usr.race == "Half Saiyan" || usr.race == "Demon" || usr.race == "Good Demon" || usr.race == "Changling"||usr.race=="Evil Saiyan"||usr.race=="Bardock"||usr.race=="Legend"||usr.race=="Xicor"||usr.race=="Cooler")
							if(usr.arms_implant||usr.legs_implant||usr.chest_implant||usr.head_implant)return
							if(!usr.babadi_quest_start)
								usr<< "<font color = white>Babadi:</font> Arrgghh! [usr.name]. Fine I shall give you something you desire."
								sleep(15)
								switch(alert(usr,"Join my Alliance?","Quest: Majin Upgrade!","Yes","Not at the moment.."))
									if("Yes")
										usr.babadi_quest_start = 1
										usr.contents += new/obj/Quests/Babadi/Majin_Upgrade
										usr<< "<font color = white>Babadi:</font> Heheh! now go and do my bidding"
									else usr<< "<font color = white>Babadi:</font> Get out of my sight you insolate rat"
							else
								if(!usr.babadi_quest_complete)
									if(usr.karma == "Evil" && usr.karma_rating >= 50)
										usr.babadi_quest_complete = 1
										usr.majined = 1
										usr<< "<font color = white>Babadi:</font> Nicely done [usr.name] you shall be rewarded now"
										if(!usr.arms_implant&&!usr.legs_implant&&!usr.chest_implant&&!usr.head_implant)
											usr.powerlevel_max *= 1.3
											usr.ki_max *= 1.3
											usr.strength_max *= 1.3
											usr.defence_max *= 1.3
											usr.overlays += majin_sign
										sleep(20)
										usr<< "<font color = white>Babadi:</font> go and carry out the evils of Babadi!!!!"
										for(var/obj/Quests/Babadi/Majin_Upgrade/L) del(L)
						else usr<< "<font color = white>Babadi:</font> Get out of my sight!"