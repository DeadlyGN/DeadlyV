mob/var/tmp/buku = 0
mob/learn
	verb/Fly()
		set category = "Techniques"
		if(src.buku) src.Land()
		else src.Flight()
mob/
	verb/Flight()
		set hidden = 1
		set category = null
		if(src.monkey)
			src<< "You cannot Fly while in your oozaru form"
			return
		if(src.dead)
			src<< "You cannot Fly while your dead"
			return
		if(src.buku_lock)
			src<< "You cannot Fly at the moment"
			return
		if(src.z>=6)
			if(src.x<=219)
				src<<"You cannot fly at this location!"
				return
		for(var/turf/Floors/Gravity_Floor/S in view(src,6))
			if(S in oview(7))
				src<< "The Gravity is too heavy here to Fly!"
				return
		if(src.donut_wrapped||src.stone_form||src.grav||src.doing||src.buku||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
		src<< "You lift off the ground and take for the sky"
		src.buku = 1
		src.density = 0
		src.afk_time = 0
		spawn()
			if(!src.Icon_State("flight"))
				while(src.buku)
					animate(src,pixel_y=src.pixel_y+1,time=2,loop=1)
					sleep(2)
					animate(src,pixel_y=src.pixel_y-1,time=2,loop=1)
					sleep(2)
				src.pixel_y=0
	verb/Land()
		set hidden = 1
		set category = null
		src<< "You land on the ground from the sky"
		src.buku = 0
		src.density = 1
		if(src.doing) src.doing --
		src.Icon_State("")
		src.afk_time = 0