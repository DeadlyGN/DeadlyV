turf
	Passages
		King_Kai_Training
			Enter
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					if(M.level <30000)
						M.loc = locate(78,158,8)
						M.density = 1
						M.buku_lock = 1
						M.it_lock = 1
						M.ki_lock = 1
					else M<<"You can not enter this room anymore."
			Exit
				density = 1
				Enter(mob/PC/M)
					if(isobj(M)) del(M)
					M.loc = locate(102,96,8)
					M.density = 1
					M.buku_lock = 0
					M.ki_lock = 0
					M.it_lock = 0
					M.grav = 0
					M.grav_on = 0

		Safe_Zone1
			Enter
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(29,200,9)
			Exit
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(37,216,1)

