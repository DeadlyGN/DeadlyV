mob/var/tmp/spit_locked = 0
mob/learn/Demon
	verb/Stone_Spit(mob/M in oview(7))
		set category = "Techniques"
		var/ki_cost = round(src.ki_max * 0.32)
		if(src.monkey||src.tourny||M.tourny||M.buku) return
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(M.safe||M.dead)
			src<< "A force stops you from attacking [M]"
			return
		if(src.safe||src.dead)
			src<< "You're currently safe and cannot attack."
			return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.spit_locked)
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
			src<< "<font size=1><B>[M.name]'s huge body has broken free from your attack!"
			return
		if(src.ki >= ki_cost)
			src.spit_locked = 1
			src.doing ++
			src.ki -= ki_cost
			src.overlays += src.spit_charge
			sleep(6)
			src.overlays -= src.spit_charge
			src.Icon_State("attack")
			sleep(11)
			src.Icon_State("")
			M.overlays += M.stone_spit
			M.frozen = 1
			M.attack_lock = 1
			M.ki_lock = 1
			M.stone_form = 1
			M.buku = 0
			view(6) << "<font size=1><B>[M.name] has been turned into stone!"
			src.spit_lock()
			M.spit_unlock()
mob/proc/spit_lock()
	if(src.doing) src.doing --
	spawn(600) src.spit_locked = 0
mob/proc/spit_unlock()
	sleep(55)
	view(6) << "<font size=1><B>[src.name] has broken through the stone!"
	src.overlays -= stone_spit
	src.frozen = 0
	src.attack_lock = 0
	src.buku = 0
	src.ki_lock = 0
	src.stone_form = 0
mob
	var/tmp
		icon/spit_charge = 'Stone Charge.dmi'
		icon/stone_spit = 'Stone.dmi'
		stone_form = 0