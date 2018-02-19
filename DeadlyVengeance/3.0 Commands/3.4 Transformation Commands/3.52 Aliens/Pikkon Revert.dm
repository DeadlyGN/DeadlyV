mob/proc/Pikkon_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(src.form!="")
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(16)
		src.overlays -= small_blue_elec
		src.aura_on = 1
		call(src,"Aura")()
		src.Power_Redefine()
		src.form = ""
		src.icon = 'Pikkon Form 1.dmi'
		oview() << "[src.name] has dwindled down to their base form."
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --