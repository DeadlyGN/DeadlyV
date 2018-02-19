mob/learn
	verb/Chou_Kamehameha(mob/M in oview(6))
		set category = "Techniques"
		var/ki_damage = round(usr.ki/rand(2,6))
		var/ki_cost = round(usr.ki / 3)
		if(!M||usr.buku) return
		if(M.z == usr.z)
			if(M.dead||M.safe||M.dead||M.tourny||usr.dead||usr.safe||usr.monkey) return
			if(usr.doing)
				usr<< "<font size = -1><B>You can only do one thing at a time!"
				return
			else
				if(usr.ki_lock)
					usr<< "<font size = -1>Cannot use this Technique at this time"
					return
				else
					if(usr.ki >= ki_cost)
						usr.doing ++
						usr<< "<font size = -1><B>You beging to charge up <font color = yellow> Chou-Kamehameha!<font>"
						usr.overlays += usr.chou_kamehameha_charge
						usr.frozen = 1
						sleep(30)
						if(M)
							if(!M||M.safe||M.dead||M.tourny)
								src.frozen=0
								return
							if(M.z == usr.z)
								usr.overlays -= usr.chou_kamehameha_charge
								view(6) << "<font size = -1><B>[usr.name] throws a <font color = #FF7E00> Chou-Kamehameha</font><B> at [M.name]!"
								missile('Chou Kamehameha.dmi', usr, M)
								usr.ki -= ki_cost
								sleep(14)
								if(M)
									if(!M||M.safe||M.dead||M.tourny)
										src.frozen=0
										return
									if(M.z == usr.z)
										if(M.absorbing)
											if(ki_damage > M.powerlevel_max) M.Damage(ki_damage*2)
											else
												view(6) << "<font size = -1><B>[M.name] Absorbs the energy from [usr.name]'s <font color = #FF7E00> Chou-Kamehameha!"
												M << "<font size = -1><B>You managed to Absorb [ki_damage] worth of power from that attack!"
												M.powerlevel += round(ki_damage/2)
												M.ki += round(ki_damage/2)
												if(M.powerlevel>=M.powerlevel_max*2500) M.powerlevel=0
												if(M.ki>=M.ki_max*2500) M.ki=0
										else M.Damage(ki_damage)
										M.SmallKiDeathCheck()
										if(usr.doing) usr.doing --
										usr.frozen = 0
										return
		usr<< "<font size = -1><B>Your target is gone! Where did they go?!"
		usr.overlays -= usr.chou_kamehameha_charge
		if(usr.doing) usr.doing --
		usr.frozen = 0