mob/var/tmp
 frozen = 0
 speeding = 0
mob/PC
	Move()
		if(frozen||speeding) return 0
		var/delay = speed
		var/buku_speed = max(0,speed - 1.5)
		speeding = 1
		.=..()
		if(buku) spawn(buku_speed) speeding = 0
		else spawn(delay) speeding = 0
		if(.) spawn()
			var/FullBonus = 0
			var/FullDrain = rand(0,1)
			var/z_bonus = src.level * 4
			var/level5 = round(src.level/5)
			var/cape1_bonus = 1 + level5
			var/cape2_bonus = 5 + level5
			var/cape3_bonus = 12 + level5
			var/armor1_bonus = 3 + level5
			var/armor2_bonus = 7 + level5
			var/armor3_bonus = 17 + level5
			var/gi1_bonus = 2 + level5
			var/gi2_bonus = 7 + level5
			var/gi3_bonus = 15 + level5
			var/leg_bonus = 5 + level5
			var/leg2_bonus = 10 + level5
			var/arm_bonus = 5 + level5
			var/arm2_bonus = 10 + level5
			var/ankle_bonus = 1 + level5
			var/ankle2_bonus = 5 + level5
			var/wrist_bonus = 1 + level5
			var/wrist2_bonus = 5 + level5
			var/turben_bonus = 5 + level5
			var/turben2_bonus = 10 + level5
			if(z_bonus <= 1) z_bonus = 1
			if(src.z_sword)
				FullBonus += z_bonus
				if(src.powerlevel_max < 3500000) FullDrain += rand(1,3)
				if(src.powerlevel_max > 4000000) FullDrain += 1
			switch(src.weightcape)
				if(1) FullBonus += cape1_bonus
				if(2) FullBonus += cape2_bonus
				if(3) FullBonus += cape3_bonus
			switch(src.weightarmor)
				if(1) FullBonus += armor1_bonus
				if(2) FullBonus += armor2_bonus
				if(3) FullBonus += armor3_bonus
			switch(src.weightgi)
				if(1) FullBonus += gi1_bonus
				if(2) FullBonus += gi2_bonus
				if(3) FullBonus += gi3_bonus
			switch(src.weightleg)
				if(1) FullBonus += leg_bonus
				if(2) FullBonus += leg2_bonus
			switch(src.weightarm)
				if(1) FullBonus += arm_bonus
				if(2) FullBonus += arm2_bonus
			switch(src.weightankle)
				if(1) FullBonus += ankle_bonus
				if(2) FullBonus += ankle2_bonus
			switch(src.weightwrist)
				if(1) FullBonus += wrist_bonus
				if(2) FullBonus += wrist2_bonus
			switch(src.weighthead)
				if(1) FullBonus += turben_bonus
				if(2) FullBonus += turben2_bonus
			if(FullBonus <= 0) FullBonus = 0
			if(FullBonus >= 650) FullBonus = 650
			if(src.mode == 7 && FullBonus >= 1050) FullBonus = 1050
			if(FullDrain >= 25) FullDrain = rand(5,15)
			if(src.weightgi >= 1||src.weightcape >= 1||src.weightarmor >= 1||src.weightarm >= 1||src.weightleg >= 1||src.weightankle >= 1||src.weightwrist >= 1||src.weighthead >= 1||src.z_sword >= 1)
				if(src.fatigue < src.fatigue_max && !src.KO && !src.rest && !src.frozen && !src.doing)
					if(prob(33)) src.fatigue += FullDrain + round(src.level/80)
					if(prob(5))
						src.fatigue_exp += round(FullBonus/2)+src.level
						src.Fatigue_Level_Up()
					src.Gain_Exp(FullBonus)
					src.Tired_KO()
		if(src.s_bubble)
			var/turf/T = locate(src.x,src.y+1,src.z)
			if(T) src.s_bubble.loc = T
			else src.s_bubble.loc = src.loc
		return .
mob/Move()//Move proc.. it's absolutely delectable
	. = ..()
	if(src.client)
		for(var/mob/Monster/B in Pets) if(B.owner == src && !B.not_following && !B.frozen && !B.speeding){if(src.buku){call(B,"Flight")()}; walk_towards(B,src)}
	return .
