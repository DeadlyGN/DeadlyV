mob/var/ball_locked = 0
mob/learn
	verb/Trap_Ball(mob/M in oview(6))
		set category = "Techniques"
		var/ki_cost = round(src.ki_max * 0.32)
		if(usr.buku) return
		else
			if(usr.monkey) return
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
				src<< "You're already doing something!"
				return
			if(!M||M.safe||M.dead||M.tourny)
				src<< "A force stops you from attacking [M]"
				return
			if(src.buku) return
			if(src.safe||src.dead)
				src<< "You're currently safe and cannot attack."
				return
			if(M.buku) return
			if(src.wrapped)
				src<< "Your ki has been contained in the goo!"
				return
			if(src.dead)
				return
			if(src.ball_locked)
				src<< "You must wait before using this technique again!"
				return
			if(src.ki_lock)
				src<< "Cannot use this Technique at this time"
				return
			if(!M.pk)
				usr<< "[M] Must be a combatant to engage in combat with players!"
				return
			if(!src.pk)
				usr<< "You're not a Combatant!"
				return
			if(M.ball_wrapped)
				usr<< "<font size=1><B>[M.name] is already bound by you!"
				return
			if(usr.ki_lock)
				usr<< "<font size=1><B>Some unknown force contains your Ki!"
				return
			if(M.monkey)
				usr<< "<font size=1><B>[M.name]'s huge body has instantly broken the bind!"
				return
			if(!M||M.safe||M.dead||M.tourny)
				return
			if(usr.ki >= ki_cost)
				usr.ball_locked = 1
				usr.doing ++
				usr.ki -= ki_cost
				usr.overlays += usr.trap_ball_charge
				sleep(6)
				usr.overlays -= usr.trap_ball_charge
				usr.Icon_State("attack")
				sleep(11)
				usr.Icon_State("")
				M.overlays += M.trap_ball
				M.frozen = 1
				M.attack_lock = 1
				M.ki_lock = 1
				M.ball_wrapped = 1
				view(6) << "<font size=1><B>[M.name] has been binded up by [usr.name]!"
				usr.ball_lock()
				M.ball_unlock()
			else
				return
mob/proc/ball_lock()
	if(src.doing) src.doing --
	spawn(600)
	src.ball_locked = 0
mob/proc/ball_unlock()
	sleep(50)
	view(6) << "<font size=1><B>[src.name] has broken the binding which contains them!"
	src.overlays -= trap_ball
	src.frozen = 0
	src.attack_lock = 0
	src.buku = 0
	src.ki_lock = 0
	src.ball_wrapped = 0