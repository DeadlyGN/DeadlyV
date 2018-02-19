mob/proc/Jester_Trans()
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(!src.doing) src.doing ++
	src.aura_on = 1
	call(src,"Aura")()
	src.Icon_State("enrage")
	src.frozen = 1
	sleep(19)
	spawn(25) src.underlays -= ssj_aura
	switch(src.form)
		if("")
			src.Power_Redefine()
			src.form = "Potential Realised Form"
			src.powerlevel *= 118
			src.ki *= 118
			src.strength *= 118
			src.defence *= 118
			src.block = 7
			src.dodge = 7
			src.critical = 7
			src.reflect = 7
			src.counter = 7
			src.speed = 3
			spawn(5)
			view(6) << "<font color = white>[src.name] Has realised their Potential."
			src.icon = 'Jester 2.dmi'
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Potential Realised Form")
			src.Power_Redefine()
			src.form = "Second Stage"
			src.icon = 'Jester 3.dmi'
			src.overlays += small_blue_elec
			src.powerlevel *= 329
			src.ki *= 329
			src.strength *= 329
			src.defence *= 329
			src.block = 15
			src.dodge = 15
			src.critical = 15
			src.reflect = 15
			src.counter = 15
			src.speed = 3
			view(6) << "<font color = white>[src.name] Has Transformed into their Second stage!!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Second Stage")
			src.Power_Redefine()
			src.form = "Third Stage"
			src.icon = 'Jester 4.dmi'
			src.overlays -= small_blue_elec
			src.overlays += big_blue_elec
			src.powerlevel *= 511
			src.ki *= 511
			src.strength *= 511
			src.defence *= 511
			src.block = 20
			src.dodge = 20
			src.critical = 20
			src.reflect = 20
			src.counter = 20
			src.speed = 2.3
			view(6) << "<font color = white>[src.name]Has Transformed into their Third stage!"
			new/obj/techs/Overlays/Crater_Small(src.loc)
		if("Third Stage")
			src.Power_Redefine()
			src.form = "Fourth Stage"
			src.icon = 'Jester 5.dmi'
			src.powerlevel *= 718
			src.ki *= 718
			src.strength *= 718
			src.defence *= 718
			src.block = 30
			src.dodge = 30
			src.critical = 30
			src.reflect = 30
			src.counter = 30
			src.speed = 1.5
			view(6) << "<font color = white>[src.name] Has Transformed into their Fourth stage!"
			new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Fourth Stage")
			src.Power_Redefine()
			src.form = "Fifth Stage"
			src.icon = 'Jester 6.dmi'
			src.overlays -= big_blue_elec
			src.overlays += big_red_elec
			src.powerlevel *= 1100
			src.ki *= 1100
			src.strength *= 1100
			src.defence *= 1100
			src.block = 40
			src.dodge = 40
			src.critical = 40
			src.reflect = 40
			src.counter = 40
			src.speed = 0.5
			view(6) << "<font color = white>mountains crumble as [src.name] Has Transformed into their Fifth stage!"
	src.frozen = 0
	src.safe = 0
	if(src.doing) src.doing --
	src.Icon_State("")