obj/Transform/Revert
	verb
		Revert()
			set category = "Combat"
			if(usr.tourny&&usr.beingattacked)
				alert(usr,"You're unable to revert inside tournament matches! Prepare before the match, not durring!","Tournament")
				return
			if(usr.doing||usr.trans_delay||usr.boxing) return
			usr.trans_delay = 1
			usr.doing ++
			usr.Force_Revert()
			usr.afk_time = 0
			//usr.overlays+=usr.hair
			sleep(50)
			usr.trans_delay = 0
			if(usr.doing) usr.doing --
mob/proc
	FullHeal()
		powerlevel = powerlevel_max
		ki = ki_max
		strength = strength_max
		defence = defence_max
		speed = speed_max
		critical = critical_max
		dodge = dodge_max
		reflect = reflect_max
		block = block_max
		counter = counter_max
	Power_Redefine()
		if(powerlevel>powerlevel_max) powerlevel = powerlevel_max
		if(ki>ki_max) ki = ki_max
		/*if(strength>strength_max) */strength = strength_max
		/*if(defence>defence_max) */defence = defence_max
		speed = speed_max
		critical = critical_max
		dodge = dodge_max
		reflect = reflect_max
		block = block_max
		counter = counter_max
	Force_Revert()
		if(form=="Inverted"){ Invert_Revert(); return; }
		switch(race)
			if("Konats") Konats_Revert()
			if("Human") Human_Revert()
			if("Half Saiyan") Half_Saiyan_Revert()
			if("Changling") if(!metal_converted) Changling_Revert()
			if("Saiyan") Saiyan_Revert()
			if("Xicor") Xicor_Revert()
			if("Hybrid") Hybrid_Revert()
			if("Vampire") Vampire_Revert()
			if("Tuffle") Tuffle_Revert()
			if("Bio-Android") Bio_Revert()
			if("Demon") Demon_Revert()
			if("Majin") Majin_Revert()
			if("Bojack") Bojack_Revert()
			if("Dragon") Dragon_Revert()
			if("Kai") Kai_Revert()
			if("Saibaman") Saibaman_Revert()
			if("Legend") Legend_Revert()
			if("All Star") All_Star_Revert()
			if("Makenshi") Makenshi_Revert()
			if("Dark Neo") Neo_Revert()
			if("Bardock") Bardock_Revert()
			if("Slayer") Slayer_Revert()
			if("Cooler") if(!metal_converted) Cooler_Revert()
			if("Dark Angel") Dark_Angel_Revert()
			if("Evil Saiyan") Evil_Revert()
			if("Pikkon") Pikkon_Revert()
			if("Nightmire Dragon") NightDra_Revert()
			if("Jester") Jester_Revert()
			if("Burter") Burter_Revert()
			if("Uub") Uub_Revert()
		if(src.MembIcon) src.icon=MembIcon
		else src.Skin_Apply()
		if(src.dead) src.FullHeal()