mob/PC/verb
	North()
		set hidden = 1
		afk_time = 0
		spawn()
			if(meditation)
				if(meddir=="North")
					spawn() MedGain()
					meddir=null
				else
					meddir=null
					meditation=0
					src<<"You fail in your meditation"
					spawn() Meditate_Gain()
			else if(GMLocked||jailed||frozen||wrapped||donut_wrapped||KO||frozen||dual_training||selftraining||boxing||meditation||meditate) return
			if(dead && z!=8) loc = locate(44,25,8)
			else client.North()
	South()
		set hidden = 1
		afk_time = 0
		spawn()
			if(meditation)
				if(meddir=="South")
					spawn() MedGain()
					meddir=null
				else
					meddir=null
					meditation=0
					src<<"You fail in your meditation"
					spawn() Meditate_Gain()
			else if(GMLocked||jailed||frozen||wrapped||donut_wrapped||KO||frozen||dual_training||selftraining||boxing||meditation||meditate) return
			if(dead && z!=8) loc = locate(44,25,8)
			else client.South()
	East()
		set hidden = 1
		afk_time = 0
		spawn()
			if(meditation)
				if(meddir=="East")
					spawn() MedGain()
					meddir=null
				else
					meddir=null
					meditation=0
					src<<"You fail in your meditation"
					spawn() Meditate_Gain()
			else if(GMLocked||jailed||frozen||wrapped||donut_wrapped||KO||frozen||dual_training||selftraining||boxing||meditation||meditate) return
			if(dead && z!=8) loc = locate(44,25,8)
			else client.East()
	West()
		set hidden = 1
		afk_time = 0
		spawn()
			if(meditation)
				if(meddir=="West")
					spawn() MedGain()
					meddir=null
				else
					meddir=null
					meditation=0
					src<<"You fail in your meditation"
					spawn() Meditate_Gain()
			else if(GMLocked||jailed||frozen||wrapped||donut_wrapped||KO||frozen||dual_training||selftraining||boxing||meditation||meditate) return
			if(dead && z!=8) loc = locate(44,25,8)
			else client.West()
	NorthWest()
		set hidden = 1
		afk_time = 0
		spawn()
			if(meditation)
				if(meddir=="NorthWest")
					spawn() MedGain()
					meddir=null
				else
					meddir=null
					meditation=0
					src<<"You fail in your meditation"
					spawn() Meditate_Gain()
			else if(GMLocked||jailed||frozen||wrapped||donut_wrapped||KO||frozen||dual_training||selftraining||boxing||meditation||meditate) return
			if(dead && z!=8) loc = locate(44,25,8)
			else client.Northwest()
	NorthEast()
		set hidden = 1
		afk_time = 0
		spawn()
			if(meditation)
				if(meddir=="NorthEast")
					spawn() MedGain()
					meddir=null
				else
					meddir=null
					meditation=0
					src<<"You fail in your meditation"
					spawn() Meditate_Gain()
			else if(GMLocked||jailed||frozen||wrapped||donut_wrapped||KO||frozen||dual_training||selftraining||boxing||meditation||meditate) return
			if(dead && z!=8) loc = locate(44,25,8)
			else client.Northeast()
	SouthWest()
		set hidden = 1
		afk_time = 0
		spawn()
			if(meditation)
				if(meddir=="SouthWest")
					spawn() MedGain()
					meddir=null
				else
					meddir=null
					meditation=0
					src<<"You fail in your meditation"
					spawn() Meditate_Gain()
			else if(GMLocked||jailed||frozen||wrapped||donut_wrapped||KO||frozen||dual_training||selftraining||boxing||meditation||meditate) return
			if(dead && z!=8) loc = locate(44,25,8)
			else client.Southwest()
	SouthEast()
		set hidden = 1
		afk_time = 0
		spawn()
			if(meditation)
				if(meddir=="SouthEast")
					spawn() MedGain()
					meddir=null
				else
					meddir=null
					meditation=0
					src<<"You fail in your meditation"
					spawn() Meditate_Gain()
			else if(GMLocked||jailed||frozen||wrapped||donut_wrapped||KO||frozen||dual_training||selftraining||boxing||meditation||meditate) return
			if(dead && z!=8) loc = locate(44,25,8)
			else client.Southeast()
turf
	Enter(var/mob/M as mob)
		if(ismob(M)) {M.safe=0;if(M.grav){if(M.z!=5&&M.z!=6){M.grav=0;M.grav_on=0;}}}
		for(var/area/house/A in view(0,src)) if(istype(A,/area/house/))
			if(isobj(M)) if(istype(M,/obj/)) del(M)
			if(!ismob(M)) break
			if(!M.key) return FALSE
			if(M.beingattacked||M.attacker){alert(M,"Please wait a moment after combat before entering."); return FALSE:}
			for(var/obj/O in M.contents)
				if(istype(O,/obj/Dragonballs))
					M << "You cannot enter with a dragonball!"
					return FALSE
			if(M.arenab){ spawn(){ alert(usr,"Finish your arena battle!")}; return FALSE; }
			if(M.doing){ M<<"Finish whatever you're doing before entering."; return FALSE; }
			M.safe = 1
			M.see_invisible = 0
		//usr<<"[usr] [usr.type] the usr has entered [src] [type] the src"
		return ..()
	/*Exit(var/mob/M as mob)
		//usr<<"[usr] [usr.type] the usr has exited [src] [type] the src"
		return ..()*/
	Exited(var/mob/PC/M as mob)
		if(ismob(M))
			var/a1=0
			for(var/area/house/A in view(0,src)) a1++
			if(!a1){ M.see_invisible = 1; M.safe=0; }
			return ..()
area
	mouse_opacity=0
	house
		layer=7
turf
	No_Walking
		density=1
		Enter()
			return FALSE