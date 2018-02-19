mob/proc/Burter_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(src.form!="")
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(10)
		src.aura_on = 1
		call(src,"Aura")()
		src.Power_Redefine()
		src.form = ""
		src.icon = 'Burter (Trikon).dmi'
		oview() << "[src.name] has reverted from their Transformed state."
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --