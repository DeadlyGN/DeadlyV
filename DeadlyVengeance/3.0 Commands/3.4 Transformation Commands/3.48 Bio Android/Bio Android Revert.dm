mob/proc/Bio_Revert()
	if(src.KO)
		src <<"No cheating"
		return
	if(src.form_3)

		src.frozen = 1
		src.icon_state = "enrage"

		sleep(10)

		src.form_3 = 0
		src.form_4 = 0
		src.form_5 = 0
		src.form_6 = 0

		src.overlays -= small_blue_elec
		src.overlays -= big_blue_elec

		src.overlays -= small_red_elec
		src.overlays -= big_red_elec

		src.overlays -= mystic_elec

		src.Power_Redefine()

		oview() << "[src.name] has reverted from his Power Weighted Form."
		src.icon_state = ""
		src.icon = 'Bio Android - Form 3.dmi'
		src.frozen = 0
		src.doing = 0

		return
	else
		return