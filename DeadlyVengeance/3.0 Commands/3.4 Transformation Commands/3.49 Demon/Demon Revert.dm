mob/proc/Demon_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(src.form!="")
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(17)
		src.form = ""
		src.overlays.Remove(demon_elec_2,demon_elec)
		switch(src.chromosome)
			if("Evil")src.icon = 'Demon - Form 1.dmi'
			if("Good")src.icon = 'Good Demon.dmi'
			if("Chaos")src.icon = 'Chaos Demon 1.dmi'
		src.Power_Redefine()
		oview() << "[src.name] has reverted from their Transformed state."
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --