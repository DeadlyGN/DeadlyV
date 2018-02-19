mob/proc/Evil_Trans()
	var/trans_time = 27
	if(src.upkeep == 5) trans_time = 5
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	src.safe = 1
	if(!src.doing) src.doing ++
	src.Icon_State("SS")
	src.frozen = 1
	sleep(trans_time)
	switch(src.form)
		if("")if(src.powerlevel_max >= 8500)
			src.Power_Redefine()
			src.form = "Super Saiyan"
			src.icon = 'Evil Sayain 2.dmi'
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
			view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Super Saiyan")if(src.powerlevel_max >= 25000)
			src.Power_Redefine()
			src.form = "Super Saiyan 2"
			src.icon = 'Evil Sayain 3.dmi'
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
			view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 2!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Super Saiyan 2")if(src.powerlevel_max >= 50000)
			src.Power_Redefine()
			src.form = "Super Saiyan 3"
			src.icon = 'Evil Sayain 4.dmi'
			src.overlays += small_purple_elec
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
			view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 3!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Super Saiyan 3")if(src.powerlevel_max >= 175000)
			src.Power_Redefine()
			src.form = "Super Saiyan 4"
			src.icon = 'Evil Sayain 5.dmi'
			src.overlays -= small_purple_elec
			src.overlays += big_purple_elec
			src.powerlevel *= 528
			src.ki *= 525
			src.strength *= 524
			src.defence *= 523
			src.block += 10
			src.dodge += 10
			src.critical += 12
			src.reflect += 12
			src.counter += 10
			src.speed = 1.8
			view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 4!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Super Saiyan 4")if(src.powerlevel_max >= 500000)
			src.Power_Redefine()
			src.form = "Super Saiyan 5"
			src.icon = 'Evil Sayain 6.dmi'
			src.overlays -= big_purple_elec
			src.overlays += big_purple_elec
			src.powerlevel *= 630
			src.ki *= 600
			src.strength *= 690
			src.defence *= 680
			src.block += 9
			src.dodge += 9
			src.critical += 11
			src.reflect += 11
			src.counter += 9
			src.speed = 1.8
			view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 5!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Super Saiyan 5")if(src.powerlevel_max >= 1000000)
			src.Power_Redefine()
			src.form = "Super Saiyan 6"
			src.icon = 'Evil Sayain 7.dmi'
			src.overlays -= big_purple_elec
			src.overlays += big_purple_elec
			src.powerlevel *= 800
			src.ki *= 800
			src.strength *= 800
			src.defence *= 800
			src.block += 9
			src.dodge += 7
			src.critical += 10
			src.reflect += 10
			src.counter += 9
			src.speed = 1
			view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 6!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Super Saiyan 6")if(src.powerlevel_max >= 1400000)
			src.Power_Redefine()
			src.form = "Super Saiyan 7"
			src.icon = 'Evil Sayain 8.dmi'
			src.overlays -= big_purple_elec
			src.overlays += big_purple_elec
			src.powerlevel *= 1100
			src.ki *= 1100
			src.strength *= 1100
			src.defence *= 1100
			src.block += 5
			src.dodge += 4
			src.critical += 11
			src.reflect += 8
			src.counter += 9
			src.speed = 1
			view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 7!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	src.safe = 0
	if(src.doing) src.doing --
	src.Icon_State("")