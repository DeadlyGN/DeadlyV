mob/proc/Uub_Trans()
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(src.form==""||src.form=="Hidden Form")if(alert(usr,"Are your sure you want to transform?","Permanent Transformation","Yes","No")=="No")return
	if(!src.doing) src.doing ++
	src.safe = 1
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(19)
	switch(src.form)
		if("")if(src.powerlevel_max >= 10000 && src.level >= 3500)
			src.form = "Hidden Form"
			src.powerlevel_max *= 5
			src.ki_max *= 5
			src.strength_max *= 5
			src.defence_max *= 5
			src.speed = 3.2
			src.speed_max = 3.2
			src.critical_max += rand(1,3)
			src.dodge_max += rand(1,3)
			src.reflect_max += rand(1,3)
			src.block_max += rand(1,3)
			src.counter_max += rand(1,3)
			src.Power_Redefine()
			view(6) << "<font color = white>[src.name] transforms into their hidden form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Hidden Form")if(src.powerlevel_max >= 35000 && src.level >= 8000)
			src.form = "Next Form"
			src.icon = 'Uub 2.dmi'
			src.overlays += small_blue_elec
			src.powerlevel_max *= 2
			src.ki_max *= 2
			src.strength_max *= 2
			src.defence_max *= 2
			src.speed = 2
			src.speed_max = 2
			src.critical_max += rand(1,5)
			src.dodge_max += rand(1,5)
			src.reflect_max += rand(1,5)
			src.block_max += rand(1,5)
			src.counter_max += rand(1,5)
			src.Power_Redefine()
			view(6) << "<font color = white>[src.name] use Goku's training and transforman into their next form!!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Next Form")if(src.powerlevel_max >= 80000)
			src.form = "Majuub"
			src.icon = 'Uub 3.dmi'
			src.overlays -= src.aura
			src.overlays += mystic_elec
			src.Power_Redefine()
			src.powerlevel *= 5
			src.ki *= 5
			src.strength *= 5
			src.defence *= 5
			src.speed = 0.3
			view(6) << "<font color = white>[src.name] fuses with Majin buu to became Majuub!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Majuub")if(src.powerlevel_max >= 100000)
			src.form = "Advanced Majuub"
			src.icon = 'Uub 4.dmi'
			src.overlays -= mystic_elec
			src.overlays += mystic_elec
			src.Power_Redefine()
			src.powerlevel *= 2
			src.ki *= 2
			src.strength *= 2
			src.defence *= 2
			src.speed = 0.2
			view(6) << "<font color = white>[src.name] skin turns pink!!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Advanced Majuub")if(src.powerlevel_max >= 250000)
			src.form = "Awakened"
			src.icon = 'Uub 3.dmi'
			src.overlays -= mystic_elec
			src.overlays += mystic_elec
			src.Power_Redefine()
			src.powerlevel *= 5
			src.ki *= 5
			src.strength *= 5
			src.defence *= 5
			src.speed = 0.1
			view(6) << "<font color = white>[src.name] transforms back the normal skin...but their power has increased!!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Awakened")if(src.powerlevel_max >= 6500000)
			src.form = "Majuub Champions"
			src.icon = 'Uub 5.dmi'
			src.overlays -= mystic_elec
			src.overlays += mystic_elec
			src.Power_Redefine()
			src.powerlevel *= 2.8
			src.ki *= 2.8
			src.strength *= 2.8
			src.defence *= 2.8
			src.speed = 0.1
			view(6) << "<font color = white>[src.name] transforms into their Champions form!!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.safe = 0
	src.Icon_State("")