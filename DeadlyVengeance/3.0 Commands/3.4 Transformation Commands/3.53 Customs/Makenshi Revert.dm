mob/proc/Makenshi_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(src.form!="")
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(16)
		src.form = ""
		src.overlays -= small_blue_elec
		src.overlays -= big_blue_elec
		src.overlays -= small_red_elec
		src.overlays -= big_red_elec
		src.overlays -= small_purple_elec
		src.overlays -= big_purple_elec
		src.overlays -= hair1
		src.overlays -= hair2
		src.overlays -= hair3
		src.overlays -= hair4
		src.overlays -= mystic_elec
		src.icon = 'Makenshi Normal Form.dmi'
		src.Power_Redefine()
		oview() << "[src.name] has reverted from their Transformed state."
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --