mob/proc/All_Star_Trans()
	var/trans_time = 27
	if(src.upkeep == 5) trans_time = 5
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate||src.KO) return
	if(!src.doing) src.doing ++
	src.safe = 1
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(trans_time)
	src.Power_Redefine()
	if(src.form=="")
		if(src.kills+src.pkills<50000)
			if(src.kills+src.pkills>2000)
				src.powerlevel *= round(kills/50)
				src.ki *= round(kills/50)
				src.strength *= round(kills/50)
				src.defence *= round(kills/50)
				if(src.kills+src.pkills>=1000)
					if(src.kills+src.pkills>10000)
						src.block += 50
						src.dodge += 50
						src.critical += 50
						src.reflect += 50
						src.counter += 50
					else
						src.block += round(kills/100)
						src.dodge += round(kills/100)
						src.critical += round(kills/100)
						src.reflect += round(kills/100)
						src.counter += round(kills/100)
				else
					src.block += 10
					src.dodge += 10
					src.critical += 10
					src.reflect += 10
					src.counter += 10
			else
				src.powerlevel *= 390
				src.ki *= 390
				src.strength *= 390
				src.defence *= 390
		else
			src.powerlevel *= 1250
			src.ki *= 1250
			src.strength *= 1250
			src.defence *= 1250
			src.block += 90
			src.dodge += 90
			src.critical += 90
			src.reflect += 90
			src.counter += 90
		src.speed = 1
		src.form = "All-Star"
		src.Icon_State("")
		src.icon = 'All-Star Second form.dmi'
		src.overlays += big_purple_elec
		src.overlays += namek_elec
		src.overlays += big_red_elec
		src.overlays += mystic_elec
		src.overlays += demon_elec
		src.overlays += demon_elec_2
		src.overlays += small_blue_elec
		src.overlays += big_blue_elec
		src.overlays += small_red_elec
		src.overlays += big_red_elec
		src.overlays += ely_red_elec
		src.overlays += ely_blue_elec
		oview()<<"<font color=Blue>You feel an great power. A power so great, you feel your core start to tremble."
		view(6) <<{"<font color = blue>[src.name]'s <FONT COLOR="#00008b">p</FONT><FONT COLOR="#000098">o</FONT><FONT COLOR="#0000a5">w</FONT><FONT COLOR="#0000b2">e</FONT><FONT COLOR="#0000bf">r</FONT><FONT COLOR="#0000cc"> </FONT><FONT COLOR="#0000d9">i</FONT><FONT COLOR="#0000e6">s</FONT><FONT COLOR="#0000f3"> </FONT><FONT COLOR="#0000ff">o</FONT><FONT COLOR="#0000f4">v</FONT><FONT COLOR="#0000e9">e</FONT><FONT COLOR="#0000dd">r</FONT><FONT COLOR="#0000d1">p</FONT><FONT COLOR="#0000c6">o</FONT><FONT COLOR="#0000ba">w</FONT><FONT COLOR="#0000ae">e</FONT><FONT COLOR="#0000a2">r</FONT><FONT COLOR="#000097"> </FONT><FONT COLOR="#00008b">e</FONT><FONT COLOR="#000097">v</FONT><FONT COLOR="#0000a2">e</FONT><FONT COLOR="#0000ae">r</FONT><FONT COLOR="#0000ba">t</FONT><FONT COLOR="#0000c6">h</FONT><FONT COLOR="#0000d1">i</FONT><FONT COLOR="#0000dd">n</FONT><FONT COLOR="#0000e9">g</FONT><FONT COLOR="#0000f4"> </FONT><FONT COLOR="#0000ff">i</FONT><FONT COLOR="#0000f3">n</FONT><FONT COLOR="#0000e6"> </FONT><FONT COLOR="#0000d9">s</FONT><FONT COLOR="#0000cc">i</FONT><FONT COLOR="#0000bf">t</FONT><FONT COLOR="#0000b2">e</FONT><FONT COLOR="#0000a5">!</FONT><FONT COLOR="#000098">!</FONT><FONT COLOR="#00008b">!</FONT>"}
		new/obj/techs/Overlays/Crater_Small(src.loc)
	src.frozen = 0
	src.safe = 0
	if(src.doing) src.doing --