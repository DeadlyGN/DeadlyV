mob/proc/Burter_Trans()
	if(src.form=="Dark Form"||src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(!src.doing) src.doing ++
	src.frozen = 1
	src.aura_on = 1
	call(src,"Aura")()
	src.underlays += ssj_aura
	spawn(25) src.underlays -= ssj_aura
	src.Icon_State("enrage")
	sleep(19)
	switch(src.form)
		if("")
			src.form = "Green Form"
			src.icon = 'Burter (Trikon) Green.dmi'
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
			src.speed = 2
			sleep(5)
			view(6) << "<font color = white>[src.name] Has Transformed into their Green Form"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Green Form")
			src.form = "Red Form"
			src.icon = 'Burter (Trikon) Red.dmi'
			src.overlays += small_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 429
			src.ki *= 429
			src.strength *= 429
			src.defence *= 429
			src.block = 15
			src.dodge = 15
			src.critical = 15
			src.reflect = 15
			src.counter = 15
			src.speed = 1
			view(6) << "<font color = white>[src.name] Has Transformed into their Red Form"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Red Form")
			src.form = "Light Form"
			src.icon = 'Burter (Trikon) Light.dmi'
			src.overlays -= small_blue_elec
			src.overlays += big_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 711
			src.ki *= 711
			src.strength *= 711
			src.defence *= 711
			src.block = 20
			src.dodge = 20
			src.critical = 20
			src.reflect = 20
			src.counter = 20
			src.speed = 0.4
			view(6) << "<font color = white>[src.name]Has Transformed into their Light Form"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Light Form")
			src.form = "Dark Form"
			src.icon = 'Burter (Trikon) Dark.dmi'
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block = 38
			src.dodge = 50
			src.critical = 36
			src.reflect = 40
			src.counter = 30
			src.speed = 0.1
			view(6) << "<font color = white>[src.name] Has Transformed into their Dark Form"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	src.safe = 0
	if(src.doing) src.doing --
	src.Icon_State("")