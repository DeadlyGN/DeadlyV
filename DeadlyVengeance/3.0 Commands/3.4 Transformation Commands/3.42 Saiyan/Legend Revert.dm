mob/proc/Legend_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(src.form!="")
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(16)
		src.overlays.Remove(small_purple_elec,big_purple_elec)
		src.Power_Redefine()
		src.form = ""
		src.icon = 'LSSJ.dmi'
		oview() << "[src.name] has reverted from their Transformed state."
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --