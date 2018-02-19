mob/proc/Cooler_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(src.form!="")
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(16)
		src.overlays -= small_blue_elec
		src.overlays -= big_blue_elec
		src.overlays -= small_red_elec
		src.overlays -= big_red_elec
		src.overlays -= small_purple_elec
		src.overlays -= big_purple_elec
		src.underlays -= neopurple
		src.underlays -= neored
		src.underlays -= neoyellow
		src.underlays -= neoblue
		src.underlays -= neoyellow
		src.underlays -= neogreen
		src.overlays -= mystic_elec
		src.Power_Redefine()
		src.form = ""
		src.icon = 'Cooler.dmi'
		src.Icon_State("")
		oview() << "[src.name] has reverted from their Transformed state."
		src.frozen = 0
		if(src.doing) src.doing --