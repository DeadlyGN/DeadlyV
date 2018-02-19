mob/
	var
		Yadrat_taught = 0
		learn_advanced_it = 0
	AI/
		Yadrat
			name = "{NPC} Yadrat"
			icon = 'npcs.dmi'
			icon_state = "Yadrat"
			energy_code = 2291346
			verb/Talk()
				set src in oview(2)
				set category = null
				if(usr.frieza_wins)
					if(usr.Yadrat_taught==0)
						if(usr.learn_fuse==0)
							usr<<"<font color=gray>Yadrat: <font color=green>[usr]! You look hurt! Allow me to help you..."
							usr.powerlevel=usr.powerlevel_max
							usr<<"<font color=white>You spend some time with the Yadrat people, being healed back to normal."
							usr<< "<center><font color = white> .:: You learn to Fuse ::.</font></center></center>"
							usr.verbs += new/mob/learn/verb/Fuse
							usr.learn_fuse = 1
						if(usr.learn_it)
							usr<< "<center><font color = white> .:: You learn: Advanced Instant Transmission ::.</font></center></center>"
							usr.verbs += new/mob/learn/verb/Advanced_Instant_Transmission
							usr.learn_advanced_it = 1
							usr.Yadrat_taught = 1
							usr.learn_it = 0
							usr.verbs -= new/mob/learn/verb/Instant_Transmission
						else usr<<"<font color=gray>Yadrat: <font color=green>Come back once you've learned Instant Transmission, [usr]."
					else usr<<"<font color=gray>Yadrat: <font color=green>I've taught you everything I can."
				else usr<<"<font color=gray>Yadrat: <font color=green>Come back once you've defeated Frieza, we cannot trust you otherwise."
				usr:QuestMedal()