mob/proc
	Dragon_Revert()
		if(src.KO)
			src<<"No cheating"
			return
		if(src.form!="")
			src.frozen = 1
			src.Icon_State("enrage")
			sleep(16)
			src.form = ""
			src.overlays -= small_blue_elec
			src.overlays -= big_blue_elec
			src.overlays -= small_red_elec
			src.overlays -= big_red_elec
			src.overlays -= small_purple_elec
			src.overlays -= big_purple_elec
			src.overlays -= mystic_elec
			src.icon = 'Dragon.dmi'
			src.Power_Redefine()
			oview() << "[src.name] has reverted from their Transformed state."
			src.Icon_State("")
			src.frozen = 0
			if(src.doing) src.doing --
	Saibaman_Revert()
		if(src.KO)
			src<<"No cheating"
			return
		if(src.form!="")
			src.frozen = 1
			src.Icon_State("enrage")
			sleep(16)
			src.form = ""
			src.overlays -= small_blue_elec
			src.overlays -= big_blue_elec
			src.overlays -= small_red_elec
			src.overlays -= big_red_elec
			src.overlays -= ely_red_elec
			src.overlays -= ely_blue_elec
			src.overlays -= mystic_elec
			src.underlays -= sh2_aura
			src.aura_on = 1
			call(src,"Aura")()
			src.Power_Redefine()
			src.Hair_Apply()
			oview() << "[src.name] has reverted from their Transformed state."
			src.icon = 'Saibaman - Form 1.dmi'
			src.Icon_State("")
			src.frozen = 0
			if(src.doing) src.doing --
	Saibaman_Trans()
		var/trans_time = 5
		if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
		switch(src.form)
			if("")if(src.powerlevel_max >= 25000)
				if(!src.doing) src.doing ++
				src.Icon_State("enrage")
				src.frozen = 1
				sleep(trans_time)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max
				src.form = "First Form"
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
				view(6) << "<font color = green>[src.name] explodes into frist form!"
				src.icon = 'Saibaman - Form 1.dmi'
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("First Form")if(src.powerlevel_max >= 50000)
				if(!src.doing) src.doing ++
				src.Icon_State("enrage")
				src.frozen = 1
				sleep(trans_time)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max
				src.form = "Red Form"
				src.powerlevel *= 200
				src.ki *= 200
				src.strength *= 200
				src.defence *= 200
				src.block += 8
				src.dodge += 6
				src.critical += 6
				src.reflect += 8
				src.counter += 6
				src.speed = 3.2
				src.overlays += small_blue_elec
				view(6) << "<font color = Blue>[src.name] explodes into their red form!"
				src.icon = 'Saibaman - Form 2.dmi'
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Red Form")if(src.powerlevel_max >= 75000)
				if(!src.doing) src.doing ++
				src.Icon_State("enrage")
				src.frozen = 1
				sleep(trans_time)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max
				src.form = "Blue Form"
				src.powerlevel *= 400
				src.ki *= 400
				src.strength *= 400
				src.defence *= 400
				src.block += 6
				src.dodge += 8
				src.critical += 6
				src.reflect += 6
				src.counter += 8
				src.speed = 2.8
				src.overlays -= small_blue_elec
				src.overlays += big_blue_elec
				view(6) << "<font color = blue>[src.name] explodes into their blue form!"
				src.icon = 'Saibaman - Form 3.dmi'
				src.USSJ_Apply()
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Blue Form")if(src.powerlevel_max >= 100000)
				if(!src.doing) src.doing ++
				src.Icon_State("enrage")
				src.frozen = 1
				sleep(trans_time)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max
				src.form = "Golden Form"
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
				src.overlays -= small_blue_elec
				src.overlays += big_blue_elec
				view(6) << "<font color = blue>[src.name] explodes into their golden form!"
				src.icon = 'Saibaman - Form 4.dmi'
				src.USSJ_Apply()
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Golden Form")if(src.powerlevel_max >= 175000)
				if(!src.doing) src.doing ++
				src.Icon_State("enrage")
				src.frozen = 1
				sleep(trans_time)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max
				src.form = "Black Form"
				src.powerlevel *= 600
				src.ki *= 600
				src.strength *= 600
				src.defence *= 600
				src.block += 6
				src.dodge += 8
				src.critical += 6
				src.reflect += 6
				src.counter += 8
				src.speed = 2.8
				src.overlays -= small_blue_elec
				src.overlays += big_blue_elec
				view(6) << "<font color = blue>[src.name] explodes into their black form!"
				src.icon = 'Saibaman - Form 5.dmi'
				src.USSJ_Apply()
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Black Form")if(src.powerlevel_max >= 275000)
				if(!src.doing) src.doing ++
				src.Icon_State("enrage")
				src.frozen = 1
				sleep(trans_time)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max
				src.form = "Hollow Form"
				src.powerlevel *= 800
				src.ki *= 800
				src.strength *= 800
				src.defence *= 800
				src.block += 6
				src.dodge += 8
				src.critical += 6
				src.reflect += 6
				src.counter += 8
				src.speed = 2.8
				src.overlays -= small_blue_elec
				src.overlays += big_blue_elec
				view(6) << "<font color = blue>[src.name] explodes into their hollow form!"
				src.icon = 'Saibaman - Form 6.dmi'
				src.USSJ_Apply()
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Hollow Form")if(src.powerlevel_max >= 375000)
				if(!src.doing) src.doing ++
				src.Icon_State("enrage")
				src.frozen = 1
				sleep(trans_time)
				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max
				src.form = "White Form"
				src.powerlevel *= 1000
				src.ki *= 1000
				src.strength *= 1000
				src.defence *= 1000
				src.block += 6
				src.dodge += 8
				src.critical += 6
				src.reflect += 6
				src.counter += 8
				src.speed = 2.8
				src.overlays -= small_blue_elec
				src.overlays += big_blue_elec
				view(6) << "<font color = blue>[src.name] explodes into their white form!"
				src.icon = 'Saibaman - Form 7.dmi'
				src.USSJ_Apply()
				new/obj/techs/Overlays/Crater_Small(src.loc)
		src.frozen = 0
		if(src.doing) src.doing --
		src.Icon_State("")
		src.safe = 0
	Dragon_Trans()
		var/trans_time = 10
		if(src.upkeep == 5) trans_time = 5
		if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
		switch(src.form)
			if("")
				if(src.powerlevel_max >= 10000)
					src.safe = 1
					if(!src.doing) src.doing ++
					src.Icon_State("enrage")
					src.frozen = 1
					sleep(trans_time)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.form = "Second Form"
					src.powerlevel *= 100
					src.ki *= 100
					src.strength *= 100
					src.defence *= 100
					src.block += 2
					src.dodge += 2
					src.critical += 5
					src.reflect += 5
					src.counter += 2
					src.speed = 3.8
					view(6) << "<font color = #800080>[src.name] changes into their Second Form!"
					src.icon = 'Dragon Rage 2.dmi'
					new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Second Form")
				if(src.powerlevel_max >= 50000)
					src.safe = 1
					if(!src.doing) src.doing ++
					src.Icon_State("enrage")
					src.frozen = 1
					sleep(trans_time)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.powerlevel = src.powerlevel_max
					src.form = "Third Form"
					src.powerlevel *= 200
					src.ki *= 200
					src.strength *= 200
					src.defence *= 200
					src.block += 4
					src.dodge += 4
					src.critical += 7
					src.reflect += 7
					src.counter += 4
					src.speed = 3
					view(6) << "<font color = #800080>[src.name] changes into their Third Form!"
					src.icon = 'Dragon Rage 3.dmi'
					new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Third Form")
				if(src.powerlevel_max >= 100000)
					src.safe = 1
					if(!src.doing) src.doing ++
					src.Icon_State("enrage")
					src.frozen = 1
					sleep(trans_time)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.powerlevel = src.powerlevel_max
					src.form = "Fourth Form"
					src.powerlevel *= 400
					src.ki *= 400
					src.strength *= 400
					src.defence *= 400
					src.block += 6
					src.dodge += 6
					src.critical += 8
					src.reflect += 8
					src.counter += 6
					src.speed = 2.5
					src.overlays += small_purple_elec
					view(6) << "<font color = #800080>[src.name] changes into their Forth Form!"
					src.icon = 'Dragon Rage 5.dmi'
					new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Fourth Form")
				if(src.powerlevel_max >= 350000)
					src.safe = 1
					if(!src.doing) src.doing ++
					src.Icon_State("enrage")
					src.frozen = 1
					sleep(trans_time)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.form = "Fifth Form"
					src.powerlevel *= 500
					src.ki *= 500
					src.strength *= 500
					src.defence *= 500
					src.block += 10
					src.dodge += 10
					src.critical += 12
					src.reflect += 12
					src.counter += 10
					src.speed = 1.8
					src.overlays -= small_purple_elec
					src.overlays += big_purple_elec
					view(6) << "<font color = #800080>[src.name] changes into their Fifth Form!"
					src.icon = 'Dragon Rage 6.dmi'
					new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Fifth Form")
				if(src.powerlevel_max >= 500000)
					src.safe = 1
					if(!src.doing) src.doing ++
					src.Icon_State("enrage")
					src.frozen = 1
					sleep(trans_time)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.form = "Final Form"
					src.powerlevel *= 600
					src.ki *= 600
					src.strength *= 600
					src.defence *= 600
					src.block += 9
					src.dodge += 9
					src.critical += 11
					src.reflect += 11
					src.counter += 9
					src.speed = 1.8
					view(6) << "<font color = #800080>[src.name] changes into their Final Form!"
					src.icon = 'Dragon Rage 7.dmi'
					new/obj/techs/Overlays/Crater_Center(src.loc)
					src.overlays += big_purple_elec
			if("Final Form")
				if(src.powerlevel_max >= 1000000)
					src.safe = 1
					if(!src.doing) src.doing ++
					src.Icon_State("enrage")
					src.frozen = 1
					sleep(trans_time)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.form = "Omega Form"
					src.powerlevel *= 800
					src.ki *= 800
					src.strength *= 800
					src.defence *= 800
					src.block += 9
					src.dodge += 9
					src.critical += 19
					src.reflect += 3
					src.counter += 3
					src.speed = -8.5
					view(6) << "<font color = #800080>[src.name] changes into their Omega Form!"
					src.icon = 'Omegas.dmi'
					new/obj/techs/Overlays/Crater_Center(src.loc)
					src.overlays += big_purple_elec
					src.overlays += ely_red_elec
					src.overlays += ely_blue_elec
			if("Omega Form")
				if(src.powerlevel_max >= 3500000)
					src.safe = 1
					if(!src.doing) src.doing ++
					src.Icon_State("enrage")
					src.frozen = 1
					sleep(trans_time)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.form = "Omegas Form"
					src.powerlevel *= 1000
					src.ki *= 1000
					src.strength *= 1000
					src.defence *= 1000
					src.block += 9
					src.dodge += 9
					src.critical += 19
					src.reflect += 3
					src.counter += 3
					src.speed = -10.5
					view(6) << "<font color = #800080>[src.name] changes into their Omegas Form!"
					src.icon = 'Omega.dmi'
					new/obj/techs/Overlays/Crater_Center(src.loc)
					src.overlays += big_purple_elec
					src.overlays += ely_red_elec
					src.overlays += ely_blue_elec
		src.frozen = 0
		if(src.doing) src.doing --
		src.Icon_State("")
		src.safe = 0
	Bio_W_Trans()
		if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
		if(alert(usr,"Are your sure you want to transform?","Permanent Transformation","Yes","No")=="No")return
		src.safe = 1
		if(!src.doing) src.doing ++
		src.frozen = 1
		src.Icon_State("enrage")
		sleep(19)
		switch(src.form)
			if("")if(src.powerlevel_max >= 100000 && src.level >= 35000)
				src.form = "Model II"
				src.Power_Redefine()
				src.speed_max = 3.2
				src.critical_max += rand(1,3)
				src.dodge_max += rand(1,3)
				src.reflect_max += rand(1,3)
				src.block_max += rand(1,3)
				src.counter_max += rand(1,3)
				view(6) << "<font color = green>[src.name] transforms into their number 2 form!"
				src.icon = 'Bio Warrior 2.dmi'
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Model II")if(src.powerlevel_max >= 350000 && src.level >= 80000)
				src.form = "Model III"
				src.Power_Redefine()
				src.powerlevel_max *= 2
				src.ki_max *= 2
				src.strength_max *= 2
				src.defence_max *= 2
				src.speed_max = 2.5
				src.critical_max += rand(1,5)
				src.dodge_max += rand(1,5)
				src.reflect_max += rand(1,5)
				src.block_max += rand(1,5)
				src.counter_max += rand(1,5)
				view(6) << "<font color = green>[src.name] transforms into their number 3 form!!"
				src.icon = 'Bio Warrior 3.dmi'
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Model III")if(src.powerlevel_max >= 800000)
				src.form = "Model IV"
				src.Power_Redefine()
				src.powerlevel_max *= 5
				src.ki_max *= 5
				src.strength_max *= 5
				src.defence_max *= 5
				src.speed_max = 1.8
				src.block_max += 15
				src.dodge_max += 15
				src.critical_max += 15
				src.reflect_max += 15
				src.counter_max += 15
				src.overlays += mystic_elec
				view(6) << "<font color = green>[src.name] transforms into their number 4 form!!"
				src.icon = 'Bio Warrior 4.dmi'
				new/obj/techs/Overlays/Crater_Center(src.loc)
				src.overlays -= src.aura
			if("Model IV")if(src.powerlevel_max >= 1000000)
				src.form = "Model V"
				src.Power_Redefine()
				src.powerlevel_max *= 2
				src.ki_max *= 2
				src.strength_max *= 2
				src.defence_max *= 2
				src.speed_max = 1.2
				src.block_max += 20
				src.dodge_max += 20
				src.critical_max += 20
				src.reflect_max += 20
				src.counter_max += 20
				src.overlays += mystic_elec
				view(6) << "<font color = green>[src.name] transforms into their number 5 form!!"
				src.icon = 'Bio Warrior 5.dmi'
				new/obj/techs/Overlays/Crater_Center(src.loc)
				src.overlays -= src.aura
			if("Model V")if(src.powerlevel_max >= 2300000)
				src.form = "Model VI"
				src.Power_Redefine()
				src.powerlevel_max *= 5
				src.ki_max *= 5
				src.strength_max *= 5
				src.defence_max *= 5
				src.speed_max = 0.7
				src.block_max += 20
				src.dodge_max += 20
				src.critical_max += 20
				src.reflect_max += 20
				src.counter_max += 20
				src.overlays += mystic_elec
				view(6) << "<font color = green>[src.name] transforms into their number 6 form!!"
				src.icon = 'Bio Warrior 6.dmi'
				new/obj/techs/Overlays/Crater_Center(src.loc)
				src.overlays -= src.aura
			if("Model VI")if(src.powerlevel_max >= 35000000)
				src.form = "Model VII"
				src.Power_Redefine()
				src.powerlevel_max *= 2.8
				src.ki_max *= 2.8
				src.strength_max *= 2.8
				src.defence_max *= 2.8
				src.speed_max = 0.1
				src.block_max += 20
				src.dodge_max += 20
				src.critical_max += 20
				src.reflect_max += 20
				src.counter_max += 20
				src.overlays += mystic_elec
				view(6) << "<font color = green>[src.name] transforms into their number 7 form!!"
				src.icon = 'Bio Warrior 7.dmi'
				new/obj/techs/Overlays/Crater_Center(src.loc)
				src.overlays -= src.aura
		src.frozen = 0
		if(src.doing) src.doing --
		src.safe = 0
		src.Icon_State("")