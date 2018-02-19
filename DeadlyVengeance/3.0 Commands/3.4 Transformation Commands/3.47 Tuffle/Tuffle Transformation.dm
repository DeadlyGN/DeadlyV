mob/proc/Tuffle_Trans()
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
	if(src.form!=("Super Tuffle"||"Hidden Form"))if(alert(usr,"Are your sure you want to transform?","Permanent Transformation","Yes","No")=="No")return
	if(!src.doing) src.doing ++
	src.safe = 1
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(20)
	switch(src.form)
		if("")if(src.powerlevel_max >= 10000 && src.infect_kill >= 10 && src.karma =="Evil")
			src.form = "Infected Form"
			src.icon = 'Bebi - Form 2.dmi'
			src.Power_Redefine()
			src.powerlevel_max *= 5
			src.ki_max *= 5
			src.strength_max *= 5
			src.defence_max *= 5
			src.critical_max += rand(1,3)
			src.dodge_max += rand(1,4)
			src.reflect_max += rand(1,2)
			src.block_max += rand(1)
			src.counter_max += rand(1,3)
			src.speed_max = 3.7
			view(6) << "<font color = white>[src.name] takes over their hosts body and morphs into Infected Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Infected Form")if(src.powerlevel_max >= 25000 && src.infect_kill >= 50 && src.karma =="Evil" && src.karma_rating >= 20)
			src.form = "Infected Form 2"
			src.icon = 'Bebi - Form 3.dmi'
			src.Power_Redefine()
			src.powerlevel_max *= 16
			src.ki_max *= 16
			src.strength_max *= 16
			src.defence_max *= 16
			src.critical_max += rand(1,7)
			src.dodge_max += rand(1,7)
			src.reflect_max += rand(1,7)
			src.block_max += rand(1,7)
			src.counter_max += rand(1,7)
			src.speed_max = 2.2
			view(6) << "<font color = white>[src.name] transforms into their Infected Form 2!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Infected Form 2")if(src.powerlevel_max >= 30000 && src.infect_kill >=100)
			src.form = "Super Tuffle"
			src.icon = 'Bebi - Form 4.dmi'
			src.overlays += big_red_elec
			src.overlays -= src.aura
			src.underlays += ssj_aura
			spawn(25) src.underlays -= ssj_aura
			src.Power_Redefine()
			src.powerlevel *= 8
			src.ki *= 8
			src.strength *= 8
			src.defence *= 8
			src.block += 15
			src.dodge += 15
			src.critical += 15
			src.reflect += 15
			src.counter += 15
			view(6) << "<font color = yellow>[src.name] explodes in rage as they go Super Tuffle!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Super Tuffle")if(src.powerlevel_max >= 300000 && src.infect_kill >=200)
			src.form = "Hidden Form"
			src.overlays += big_red_elec
			src.overlays += src.hair_fssj4
			src.overlays -= src.aura
			src.underlays += ssj_aura
			spawn(25) src.underlays -= ssj_aura
			src.Power_Redefine()
			src.powerlevel *= 2.5
			src.ki *= 2.5
			src.strength *= 2.5
			src.defence *= 2.5
			src.speed = 1.8
			src.block += 15
			src.dodge += 15
			src.critical += 15
			src.reflect += 15
			src.counter += 15
			view(6) << "<font color = yellow>[src.name] explodes in rage as they go Hidden Tuffle Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	if(src.doing) src.doing --
	src.safe = 0
	src.frozen = 0
	src.Icon_State("")