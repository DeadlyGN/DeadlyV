mob/learn
	verb
		Scan(mob/M in view(6))
			set category = "Techniques"
			if(M.race != "Android")
				var/form = ""
				if(M.form=="")form = "Base Form"
				if(M.form=="Ranger")form = "<font color=[M.pranger]> Ranger"
				src<< "Aquiring [M]'s Biological Signal..."
				sleep(25)
				if(!M)return
				src<< "---------------------"
				src<< "<font size = 4>[M]</size>"
				src<< "Level: [M.level]"
				src<< "Karma: [M.karma]"
				src<< "Powerlevel: [num2text(M.powerlevel,10000000)] / [num2text(M.powerlevel_max,10000000)]"
				src<< "Ki: [num2text(M.ki,10000000)] / [num2text(M.ki_max,10000000)]"
				src<< "Strength: [num2text(M.strength,10000000)] / [num2text(M.strength_max,10000000)]"
				src<< "Defence: [num2text(M.defence,10000000)] / [num2text(M.defence_max,10000000)]"
				src<< ""
				src<< "Block Skill: [M.block] %"
				src<< "Counter Skill: [M.counter] %"
				src<< "Reflect Skill: [M.reflect] %"
				src<< "Dodge Skill: [M.dodge] %"
				src<< "Critical Skill: [M.critical] %"
				src<< ""
				src<< "Currently In: [form]"
				src<< "Energy Code: [num2text(M.energy_code,1000000)]"
				src<< "---------------------"
				src.afk_time = 0
			else
				src<< "They have no Energy to Scan!"
				return
mob/learn
	verb/World_Scan()
		set category = "Techniques"
		for(var/mob/M in players) if(!M.hidden)
			src<<"<font size=1><font color = blue><B> Name::</font><B> [M.name]</font><font color = blue><B> Race:</font><B> [M.race]</font><font color = blue><B> Level:</font><B> [M.level]</font><font color = blue><B> Location:</font><B> [M.x],[M.y],[M.z]</font>"