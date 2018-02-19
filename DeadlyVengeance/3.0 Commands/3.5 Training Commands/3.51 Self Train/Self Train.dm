mob/var
	tmp
		boxing = 0
		waiting = 0
		selftraining = 0
	one_time = 0
mob/PC/verb/Self_Train()
	set category = "Training"
	if(!src.waiting)
		if(src.boxing||src.selftraining)
			src<< "<font size=1><B>You stop training."
			src.one_time = 0
			src.boxing = 0
			src.selftraining=0
			waiting = 1
			sleep(30)
			waiting = 0
			if(src.doing) src.doing --
		else
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
			else
				if(src.fatigue >= src.fatigue_max)
					src<< "<font size=1><B>You're too drained to train!"
				else
					src.boxing = 1
					src.selftraining=1
					if(!src.doing) src.doing ++
					src.Icon_State("spar fury")
					src<< "<font size=1><B>You begin to train!"
					src.frozen = 1
					src.Self_Train2()
					src.one_time = 1
					src.waiting = 1
					spawn(30)
						src.waiting = 0
	else src<< "You must wait before you can self train again!"
mob/proc/Self_Train2()
	while(src.boxing&&src.selftraining&&!src.dual_training&&!src.dualtrain)
		sleep(1)
		var/exp_bonus = 45000
		if(src.exp<0) src.exp=0
		switch(trainingmode)
			if(2) exp_bonus += 6100
			if(3) exp_bonus += 7100
			if(4) exp_bonus += 8100
			if(5) exp_bonus += 9000
			if(6) exp_bonus += 12000
			if(7) exp_bonus += 18000
			if(8) exp_bonus += 28000
		switch(src.mode)
			if(2) exp_bonus += 6100
			if(3) exp_bonus += 7100
			if(4) exp_bonus += 8100
			if(5) exp_bonus += 9000
			if(6) exp_bonus += 12000
			if(7) exp_bonus += 18000
			if(8) exp_bonus += 28000
		if(src.fatigue >= src.fatigue_max)
			src<< "<font size=1><B>You feel weak so you stop training!"
			src.one_time = 0
			src.selftraining=0
			if(src.doing) src.doing --
			src.frozen = 0
			src.boxing = 0
			src.Icon_State("")
			return
		else
			src.Gain_Exp(exp_bonus,"Self")
			src.fatigue += round(rand(1,3)*(src.level/45))
		sleep(23)
	src.Icon_State("")
	src.frozen = 0
	src.selftraining=0
	if(src.doing) src.doing --
	src.boxing = 0
mob/var/tmp/meditation = 0
/*mob/proc
	Ki_Meditation()
		while(src.meditation&&src.meditate)
			var/ki_chance = rand(4,6)
			var/ki_gain = src.level * rand(4,6)
			if(src.fatigue >= src.fatigue_max)
				src.meditate = 0
				if(src.doing) src.doing --
				src.frozen = 0
				src.Icon_State("")
				src<< "You fail your meditation, as beads of sweat drop down your face."
				return
			src.fatigue += rand(2,5) + round(src.level/80)
			src.ki_exp += (src.exp * rand(3,5))
			if(prob(ki_chance))
				src<< "<font color = yellow>As you train your ki, you gain +[ki_gain] Ki!</font>"
				src.ki += ki_gain
				return
			spawn(17) src.Ki_Level_Up()
			sleep(22)
		if(src.doing) src.doing --
		src.frozen = 0
		src.meditate = 0
		src.Icon_State("")*/
mob/var/tmp{meditate = 0; medhash = null;}
obj/Training
	density = 0
	Meditation_Pad
		icon='Furnature.dmi'
		icon_state = "warp"
		verb
			Meditate()
				set src in view(0)
				set category = "Training"
				if(usr.meditatewait)
					usr<<"You must wait shortly before using this again."
					return
				if(usr.meditation||usr.meditate)
					usr.meditation = 0
					usr.meditate = 0
					if(usr.doing) usr.doing --
					usr.frozen = 0
					usr.Icon_State("")
					usr<< "You get up from meditating"
					return
				if(usr.doing||usr.buku||usr.dual_training||usr.selftraining||usr.boxing||usr.meditation||usr.meditate||usr.kaioken) return
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too Tired to Meditate"
				else
					usr.meditate ++
					usr<< "You sit down and begin to focus your mind as you Meditate."
					usr.meditation ++
					usr.doing ++
					usr.frozen = 1
					usr.meditatewait = 1
					usr.Icon_State("meditate")
					spawn(60) usr.meditatewait = 0
					usr.Meditate_Gain()
