mob/var/list/buffs = new()
mob/var/buff_time = 0
mob/var/active_buffs = 0
mob/proc
	BUFF_TIMER()
		if(src.buff_time > 0)
			src.buff_time -= 100
			sleep(100)
			BUFF_TIMER()
		else
			if(src.buff_time <= 0)
				if("exp_buff" in src.buffs) src.buffs -= "exp_buff"
				if("minor_exp_buff" in src.buffs) src.buffs -= "minor_exp_buff"
				if("pl_buff" in src.buffs)
					src.buffs -= "pl_buff"
					src.powerlevel_max -= usr.saved_pl * 0.15
				if("def_buff" in src.buffs)
					src.buffs -= "def_buff"
					src.defence_max -= usr.saved_def * 0.05
				if("str_buff" in src.buffs)
					src.buffs -= "str_buff"
					src.strength_max -= usr.saved_str * 0.075
				src.active_buffs = 0
				return
	MUTE_TIMER()
		if(src.mute_time)
			sleep(src.mute_time)
			if(src.muted)
				src.muted = 0
				players<<"[src] has been <font color=red>UNMUTED</font>."
	JAIL_TIMER()
		if(src.jail_time)
			src.loc=locate(rand(188,200),rand(4,11),8)
			sleep(src.jail_time*600)
			if(src.jailed)
				src.jailed = 0
				players<<"[src] has been <font color=red>UNJAILED</font>."
				src.loc=locate(23,215,9)
obj/proc
	BUFF_COOLDOWN()
		while(src.cooldown > 0)
			src.cooldown -= 100
			sleep(100)
		if(src.cooldown <= 0)
			src.cooldown = 0
			return