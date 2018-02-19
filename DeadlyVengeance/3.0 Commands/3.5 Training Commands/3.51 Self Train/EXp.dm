mob/proc/Exp_Check()
	switch(src.tnl)
		if(1500)
			if(src.level >= 500)
				src.rank = "Rookie"
				src.tnl = 2500
				src.zenni+=1500
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>Rookie<font color=silver> ***"
				GiveMedal("Rookie",src)
		if(2500)
			if(src.level >= 1000)
				src.rank = "Novice"
				src.tnl = 5000
				src.zenni+=1800
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>Novice<font color=silver> ***"
				GiveMedal("Novice",src)
		if(5000)
			if(src.level >= 5000)
				src.rank = "Expert"
				src.tnl = 7500
				src.zenni+=2000
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>Expert<font color=silver> ***"
				GiveMedal("Expert",src)
		if(7500)
			if(level>=10000)
				src.rank = "Champion"
				src.tnl = 10000
				src.zenni+=2200
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>Champion<font color=silver> ***"
				GiveMedal("Champion",src)
		if(10000)
			if(src.level >= 30000)
				src.rank = "Elder"
				src.tnl = 17500
				src.zenni+=2500
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>Elder<font color=silver> ***"
				GiveMedal("Elder",src)
		if(17500)
			if(src.level >= 50000)
				src.rank = "Sage"
				src.tnl = 25000
				src.zenni+=4500
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>Sage<font color=silver> ***"
				GiveMedal("Sage",src)
		if(25000)
			if(src.level >= 100000)
				src.rank = "Guru"
				src.tnl = 50000
				src.zenni+=5500
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>Guru<font color=silver> ***"
				GiveMedal("Guru",src)
		if(50000)
			if(src.level >= 250000)
				src.rank = "Master"
				src.tnl = 60000
				src.zenni+=7500
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>Master<font color=silver> ***"
				GiveMedal("Master",src)
		if(60000)
			if(src.level >= 500000)
				src.rank = "Grandmaster"
				src.tnl = 70000
				src.zenni+=8500
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>Grandmaster<font color=silver> ***"
				GiveMedal("Grandmaster",src)
		if(70000)
			if(src.level >= 750000)
				src.rank = "Deity"
				src.tnl = 90000
				src.zenni+=10000
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>Deity<font color=silver> ***"
				GiveMedal("Deity",src)
		if(90000)
			if(src.level >= 1000000)
				src.rank = "King of Kings"
				src.tnl = 105000
				src.zenni+=15000
				src<<"<center><font color=silver> *** You have ranked up to <font color=[pick("yellow","red","blue","lime")]>King of Kings<font color=silver> ***"
				if(GiveMedal("King of Kings",src)) src.verbs += new/mob/learn/verb/Godly_Blast
		if(105000)
			if(src.level >= 5000000)
				src.rank = "All Star Player"
				src.tnl = 150000
				src.zenni+=150000
				src<<"<font color=aqua> <center> *** You have ranked up to a All Star Player ***"
				players <<"<font color = green>[world.name] Information: <font color = blue>[src]<font color=aqua> has joined the few to become a All Star Player."
				if(GiveMedal("All Star Player",src)) src.verbs += new/mob/learn/AllStar/verb/ASK
		if(150000) if(src.level >= 10000000) src.tnl=200000