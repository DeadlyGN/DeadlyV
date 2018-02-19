mob/proc/Pikkon_Trans()
	var/trans_time = 17
	if(src.form=="Inferno Form"||src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(!src.doing) src.doing ++
	src.Icon_State("enrage")
	src.frozen = 1
	sleep(trans_time)
	switch(src.form)
		if("")if(src.powerlevel_max >= 50000)
			src.form = "Hightened Being"
			src.icon = 'Pikkon Form 2.dmi'
			src.Power_Redefine()
			src.powerlevel *= 600
			src.ki *= 600
			src.strength *= 600
			src.defence *= 600
			src.block += 17
			src.dodge += 14
			src.critical += 14
			src.reflect += 17
			src.counter += 14
			src.speed = 0.8
			view(6) << "<font color = #EB7F00>[src.name]'s power begins to rise as they transform into a hightened form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Hightened Being")if(src.powerlevel_max >= 220000)
			src.form = "Inferno Form"
			src.icon = 'Pikkon Form 3.dmi'
			src.overlays += small_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 28
			src.dodge += 26
			src.critical += 26
			src.reflect += 28
			src.counter += 26
			src.speed = 0.2
			view(6) << "<font color = #EB7F00>[src.name] burst with energy as they transform into their inferno form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.safe = 0
	src.Icon_State("")