/obj/Overlays/Oozaru_top
	Oozaru_Head
	icon = 'Oozaru.dmi'
	icon_state = "head"
	layer = 14
	density = 1
	New()
		pixel_y = 32
/obj/Overlays/Oozaru_bottom
	Oozaru_Body
	icon = 'Oozaru.dmi'
	layer = 14
	density = 1
	New()
		pixel_y = 1
mob
	var
		monkey = 0
		tail_cut = 0
		wearing_tail = 0
		has_tail = 0
		tmp/oozaru_delay = 0
mob/learn/Saiyan
	verb
		Fake_Moon()
			set category = "Techniques"
			if(src.monkey) src.oozaru_break()
			else
				if(src.oozaru_delay)
					src<< "You must wait before using this technique again."
					return
				if(!src.has_tail)
					src<< "<font color = blue>Error:</font></B>You dont have a tail!"
					return
				if(src.kaioken)
					src<< "<font color = blue>Error:</font></B>Its too dangerous to use Kaioken right now!"
					return
				if(src.form!="")
					src<< "<font color = blue>Error:</font></B>You're already transformed, revert then try again!"
					return
				if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
					src<< "<font color = blue>Error:</font></B>You're already doing something!"
					return
				if(!src.monkey)
					view() <<"<B>[src.name] shoots a blast of energy up into the sky, creating a false moon!"
					src.oozaru_delay = 1
					src.monkey = 1
					src.doing =1
					src.Icon_State("enrage")
					src.frozen = 1
					sleep(16)
					src.Icon_State("")
					src.frozen = 0
					view() <<"<B>[src.name] begins to sweat.. Fur suddenly sprout out all over their body.."
					sleep(11)
					view() <<"<B>[src.name] has gone Oozaru!"
					src.oldicon = src.icon
					src.icon = null
					src.overlays = null
					src.overlays += new /obj/Overlays/Oozaru_top/Oozaru_Head
					src.overlays += new /obj/Overlays/Oozaru_bottom/Oozaru_Body
					src.aura_on = 1
					call(src,"Aura")()
					src.Power_Redefine()
					src.powerlevel *= 89
					src.strength *= 89
					src.defence *= 89
					src.speed -= 1.7
					if(src.doing) src.doing --
					spawn(50) src.oozaru_delay = 0
mob/proc/oozaru_break()
	view() <<"<B>[src.name] begins to shrink down from Oozaru back to normal form!"
	src.Power_Redefine()
	src.form=""
	src.monkey = 0
	src.overlays = null
	src.icon = src.oldicon
	src.oldicon = null
	src.Skin_Apply()
	if(src.tail_cut) src.overlays += src.tail
	src.Icon_State("")
	src.Power_Redefine()
	src.buku = 0
	src.buku_lock = 0
	src.Hair_Apply()
mob/proc/apply_tail()
	if(src.tail_cut>2)
		src<< "<center>\white ..:: Your Tail Doesn't Seem to Be Growing Back ::.. </center>"
		src.has_tail=0
		return
	src<< "<center>\white ..:: Your Tail Grew Back ::.. </center>"
	src.has_tail = 1
	src.overlays += src.tail