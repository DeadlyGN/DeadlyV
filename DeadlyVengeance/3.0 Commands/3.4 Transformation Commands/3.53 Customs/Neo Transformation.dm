mob/proc/Neo_Trans()
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
			src.form = "Blue Glow"
			src.underlays += neoblue
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
			view(6) << "<font color = blue>[src.name]'s transforms into a Blue Glow!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Blue Glow")if(src.powerlevel_max >= 25000)
			src.form = "Green Glow"
			src.underlays -= neoblue
			src.underlays += neogreen
			src.Power_Redefine()
			src.powerlevel *= 318
			src.ki *= 315
			src.strength *= 314
			src.defence *= 313
			src.block += 4
			src.dodge += 4
			src.critical += 7
			src.reflect += 7
			src.counter += 4
			src.speed = 3
			view(6) << "<font color = green>[src.name]'s transforms into a Green Glow!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Green Glow")if(src.powerlevel_max >= 50000)
			src.form = "Yellow Glow"
			src.underlays -= neogreen
			src.underlays += neoyellow
			src.Power_Redefine()
			src.powerlevel *= 523
			src.ki *= 520
			src.strength *= 519
			src.defence *= 518
			src.block += 6
			src.dodge += 6
			src.critical += 8
			src.reflect += 8
			src.counter += 6
			src.speed = 2.5
			view(6) << "<font color = yellow>[src.name]'s transforms into a Yellow Glow!"
		if("Yellow Glow")if(src.powerlevel_max >= 175000)
			src.form = "Purple Glow"
			src.underlays -= neoyellow
			src.underlays += neopurple
			src.Power_Redefine()
			src.powerlevel *= 728
			src.ki *= 725
			src.strength *= 724
			src.defence *= 723
			src.block += 10
			src.dodge += 10
			src.critical += 12
			src.reflect += 12
			src.counter += 10
			src.speed = 1.8
			src.overlays -= small_purple_elec
			src.overlays += big_purple_elec
			view(6) << "<font color = purple>[src.name]'s transforms into a Purple Glow"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Purple Glow")if(src.powerlevel_max >= 275000)
			src.form = "Red Glow"
			src.underlays -= neopurple
			src.underlays += neored
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
			src.speed = 1.3
			src.overlays -= small_purple_elec
			src.overlays += big_purple_elec
			view(6) << "<font color = red>[src.name]'s transforms into a Red Glow"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	src.safe = 0
	if(src.doing) src.doing --
	src.Icon_State("")