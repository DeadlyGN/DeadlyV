mob/var/
 goodtest=0
 eviltest=0
mob
	AI
		Light_Teacher
			name = "{NPC} Light Teacher"
			icon = 'npcs.dmi'
			icon_state = "Light Teacher"
			energy_code = 7227362
			verb
				Talk()
					set category = null
					set src in oview(1)
					if(usr.race == "Demon"&&usr.chromosome=="Evil")
						if(usr.karma == "Good" && usr.karma_rating >= 95)
							usr.Force_Revert()
							usr.learn_chaos_blitz = 1
							usr.chromosome = "Chaos"
							usr.icon = 'Chaos Demon 1.dmi'
							usr<< "<font color = maroon>Light Teacher:</font> You, [usr.name], have been transformed into an Chaos Demon, you have the power of good and evil within you now."
							GiveMedal("Complete Chaos",usr)
							usr<< "<center><font color=white>..:: You learned Chaos Blitz ::..</center></font>"
							usr.verbs += new/mob/learn/verb/Chaos_Demon_Ki_Blast
						else usr<< "<font color=white>Light Teacher:</font> Even Demons like you can be good-willed. If you can do some good in the world, I might be able to help you."
					else usr<< "<font color=white>Light Teacher:</font> I only help Evil Demons. Good day, [usr.name]."
					if(usr.karma == "Good" && usr.karma_rating >= 100 && usr.goodtest==0)
						GiveMedal("Good is the Way to Go",usr)
						usr.goodtest+=1
mob
	AI
		Dark_Teacher
			name = "{NPC} Dark Teacher"
			icon = 'npcs.dmi'
			icon_state = "Dark Teacher"
			energy_code = 7227363
			verb
				Talk()
					set category = null
					set src in oview(1)
					if(usr.race == "Demon"&&usr.chromosome=="Good")
						if(usr.karma == "Evil" && usr.karma_rating >= 95)
							usr.Force_Revert()
							usr.learn_chaos_blitz = 1
							usr.chromosome = "Chaos"
							usr.icon = 'Chaos Demon 1.dmi'
							usr<< "<font color = maroon>Dark Teacher:</font> You, [usr.name], have been transformed into an Chaos Demon, you have the power of good and evil within you now."
							GiveMedal("Complete Chaos",usr)
							usr<< "<center><font color=white>..:: You learned Chaos Blitz ::..</center></font>"
							usr.verbs += new/mob/learn/verb/Chaos_Demon_Ki_Blast
						else usr<< "<font color=maroon>Dark Teacher:</font> You make me sick. You're a demon, but all you do is good. Bring some more evil to the world and I'll help you."
					else usr<< "<font color=maroon>Dark Teacher:</font> I only help Good Demons. Go away."
					if(usr.karma == "Evil" && usr.karma_rating > 100 && usr.eviltest==0)
						GiveMedal("Evil is the Life",usr)
						usr.eviltest+=1