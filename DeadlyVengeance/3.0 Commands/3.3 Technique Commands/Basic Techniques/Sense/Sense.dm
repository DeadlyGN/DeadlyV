mob/learn/verb
	Sense()
		set category = "Techniques"
		var/huge = 0
		var/strong = 0
		var/weak = 0
		var/avg
		var/ext = 0
		src<< ""
		src<< "You sense:"
		for(var/mob/PC/M in players)
			if(M.client&&M!=usr)
				if(M.level >= src.level * 100) ext += 1
				if(M.level >= src.level * 50 && M.level <= src.level*99) huge += 1
				if(M.level >= src.level * 10 && M.level <= src.level*49) strong += 1
				if(M.level >= src.level && M.level <= src.level*9) avg +=1
				if(M.level < src.level) weak += 1
		spawn(3)
			if(ext)
				src<< "\cyan [ext] <font color = red>Extremely Huge Powers can be detected!"
				src<< "---------------------------------------"
			src<< "\cyan [huge] <font color = yellow>Huge Powers detected!"
			src<< "---------------------------------------"
			src<< "\cyan [strong] <font color = green>Strong Powers detected!"
			src<< "---------------------------------------"
			src<< "\cyan [avg] <font color = blue>Average Powers detected!"
			src<< "---------------------------------------"
			src<< "\cyan [weak] <font color = white>Weak Powers detected!"
			src<< "<br>"
		src.afk_time = 0