mob/var/it_blocked = 0
mob/learn
	verb/Instant_Transmission()
		set category = "Techniques"
		var/ki_cost = rand(60,100)
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(src.grav||src.grav_on)
			src<< "<font color=#FF9900><b>Training Information:</font> \white You cannot IT whilst gravity training!"
			return
		if(src.safe||src.dead)
			src<< "Get out of the safe zone!"
			return
		if(src.going_boom||src.stone_form||src.donut_wrapped||src.grav_popup||src.grav_delay||src.regen_dead||src.KO) return
		if(src.it_lock)
			src<< "Cannot use this Technique at this time"
			return
		if(src.ki_lock)
			src<< "Cannot use this Technique at this time"
			return
		if(src.in_guild)
			switch(alert(usr,"EC Or Guild Member?","Instant Transmission","EC","Guild Member"))
				if("Guild Member")
					src.Guild_IT()
				if("EC")
					if(src.ki > ki_cost)
						var/code = input("Which Energy Code do you wish to IT to?")as num
						if(lentext(code) > 7)
							src<< "EC too Long!"
							return
						if(code == src.energy_code)
							src<< "That's your EC!"
							return
						if(code)
							for(var/mob/M in world)
								if(M.energy_code == code)
									if(!M.it_blocked||!M.hidden)
										if(M.z==6 && src.z!=6)
											src<<"They're not in your dimension!"
											return
										if(src.z==6 && M.z!=6)
											src<<"They're not in your dimension!"
											return
										if(M.z==3 && src.z!=3)
											src<<"They're not of your time!"
											return
										if(src.z==3 && M.z!=3)
											src<<"They're not of your time!"
											return
										if(M.z<1)return
										if(src.dead)
											src<<"You cannot use this technique while dead."
											return
										if(M.dead)
											src<<"[M] appears to be dead."
											return
										if(src.jailed)
											src<<"Not while jailed!"
											return
										if(M.z>4&&M.client)return
										for(var/area/house/S in view(1,M))
											for(var/obj/O in src.contents)
												if(istype(O,/obj/Dragonballs))
													if(src.client) src << "You cannot enter a sz with a dragonball!"
													return
										if(M.client) if(src.jailed||M.jailed||src.tourny||M.tourny)return
										src.ki -= ki_cost
										src<< "<B>Locking onto [M]..."
										sleep(15)
										src<< "<B>[M] Found!"
										src.Icon_State("IT")
										sleep(6)
										src.Icon_State("")
										if(!M)return
										if(src.going_boom)
											src<<"Not while you're suiciding."
											return
										src.x = M:x
										src.y = M:y-1
										src.z = M:z
										view(6) << "<B>[src] appears from nowhere!"
										src.Icon_State("IT")
										sleep(6)
										src.Icon_State("")
										src.afk_time = 0
									else src<< "You cannot seem to get a clear lock on [M]'s energy signal..."
									break
					else
						src<< "You do not have enough Ki!"
		else
			if(src.ki > ki_cost)
				var/code = input("Which Energy Code do you wish to IT to?")as num
				if(lentext(code) > 7)
					src<< "EC too Long!"
					return
				if(code == src.energy_code)
					src<< "That's your EC!"
					return
				if(code)
					for(var/mob/M in world)
						if(M.energy_code == code)
							if(!M.it_blocked&&!M.hidden)
								if(M.z==6 && src.z!=6)
									src<<"They're not in your dimension!"
									return
								if(src.z==6 && M.z!=6)
									src<<"They're not in your dimension!"
									return
								if(M.z==3 && src.z!=3)
									src<<"They're not of your time!"
									return
								if(src.z==3 && M.z!=3)
									src<<"They're not of your time!"
									return
								if(src.jailed)
									src<<"Not while jailed!"
									return
								if(M.z<1)return
								if(src.dead)
									src<<"You cannot use this technique while dead."
									return
								if(M.dead)
									src<<"You cannot seem to find [M]."
									return
								if(M.z>4&&M.client)return
								if(src.jailed||M.jailed||src.tourny||M.tourny)return
								if(src.going_boom)
									src<<"Not while you're suiciding."
									return
								for(var/area/house/S in view(1,M))
									for(var/obj/O in src.contents)
										if(istype(O,/obj/Dragonballs))
											if(src.client) src << "You cannot enter a sz with a dragonball!"
											return
								src.ki -= ki_cost
								src<< "<B>Locking onto [M]..."
								sleep(15)
								src<< "<B>[M] Found!"
								src.Icon_State("IT")
								sleep(6)
								src.Icon_State("")
								if(src.going_boom)
									src<<"Not while you're suiciding."
									return
								if(!M)return
								src.x = M:x
								src.y = M:y-1
								src.z = M:z
								view(6) << "<B>[src] appears from nowhere!"
								src.Icon_State("IT")
								sleep(6)
								src.Icon_State("")
								src.afk_time = 0
							else src<< "You cannot seem to get a clear lock on [M]'s energy signal..."
							break
			else src<< "You do not have enough Ki!"
mob/proc/Guild_IT()
	var/list/Menu = new()
	for(var/mob/M in players) if(M!=src&&M.in_guild&&M.guild_name == src.guild_name&&!M.hidden&&!M.tourny&&M.z<4) Menu.Add(M)
	var/mob/M = input("IT to whom?","Guild Instant Transmission") as null | anything in Menu
	if(!M||M.z<1||M.z>4||M.tourny)return
	if((M.z==6 && src.z!=6)||(src.z==6 && M.z!=6))
		src<<"They're not in your dimension!"
		return
	if((M.z==3 && src.z!=3)||(src.z==3 && M.z!=3))
		src<<"They're not of your time!"
		return
	if(src.dead)
		src<<"You cannot use this technique while dead."
		return
	if(M.dead)
		src<<"You cannot seem to find [M]."
		return
	if(src.jailed)
		src<<"Not while jailed!"
		return
	for(var/area/house/S in view(1,M))
		for(var/obj/O in src.contents)
			if(istype(O,/obj/Dragonballs))
				if(src.client) src << "You cannot enter a sz with a dragonball!"
				return
	if(src.going_boom)
		src<<"Not while you're suiciding."
		return
	if(M.client) if(src.jailed||M.jailed||src.tourny||M.tourny)return
	if(!src.it_lock||!M.it_lock||!src.dead||!M.dead)
		if(!M.it_blocked)
			src<< "<B>Locking onto [M]..."
			sleep(15)
			src<< "<B>[M] Found!"
			src.Icon_State("IT")
			sleep(6)
			src.Icon_State("")
			if(src.going_boom)
				src<<"Not while you're suiciding."
				return
			src.x = M:x
			src.y = M:y-1
			src.z = M:z
			view(6) << "<font size=1><B>[src.name] appears from nowhere!"
			src.Icon_State("IT")
			spawn(6) src.Icon_State("")
		else src<< "You cannot seem to get a clear lock on [M]'s energy signal..."