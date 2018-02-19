mob/learn
	verb/Kiai(mob/M in oview(7))
		set category = "Techniques"
		var/ki_cost = round(src.ki_max * 0.02)
		var/ki_damage = round(src.level)
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(src.safe||src.dead) return
		if(src.ki_lock)
			src<< "Cannot use this Technique at this time"
			return
		if(src.monkey)
			src<<"You cannot use this whilist in oozaru."
			return
		if(!M||M.safe||M.dead||M.tourny||M == src) return
		if(!M.pk)
			src<< "They're not a Combatant!"
			return
		if(!src.pk)
			src<< "You're not a Combatant!"
			return
		for(var/area/house/S in view(4,M))
			src<< "They're in a Safe Zone!"
			return
		if(ki_damage <= 0)ki_damage = 10
		if(src.ki >= ki_cost)
			src.ki -= ki_cost
			var/FallDir = get_dir(src,M)
			src.dir = FallDir
			step(M,FallDir)
			switch(FallDir)
				if(NORTH)M.dir = SOUTH
				if(NORTHWEST)M.dir = SOUTHEAST
				if(WEST)M.dir = EAST
				if(SOUTHWEST)M.dir = NORTHEAST
				if(SOUTH)M.dir = NORTH
				if(SOUTHEAST)M.dir = NORTHWEST
				if(EAST)M.dir = WEST
				if(NORTHEAST)M.dir = SOUTHWEST
			spawn(11)
				if(!M||M.safe||M.dead||M.tourny)
					src.doing=0
					src.frozen=0
					return
				M.Damage(ki_damage)
				M.DeathCheck(src)
		else src<< "You do not have enough Ki!"
		src.afk_time = 0