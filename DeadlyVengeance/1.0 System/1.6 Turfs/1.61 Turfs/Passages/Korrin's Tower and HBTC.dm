turf
	Passages
		The_Lookout
			Enter
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					for(var/obj/O in M.contents)
						if(istype(O,/obj/Dragonballs))
							usr<<"You cannot enter a sz with a dragonball!"
							return
					M.loc = locate(234,3,8)
			Exit
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					M.loc = locate(191,247,1)
		Korrins
			Enter
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					for(var/obj/O in M.contents)
						if(istype(O,/obj/Dragonballs))
							usr<<"You cannot enter a sz with a dragonball!"
							return
					M.loc=locate(234,152,8)
			Exit
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					M.loc=locate(234,144,8)
		HBTC
			Enter
				Enter(mob/PC/M as mob)
					if(isobj(M)) del(M)
					if(ismob(M))
						for(var/obj/O in M.contents)
							if(istype(O,/obj/Dragonballs))
								usr<<"You cannot enter a sz with a dragonball!"
								return
						if(M.going) return FALSE
						M.going++
						if(M.level >= 17500)
							if(M.HBTC < 5)
								if(M.going>1) return FALSE
								M.loc = locate(115,246,6)
								M.HBTC ++
								M.it_blocked = 1
								M.it_lock = 1
							else
								if(M.going>1) return FALSE
								usr<< "Your body cannot handle anymore training in the HBTC!"
						else
							if(M.going>1) return FALSE
							usr<< "You don't feel strong enough yet...(Level 17500)"
					else return FALSE
					M.going=0
			Exit
				Enter(mob/PC/M as mob)
					if(isobj(M)) del(M)
					if(ismob(M))
						M.loc = locate(234,242,8)
						M.it_blocked = 0
						M.it_lock = 0
						M.safe=1
						spawn(11)M.safe=0
					else return FALSE