mob/learn
	verb/Power_Down()
		set category = "Techniques"
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(src.buku)
			src<< "You cannot power down while in the air!"
			return
		if(src.KO) return
		if(src.powerlevel <= 0)
			src<< "You're too weak to power down!"
			return
		var/power_down = input("What do you wish to power down to?")as num | null
		if(power_down <= 0)
			src<< "You cannot power down that much!"
			return
		if(power_down >= src.powerlevel)
			src<< "You must power up for that!"
			return
		if(power_down < src.powerlevel)
			src<< "You lower your powerlevel to \white[num2text(power_down,10000000)]."
			src.Icon_State("enrage")
			oview(150) << "\white A powerlevel drops in the distance."
			sleep(16)
			src.powerlevel = power_down
			src.Icon_State("")