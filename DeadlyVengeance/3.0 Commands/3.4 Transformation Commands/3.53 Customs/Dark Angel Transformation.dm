mob/proc/Dark_Angel_Trans()
	var/trans_time = 27
	if(src.upkeep == 5) trans_time = 5
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	src.safe = 1
	if(!src.doing) src.doing ++
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(trans_time)
	switch(src.form)
		if("")if(src.powerlevel_max >= 8500)
			src.form = "Eradication Form"
			src.Power_Redefine()
			src.powerlevel *= 130
			src.ki *= 100
			src.strength *= 90
			src.defence *= 80
			src.block += 2
			src.dodge += 2
			src.critical += 5
			src.reflect += 5
			src.counter += 2
			src.speed = 3.8
			view(6) << "<font color = purple>[src.name]'s transforms to a first form!?!"
			src.icon = 'dark angelform 1 trans.dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Eradication Form")if(src.powerlevel_max >= 25000)
			src.form = "Fury Form"
			src.Power_Redefine()
			src.powerlevel *= 580
			src.ki *= 550
			src.strength *= 540
			src.defence *= 530
			src.block += 4
			src.dodge += 4
			src.critical += 7
			src.reflect += 7
			src.counter += 4
			src.speed = 3
			view(6) << "<font color = purple>[src.name]'s transforms to a sencond form!?!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
			src.icon = 'dark angel 2nd trans.dmi'
		if("Fury Form")if(src.powerlevel_max >= 50000)
			src.form = "Resilient Form"
			src.Power_Redefine()
			src.powerlevel *= 830
			src.ki *= 800
			src.strength *= 790
			src.defence *= 780
			src.block += 6
			src.dodge += 6
			src.critical += 8
			src.reflect += 8
			src.counter += 6
			src.speed = 2.5
			src.overlays += small_purple_elec
			view(6) << "<font color = purple>[src.name]'s transforms to a third form!?!"
			src.icon = 'dark angel 3rd trans.dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Resilient Form")if(src.powerlevel_max >= 175000)
			src.form = "Final Form"
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 26
			src.dodge += 35
			src.critical += 27
			src.reflect += 22
			src.counter += 20
			src.speed = 1.8
			src.overlays -= small_purple_elec
			src.overlays += big_purple_elec
			view(6) << "<font color = purple>[src.name]'s transforms to the final form!?!"
			src.icon = 'dark angel 4rd trans.dmi'
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.safe = 0
	src.Icon_State("")