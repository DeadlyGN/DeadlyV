obj/charger2/icon = 'Spirit Bomb Energy.dmi'
mob/var/charging = 0
mob/learn
	verb/Spirit_Bomb(mob/M in oview(7))
		set category = "Techniques"
		var/sb_damage = ((src.ki * 0.25) + (src.ki_skill * src.level))
		for(var/area/house/S in view(4,M))
			src<< "You're in a Safe Zone!"
			return
		if(src.monkey)
			src<< "You cannot use this technique at the moment"
			return
		if(!M.pk)
			src<< "[M] Must be a combatant to engage in combat with players!"
			return
		if(!M||M.safe||M.dead||M.tourny)
			src<< "A force stops you from attacking [M]"
			return
		if(!src.pk)
			src<< "You must be a combatant to engage in combat with players!"
			return
		if(src.safe||src.dead)
			src<< "You're currently safe and cannot attack."
			return
		if(sb_damage < 0)sb_damage = 100
		if(src.charging)return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.karma == "Evil")
			src<< "You must be pure of heart to use the Spirit Bomb technique"
			return
		if(src.rage > 0)
			src<< "You must be calm to use the Spirit Bomb technique"
			return
		if(sb_damage <= src.powerlevel)
			src<< "<font size = -1><B>You begin to concentrait your enegry into a Spirit Bomb!"
			src.frozen = 1
			if(!src.doing) src.doing ++
			src.Icon_State("spirit bomb")
			src.overlays += small_spirit_bomb
			src.charging = 1
			sleep(15)
			for(var/mob/PC/M2 in view(6))
				if(M2 == src||M2 == M||(M2.type != /mob/PC)) continue
				switch(alert(src,"Allow people to donate power to your spirit bomb?","","Yes","No"))
					if("Yes")
						switch(alert(M2,"Donate power to [src.name]'s Spirit Bomb?","","Yes","No"))
							if("Yes")
								var/donate = input(M2,"How much do you wish to Donate?")as num
								if(donate >= M2.powerlevel) donate = M2.powerlevel-1
								if(donate > 1)
									sb_damage += donate
									missile(new/obj/charger2, M2, src)
									M2.Damage(donate)
						continue
			while(src.charging)
				if(!M||M.safe||M.dead||M.tourny)
					src.doing=0
					src.frozen=0
					src.charging = 0
					return
				switch(alert(src,"Continue Charging the Spirit Bomb?","","Yes","No"))
					if("Yes")
						for(var/mob/PC/M2 in view(6))
							if(M2 == src||M2 == M||M2.type != /mob/PC)continue
							switch(alert(src,"Allow people to donate power to your Spirit Bomb?","","Yes","No"))
								if("Yes")
									switch(alert(M2,"Donate power to [src.name]'s Spirit Bomb?","","Yes","No"))
										if("Yes")
											var/donate = input(M2,"How much do you wish to Donate?")as num
											if(donate >= M2.powerlevel) donate = M2.powerlevel-1
											if(donate>1)
												sb_damage += donate
												missile(new/obj/charger2, M2, src)
												M2.Damage(donate)
									if(!M||M.safe||M.dead||M.tourny)
										src.doing=0
										src.frozen=0
										src.charging = 0
										return
									continue
						for(var/turf/T in view(src,8))
							var/chance = roll(1,8)
							if(chance == 6)
								missile(new/obj/charger2, T, src)
								sb_damage += src.ki_max * 0.05
					else
						if(!M)return
						src.overlays -= small_spirit_bomb
						src.overlays += big_spirit_bomb
						src.charging = 0
						sleep(16)
						if(!M)return
						src<< "<font size = -1><B>Your Spirit Bomb is complete!"
						sleep(15)
						src.overlays -= big_spirit_bomb
						if(!M||M.safe||M.dead||M.tourny)
							src.doing=0
							src.frozen=0
							return
						missile(new/obj/techs/Overlays/Spirit_Bomb_Center, src, M)
						src.Icon_State("")
						src.frozen = 0
						if(src.doing) src.doing --
						if(M.karma == "Evil")
							M.Damage(sb_damage)
							M.BigKiDeathCheck(src)
						else view(6) << "\red [src]'s Spirit Bomb didn't seem to have effected [M]"
				sleep(25)