mob/proc/Demon_Trans()
	var/transtime = 5
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
	if(!src.doing) src.doing ++
	src.safe = 1
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(transtime)
	switch(src.chromosome)
		if("Evil")switch(src.form)
			if("")if(src.powerlevel_max >= 7500)
				src.form = "Demonic Will"
				src.icon = 'Demon - Form 2.dmi'
				src.Power_Redefine()
				src.powerlevel *= 112
				src.ki *= 110
				src.strength *= 112
				src.defence *= 118
				src.critical += rand(1,3)
				src.dodge += rand(1,4)
				src.reflect += rand(1,2)
				src.block += rand(1)
				src.counter += rand(1,3)
				src.speed = 3.7
				view(6) << "<font color = maroon>[src.name] transforms into their Demonic Will Form!"
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Demonic Will")if(src.powerlevel_max >= 35000)
				src.icon = 'Demon - Form 3.dmi'
				src.form = "Demonic Ascension"
				src.Power_Redefine()
				src.powerlevel *= 217
				src.ki *= 215
				src.strength *= 217
				src.defence *= 213
				src.critical += rand(2,7)
				src.dodge += rand(2,7)
				src.reflect += rand(2,7)
				src.block += rand(2,7)
				src.counter += rand(2,7)
				src.speed = 3.0
				src.overlays += demon_elec_2
				view(6) << "<font color = maroon>[src.name] transforms into their Demonic Ascension Form!"
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Demonic Ascension")if(src.powerlevel_max >= 150000)
				src.form = "Pure Evil"
				src.icon = 'Demon - Form 4.dmi'
				src.overlays -= demon_elec_2
				src.overlays += demon_elec
				src.Power_Redefine()
				src.powerlevel *= 327
				src.ki *= 325
				src.strength *= 327
				src.defence *= 324
				src.speed = 2.4
				src.block += 3
				src.dodge += 3
				src.critical += 3
				src.reflect += 3
				src.counter += 3
				view(6) << "<font color = maroon>[src.name] Morphs into their Pure Evil Form!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Pure Evil")if(src.powerlevel_max >= 290000)
				src.form  = "Demonic Corrupt"
				src.Power_Redefine()
				src.powerlevel *= 532
				src.ki *= 530
				src.strength *= 531
				src.defence *= 528
				src.speed = 1.8
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << "<font color = maroon>[src.name] raises their power to maximum!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Demonic Corrupt")if(src.powerlevel_max >= 450000)
				src.form = "True Form"
				src.icon = 'Demon - Form 5.dmi'
				src.Power_Redefine()
				src.powerlevel *= 632
				src.ki *= 630
				src.strength *= 631
				src.defence *= 628
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << "<font color = maroon>[src.name] raises their power to the true form!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("True Form")if(src.powerlevel_max >= 750000)
				src.form = "Demonic Purity"
				src.icon = 'Demon - Form 6.dmi'
				src.Power_Redefine()
				src.powerlevel *= 732
				src.ki *= 730
				src.strength *= 731
				src.defence *= 728
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << "<font color = maroon>[src.name] raises their power to the red form!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Demonic Purity")if(src.powerlevel_max >= 1000000)
				src.form = "Demonic Overlord"
				src.icon = 'Demon - Form 7.dmi'
				src.Power_Redefine()
				src.powerlevel *= 1000
				src.ki *= 1000
				src.strength *= 1000
				src.defence *= 1000
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << "<font color = maroon>[src.name] raises their power to the Overlord of Demons form!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Good")switch(src.form)
			if("")if(src.powerlevel_max >= 7500)
				src.form = "Demonic Urge"
				src.icon = 'Good Demon 2.dmi'
				src.Power_Redefine()
				src.powerlevel *= 112
				src.ki *= 110
				src.strength *= 112
				src.defence *= 118
				src.critical += rand(1,3)
				src.dodge += rand(1,4)
				src.reflect += rand(1,2)
				src.block += rand(1)
				src.counter += rand(1,3)
				src.speed = 3.7
				view(6) << "<font color = White>[src.name] transforms into their Demonic Urge Form!"
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Demonic Urge")if(src.powerlevel_max >= 35000)
				src.form = "Demonic Decention"
				src.icon = 'Good Demon 3.dmi'
				src.Power_Redefine()
				src.powerlevel *= 217
				src.ki *= 215
				src.strength *= 217
				src.defence *= 213
				src.critical += rand(2,7)
				src.dodge += rand(2,7)
				src.reflect += rand(2,7)
				src.block += rand(2,7)
				src.counter += rand(2,7)
				src.speed = 2.7
				src.overlays += demon_elec_2
				view(6) << "<font color = white>[src.name] transforms into their Demonic Decention Form!"
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Demonic Decention")if(src.powerlevel_max >= 150000)
				src.form = "Pure Good"
				src.icon = 'Good Demon 4.dmi'
				src.overlays -= demon_elec_2
				src.overlays += demon_elec
				src.Power_Redefine()
				src.powerlevel *= 327
				src.ki *= 325
				src.strength *= 327
				src.defence *= 324
				src.speed = 1.3
				src.block += 3
				src.dodge += 3
				src.critical += 3
				src.reflect += 3
				src.counter += 3
				view(6) << "<font color = white>[src.name] Morphs into their Pure Good Form!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Pure Good")if(src.powerlevel_max >= 490000)
				src.form = "Maximum Good"
				src.Power_Redefine()
				src.powerlevel *= 532
				src.ki *= 530
				src.strength *= 531
				src.defence *= 528
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << "<font color = white>[src.name] raises their power to maximum!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Maximum Good")if(src.powerlevel_max >= 750000)
				src.form = "True Form"
				src.icon = 'Good Demon 5.dmi'
				src.Power_Redefine()
				src.powerlevel *= 632
				src.ki *= 630
				src.strength *= 631
				src.defence *= 628
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << "<font color = white>[src.name] raises their power to the true form!"
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("True Form")if(src.powerlevel_max >= 1000000)
				src.form = "Demonic Impurity"
				src.icon = 'Good Demon 6.dmi'
				src.Power_Redefine()
				src.powerlevel *= 732
				src.ki *= 730
				src.strength *= 731
				src.defence *= 728
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << "<font color = white>[src.name] raises their power to the blue form!"
				src.Icon_State("")
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Demonic Impurity")if(src.powerlevel_max >= 2000000)
				src.form = "Demonic Majesty"
				src.icon = 'Good Demon 7.dmi'
				src.Power_Redefine()
				src.powerlevel *= 1000
				src.ki *= 1000
				src.strength *= 1000
				src.defence *= 1000
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << "<font color = white>[src.name] raises their power to a King above Kings!"
				src.Icon_State("")
				new/obj/techs/Overlays/Crater_Center(src.loc)
		if("Chaos")switch(src.form)
			if("")if(src.powerlevel_max>=7500)
				src.form = "Chaotic Will"
				src.icon = 'Chaos Demon 2.dmi'
				src.Power_Redefine()
				src.powerlevel *= 112
				src.ki *= 110
				src.strength *= 112
				src.defence *= 8
				src.critical += rand(1,3)
				src.dodge += rand(1,4)
				src.reflect += rand(1,2)
				src.block += rand(1)
				src.counter += rand(1,3)
				src.speed = 3.7
				view(6) << {"<font color = White>[src.name]'s <FONT COLOR="#800000">will has slipped into chaos."}
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Chaotic Will")if(src.powerlevel_max>=35000)
				src.form = "Chaotic Ascension"
				src.icon = 'Chaos Demon 3.dmi'
				src.Power_Redefine()
				src.powerlevel *= 217
				src.ki *= 215
				src.strength *= 217
				src.defence *= 213
				src.critical += rand(2,7)
				src.dodge += rand(2,7)
				src.reflect += rand(2,7)
				src.block += rand(2,7)
				src.counter += rand(2,7)
				src.speed = 2.7
				src.overlays += demon_elec_2
				view(6) << {"<font color = white>[src.name] <FONT COLOR="#800000">ascends into chaos."}
				new/obj/techs/Overlays/Crater_Small(src.loc)
			if("Chaotic Ascension")if(src.powerlevel_max>=150000)
				src.form = "Pure Chaos"
				src.icon = 'Chaos Demon 4.dmi'
				src.overlays -= demon_elec_2
				src.overlays += demon_elec
				src.Power_Redefine()
				src.powerlevel *= 427
				src.ki *= 425
				src.strength *= 427
				src.defence *= 424
				src.speed = 1.3
				src.block += 3
				src.dodge += 3
				src.critical += 3
				src.reflect += 3
				src.counter += 3
				view(6) << {"<font color = white>[src.name] <FONT COLOR="#800000">has seeped into a form of pure chaos."}
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Pure Chaos")if(src.powerlevel_max>=490000)
				src.form = "Chaotic Servent"
				src.Power_Redefine()
				src.powerlevel *= 532
				src.ki *= 530
				src.strength *= 531
				src.defence *= 528
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) <<{"<font color = white>[src.name]<FONT COLOR="#800000"> has fallen into the service of the Chaos."}
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Chaotic Servent")if(src.powerlevel_max>=750000)
				src.form = "Chaotic Upstart"
				src.icon = 'Chaos Demon 5.dmi'
				src.Power_Redefine()
				src.powerlevel *= 632
				src.ki *= 630
				src.strength *= 631
				src.defence *= 628
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << {"<font color = white>[src.name]<FONT COLOR="#800000"> grows in chaotic stature as they become a Chaotic Upstart"}
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Chaotic Upstart")if(src.powerlevel_max>=1000000)
				src.form = "Chaos Knight"
				src.icon = 'Chaos Demon 6.dmi'
				src.Power_Redefine()
				src.powerlevel *= 720
				src.ki *= 700
				src.strength *= 710
				src.defence *= 720
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << {"<font color = white>[src.name]<FONT COLOR="#800000"> gains honor amongst the chaos as a Chaos Knight"}
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Chaos Knight")if(src.powerlevel_max>=25000000)
				src.form = "Chaos Ruler"
				src.icon = 'Chaos Demon 7.dmi'
				src.Power_Redefine()
				src.powerlevel *= 820
				src.ki *= 800
				src.strength *= 810
				src.defence *= 880
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << {"<font color = white>[src.name] <FONT COLOR="#800000">gains prestige amongst the chaos as a Chaos Ruler."}
				new/obj/techs/Overlays/Crater_Center(src.loc)
			if("Chaos Ruler")if(src.powerlevel_max>=34000000)
				src.form = "King of Chaos"
				src.icon = 'Chaos Demon 8.dmi'
				src.Power_Redefine()
				src.powerlevel *= 1150
				src.ki *= 1150
				src.strength *= 1150
				src.defence *= 1150
				src.speed = 1.3
				src.block += 5
				src.dodge += 5
				src.critical += 5
				src.reflect += 5
				src.counter += 5
				view(6) << {"<font color = white>[src.name] <FONT COLOR="#800000">has conqoured the chaos and become the King of Chaos."}
				new/obj/techs/Overlays/Crater_Center(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.Icon_State("")
	src.safe = 0