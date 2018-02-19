mob/proc/Namek_Trans()
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(alert(usr,"Are your sure you want to transform?","Permanent Transformation","Yes","No")=="No")return
	if(!src.doing) src.doing ++
	src.safe = 1
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(19)
	src.overlays -= src.aura
	switch(src.form)
		if("")if(src.powerlevel_max >= 10000 && src.level >= 3500)
			src.form = "Super Namek"
			src.Power_Redefine()
			src.powerlevel_max *= 5
			src.ki_max *= 5
			src.strength_max *= 5
			src.defence_max *= 5
			src.speed_max = 3.2
			src.critical_max += rand(1,3)
			src.dodge_max += rand(1,3)
			src.reflect_max += rand(1,3)
			src.block_max += rand(1,3)
			src.counter_max += rand(1,3)
			view(6) << "<font color = green>[src.name] calms their mind, and fuses with Nail!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Super Namek")if(src.powerlevel_max >= 35000 && src.level >= 8000)
			src.form = "100% Namekian"
			src.overlays += small_blue_elec
			src.Power_Redefine()
			src.powerlevel_max *= 2
			src.ki_max *= 2
			src.strength_max *= 2
			src.defence_max *= 2
			src.speed_max = 2
			src.critical_max += rand(1,5)
			src.dodge_max += rand(1,5)
			src.reflect_max += rand(1,5)
			src.block_max += rand(1,5)
			src.counter_max += rand(1,5)
			view(6) << "<font color = green>[src.name] calms there mind an fuses with Kami!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("100% Namekian")if(src.powerlevel_max >= 80000)
			src.form = "True Super Namek"
			src.icon = 'Namek - Super.dmi'
			src.overlays -= small_blue_elec
			src.Power_Redefine()
			src.powerlevel_max *= 5
			src.ki_max *= 5
			src.strength_max *= 5
			src.defence_max *= 5
			src.speed = 0.3
			src.block_max += 15
			src.dodge_max += 15
			src.critical_max += 15
			src.reflect_max += 15
			src.counter_max += 15
			view(6) << "<font color = green>[src.name] explodes in rage as they go Super Namek!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("True Super Namek")if(src.powerlevel_max >= 100000)
			src.form = "Super Namek 2"
			src.icon = 'Namek - Super2.dmi'
			src.overlays -= mystic_elec
			src.overlays += mystic_elec
			src.Power_Redefine()
			src.powerlevel_max *= 2
			src.ki_max *= 2
			src.strength_max *= 2
			src.defence_max *= 2
			src.speed = 0.2
			src.block_max += 20
			src.dodge_max += 20
			src.critical_max += 20
			src.reflect_max += 20
			src.counter_max += 20
			view(6) << "<font color = green>[src.name] explodes in rage as they go Super Namek 2!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Super Namek 2")if(src.powerlevel_max >= 250000)
			src.form = "Ascended Namek"
			src.icon = 'Namek - Super3.dmi'
			src.overlays += mystic_elec
			src.Power_Redefine()
			src.powerlevel_max *= 5
			src.ki_max *= 5
			src.strength_max *= 5
			src.defence_max *= 5
			src.speed = 0.1
			src.block_max += 20
			src.dodge_max += 20
			src.critical_max += 20
			src.reflect_max += 20
			src.counter_max += 20
			view(6) << "<font color = green>[src.name] looks up as they Reaches above all Nameks!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Ascended Namek")if(src.powerlevel_max >= 750000)
			src.form = "Hidden Form"
			src.icon = 'Namek - Super4.dmi'
			src.overlays -= mystic_elec
			src.overlays += mystic_elec
			src.Power_Redefine()
			src.powerlevel_max *= 2.8
			src.ki_max *= 2.8
			src.strength_max *= 2.8
			src.defence_max *= 2.8
			src.speed = 0.1
			src.block_max += 10
			src.dodge_max += 10
			src.critical_max += 10
			src.reflect_max += 10
			src.counter_max += 10
			view(6) << "<font color = green>[src.name] Finds a Hidden Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.safe = 0
	src.frozen = 0
	src.Icon_State("")
	if(src.doing) src.doing --