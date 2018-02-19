mob/proc/Slayer_Trans()
	var/trans_time = 27
	if(src.upkeep == 5) trans_time = 5
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	src.safe = 1
	if(!src.doing) src.doing ++
	src.frozen = 1
	src.Icon_State("spar fury")
	sleep(trans_time)
	switch(src.form)
		if("")if(src.powerlevel_max >= 8500)
			src.form = "Pumped Form"
			src.Power_Redefine()
			src.powerlevel *= 500
			src.ki *= 500
			src.strength *= 500
			src.defence *= 500
			src.block += 2
			src.dodge += 2
			src.critical += 5
			src.reflect += 5
			src.counter += 2
			src.speed = 2.8
			view(6) << "<font color = red>[src.name]'s transforms into a Pumped Form!"
			src.icon = 'Slayer trans 1.dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Pumped Form")if(src.powerlevel_max >= 150000)
			src.form = "True Slayer Form"
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 40
			src.dodge += 40
			src.critical += 70
			src.reflect += 40
			src.counter += 40
			src.speed = 1
			view(6) << "<font color = red>[src.name]'s transforms into their True Slayer Form!"
			src.icon = 'Slayer trans 2.dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
	src.frozen = 0
	src.safe = 0
	if(src.doing) src.doing --
	src.Icon_State("")