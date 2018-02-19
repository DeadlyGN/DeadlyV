/obj/Overlays/Golden_top
	Ape_Head
	icon = 'Bebi - Form 3.dmi'
	icon_state = "top"
	layer = 4
	density = 1
	New()
		pixel_y = 32
/obj/Overlays/Golden_bottom
	Ape_Body
	icon = 'Bebi - Form 3.dmi'
	icon_state = "bottom"
	layer = 4
	density = 1
	New()
		pixel_y = 1
mob/var/tmp/ape_delay = 0
mob/learn/Tuffle
	verb
		Golden_Oozaru()
			set category = "Techniques"
			if(src.monkey) src.ape_break()
			else
				if(src.oozaru_delay)
					src<< "You must wait before using this technique again."
					return
				if(src.kaioken)
					src<< "<font color = blue>Error:</font></B>Its too dangerous to use Kaioken right now!"
					return
				if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
					src<< "<font color = blue>Error:</font></B>You're already doing something!"
					return
				if(src.form=="Infected Form 2")
					if(!src.monkey)
						icon_state= "blank"
						view() <<"<B>[src.name] screams out in a blind rage!!!"
						src.oozaru_delay = 1
						src.monkey = 1
						src.doing =1
						src.Icon_State("enrage")
						src.frozen = 1
						sleep(16)
						src.Icon_State("blank")
						src.frozen = 0
						view() <<"<B>[src.name] begins to sweat.. a golden fur suddenly sprouts out all over their body.."
						sleep(11)
						view() <<"<B>[src.name] has grown into a gaint golden ape!"
						src.oldicon = src.icon
						src.icon = null
						src.overlays = null
						src.overlays += new /obj/Overlays/Golden_top/Ape_Head
						src.overlays += new /obj/Overlays/Golden_bottom/Ape_Body
						src.aura_on = 1
						call(src,"Aura")()
						src.Power_Redefine()
						src.powerlevel *= 25
						src.ki *= 25
						src.strength *= 25
						src.defence *= 25
						src.speed -= 1.34
						if(src.doing) src.doing --
						spawn(50) src.oozaru_delay = 0
mob/proc/ape_break()
	view() <<"<B>[src.name] begins to shrink down from their golden glory back to their normal form!"
	src.Power_Redefine()
	src.form = "Infected Form 2"
	src.monkey = 0
	src.overlays = null
	src.buku = 0
	src.buku_lock = 0
	src.Icon_State("")
