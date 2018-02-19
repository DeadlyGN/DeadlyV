mob/var/tmp/
	mob/PC/maker
	splits = 0
mob/learn
	verb/Split_Form()
		set name = "Split Form"
		set category = "Techniques"
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.monkey)
			src<<"You cannot use this whilist in oozaru."
			return
		if(src.dead||src.buku) return
		for(var/area/L in oview(0))
			if(istype(L,/area/house/))
				usr<<"You cannot make splits in the sz"
				return
		if(src.ki_lock)
			src<< "Cannot use this Technique at this time"
			return
		if(src.level < 8000)
			if(src.splits >= 1)
				src<< "You can only have 1 Split Form at a time."
				return
		else
			if(src.splits >= 2)
				src<< "You can only have 2 Split Forms at a time."
				return
		var/ki_cost = round(src.ki_max)
		var/mob/Monster/Split_form/S = new/mob/Monster/Split_form
		if(src.ki >= ki_cost)
			view() << "[src.name] has created a Split Form!"
			src.ki -= ki_cost
			src.splits += 1
			S.loc = locate(usr.x+1,usr.y,usr.z)
			S.powerlevel = src.powerlevel/7
			S.level = src.level
			S.ki = src.ki/7
			S.strength = src.strength/7
			S.defence = src.defence/7
			S.speed = src.speed
			S.critical = src.critical/2
			S.block = src.block/2
			S.reflect = src.reflect/2
			S.counter = src.counter/2
			S.dodge = src.dodge/2
			S.maker = usr
			S.icon = usr.icon
			S.name = "[usr.name]'s Split Form"
			S.overlays = usr.overlays
			S.underlays = usr.underlays
			S.zanzoken = usr.zanzoken
			S.race = usr.race
			S.hair = usr.hair
			S.spawnin=null
mob/learn
	verb/Kill_Split()
		set category = "Techniques"
		for(var/mob/Monster/Split_form/S in Pets)
			if(S.maker == src)
				src.splits = 0
				src<<"You have summoned your Split back to you."
				del S
			..()