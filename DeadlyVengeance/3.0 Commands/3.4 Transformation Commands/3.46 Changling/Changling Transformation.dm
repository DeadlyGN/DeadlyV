mob/proc/Changling_Trans()
	var/trans_time = 27
	if(src.upkeep == 5) trans_time = 5
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
	if(!src.doing) src.doing ++
	src.safe = 1
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(trans_time)
	switch(src.form)
		if("")if(src.powerlevel_max >= 8500)
			src.form = "Second Form"
			src.icon = 'Changling - Form 2.dmi'
			src.Power_Redefine()
			src.powerlevel *= 113
			src.ki *= 110
			src.strength *= 119
			src.defence *= 118
			src.block += 2
			src.dodge += 2
			src.critical += 5
			src.reflect += 5
			src.counter += 2
			src.speed = 3.8
			view(6) << "<font color = #800080>[src.name]'s power surges as they morph into their Second Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Second Form")if(src.powerlevel_max >= 25000)
			src.form = "Third Form"
			src.icon = 'Changling - Form 3.dmi'
			src.Power_Redefine()
			src.powerlevel *= 218
			src.ki *= 215
			src.strength *= 214
			src.defence *= 213
			src.block += 4
			src.dodge += 4
			src.critical += 7
			src.reflect += 7
			src.counter += 4
			src.speed = 3
			view(6) << "<font color = #800080>[src.name]'s power surges as they morph into their Third Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Third Form")if(src.powerlevel_max >= 50000)
			src.form = "Fourth Form"
			src.icon = 'Changling - Form 4.dmi'
			src.overlays += small_purple_elec
			src.Power_Redefine()
			src.powerlevel *= 423
			src.ki *= 420
			src.strength *= 419
			src.defence *= 418
			src.block += 6
			src.dodge += 6
			src.critical += 8
			src.reflect += 8
			src.counter += 6
			src.speed = 2.5
			view(6) << "<font color = #800080>[src.name]'s power surges as they morph into their Forth Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Fourth Form")if(src.powerlevel_max >= 175000)
			src.form = "Fourth Form 100%"
			src.icon = 'Changling - Form 5.dmi'
			src.overlays -= small_purple_elec
			src.overlays += big_purple_elec
			src.Power_Redefine()
			src.powerlevel *= 628
			src.ki *= 625
			src.strength *= 624
			src.defence *= 623
			src.block += 10
			src.dodge += 10
			src.critical += 12
			src.reflect += 12
			src.counter += 10
			src.speed = 1.8
			view(6) << "<font color = #800080>[src.name]'s power surges as they morph into their 100% Power Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Fourth Form 100%")if(src.powerlevel_max >= 500000)
			src.form = "Hidden Form"
			src.icon = 'Changling - Form 6.dmi'
			src.Power_Redefine()
			src.powerlevel *= 730
			src.ki *= 700
			src.strength *= 790
			src.defence *= 780
			src.block += 9
			src.dodge += 9
			src.critical += 11
			src.reflect += 11
			src.counter += 9
			src.speed = 1.8
			view(6) << "<font color = #800080>[src.name]'s power surges as they morph into their Hidden Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Hidden Form")if(src.powerlevel_max >= 1000000)
			src.form = "True Final Form"
			src.icon = 'Changling - Form 7.dmi'
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 9
			src.dodge += 9
			src.critical += 11
			src.reflect += 11
			src.counter += 9
			src.speed = 1.8
			view(6) << "<font color = #800080>[src.name]'s power surges as they morph into their True Final Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.Icon_State("")
	src.safe = 0