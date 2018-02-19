mob/proc/Tuffle_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(src.form in list("Super Tuffle","Hidden Form"))
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(17)
		oview() << "[src.name] has reverted from bering in [form]."
		src.form = "Infected Form 2"
		src.overlays -= small_blue_elec
		src.overlays -= big_blue_elec
		src.overlays -= small_red_elec
		src.overlays -= big_red_elec
		src.overlays -= mystic_elec
		src.overlays -= src.hair_fssj4
		src.Power_Redefine()
		src.icon = 'Bebi - Form 3.dmi'
		src.Icon_State("")
		src.frozen = 0
		if(src.doing) src.doing --