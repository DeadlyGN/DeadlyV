mob/proc/Human_Revert()
	if(src.KO)
		src <<"No cheating"
		return
	if(src.form_1)

		src.frozen = 1
		src.icon_state = "enrage"

		sleep(10)

		src.form_1 = 0
		src.form_2 = 0
		src.form_3 = 0
		src.form_4 = 0
		src.form_5 = 0


		src.overlays -= small_blue_elec
		src.overlays -= big_blue_elec

		src.overlays -= small_red_elec
		src.overlays -= big_red_elec
		src.overlays -= ely_red_elec
		src.overlays -= ely_blue_elec

		src.overlays -= mystic_elec
		src.underlays -= sh2_aura
		src.underlays -= src.aura
		src.aura_on = 0


		src.Power_Redefine()
		src.Skin_Apply()
		src.Hair_Apply()

		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.frozen = 0
		src.doing = 0

		return
	else
		return