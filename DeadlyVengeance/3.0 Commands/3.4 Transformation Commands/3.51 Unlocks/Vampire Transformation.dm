mob/proc/Vampire_Trans()
	var/trans_time=27
	if(src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
	if(!src.doing) src.doing ++
	src.safe = 1
	src.frozen = 1
	src.Icon_State("enrage")
	sleep(trans_time)
	if(src.form=="")
		src.Power_Redefine()
		src.form = "Released Vampire"
		src.icon = 'Alucard2.dmi'
		src.powerlevel *= 950
		src.ki *= 950
		src.strength *= 950
		src.defence *= 950
		src.block = 48
		src.dodge = 45
		src.critical = 59
		src.reflect = 37
		src.counter = 28
		src.speed = 1
		oview() << "<font color=maroon>[src]</font color=maroon><font color=white>'s Power soars as they enter their release."
		new/obj/techs/Overlays/Crater_Small(src.loc)
	src.frozen = 0
	if(src.doing) src.doing --
	src.safe = 0
	src.Icon_State("")