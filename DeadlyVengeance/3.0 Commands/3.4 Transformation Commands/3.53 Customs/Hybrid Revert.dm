mob.proc/Hybrid_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(src.form!="")
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(16)
		src.icon = 'Dude from1.dmi'
		src.form = ""
		src.overlays -= small_blue_elec
		src.overlays -= big_blue_elec
		src.overlays -= small_red_elec
		src.overlays -= big_red_elec
		src.overlays -= ely_red_elec
		src.overlays -= ely_blue_elec
		src.overlays -= mystic_elec
		src.aura_on = 1
		call(src,"Aura")()
		src.Power_Redefine()
		oview() << "[src.name] has dwindled down to their base form."
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --