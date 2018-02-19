mob/proc/Bio_Trans()
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
	if(alert(usr,"Are your sure you want to transform?","Permanent Transformation","Yes","No")=="No")return
	if(!src.doing) src.doing ++
	src.safe = 1
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(20)
	switch(src.form)
		if("")if(src.powerlevel_max >= 10000 && src.absorb_kill >= 10)
			src.form = "Imperfect Form"
			src.icon = 'Bio Android - Form 2.dmi'
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
			src.Power_Redefine()
			view(6) << "<font color = green>[src.name] transforms into their Imperfect Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Imperfect Form")if(src.powerlevel_max >= 25000 && src.absorb_kill >= 30)
			src.contents -= new/obj/Techniques/Bio_Android/Absorb
			src.form = "Perfect Form"
			src.icon = 'Bio Android - Form 3.dmi'
			src.Power_Redefine()
			src.powerlevel_max *= 3
			src.ki_max *= 3
			src.strength_max *= 3
			src.defence_max *= 3
			src.critical_max += rand(1,7)
			src.dodge_max += rand(1,7)
			src.reflect_max += rand(1,7)
			src.block_max += rand(1,7)
			src.counter_max += rand(1,7)
			src.speed = 2.2
			src.speed_max = 2.2
			src.Power_Redefine()
			view(6) << "<font color = green>[src.name] transforms into their Perfect Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
			src.verbs += new/mob/learn/verb/Createcell
			src.learn_celljr = 1
			src<< "<center><font color = white> .:: You learn to make cell jrs ::.</font></center></center>"
		if("Perfect Form")if(src.powerlevel_max >= 30000 && src.level >= 750)
			src.form = "Perfect Form (Power Weighted)"
			src.icon = 'Bio Android - Form 4.dmi'
			src.overlays += small_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 23
			src.ki *= 23
			src.strength *= 23
			src.defence *= 23
			src.speed = 3.8
			src.block += 15
			src.dodge += 15
			src.critical += 15
			src.reflect += 15
			src.counter += 15
			view(6) << "<font color = green>[src.name] changes into their Perfect Power Weighted Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Perfect Form (Power Weighted)")if(src.powerlevel_max >= 50000 && src.level >= 1000)
			src.form = "Dark Perfect Form"
			src.icon = 'Bio Android - Form 7.dmi'
			src.Power_Redefine()
			src.powerlevel *= 45
			src.ki *= 45
			src.strength *= 45
			src.defence *= 45
			src.speed = 3.8
			src.block += 15
			src.dodge += 15
			src.critical += 15
			src.reflect += 15
			src.counter += 15
			view(6) << "<font color = green>[src.name] changes into their Darker Prefect Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Dark Perfect Form")if(src.powerlevel_max >= 100000 && src.level >= 2000)
			src.form = "Light Perfect Form"
			src.icon = 'Bio Android - Form 6.dmi'
			src.Power_Redefine()
			src.powerlevel *= 65
			src.ki *= 65
			src.strength *= 65
			src.defence *= 65
			src.speed = 1.8
			src.block += 15
			src.dodge += 15
			src.critical += 15
			src.reflect += 15
			src.counter += 15
			view(6) << "<font color = green>[src.name] changes into their Lighter Prefect Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Light Perfect Form")if(src.powerlevel_max >= 1000000 && src.level >= 2000)
			src.powerlevel *= 82
			src.form = "Freak Perfect Form"
			src.icon = 'Bio Android - Form 5.dmi'
			src.overlays -= small_blue_elec
			src.overlays.Add(big_blue_elec,mystic_elec)
			src.Power_Redefine()
			src.ki *= 82
			src.strength *= 82
			src.defence *= 82
			src.speed = 1
			src.block += 15
			src.dodge += 15
			src.critical += 15
			src.reflect += 15
			src.counter += 15
			view(6) << "<font color = green>[src.name] changes into their Freak Prefect Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	if(src.doing) src.doing --
	src.Icon_State("")
	src.frozen = 0
	src.safe = 0