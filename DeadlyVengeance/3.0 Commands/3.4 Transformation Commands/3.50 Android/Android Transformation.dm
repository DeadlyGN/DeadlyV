mob/proc/Android_Trans()
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(alert(usr,"Are your sure you want to transform?","Permanent Transformation","Yes","No")=="No")return
	if(!src.doing) src.doing ++
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(20)
	switch(src.form)
		if("")if(src.powerlevel_max >= 10000 && src.chip >= 2 && src.kills+src.pkills >= 25)
			src.form = "Enhanced Android"
			src.icon = 'Android - Form 2.dmi'
			src.overlays += android_elec
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
			src.speed = 3.7
			src.speed_max = 3.7
			view(6) << "<font color = blue>[src.name] transforms into their Enhanced Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Enhanced Android")if(src.powerlevel_max >= 35000 && src.kills+src.pkills >= 50)
			src.form = "Refitted Android"
			src.icon = 'Android - Form 3.dmi'
			src.overlays -= android_elec
			src.overlays -= raditz_hair
			src.overlays -= goku_hair
			src.overlays -= vegeta_hair
			src.overlays -= gohan_teen_hair
			src.overlays -= gohan_adult_hair
			src.overlays -= trunks_long_hair
			src.overlays -= future_gohan_hair
			src.overlays += src.hair_droid
			src.overlays += ultimate_elec
			src.Power_Redefine()
			src.powerlevel_max *= 2
			src.ki_max *= 2
			src.strength_max *= 2
			src.defence_max *= 2
			src.critical_max += rand(1,10)
			src.dodge_max += rand(1,10)
			src.reflect_max += rand(1,10)
			src.block_max += rand(1,10)
			src.counter_max += rand(1,10)
			src.speed = 2.2
			src.speed_max = 2.2
			view(6) << "<font color = blue>[src.name] transforms into their Refitted Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Refitted Android")if(src.powerlevel_max >= 350000 && src.kills+src.pkills >= 100)
			src.form = "Battle Android"
			src.icon = 'Battle android.dmi'
			src.overlays -= ultimate_elec
			src.overlays += ultimate_elec
			src.Power_Redefine()
			src.powerlevel_max *= 5
			src.ki_max *= 5
			src.strength_max *= 5
			src.defence_max *= 5
			src.critical_max += rand(1,10)
			src.dodge_max += rand(1,10)
			src.reflect_max += rand(1,10)
			src.block_max += rand(1,10)
			src.counter_max += rand(1,10)
			view(6) << "<font color = blue>[src.name] transforms into their Battle form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Battle Android")if(src.powerlevel_max >= 500000 && src.kills+src.pkills >= 200)
			src.form = "Ultimate Android"
			src.icon = 'Android - Form 4.dmi'
			src.overlays -= ultimate_elec
			src.overlays -= src.hair_droid
			src.overlays += src.hair_droid2
			src.overlays += ultimate_elec
			src.Power_Redefine()
			src.powerlevel_max *= 2
			src.ki_max *= 2
			src.strength_max *= 2
			src.defence_max *= 2
			src.critical_max += rand(1,10)
			src.dodge_max += rand(1,10)
			src.reflect_max += rand(1,10)
			src.block_max += rand(1,10)
			src.counter_max += rand(1,10)
			view(6) << "<font color = blue>[src.name] transforms into their Ultimate Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Ultimate Android")if(src.powerlevel_max >= 750000 && src.kills+src.pkills >= 350)
			src.form = "Mega Ultimate Android"
			src.icon = 'Android - Form 5.dmi'
			src.overlays -= ultimate_elec
			src.overlays += ultimate_elec
			src.Power_Redefine()
			src.powerlevel_max *= 5
			src.ki_max *= 5
			src.strength_max *= 5
			src.defence_max *= 5
			src.critical_max += rand(1,10)
			src.dodge_max += rand(1,10)
			src.reflect_max += rand(1,10)
			src.block_max += rand(1,10)
			src.counter_max += rand(1,10)
			view(6) << "<font color = blue>[src.name] transforms into their Mega Ultimate Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Mega Ultimate Android")if(src.powerlevel_max >= 1000000 && src.kills+src.pkills >= 500)
			src.form = "Destroyer"
			src.icon = 'Rods.dmi'
			src.overlays -= android_elec
			src.overlays -= src.hair_droid
			src.overlays += rodhead
			src.overlays += ultimate_elec
			src.Power_Redefine()
			src.powerlevel_max *= 2.8
			src.ki_max *= 2.8
			src.strength_max *= 2.8
			src.defence_max *= 2.8
			src.critical_max += rand(1,10)
			src.dodge_max += rand(1,10)
			src.reflect_max += rand(1,10)
			src.block_max += rand(1,10)
			src.counter_max += rand(1,10)
			src.speed = 1.4
			src.speed_max = 1.4
			view(6) << "<font color = blue>[src.name] transforms into their Destroyer Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	if(src.doing) src.doing --
	src.safe = 0
	src.frozen = 0
	src.Icon_State("")