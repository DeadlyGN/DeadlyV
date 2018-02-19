mob/proc/Hybrid_Trans()
	var/trans_time = 17
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(!src.doing) src.doing ++
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(trans_time)
	switch(src.form)
		if("")if(src.powerlevel_max >= 5000)
			src.form = "Ascended Form"
			src.icon = 'Dude from2.dmi'
			src.Power_Redefine()
			src.powerlevel *= 200
			src.ki *= 200
			src.strength *= 200
			src.defence *= 200
			src.block += 7
			src.dodge += 4
			src.critical += 4
			src.reflect += 7
			src.counter += 4
			src.speed = 3.8
			view(6) << "<font color = #EB7F00>[src.name]'s skin colors alter as they begin to ascend into power!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Ascended Form")if(src.powerlevel_max >= 22000)
			src.form = "Unleashed Form"
			src.icon = 'Dude from3.dmi'
			src.Power_Redefine()
			src.powerlevel *= 400
			src.ki *= 400
			src.strength *= 400
			src.defence *= 400
			src.block += 8
			src.dodge += 6
			src.critical += 6
			src.reflect += 8
			src.counter += 6
			src.speed = 3.2
			src.overlays += small_blue_elec
			view(6) << "<font color = #EB7F00>[src.name] burst with energy as they transform!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Unleashed Form")if(src.powerlevel_max >= 49500)
			src.form = "Hidden Power Form"
			src.icon = 'Dude from4.dmi'
			src.Power_Redefine()
			src.powerlevel *= 800
			src.ki *= 800
			src.strength *= 800
			src.defence *= 800
			src.block += 6
			src.dodge += 8
			src.critical += 6
			src.reflect += 6
			src.counter += 8
			src.speed = 2.8
			src.overlays -= small_blue_elec
			src.overlays += big_blue_elec
			view(6) << "<font color = #EB7F00>[src.name] awakens their hidden power!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Hidden Power Form")if(src.powerlevel_max >= 150000)
			src.form = "Final Form"
			src.icon = 'Dude from5.dmi'
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 18
			src.dodge += 15
			src.critical += 18
			src.reflect += 15
			src.counter += 15
			src.speed = 2.2
			src.overlays -= big_blue_elec
			src.overlays += ely_blue_elec
			view(6) << "<font color = #CCCCCC>[src.name] enters hightend state of power as they reach their final form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.safe = 0
	src.Icon_State("")