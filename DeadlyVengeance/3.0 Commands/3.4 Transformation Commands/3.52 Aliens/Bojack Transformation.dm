mob/proc/Bojack_Trans()
	var/trans_time = 5
	if(src.form=="Berserk Form"||src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
	if(!src.doing) src.doing ++
	src.Icon_State("enrage")
	src.frozen = 1
	sleep(trans_time)
	switch(src.form)
		if("")if(src.powerlevel_max >= 7500)
			src.form = "Potential Unlocked"
			src.Power_Redefine()
			src.powerlevel *= 100
			src.ki *= 100
			src.strength *= 100
			src.defence *= 100
			src.block += 7
			src.dodge += 4
			src.critical += 4
			src.reflect += 7
			src.counter += 4
			src.speed = 3.8
			view(6) << "<font color = green>[src.name] explodes in rage as they Unlock their Potential!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Potential Unlocked")if(src.powerlevel_max >= 20000)
			src.form = "Focused Power"
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
			view(6) << "<font color = green>[src.name] explodes in rage as they Focus their power!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Focused Power")if(src.powerlevel_max >= 50000)
			src.form = "Advanced Focus"
			src.USSJ_Apply()
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
			view(6) << "<font color = green>[src.name] explodes in rage as they enter a state of Advanced Focus!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Advanced Focus")if(src.powerlevel_max >= 150000)
			src.form = "Full Potential"
			src.Skin_Apply()
			src.SH_Hair_Apply()
			src.overlays -= big_blue_elec
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
			view(6) << "<font color = #CCCCCC>[src.name] explodes in rage and unlock their full Potential!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Full Potential")if(src.powerlevel_max >= 490000)
			src.form = "Berserk Form"
			src.icon = 'Bojack Rage.dmi'
			src.SH2_Hair_Apply()
			src.overlays -= ely_blue_elec
			src.overlays += ely_red_elec
			src.overlays += sh2_aura
			spawn(25) src.overlays -= sh2_aura
			src.Power_Redefine()
			src.powerlevel *= 1000
			src.ki *= 1000
			src.strength *= 1000
			src.defence *= 1000
			src.block += 5
			src.dodge += 8
			src.critical += 60
			src.reflect += 6
			src.counter += 40
			src.speed = 1.7
			view(6) << "<font color = #800080>[src.name]'s breaks into a horrible rage!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.Icon_State("")
	src.safe = 0