mob/proc/Makenshi_Trans()
	var/trans_time = 27
	if(src.upkeep == 5) trans_time = 5
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
	src.safe = 1
	if(!src.doing) src.doing ++
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(trans_time)
	switch(src.form)
		if("")if(src.powerlevel_max >= 8500)
			src.form = "Second Form"
			src.overlays += src.hair1
			src.Power_Redefine()
			src.powerlevel *= 200
			src.ki *= 200
			src.strength *= 200
			src.defence *= 200
			src.block += 2
			src.dodge += 2
			src.critical += 5
			src.reflect += 5
			src.counter += 2
			src.speed = 3.8
			view(6) << "<font color = white>[src.name]'s power surges as they morph into their Second Form!"
			src.icon = 'Makenshi Intense Form.dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Second Form")if(src.powerlevel_max >= 25000)
			src.form = "Third Form"
			src.overlays -= src.hair1
			src.overlays += src.hair2
			src.Power_Redefine()
			src.powerlevel *= 500
			src.ki *= 500
			src.strength *= 500
			src.defence *= 500
			src.block += 4
			src.dodge += 4
			src.critical += 7
			src.reflect += 7
			src.counter += 4
			src.speed = 3
			view(6) << "<font color = white>[src.name]'s power surges as they morph into their Third Form!"
			src.icon = 'Makenshi Dark  Form.dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Third Form")if(src.powerlevel_max >= 50000)
			src.form = "Fourth Form"
			src.overlays -= src.hair2
			src.overlays += src.hair3
			src.Power_Redefine()
			src.powerlevel *= 800
			src.ki *= 800
			src.strength *= 800
			src.defence *= 800
			src.block += 6
			src.dodge += 6
			src.critical += 8
			src.reflect += 8
			src.counter += 6
			src.speed = 2.5
			src.overlays += small_purple_elec
			view(6) << "<font color =white>[src.name]'s power surges as they morph into their Forth Form!"
			src.icon = 'Makenshi True Dark Form.dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Fourth Form")if(src.powerlevel_max >= 175000)
			src.form = "100% Power Form"
			src.overlays -= src.hair3
			src.overlays += src.hair4
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 10
			src.dodge += 10
			src.critical += 12
			src.reflect += 12
			src.counter += 10
			src.speed = 1.8
			src.overlays -= small_purple_elec
			src.overlays += big_purple_elec
			view(6) << "<font color = #800080>[src.name]'s power surges as they morph into their 100% Power Form!"
			src.icon = 'Makenshi True White Form.dmi'
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.Icon_State("")
	src.safe = 0