mob
	var/learn_invert 	= 0
	learn/verb/Invert()
		set category = "Combat"
		set name = "Invert Power"
		set desc = "The user finds the stored power locked deep within them and gets a power boost."
		if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
		if(src.kaioken)
			src<<"Please settle your kaioken state."
			return
		else
			if(src.form=="")
				if(src.powerlevel_max >= 75000)
					if(!src.doing) src.doing ++
					src.safe = 1
					src.frozen = 1
					src.Icon_State("enrage")
					sleep(5)
					src.Power_Redefine()
					src.powerlevel *= 100
					src.ki *= 100
					src.strength *= 100
					src.defence *= 100
					src.block += 18
					src.dodge += 18
					src.critical += 18
					src.reflect += 18
					src.counter += 18
					src.speed = 2.8
					src.form = "Inverted"
					src.Icon_State("")
					src.overlays += small_white_elec
					view(6) << "<font color = white>[src.name]'s power surges as they become inverted!"
					new/obj/techs/Overlays/Crater_Small(src.loc)
					src.safe = 0
					src.frozen = 0
					if(src.doing) src.doing --
			else
				src<< "You cannot invert in a transformed state"
	proc/Invert_Revert()
		if(src.KO)
			src<<"No cheating"
			return
		if(src.form=="Inverted")
			src.frozen = 1
			src.Icon_State("enrage")
			sleep(16)
			src.form = ""
			src.aura_on = 1
			call(src,"Aura")()
			src.overlays -= small_white_elec
			src.Power_Redefine()
			oview() << "[src.name] has reverted from their Transformed state."
			src.Icon_State("")
			src.frozen = 0
			if(src.doing) src.doing --
			src.trans_delay = 0