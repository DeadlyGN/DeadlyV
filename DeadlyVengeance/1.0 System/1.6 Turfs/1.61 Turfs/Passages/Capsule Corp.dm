turf
	Passages
		Capsule_Corp
			Enter_1
				density = 1
				Enter(var/mob/PC/M)
					if(isobj(M)) del(M)
					if(!ismob(M)||M.going)return
					for(var/obj/O in M.contents)
						if(istype(O,/obj/Dragonballs))
							usr<<"You cannot enter a sz with a dragonball!"
							return
					M.going=1
					switch(input("Which Gravity Room do you wish to Enter?") in list("Gravity Room 1","Gravity Room 2","Gravity Room 3","Gravity Room 4","Gravity Room 5","Gravity Room 6","Gravity Room 7","Gravity Room 8","Gravity Pull Room"))
						if("Gravity Room 1")
							M.loc = locate(9,187,8)
						if("Gravity Room 2")
							M.loc = locate(34,187,8)
						if("Gravity Room 3")
							M.loc = locate(59,187,8)
						if("Gravity Room 4")
							M.loc = locate(9,166,8)
						if("Gravity Room 5")
							M.loc = locate(34,166,8)
						if("Gravity Room 6")
							M.loc = locate(59,166,8)
						if("Gravity Room 7")
							M.loc = locate(9,144,8)
						if("Gravity Room 8")
							M.loc = locate(34,144,8)
						if("Gravity Pull Room")
							M.loc = locate(192,17,7)
					M.density = 1
					M.buku_lock = 1
					M.buku=0
					M.Icon_State("")
					M.attack_lock = 1
					M.ki_lock = 1
					M.it_lock = 1
					M.going=0
			Exit_1
				density = 1
				Enter(var/mob/PC/M)
					if(isobj(M)) del(M)
					if(!ismob(M))return
					M.loc = locate(46,210,1)
					M.density = 1
					M.buku_lock = 0
					M.attack_lock = 0
					M.ki_lock = 0
					M.it_lock = 0
					M.grav = 0
					M.grav_on = 0
			Enter_3
				density = 1
				Enter(var/mob/PC/M)
					if(isobj(M)) del(M)
					if(!ismob(M)||M.going)return
					M.going=1
					switch(input("Which Simulation Room do you wish to Enter?") in list("Simulation Room 1","Simulation Room 2","Simulation Room 3","Simulation Room 4"))
						if("Simulation Room 1")
							M.loc = locate(113,7,8)
						if("Simulation Room 2")
							M.loc = locate(136,7,8)
						if("Simulation Room 3")
							M.loc = locate(113,28,8)
						if("Simulation Room 4")
							M.loc = locate(135,28,8)
					M.density = 1
					M.buku_lock = 1
					M.buku=0
					M.Icon_State("")
					M.attack_lock = 1
					M.ki_lock = 1
					M.it_lock = 1
					M.going=0
			Exit_3
				density = 1
				Enter(var/mob/PC/M)
					if(isobj(M)) del(M)
					if(!ismob(M))return
					M.loc = locate(45,190,1)
					M.density = 1
					M.buku=0
					M.Icon_State("")
					M.ki_lock = 0
					M.it_lock = 0
					M.buku_lock = 0
					M.attack_lock = 0
		Capsule_Corp_Future
			Enter
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					for(var/obj/O in M.contents)
						if(istype(O,/obj/Dragonballs))
							usr<<"You cannot enter a sz with a dragonball!"
							return
					if(M.trunks_quest_complete)
						M.loc = locate(125,48,8)
						M.density = 1
						M.buku_lock = 1
						M.buku=0
						M.Icon_State("")
						M.density=1
						M.attack_lock = 1
						M.ki_lock = 1
						M.it_lock = 1
					else M << "Access Denied"
			Exit
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					M.loc = locate(75,181,3)
					M.density = 1
					M.buku_lock = 0
					M.ki_lock = 0
					M.it_lock = 0
					M.grav = 0
					M.grav_on = 0