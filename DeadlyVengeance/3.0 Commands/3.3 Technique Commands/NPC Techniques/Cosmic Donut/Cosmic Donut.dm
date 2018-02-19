mob
	var
		tmp/icon
			cosmic_donut_charge = 'Cosmic Donut Charge.dmi'
			cosmic_donut = 'Cosmic Donut.dmi'
		cosmic_donut_learn = 0
		tmp/donut_wrapped = 0
		tmp/donut_locked = 0
mob/learn
	verb/Galactic_Donut(mob/M in oview(7))
		set category = "Techniques"
		var/ki_cost = round(src.ki_max * 0.32)
		if(src.monkey) return
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(!M||M.safe||M.dead)
			src<< "A force stops you from attacking [M]"
			return
		if(src.safe||src.dead)
			src<< "You're currently safe and cannot attack."
			return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.donut_locked)
			src<< "You must wait before using this technique again!"
			return
		if(src.ki_lock)
			src<< "Cannot use this Technique at this time"
			return
		if(!M.pk)
			src<< "[M] Must be a combatant to engage in combat with players!"
			return
		if(!src.pk)
			src<< "You're not a Combatant!"
			return
		if(M.donut_wrapped)
			src<< "<font size=1><B>[M.name] is already bound by you!"
			return
		if(src.ki_lock)
			src<< "<font size=1><B>Some unknown force contains your Ki!"
			return
		if(M.monkey)
			src<< "<font size=1><B>[M.name]'s huge body has instantly broken the bind!"
			return
		if(src.ki >= ki_cost)
			src.donut_locked = 1
			src.doing ++
			src.ki -= ki_cost
			src.overlays += src.cosmic_donut_charge
			sleep(6)
			src.overlays -= src.cosmic_donut_charge
			src.Icon_State("attack")
			sleep(11)
			src.Icon_State("")
			if(!M||M.safe||M.dead||M.tourny)
				src.doing=0
				src.frozen=0
				return
			M.overlays += M.cosmic_donut
			M.frozen = 1
			M.attack_lock = 1
			M.ki_lock = 1
			M.donut_wrapped = 1
			view(6) << "<font size=1><B>[M.name] has been binded up by [src.name]!"
			src.donut_lock()
			M.donut_unlock()
mob/proc/donut_lock()
	if(src.doing) src.doing --
	spawn(600)
	src.donut_locked = 0
mob/proc/donut_unlock()
	sleep(50)
	view(6) << "<font size=1><B>[src.name] has broken the binding which contains them!"
	src.overlays -= cosmic_donut
	src.frozen = 0
	src.attack_lock = 0
	src.buku = 0
	src.ki_lock = 0
	src.donut_wrapped = 0