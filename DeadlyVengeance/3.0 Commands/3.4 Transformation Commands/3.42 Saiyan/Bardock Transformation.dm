mob/proc/Bardock_Trans()
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
			src.form = "Super Saiyan"
			src.icon = 'bardockss.dmi'
			src.Power_Redefine()
			src.powerlevel *= 240
			src.ki *= 160
			src.strength *= 130
			src.defence *= 120
			src.block += 2
			src.dodge += 2
			src.critical += 5
			src.reflect += 5
			src.counter += 2
			src.speed = 3.8
			view(6) << "<font color = yellow>[src.name]'s transforms to a SUPER SAYAIN!?!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Super Saiyan")if(src.powerlevel_max >= 25000)
			src.form = "Super Saiyan 2"
			src.Power_Redefine()
			src.powerlevel *= 460
			src.ki *= 400
			src.strength *= 420
			src.defence *= 350
			src.block += 4
			src.dodge += 4
			src.critical += 7
			src.reflect += 7
			src.counter += 4
			src.speed = 3
			view(6) << "<font color = yellow>[src.name]'s transforms to a SUPER SAYAIN 2!?!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Super Saiyan 2")if(src.powerlevel_max >= 50000)
			src.form = "Super Saiyan 3"
			src.icon = 'bardockss3.dmi'
			src.overlays += small_purple_elec
			src.Power_Redefine()
			src.powerlevel *= 560
			src.ki *= 500
			src.strength *= 578
			src.defence *= 580
			src.block += 6
			src.dodge += 6
			src.critical += 8
			src.reflect += 8
			src.counter += 6
			src.speed = 2.5
			view(6) << "<font color = yellow>[src.name]'s transforms to a SUPER SAYAIN 3!?!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Super Saiyan 3")if(src.powerlevel_max >= 175000)
			src.form = "Super Saiyan 4"
			src.icon = 'bardockss4.dmi'
			src.Power_Redefine()
			src.powerlevel *= 680
			src.ki *= 650
			src.strength *= 640
			src.defence *= 630
			src.block += 10
			src.dodge += 10
			src.critical += 12
			src.reflect += 12
			src.counter += 10
			src.speed = 1.8
			src.overlays -= small_purple_elec
			src.overlays += big_purple_elec
			view(6) << "<font color = red>[src.name]'s transforms to a SUPER SAYAIN 4!?!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Super Saiyan 4")if(src.powerlevel_max >= 500000)
			src.form = "Super Saiyan 5"
			src.icon = 'BardockSS5.dmi'
			src.overlays += big_purple_elec
			src.Power_Redefine()
			src.powerlevel *= 820
			src.ki *= 800
			src.strength *= 820
			src.defence *= 800
			src.block += 9
			src.dodge += 9
			src.critical += 11
			src.reflect += 11
			src.counter += 9
			src.speed = 1.8
			view(6) << "<font color = white>[src.name]'s transforms to a SUPER SAYAIN 5!?!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Super Saiyan 5")if(src.powerlevel_max >= 800000)
			src.form = "Super Saiyan 6"
			src.icon = 'BardockSS6.dmi'
			src.overlays -= big_purple_elec
			src.overlays += big_purple_elec
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 18
			src.dodge += 15
			src.critical += 19
			src.reflect += 17
			src.counter += 18
			src.speed = 1
			view(6) << "<font color =Gray>[src.name]'s transforms to a<font color=red> SUPER SAYAIN 6!?!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.safe = 0
	src.Icon_State("")