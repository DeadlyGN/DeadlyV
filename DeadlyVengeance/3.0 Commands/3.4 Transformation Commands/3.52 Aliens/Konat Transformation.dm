mob/proc/Konats_Trans()
	var/trans_time = 17
	if(src.form=="Deity Form"||src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(!src.doing) src.doing ++
	src.Icon_State("enrage")
	src.frozen = 1
	sleep(trans_time)
	switch(src.form)
		if("")if(src.powerlevel_max >= 5000)
			src.form = "Enraged Form"
			src.Power_Redefine()
			src.powerlevel *= 112
			src.ki *= 118
			src.strength *= 110
			src.defence *= 110
			src.block += 7
			src.dodge += 4
			src.critical += 4
			src.reflect += 7
			src.counter += 4
			src.speed = 3.8
			view(6) << "<font color = #EB7F00>[src.name] explodes into a rage!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Enraged Form")if(src.powerlevel_max >= 22000)
			src.form = "Focused Rage Form"
			src.overlays += small_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 317
			src.ki *= 313
			src.strength *= 315
			src.defence *= 315
			src.block += 8
			src.dodge += 6
			src.critical += 6
			src.reflect += 8
			src.counter += 6
			src.speed = 3.2
			view(6) << "<font color = #EB7F00>[src.name] focus' their power as they channel their rage!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Focused Rage Form")if(src.powerlevel_max >= 49500)
			src.form = "Advanced Focus"
			src.USSJ_Apply()
			src.overlays -= small_blue_elec
			src.overlays += big_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 522
			src.ki *= 518
			src.strength *= 520
			src.defence *= 520
			src.block += 6
			src.dodge += 8
			src.critical += 6
			src.reflect += 6
			src.counter += 8
			src.speed = 2.8
			view(6) << "<font color = #EB7F00>[src.name] enters a state of advanced focus!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Advanced Focus")if(src.powerlevel_max >= 150000)
			src.form = "Ascended Form"
			src.Skin_Apply()
			src.SH_Hair_Apply()
			src.overlays -= big_blue_elec
			src.overlays += ely_blue_elec
			src.Power_Redefine()
			src.powerlevel *= 727
			src.ki *= 723
			src.strength *= 725
			src.defence *= 725
			src.block += 8
			src.dodge += 5
			src.critical += 8
			src.reflect += 5
			src.counter += 5
			src.speed = 2.2
			view(6) << "<font color = #CCCCCC>[src.name] enters a calm state as they accend into a higher being!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Ascended Form")if(src.powerlevel_max >= 490000)
			src.form = "Diety Form"
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
			view(6) << "<font color = silver>[src.name] becomes a deity to the people!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	src.safe = 0
	if(src.doing) src.doing --
	src.Icon_State("")