obj/HUD/
	layer=20
	Arrows
		icon = 'Arrows.dmi'
		screen_loc = "CENTER,CENTER"
mob/proc/
	Meditate_Gain()
		var/obj/O = new/obj/HUD/Arrows()
		src.meddir=null
		src.medhash=null
		for(var/obj/HUD/Arrows/a in src.client.screen)
			src.client.screen-=a
			del(a)
		if(meditation>1)
			meditation--
			return
		if(meditate>1)
			src.meditate--
			return
		if(exp<0) exp=0
		if(fatigue >= fatigue_max)
			src<< "You're too tired to continue meditating"
			fatigue = fatigue_max
			meditate = 0
			meditation = 0
			frozen = 0
			if(doing) doing --
			Icon_State("")
			return
		if(prob(85)) fatigue += rand(0,500) + round(level/20)
		spawn(rand(9,15))
			if(!meditation||!meditate)
				if(doing) doing --
				frozen = 0
				meditation = 0
				meditate = 0
				Icon_State("")
				return
			var/medir=rand(1,4)
			var/medihash=rand(000001,999999)
			src.medhash=medihash
			switch(medir)
				if(1)
					src.meddir="North"
					O.icon_state=meddir
					O.screen_loc = "CENTER,CENTER+1"
					src.client.screen+=O
					spawn(23)
						if(src.meddir=="North"&&src.medhash==medihash)
							src.meddir=null
							src.medhash=null
							src<<"Too slow!"
							if(O) O.icon_state = ""
							src.meditate = 0
				if(2)
					src.meddir="South"
					O.icon_state=meddir
					O.screen_loc = "CENTER,CENTER-1"
					src.client.screen+=O
					spawn(23)
						if(src.meddir=="South"&&src.medhash==medihash)
							src.meddir=null
							src.medhash=null
							src<<"Too slow!"
							if(O) O.icon_state = ""
							src.meditate = 0
				if(3)
					src.meddir="East"
					O.icon_state=meddir
					O.screen_loc = "CENTER+1,CENTER"
					src.client.screen+=O
					spawn(23)
						if(src.meddir=="East"&&src.medhash==medihash)
							src.meddir=null
							src.medhash=null
							src<<"Too slow!"
							if(O) O.icon_state = ""
							src.meditate = 0
				if(4)
					src.meddir="West"
					O.icon_state=meddir
					O.screen_loc = "CENTER-1,CENTER"
					src.client.screen+=O
					spawn(23)
						if(src.meddir=="West"&&src.medhash==medihash)
							src.meddir=null
							src.medhash=null
							src<<"Too slow!"
							if(O) O.icon_state = ""
							src.meditate = 0
			spawn(rand(21,25))
				if(O)
					src.client.screen -= O
					O.icon_state = ""
					del O
				if(!meditation||!meditate)
					if(doing) doing --
					frozen = 0
					meditation = 0
					meditate = 0
					Icon_State("")
	MedGain()
		var/exp_bonus = tnl*50
		switch(trainingmode)
			if(2) exp_bonus += 6100
			if(3) exp_bonus += 7100
			if(4) exp_bonus += 8100
			if(5) exp_bonus += 9000
			if(6) exp_bonus += 12000
			if(7) exp_bonus += 18000
			if(8) exp_bonus += 28000
		switch(src.mode)
			if(2) exp_bonus += 6100
			if(3) exp_bonus += 7100
			if(4) exp_bonus += 8100
			if(5) exp_bonus += 9000
			if(6) exp_bonus += 12000
			if(7) exp_bonus += 18000
			if(8) exp_bonus += 28000
		spawn() src.Gain_Exp(exp_bonus,"MedPad")
		spawn(2) Meditate_Gain()