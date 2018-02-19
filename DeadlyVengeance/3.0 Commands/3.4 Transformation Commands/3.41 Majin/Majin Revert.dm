mob/proc/Majin_Revert()
	if(src.KO) return
	if(src.form in list("Super Majin 2"))
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(17)
		src.form = "Super Majin"
		src.aura_on = 1
		call(src,"Aura")()
		src.overlays.Remove(small_red_elec)
		src.Power_Redefine()
		oview() << "[src.name] has reverted from their Transformed state."
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --