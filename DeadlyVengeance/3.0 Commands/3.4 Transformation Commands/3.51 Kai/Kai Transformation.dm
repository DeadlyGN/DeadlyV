mob/proc/Kai_Trans()
	var/trans_time = 5
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
	if(!src.doing) src.doing ++
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(trans_time)
	switch(src.form)
		if("")if(src.powerlevel_max >= 10000)
			src.form = "Elder Kai"
			src.icon = 'Kai - Elder.dmi'
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
			view(6) << "<font color = blue>[src.name] explodes into Elder Kai Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Elder Kai")if(src.powerlevel_max >= 20000)
			src.form = "King Kai"
			src.icon = 'Kai - King.dmi'
			src.overlays += small_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 300
			src.ki *= 300
			src.strength *= 300
			src.defence *= 300
			src.block += 8
			src.dodge += 6
			src.critical += 6
			src.reflect += 8
			src.counter += 6
			src.speed = 3.2
			view(6) << "<font color = Blue>[src.name] explodes into King Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("King Kai")if(src.powerlevel_max >= 50000)
			src.form = "Grand Kai"
			src.icon = 'Kai - Grand.dmi'
			src.overlays -= small_blue_elec
			src.overlays += big_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 500
			src.ki *= 500
			src.strength *= 500
			src.defence *= 500
			src.block += 6
			src.dodge += 8
			src.critical += 6
			src.reflect += 6
			src.counter += 8
			src.speed = 2.8
			view(6) << "<font color = blue>[src.name] explodes into Grand Form!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Grand Kai")if(src.powerlevel_max >= 100000)
			src.form = "Supreme Kaio"
			src.icon = 'Kai - Supreme.dmi'
			src.SH_Hair_Apply()
			src.overlays -= big_blue_elec
			src.overlays += ely_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 800
			src.ki *= 800
			src.strength *= 800
			src.defence *= 800
			src.block += 8
			src.dodge += 5
			src.critical += 8
			src.reflect += 5
			src.counter += 5
			src.speed = 2.2
			view(6) << "<font color = blue>[src.name] explodes into Supreme Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Supreme Kaio")if(src.powerlevel_max >= 500000)
			src.form = "Ultimate Kaio"
			src.icon = 'Kai - Ultimate.dmi'
			src.SH2_Hair_Apply()
			src.overlays += sh2_aura
			spawn(25) src.overlays -= sh2_aura
			src.overlays -= ely_blue_elec
			src.overlays += ely_red_elec
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 5
			src.dodge += 8
			src.critical += 6
			src.reflect += 6
			src.counter += 8
			src.speed = 1.7
			view(6) << "<font color = blue>[src.name]'s breaks into  Ultimate Kai Form!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.Icon_State("")
	src.safe = 0