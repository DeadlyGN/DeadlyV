obj/charger1/icon = 'Omega Blaster Charge.dmi'
mob/learn
	verb/Omega_Blaster(mob/M in oview(6))
		set category = "Techniques"
		var/sb_damage = src.powerlevel * 0.25
		for(var/area/house/S in view(4))
			if(S in oview(6))
				src<< "You're in a Safe Zone!"
				return
		if(src.monkey)
			usr<< "You cannot use this technique at the moment"
			return
		if(!M||M.safe||M.dead||M.tourny)
			src<< "A force stops you from attacking [M]"
			return
		if(!M.pk)
			src<< "[M] Must be a combatant to engage in combat with players!"
			return
		if(!src.pk)
			src<< "You must be a combatant to engage in combat with players!"
			return
		if(src.safe||src.dead)
			src<< "You're currently safe and cannot attack."
			return
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<<"You're currently doing something else."
			return
		if(sb_damage < 0)sb_damage = 100
		if(src.charging)return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(sb_damage <= src.powerlevel)
			src<< "<font size = -1><B>You begin to concentrait your enegry into a Omega Blaster!"
			sleep(15)
			src.charging = 1
			for(var/mob/PC/M2 in view(6))
				if(M2 == src||M2 == M||(M2.type != /mob/PC)) continue
				switch(alert(src,"Allow people to donate power to your omega blaster?","","Yes","No"))
					if("Yes")
						switch(alert(M2,"Donate power to [src.name]'s omega blaster?","","Yes","No"))
							if("Yes")
								var/donate = input(M2,"How much do you wish to Donate?")as num
								if(donate >= M2.powerlevel) donate = M2.powerlevel-1
								if(donate > 1)
									sb_damage += donate
									missile(new/obj/charger1, M2, src)
									M2.Damage(donate)
						continue
			while(src.charging)
				switch(alert(src,"Continue Charging the omega blaster?","","Yes","No"))
					if("Yes")
						for(var/mob/PC/M2 in view(6))
							if(M2 == src||M2 == M||M2.type != /mob/PC) continue
							switch(alert(src,"Allow people to donate power to your omega blaster?","","Yes","No"))
								if("Yes")
									switch(alert(M2,"Donate power to [src.name]'s omega blaster?","","Yes","No"))
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
								missile(new/obj/charger1, T, src)
								sb_damage += src.powerlevel_max * 0.05
					else
						if(!M)return
						src.charging = 0
						sleep(14)
						if(!M)return
						src<< "<font size = -1><B>Your Omega Blaster is complete!"
						if(!M||M.safe||M.dead||M.tourny)
							src.doing=0
							src.frozen=0
							return
						sleep(15)
						missile(new/obj/Techniques/Overlays/Omega_Blaster_Center, src, M)
						src.Icon_State("")
						M.Damage(sb_damage)
						M.BigKiDeathCheck(src)
				sleep(25)