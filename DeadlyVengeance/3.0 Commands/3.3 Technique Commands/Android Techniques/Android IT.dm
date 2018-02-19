mob/learn
	verb
		Advanced_Instant_Transmission()
			set category = "Techniques"
			set name = "Advanced Instant Transmission"
			var/mob/M = input("Who do you wish the AIT to?","Advanced Instant Transmission") as mob in world
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
				src<< "You're already doing something!"
				return
			if(src.android_dead)
				src<< "Your circuits are currently going through repairs."
				return
			if(M.z>4&&M.client) return
			if(M.z<1||src.jailed||M.jailed||src.tourny||M.tourny)return
			if(src.it_lock||src.ki_lock)
				src<< "Cannot use this Technique at this time"
				return
			if(!src.it_lock&&!M.it_lock&&!src.dead&&!M.dead)
				if(!M.it_blocked&&!M.hidden)
					if(M.z==6 && src.z!=6)
						src<<"They're not in your dimension!"
						return
					if(src.z==6 && M.z!=6)
						src<<"They're not in your dimension!"
						return
					for(var/area/house/S in view(1,M)) for(var/obj/O in src.contents)
						if(istype(O,/obj/Dragonballs))
							if(src.client) src << "You cannot enter a sz with a dragonball!"
							return
					if(src.going_boom)
						src<<"Not while you're suiciding."
						return
					else
						src.Icon_State("IT")
						sleep(6)
						src.Icon_State("")
						src.x = M:x
						src.y = M:y-1
						src.z = M:z
						view(6) << "<font size=1><B>[src.name] appears from nowhere!"
						src.Icon_State("IT")
						sleep(6)
						src.Icon_State("")
				else src<< "You cannot seem to get a clear lock on [M]'s energy signal..."