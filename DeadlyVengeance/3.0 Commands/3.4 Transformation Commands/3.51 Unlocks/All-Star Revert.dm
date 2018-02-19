mob/proc/All_Star_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(src.form!="")
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(16)
		src.overlays -= big_purple_elec
		src.overlays -= namek_elec
		src.overlays -= big_red_elec
		src.overlays -= mystic_elec
		src.overlays -= demon_elec_2
		src.overlays -= demon_elec
		src.overlays -= small_blue_elec
		src.overlays -= big_blue_elec
		src.overlays -= small_red_elec
		src.overlays -= big_red_elec
		src.overlays -= ely_red_elec
		src.overlays -= ely_blue_elec
		src.overlays += mystic_elec
		src.form = ""
		src.icon = 'All Star.dmi'
		src.Power_Redefine()
		src.block = 0
		src.dodge = 0
		src.critical = 0
		src.reflect = 0
		src.counter = 0
		oview() << "[src.name] has reverted from their transformed state."
		oview()<<"<font color=Blue> You feel the world return back to it's proper state"
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --