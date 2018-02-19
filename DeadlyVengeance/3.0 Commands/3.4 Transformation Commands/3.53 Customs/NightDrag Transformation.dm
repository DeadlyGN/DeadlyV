mob/proc/NightDra_Trans()
	var/trans_time = 27
	if(src.upkeep == 5) trans_time = 5
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	src.safe = 1
	if(!src.doing) src.doing ++
	src.frozen = 1
	switch(src.form)
		if("")if(src.powerlevel_max >= 8500)
			src.Icon_State("dtrans")
			sleep(trans_time)
			src.Power_Redefine()
			src.form = "Nightmire Form"
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
			view(6) << "<font color = red>[src.name]'s transforms into a Nightmire Dragon!"
			src.icon = 'Nightmare 2.dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Nightmire Form")if(src.powerlevel_max >= 25000)
			src.Icon_State("SS")
			sleep(trans_time)
			src.Power_Redefine()
			src.form = "Fire Soul"
			src.powerlevel *= 418
			src.ki *= 415
			src.strength *= 414
			src.defence *= 413
			src.block += 4
			src.dodge += 4
			src.critical += 7
			src.reflect += 7
			src.counter += 4
			src.speed = 3
			view(6) << "<font color = red>[src.name]'s transforms into a the Flying Fire Nightmire Dragon!"
			src.icon = 'Nightmire 4(fire dragon).dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Fire Soul")if(src.powerlevel_max >= 50000)
			src.Icon_State("SS")
			sleep(trans_time)
			src.Power_Redefine()
			src.form = "Ice Soul"
			src.powerlevel *= 723
			src.ki *= 720
			src.strength *= 719
			src.defence *= 718
			src.block += 6
			src.dodge += 6
			src.critical += 8
			src.reflect += 8
			src.counter += 6
			src.speed = 2.5
			src.overlays += small_purple_elec
			view(6) << "<font color = red>[src.name]'s transforms into a the Flying Ice Nightmire Dragon!"
			src.icon = 'Nightmire 5(ice dragon).dm1.dmi'
		if("Ice Soul")if(src.powerlevel_max >= 175000)
			src.Icon_State("SS")
			sleep(trans_time)
			src.Power_Redefine()
			src.form = "Dark Soul"
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 10
			src.dodge += 10
			src.critical += 48
			src.reflect += 12
			src.counter += 26
			src.speed = 1.3
			src.overlays -= small_purple_elec
			src.overlays += big_purple_elec
			view(6) << "<font color = red>[src.name]'s transforms into a the Flying Dark Nightmire Dragon"
			src.icon = 'Nightmire 6.dmi'
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	src.safe = 0
	if(src.doing) src.doing --
	src.Icon_State("")