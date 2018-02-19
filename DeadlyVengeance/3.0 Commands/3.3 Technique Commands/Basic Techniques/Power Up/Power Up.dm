mob/var/
	tmp/powering = 0
	tmp/powering_ki = 0
	tmp/powering_pl = 0
	tmp/power_delay = 0
	power_up_skill = 3
	power_up_aura = 0
mob/learn/verb/
	StopP_Up()
		set hidden = 1
		set category = null
		src.powering_ki=0
		src.powering_pl=0
	Power_Up()
		set category = "Techniques"
		var/max_pl_healing = 0
		var/max_ki_healing = 0
		if(src.power_up_skill) max_pl_healing = src.powerlevel_max * 0.33
		if(src.power_up_skill == 2) max_pl_healing = src.powerlevel_max * 0.66
		if(src.power_up_skill == 3) max_pl_healing = src.powerlevel_max
		if(src.power_up_skill) max_ki_healing = src.ki_max * 0.33
		if(src.power_up_skill == 2) max_ki_healing = src.ki_max * 0.66
		if(src.power_up_skill == 3) max_ki_healing = src.ki_max
		if(src.buku)
			src<< "You cannot power up whilst flying!"
			return
		if(src.KO) return
		if(src.power_delay)
			src<< "You must wait a moment before using power up again!"
			return
		if(src.powering_ki||src.powering_pl)
			src<< "You stop powering up."
			src.frozen = 0
			spawn() src.aura()
			src.powering_ki = 0
			src.powering_pl = 0
			if(src.doing) src.doing --
			src.buku_lock = 0
			sleep(25)
			src.power_delay = 0
			src.afk_time = 0
		else
			if(src.powerlevel >= max_pl_healing && src.ki >= max_ki_healing)
				src<< "There's no reason to power up!"
			else
				if(src.doing||src.buku||src.dual_training)
					src<< "You're doing something already"
					return
				src.doing ++
				src.power_delay = 1
				src.frozen = 1
				src.powering_ki = 1
				src.powering_pl = 1
				src.buku_lock = 1
				src.Icon_State("enrage")
				src<< "You begin to focus your power.."
				spawn() src.aura()
				spawn() src.Powering_PL()
				spawn() src.Powering_KI()
				sleep(25)
				src.power_delay = 0
				src.afk_time = 0
mob
	proc
		Powering_PL()
			var/healing = round(src.powerlevel_max * 0.10)
			var/max_pl_healing = 0
			while(src.powerlevel<src.powerlevel_max&&src.powering_pl)
				if(src.power_up_skill)
					max_pl_healing = src.powerlevel_max * 0.33
				if(src.power_up_skill == 2)
					max_pl_healing = src.powerlevel_max * 0.66
				if(src.power_up_skill == 3)
					max_pl_healing = src.powerlevel_max
				if(!src.powering_pl)
					src.Icon_State("")
					src.frozen = 0
					if(src.doing) src.doing --
					spawn(50) src.power_delay = 0
				else
					src.powerlevel += healing
					for(var/mob/PC/M in view(src, 3))
						if(src.powerlevel >= (M.powerlevel * 100))
							var/FallDir = get_dir(src,M)
							src.dir = FallDir
							step(M,FallDir)
							switch(FallDir)
								if(NORTH)M.dir = SOUTH
								if(NORTHWEST)M.dir = SOUTHEAST
								if(WEST)M.dir = EAST
								if(SOUTHWEST)M.dir = NORTHEAST
								if(SOUTH)M.dir = NORTH
								if(SOUTHEAST)M.dir = NORTHWEST
								if(EAST)M.dir = WEST
								if(NORTHEAST)M.dir = SOUTHWEST
				sleep(20)
			src<< "You're fully powered up!"
			src.powerlevel = max_pl_healing
			src.aura()
			src.frozen = 0
			src.powering_pl = 0
			if(src.doing) src.doing --
			src.buku_lock = 0
			src.Icon_State("")
			sleep(25)
			src.power_delay = 0
			src.overlays -= aura
		Powering_KI()
			var/healing = round(src.ki_max * 0.10)
			var/max_ki_healing = 0
			while(src.ki<src.ki_max)
				if(src.power_up_skill)
					max_ki_healing = src.ki_max * 0.33
				if(src.power_up_skill == 2)
					max_ki_healing = src.ki_max * 0.66
				if(src.power_up_skill == 3)
					max_ki_healing = src.ki_max
				if(!src.powering_ki)
					src.Icon_State("")
					src.frozen = 0
					if(src.doing) src.doing --
					spawn(50) src.power_delay = 0
				else
					src.ki += healing
					for(var/mob/PC/M in view(src, 3))
						if(src.powerlevel >= (M.powerlevel * 100))
							var/FallDir = get_dir(src,M)
							src.dir = FallDir
							step(M,FallDir)
							switch(FallDir)
								if(NORTH)M.dir = SOUTH
								if(NORTHWEST)M.dir = SOUTHEAST
								if(WEST)M.dir = EAST
								if(SOUTHWEST)M.dir = NORTHEAST
								if(SOUTH)M.dir = NORTH
								if(SOUTHEAST)M.dir = NORTHWEST
								if(EAST)M.dir = WEST
								if(NORTHEAST)M.dir = SOUTHWEST
				sleep(20)
			src<< "You're fully powered up!"
			src.aura()
			src.ki = min(src.ki, max_ki_healing)
			src.frozen = 0
			src.powering_ki = 0
			if(src.doing) src.doing --
			src.buku_lock = 0
			src.Icon_State("")
			sleep(25)
			src.power_delay = 0
			src.overlays -= aura
		aura()
			if(!src.power_up_aura)
				if(!src.aura_on)
					src.power_up_aura = 1
					if(src.kaioken) src.underlays += kaio_aura
					else
						if(src.race == "Saiyan" || src.race == "Half Saiyan")
							if(src.form!="") src.underlays += ssj_aura
							else src.overlays += src.aura
						else src.overlays += src.aura
				else
					src.power_up_aura = 1
					if(src.kaioken) src.underlays -= kaio_aura
					else
						if(src.race == "Saiyan" || src.race == "Half Saiyan")
							if(src.form!="") src.underlays -= ssj_aura
							else src.overlays -= src.aura
						else src.overlays -= src.aura
			else
				if(!src.aura_on)
					src.power_up_aura = 0
					if(src.kaioken) src.underlays -= kaio_aura
					else
						if(src.race == "Saiyan" || src.race == "Half Saiyan")
							if(src.form!="") src.underlays -= ssj_aura
							else src.overlays -= src.aura
						else src.overlays -= src.aura
				else
					src.power_up_aura = 0
					if(src.kaioken) src.underlays += kaio_aura
					else
						if(src.race == "Saiyan" || src.race == "Half Saiyan")
							if(src.form!="") src.underlays += ssj_aura
							else src.overlays += src.aura
						else src.overlays += src.aura