mob/proc/Uub_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(!(src.form in list("","Hidden Form","Next Form","Inverted","Ranger")))
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(17)
		src.form = "Majuub"
		src.overlays -= small_blue_elec
		src.overlays -= big_blue_elec
		src.overlays -= small_red_elec
		src.overlays -= big_red_elec
		src.overlays -= mystic_elec
		src.Power_Redefine()
		oview() << "[src.name] has reverted."
		src.Icon_State("")
		src.icon = 'Uub 2.dmi'
		src.frozen = 0
		if(src.doing) src.doing --
