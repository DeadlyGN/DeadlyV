mob
	var
		tmp/arenab 	= 0
		turf/previous_loc
var
	arena_battle_on = 0
	list/arena_contenders = new()
mob/PC
	verb
		Arena_Challenge()
			set category = "Channels"
			if(src.arenab||src.guildb||src.dead||src.grav_on||!src.pk||src.jailed)return
			if(arena_battle_on)
				alert(usr,"An arena battle is taking place at the moment, try again later.")
				return
			var/list/Menu = new()
			for(var/mob/M in players)
				if(M.name != usr.name) if(!M.jailed && M.arena_accepting && M.pk && !M.dead && !M.grav_on && !M.arenab && !M.guildb && !M.it_lock && !M.hidden && !M.afk && !M.tourny) Menu.Add(M)
			var/mob/M = input("Challenge Who?","Arena Challenge") as null | anything in Menu
			if(!M)return
			if(arena_battle_on)
				alert(usr,"An arena battle is taking place at the moment, try again later.")
				return
			if(tournament&&!auto_tournament)
				alert(usr,"An Tournament is currently taking place, please try again later.")
				return
			switch(alert(usr,"Do you want to challenge [M]?","Arena Challenge","Yes","No"))
				if("Yes")
					switch(alert(M,"[src] is challanging you to a arena fight, Accept?","Arena Challenge","Yes","No"))
						if("Yes")
							if(arena_battle_on)
								alert(usr,"An arena battle is taking place at the moment, try again later.")
								return
							if(M.dead)
								alert(usr,"You cannot accept while dead.")
								return
							for(var/mob/C in players) C << "<font color=#66FFFF>Arena Information:<font color=white> [usr] has challenged [M] to an Arena battle!"
							src.opponent = "[M]"
							M.opponent = "[src]"
							arena_contenders.Add(src,M)
							src.previous_loc=usr.loc
							src.last_z=usr.z
							M.previous_loc=M.loc
							M.last_z=M.z
							src.loc = locate(8,36,1)
							M.loc = locate(64,6,1)
							src.safe=0
							M.safe=0
							src.arenab = 1
							M.arenab = 1
							M.grav=0
							M.grav_on=0
							src.grav=0
							src.grav_on=0
							src.safe=0
							M.safe=0
							arena_battle_on = 1
						if("No")
							GiveMedal("Rejected",src)
							src<< "[M] has declined from your challenge"