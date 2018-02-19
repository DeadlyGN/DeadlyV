mob/var/tmp/
 rest = 0
 rest_delay = 0
mob/PC/verb/Rest()
	set category = "Training"
	if(src.rest_delay)
		src<< "You must wait a moment before Resting!"
		return
	if(src.kaioken) return
	if(src.KO) return
	if(src.rest)
		src.rest_delay = 1
		src<< "You stop resting"
		src.rest = 0
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --
		spawn(25)src.rest_delay = 0
		src.afk_time = 0
		return
	if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(!src.fatigue)
		src<< "You're already rested up"
		return
	else
		src.rest_delay = 1
		src<< "You sit down and rest yourself"
		src.rest = 1
		src.frozen = 1
		if(!src.doing) src.doing ++
		src.Icon_State("meditate")
		spawn(25)src.rest_delay = 0
		src.Rest_Gain()
		src.afk_time = 0
		return
mob/proc/Rest_Gain()
	while(src.rest)
		sleep(17)
		var/gains = round(rand(1,3)*(src.level/20))
		src.fatigue -= gains
		if(src.fatigue <= 0)
			src<< "You're all rested up"
			src.fatigue = 0
			src.rest = 0
			src.Icon_State("")
			src.frozen = 0
			if(src.doing) src.doing --
			sleep(50)
			src.rest_delay = 0
			return
		sleep(5)