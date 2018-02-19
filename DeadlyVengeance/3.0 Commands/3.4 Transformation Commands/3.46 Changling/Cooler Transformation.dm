mob/proc/Cooler_Trans()
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
			src.form = "Hidden Form"
			src.icon = 'Changling - Form 7.dmi'
			src.Power_Redefine()
			src.powerlevel *= 213
			src.ki *= 210
			src.strength *= 219
			src.defence *= 218
			src.block += 2
			src.dodge += 2
			src.critical += 5
			src.reflect += 5
			src.counter += 2
			src.speed = 3
			view(6) << "<font color = red>[src.name]'s transforms into a Hidden Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Hidden Form")if(src.powerlevel_max >= 25000)
			src.form = "Cyber Form"
			src.icon = 'Changling - Form 6.dmi'
			src.Power_Redefine()
			src.powerlevel *= 618
			src.ki *= 615
			src.strength *= 614
			src.defence *= 613
			src.block += 4
			src.dodge += 4
			src.critical += 7
			src.reflect += 7
			src.counter += 4
			src.speed = 2
			view(6) << "<font color = red>[src.name]'s transforms into their Cyber Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Cyber Form")if(src.powerlevel_max >= 75000)
			src.form = "Final Hidden Form"
			src.icon = 'Changling - Form 8.dmi'
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 41
			src.dodge += 45
			src.critical += 78
			src.reflect += 75
			src.counter += 44
			src.speed = 1
			view(6) << "<font color = red>[src.name]'s transforms into their Hidden Final Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
	src.frozen = 0
	src.Icon_State("")
	src.safe = 0
	if(src.doing) src.doing --