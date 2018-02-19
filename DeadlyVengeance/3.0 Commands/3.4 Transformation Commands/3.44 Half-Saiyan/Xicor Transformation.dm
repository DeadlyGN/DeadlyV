mob/proc/Xicor_Trans()
	if(src.form=="SX8"||src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
	src.aura_on = 1
	call(src,"Aura")()
	src.underlays += ssj_aura
	spawn(25) src.underlays -= ssj_aura
	if(!src.doing) src.doing ++
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(19)
	switch(src.form)
		if("")
			src.form = "SX1"
			src.icon = 'Xicor SSJ.dmi'
			src.Power_Redefine()
			src.powerlevel *= 118
			src.ki *= 118
			src.strength *= 118
			src.defence *= 118
			src.block = 7
			src.dodge = 7
			src.critical = 7
			src.reflect = 7
			src.counter = 7
			src.speed = 3
			sleep(5)
			view(6) << "<font color = white>[src.name] screams in an Uncontrollable Rage as they transform to SX1!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("SX1")
			src.form = "SX2"
			src.icon = 'Xicor SSJ2.dmi'
			src.overlays += small_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 229
			src.ki *= 229
			src.strength *= 229
			src.defence *= 229
			src.block = 15
			src.dodge = 15
			src.critical = 15
			src.reflect = 15
			src.counter = 15
			src.speed = 3
			view(6) << "<font color = white>[src.name]'s power grows as they transform to SX2!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("SX2")
			src.form = "SX3"
			src.icon = 'Xicor SSJ3.dmi'
			src.overlays -= small_blue_elec
			src.overlays += big_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 311
			src.ki *= 311
			src.strength *= 311
			src.defence *= 311
			src.block = 20
			src.dodge = 20
			src.critical = 20
			src.reflect = 20
			src.counter = 20
			src.speed = 2.3
			view(6) << "<font color = white>[src.name] screams in rage as their Hair Spikes up and Electricity sparks around them! [src.name] is now SX3!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("SX3")
			src.form = "SX4"
			src.icon = 'Xicor SSJ4.dmi'
			src.Power_Redefine()
			src.powerlevel *= 418
			src.ki *= 418
			src.strength *= 418
			src.defence *= 418
			src.block = 25
			src.dodge = 25
			src.critical = 25
			src.reflect = 25
			src.counter = 25
			src.speed = 1.5
			view(6) << "<font color = white>[src.name] screams as their mind fills with hate. [src.name] is now SX4!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("SX4")
			src.form = "SX5"
			src.icon = 'Xicor SSJ5.dmi'
			src.overlays -= big_blue_elec
			src.overlays += big_red_elec
			src.Power_Redefine()
			src.powerlevel *= 527
			src.ki *= 527
			src.strength *= 527
			src.defence *= 527
			src.block = 30
			src.dodge = 30
			src.critical = 30
			src.reflect = 30
			src.counter = 30
			src.speed = 0.5
			view(6) << "<font color = white>mountains crumble as [src.name] transforms to SX5!"
		if("SX5")
			src.form = "SX6"
			src.icon = 'Xicor SSJ6.dmi'
			src.overlays -= big_red_elec
			src.overlays += big_red_elec
			src.Power_Redefine()
			src.powerlevel *= 648
			src.ki *= 648
			src.strength *= 648
			src.defence *= 648
			src.block = 40
			src.dodge = 40
			src.critical = 40
			src.reflect = 40
			src.counter = 40
			src.speed = 0.5
			view(6) << "<font color = white>[src.name]'s screams in rage as they transform to SX6!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("SX6")
			src.form = "SX7"
			src.icon = 'Xicor SSJ7.dmi'
			src.overlays -= big_red_elec
			src.overlays += big_red_elec
			src.Power_Redefine()
			src.powerlevel *= 769
			src.ki *= 769
			src.strength *= 769
			src.defence *= 769
			src.block = 50
			src.dodge = 50
			src.critical = 50
			src.reflect = 50
			src.counter = 50
			src.speed = 0.5
			view(6) << "<font color = white>[src.name]'s screams in rage as they transform to SX7!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("SX7")
			src.form = "SX8"
			src.icon = 'Xicor SSJ8.dmi'
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block = 55
			src.dodge = 55
			src.critical = 55
			src.reflect = 55
			src.counter = 55
			src.speed = 0.1
			view(6) << "<font color = white>[src.name]'s screams in rage  as they transform to SX8!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	src.safe = 0
	if(src.doing) src.doing --
	src.Icon_State("")