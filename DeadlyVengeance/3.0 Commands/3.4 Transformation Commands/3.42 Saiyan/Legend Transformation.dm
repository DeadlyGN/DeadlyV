mob/proc/Legend_Trans()
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
			src.form = "Restrained Super Saiyan"
			src.Power_Redefine()
			src.powerlevel *= 100
			src.ki *= 100
			src.strength *= 100
			src.defence *= 100
			src.block += 2
			src.dodge += 2
			src.critical += 5
			src.reflect += 5
			src.counter += 2
			src.speed = 3.8
			view(6) << "<font color = green>[src.name]'s power surges as they transform in to a Super Saiyan?!"
			src.icon = 'Brollly.dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Restrained Super Saiyan")if(src.powerlevel_max >= 25000)
			src.form = "True Super Saiyan"
			src.icon = 'Brolly1.dmi'
			src.Power_Redefine()
			src.powerlevel *= 200
			src.ki *= 200
			src.strength *= 200
			src.defence *= 200
			src.block += 4
			src.dodge += 4
			src.critical += 7
			src.reflect += 7
			src.counter += 4
			src.speed = 3
			view(6) << "<font color = green>[src.name]'s power surges as they transform in to the True Super Saiyan!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("True Super Saiyan")if(src.powerlevel_max >= 50000)
			src.form = "Legendary Super Saiyan"
			src.icon = 'Brolly2.dmi'
			src.overlays += small_purple_elec
			src.Power_Redefine()
			src.powerlevel *= 500
			src.ki *= 500
			src.strength *= 500
			src.defence *= 500
			src.block += 6
			src.dodge += 6
			src.critical += 8
			src.reflect += 8
			src.counter += 6
			src.speed = 2.5
			view(6) << "<font color = green>[src.name]'s power surges as they transform in to the Legendary Super Saiyan!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Legendary Super Saiyan")if(src.powerlevel_max >= 175000)
			src.form = "Berserk Super Saiyan"
			src.icon = 'Brolly3.dmi'
			src.overlays -= small_purple_elec
			src.overlays += big_purple_elec
			src.Power_Redefine()
			src.powerlevel *= 800
			src.ki *= 800
			src.strength *= 800
			src.defence *= 800
			src.block += 45
			src.dodge += 10
			src.critical += 12
			src.reflect += 12
			src.counter += 10
			src.speed = 1.8
			view(6) << "<font color = green>[src.name]'s power surges as they morph into their 5th Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Berserk Super Saiyan")if(src.powerlevel_max >= 500000)
			src.form = "Final Form"
			src.icon = 'Brolly4.dmi'
			src.overlays -= big_purple_elec
			src.overlays += big_purple_elec
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
			view(6) << "<font color = green>[src.name]'s power surges as they morph into their Final Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.Icon_State("")
	src.safe = 0