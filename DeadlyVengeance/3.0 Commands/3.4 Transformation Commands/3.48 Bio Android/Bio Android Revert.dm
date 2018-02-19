mob/proc/Bio_Revert()
	if(src.KO)
		src<<"No cheating"
		return
	if(!(src.form in list("","Imperfect Form","Perfect Form","Inverted","Ranger")))
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(17)
		src.form = "Perfect Form (Power Weighted)"
		src.overlays.Remove(small_blue_elec,big_blue_elec,mystic_elec)
		src.Power_Redefine()
		oview() << "[src.name] has reverted to their Power Weighted Form."
		src.Icon_State("")
		src.icon = 'Bio Android - Form 4.dmi'
		src.frozen = 0
		if(src.doing) src.doing --