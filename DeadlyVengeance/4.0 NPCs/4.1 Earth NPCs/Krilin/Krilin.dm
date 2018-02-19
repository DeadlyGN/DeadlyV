mob/var/
 krilin_quest_start = 0
 krilin_quest_complete = 0
 cell_jr_kills = 0
 krillin_quest_kills = 0
mob/AI/
	Krilin
		name = "{NPC} Krillin"
		icon = 'Krilin.dmi'
		energy_code = 5321659
		verb/Talk()
			set src in oview(1)
			set category = null
			if(!usr.krilin_quest_start)
				if(!usr.krilin_quest_complete) usr<< "<font color = white>Krillin:</font> Hey, [usr.name], mind helping me out for a minute?"
				else usr<<"<font color = white>Krillin:</font> Hey there, [usr.name], here to lend a hand again?"
				switch(alert(usr,"Begin your Quest?","Quest: Danger","Yes","Not Yet"))
					if("Yes")
						usr.krilin_quest_start = 1
						usr.krillin_quest_kills = (5*(usr.krilin_quest_complete+1))+usr.cell_jr_kills
						usr.contents += new/obj/Quests/Krilin/Danger
						usr<< "<font color = white>Krillin:</font> Thanks, there are <font color=blue>[usr.krillin_quest_kills]\
						</font color=blue> Cell Jr's around here, I need you to take them out before they cause any harm."
			else
				if(usr.cell_jr_kills >= usr.krillin_quest_kills)
					usr.krilin_quest_complete ++
					usr.krilin_quest_start = 0
					usr<< "<font color = white>Krillin:</font> Thanks for killing those Cell Jr's, [usr.name], you saved me a lot of trouble."
					usr.powerlevel_max += 11000
					usr.ki_max += 11000
					usr.strength_max += 11000
					usr.defence_max += 11000
					usr.zenni += 4500
					for(var/obj/Quests/Krilin/Danger/Q) del(Q)
				else usr<< "<font color = white>Krillin:</font> You still have <font color=blue>[usr.krillin_quest_kills-usr.cell_jr_kills]</font color=blue> Cell Jr's to take care of."
			usr:QuestMedal()