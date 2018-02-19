mob/var/tmp
	mob/PC/owner
	cell_jrs = 0
mob/learn
	verb/Createcell()
		set name = "Create Cell Jr"
		set category = "Techniques"
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(src.buku)
			return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.dead) return
		if(src.ki_lock)
			src<< "Cannot use this Technique at this time"
			return
		for(var/area/L in oview(0))
			if(istype(L,/area/house/))
				usr<<"You cannot make cell jrs in the sz"
				return
		if(src.cell_jrs >= 3)
			src<< "You can only have 3 cell jrs at a time."
			return
		var/ki_cost = round(src.ki_max)
		var/mob/Monster/Cell_Jr/B = new/mob/Monster/Cell_Jr
		if(src.ki >= ki_cost)
			view() << "[src.name] has created a cell jr!"
			src.ki -= ki_cost
			src.cell_jrs += 1
			B.loc = locate(usr.x+1,usr.y,usr.z)
			B.name = "[usr.name]'s Cell Jr."
			B.powerlevel = src.powerlevel/9
			B.level = src.level
			B.ki = src.ki/9
			B.strength = src.strength/9
			B.defence = src.defence/9
			B.speed = src.speed
			B.critical = src.critical/3
			B.block = src.block/3
			B.reflect = src.reflect/3
			B.counter = src.counter/3
			B.dodge = src.dodge/3
			B.owner = usr
			B.spawnin = null