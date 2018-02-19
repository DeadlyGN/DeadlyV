turf
	Passages
		Dr_Geros
			Enter_Cave
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					if(M.going)return
					for(var/obj/O in M.contents)
						if(istype(O,/obj/Dragonballs))
							usr<<"You cannot enter a sz with a dragonball!"
							return
					M.loc = locate(154,35,8)
					M.buku_lock = 1
					M.buku=0
					M.Icon_State("")
					M.density=1
					M.attack_lock = 1
					M.ki_lock = 1
					M.it_lock = 1
			Exit_Cave
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(40,62,1)
					M.density = 1
					M.attack_lock = 0
					M.ki_lock = 0
					M.it_lock = 0
					M.buku_lock = 0
					M.buku=0
					M.Icon_State("")
			Enter_Lab
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					if(M.going)return
					M.going=1
					if(M.race == "Android"||usr.race == "Human"||usr.race=="Half Saiyan"||usr.race=="Konats")
						M.loc = locate(158,3,8)
						M.buku_lock = 1
						M.buku=0
						M.density=1
						M.Icon_State("")
						M.attack_lock = 1
						M.ki_lock = 1
						M.it_lock = 1
						M.going=0
					else
						M << "You have no business in here!"
						M.going=0
						return
			Exit_Lab
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					if(M.going)return
					M.going=1
					if(M.android_dead)
						M << "Your circuits are currently going through repairs."
						M.going=0
						return
					M.loc = locate(158,48,8)
					M.density = 1
					M.attack_lock = 1
					M.ki_lock = 1
					M.it_lock = 1
					M.Icon_State("")
					M.going=0