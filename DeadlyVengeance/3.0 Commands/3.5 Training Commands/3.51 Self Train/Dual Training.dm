mob/var/tmp/
 dualtrain = 0
 dual_partner = ""
 dual_delay = 0
 dual_training = 0
mob/PC/verb/Dual_Train()
	set category = "Training"
	var/mob/PC/M
	for(var/mob/PC/N in get_step(src,src.dir)) M=N
	if(!M||!istype(M,/mob/PC/)||src.dualtrain)
		src.dualtrain=0
		return
	if(src.doing||src.buku||src.selftraining||src.boxing||src.meditation||src.meditate||M.doing||M.buku||M.selftraining||M.boxing||M.meditation||M.meditate) return
	if(src.rest)
		src<< "you cannot DT while resting!"
		return
	if(!istype(M,/mob/PC))
		src<<"You cant dual train with NPCs!"
		return
	if(src.dualtrain||src.dual_training)
		if(istype(M,/mob/PC/))
			if(src.dual_partner == M.name)
				M.dualtrain = 0
				M << "<font size=1><B>Your partner stoped Dual Training"
				M.doing = 0
				M.dual_training = 0
				M.dual_partner = null
				M.frozen = 0
				M.Icon_State("")
				if(src.doing) src.doing --
				src.frozen = 0
				src.dualtrain = 0
				src.dual_training = 0
				src.Icon_State("")
				src<< "<font size=1><B>You stop Dual Training"
				src.dual_partner = null
				spawn(50)
					M.dual_delay = 0
					src.dual_delay = 0
		else src<<"You cant dual train with NPCs!"
	else
		switch(alert(usr,"Are you sure you wish to Dual-Train with [M]?","Dual Train","Yes","No"))
			if("Yes")
				if(M.rest == 1)
					M << "you cannot DT while resting!"
					return
				if(src.rest)
					src<< "you cannot DT while resting!"
					return
				if(M.doing||M.rest||M.boxing) src<< "<font size=1><B>[M] is already busy doing something else."
				else
					switch(alert(M,"Do you wish to Dual Train with [src]?","Dual Train","Yes","No"))
						if("Yes")
							if(src.doing) M << "<font size=1><B>Sorry, but they are now busy doing somthing"
							else
								if(M in get_step(src,src.dir))
									if(!src.doing) src.doing ++
									switch(dir)
										if(NORTH) M.dir=SOUTH
										if(SOUTH) M.dir=NORTH
										if(WEST) M.dir=EAST
										if(EAST) M.dir=WEST
										if(NORTHEAST) M.dir=SOUTHWEST
										if(NORTHWEST) M.dir=SOUTHEAST
										if(SOUTHEAST) M.dir=NORTHWEST
										if(SOUTHWEST) M.dir=NORTHEAST
									M.dual_partner = "[src.name]"
									src.dual_partner = "[M.name]"
									M.dualtrain = 1
									M.dual_training = 1
									src.dualtrain= 1
									src.dual_training = 1
									M.Icon_State("spar fury")
									src.Icon_State("spar fury")
									M.frozen = 1
									src.frozen = 1
									spawn(30)
										if(!M) return
										src<< "<font size=1><B>You and your partner begin to dual train"
										M << "<font size=1><B>You and your partner begin to dual train"
										if(M.level>src.level) spawn() src.Dual_Train2((M.level-src.level)/10)
										else spawn() src.Dual_Train2(M.level/12)
										if(src.level>M.level) spawn() M.Dual_Train2((src.level-M.level)/10)
										else spawn() M.Dual_Train2(src.level/12)
									spawn(600)
										if(!M) return
										src.dual_delay = 0
										M.dual_delay = 0
										src<< "You're ready to dual train again!"
										M << "You're ready to dual train again!"
mob/proc/Dual_Train2(exp_bonus)
	while(src.dualtrain&&src.dual_training&&!src.selftraining)
		sleep(1)
		if(exp_bonus<100) exp_bonus=100
		var/exp_bonus2 = 60000
		if(src.exp<0) src.exp=0
		switch(trainingmode)
			if(2) exp_bonus2 += 6100
			if(3) exp_bonus2 += 7100
			if(4) exp_bonus2 += 8100
			if(5) exp_bonus2 += 9000
			if(6) exp_bonus2 += 43000
			if(7) exp_bonus2 += 80000
			if(8) exp_bonus2 += 280000
		switch(src.mode)
			if(2) exp_bonus2 += 6100
			if(3) exp_bonus2 += 7100
			if(4) exp_bonus2 += 8100
			if(5) exp_bonus2 += 9000
			if(6) exp_bonus2 += 43000
			if(7) exp_bonus2 += 80000
			if(8) exp_bonus2 += 280000
		src.exp+=exp_bonus2
		var/mob/PC/P
		for(var/mob/PC/N in get_step(src,src.dir)) P=N
		if(!ismob(P)||!P.dual_partner)
			src<<"Your partner has left you!"
			break
		if(src.fatigue >= src.fatigue_max)
			for(var/mob/PC/M in get_step(src,src.dir))
				if(M.dual_partner == "[src.name]")
					M << "<font size=1><B>Your partner is too weak to continue dual training!"
			src<< "<font size=1><B>You feel weak so you stop training!"
			break
		else
			src.Gain_Exp(exp_bonus,"Dual")
			src.fatigue += round(rand(1,3)*(src.level/23))
			sleep(23)
	for(var/mob/PC/M in players)
		if(M.dual_partner == "[src.name]")
			M.Icon_State("")
			M.frozen = 0
			M.doing = 0
			M.dual_training = 0
			M.frozen = 0
			M.boxing = 0
			M.Icon_State("")
			M.dualtrain = 0
			M.dual_partner = null
	src.Icon_State("")
	src.frozen = 0
	if(src.doing) src.doing --
	src.dual_training = 0
	src.frozen = 0
	src.boxing = 0
	src.Icon_State("")
	src.dualtrain = 0
	src.dual_partner = null