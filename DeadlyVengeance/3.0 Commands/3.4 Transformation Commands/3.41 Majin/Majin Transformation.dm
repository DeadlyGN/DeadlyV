mob/proc/Majin_Trans()
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(!src.doing)src.doing ++
	switch(src.form)
		if("")if(src.karma=="Evil"&&src.karma_rating>=20)
			src<< "You feel more power surge through your body with Evil."
			src.frozen = 1
			sleep(17)
			view(6) << "[src.name] screams out as they unleashes some of their evil and transforms into a Thin Majin!"
			flick("thin transform",src)
			sleep(92)
			src.form = "Thin Majin"
			src.icon = 'Majin - Form 2.dmi'
			src.powerlevel_max *= 5
			src.ki_max *= 5
			src.strength_max *= 5
			src.defence_max *= 5
			src.block_max += 10
			src.dodge_max += 4
			src.critical_max += 15
			src.reflect_max += 8
			src.speed_max = 3.6
			src.Power_Redefine()
			new/obj/techs/Overlays/Crater_Small(src.loc)
			src.overlays -= src.aura
		if("Thin Majin")if(src.absorb_kill>=15&&src.eats>=20&&src.powerlevel_max>=30000000&&src.level>=7500)
			src.safe = 1
			src.frozen = 1
			flick("super 2 transform",src)
			sleep(100)
			src.form = "Super Majin"
			src.icon = 'Majin - Form 4.dmi'
			src.powerlevel_max *= 2
			src.ki_max *= 2
			src.strength_max *= 2
			src.defence_max *= 2
			src.critical += rand(1,5)
			src.dodge += rand(1,5)
			src.reflect += rand(1,5)
			src.block += rand(1,5)
			src.counter += rand(1,5)
			src.Power_Redefine()
			src.speed_max = 3
			view(6) << "<font color = #FF3DA6>The ground around [src.name] shakes and cracks as they Morph into their Third Form!"
		if("Super Majin")if(src.eats>=40&&src.powerlevel_max>=50000)
			src.safe = 1
			src.frozen = 1
			src.Icon_State("enrage")
			sleep(19)
			src.form = "Super Majin 2"
			src.icon = 'Majin - Form 4.dmi'
			src.powerlevel *= 5
			src.ki *= 5
			src.strength *= 5
			src.defence *= 5
			src.critical += rand(1,5)
			src.dodge += rand(1,5)
			src.reflect += rand(1,5)
			src.block += rand(1,5)
			src.counter += rand(1,5)
			src.speed = 2.3
			src.overlays += small_red_elec
			view(6) << "<font color = #FF3DA6>The ground around [src.name] shakes and cracks as they Morph into their Fourth Form"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Super Majin 2")if(src.eats>=80&&src.powerlevel_max>=90000&&src.level>=1150)
			if(alert(usr,"Are your sure you want to transform?","Permanent Transformation","Yes","No")=="Yes")
				src.safe = 1
				src.frozen = 1
				flick("kid trans",src)
				sleep(100)
				src.form = "Kid Majin"
				src.icon = 'Majin - Form 5.dmi'
				src.powerlevel_max *= 2
				src.ki_max *= 2
				src.strength_max *= 2
				src.defence_max *= 2
				src.critical_max += rand(1,10)
				src.dodge_max += rand(1,10)
				src.reflect_max += rand(1,10)
				src.block_max += rand(1,10)
				src.counter_max += rand(1,10)
				src.speed_max = 1.6
				src.Power_Redefine()
				src.overlays -= small_red_elec
				src.overlays += big_red_elec
				view(6) << "<font color = #FF3DA6>[src.name] screams out as the ground shakes and cracks as they Morph into their Final Form!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
				src.contents -= new/obj/Techniques/Bio_Android/Absorb
		if("Kid Majin")if(src.powerlevel_max >= 120000 && src.level >= 11500 && src.absorb_kill >= 50)
			if(alert(usr,"Are your sure you want to transform?","Permanent Transformation","Yes","No")=="Yes")
				src.safe = 1
				src.frozen = 1
				flick("enrage",src)
				sleep(100)
				src.form = "Teen Majin"
				src.icon = 'Kid Buu.dmi'
				src.powerlevel_max *= 5
				src.ki_max *= 5
				src.strength_max *= 5
				src.defence_max *= 5
				src.critical_max += rand(1,10)
				src.dodge_max += rand(1,10)
				src.reflect_max += rand(1,10)
				src.block_max += rand(1,10)
				src.counter_max += rand(1,10)
				src.speed_max = 1.6
				src.Power_Redefine()
				src.overlays -= big_red_elec
				src.overlays += big_red_elec
				view(6) << "<font color = #FF3DA6>[src.name] screams out as the ground shakes and cracks as they Morph into their Frist Kid Buu!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Teen Majin")if(src.powerlevel_max >= 250000 && src.level >= 21150 && src.absorb_kill >= 80)
			if(alert(usr,"Are your sure you want to transform?","Permanent Transformation","Yes","No")=="Yes")
				src.safe = 1
				src.frozen = 1
				flick("enrage",src)
				sleep(100)
				src.form = "Blue Majin"
				src.icon = 'Majin - Form 4 (Blue).dmi'
				src.powerlevel_max *= 2.5
				src.ki_max *= 2.5
				src.strength_max *= 2.5
				src.defence_max *= 2.5
				src.critical_max += 10
				src.dodge_max += 15
				src.reflect_max += 10
				src.block_max += 15
				src.counter_max += 10
				src.speed_max = 1.6
				src.Power_Redefine()
				src.overlays -= big_red_elec
				src.overlays += big_red_elec
				view(6) << "<font color = #FF3DA6>[src.name] screams out in pain as their skin turns blue!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	src.safe = 0
	src.Icon_State("")
	if(src.doing) src.doing --