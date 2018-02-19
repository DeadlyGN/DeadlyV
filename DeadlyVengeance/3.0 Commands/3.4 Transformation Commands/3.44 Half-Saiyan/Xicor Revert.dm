mob/proc/Xicor_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(src.form!="")
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(10)
		src.overlays.Remove(small_blue_elec,big_blue_elec,big_red_elec)
		src.Power_Redefine()
		src.form = ""
		src.icon = 'Xicor.dmi'
		oview() << "[src.name] has reverted from their Transformed state."
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --