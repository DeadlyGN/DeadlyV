obj/charger/icon = 'DeathBall Charge.dmi'
mob/learn
	verb/Death_Ball(mob/M in oview(7))
		set category = "Techniques"
		var/sb_damage = src.powerlevel * 0.25
		for(var/area/house/S in view(4,M))
			if(S in oview(7))
				src<< "You're in a Safe Zone!"
				return
		if(src.monkey)
			src<< "You cannot use this technique at the moment"
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
		if(sb_damage < 0) sb_damage = 100
		if(src.charging) return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.karma == "Good")
			src<< "You must Have Hatred and Evil in your heart to use the Deathball technique"
			return
		if(src.rage > 0)
			src<< "You must be Calm to use the Death Ball technique"
			return
		if(sb_damage <= src.powerlevel)
			src<< "<font size = -1><B>You begin to concentrait your enegry into a Death Ball!"
			src.frozen = 1
			if(!src.doing) src.doing ++
			src.Icon_State("spirit bomb")
			src.overlays += small_death_ball
			src.charging = 1
			sleep(15)
			for(var/mob/PC/M2 in view(6))
				if(M2 == src||M2 == M||(M2.type != /mob/PC)) continue
				switch(alert(src,"Allow people to donate power to your death ball?","","Yes","No"))
					if("Yes")
						switch(alert(M2,"Donate power to [src.name]'s death ball?","","Yes","No"))
							if("Yes")
								var/donate = input(M2,"How much do you wish to Donate?")as num
								if(donate >= M2.powerlevel) donate = M2.powerlevel-1
								if(donate > 1)
									sb_damage += donate
									missile(new/obj/charger, M2, src)
									M2.Damage(donate)
						continue
			while(src.charging)
				if(!M||M.safe||M.dead||M.tourny)
					src.doing=0
					src.frozen=0
					src.charging = 0
					return
				switch(alert(src,"Continue Charging the death ball?","","Yes","No"))
					if("Yes")
						for(var/mob/PC/M2 in view(6))
							if(M2 == src||M2 == M||M2.type != /mob/PC)continue
							switch(alert(src,"Allow people to donate power to your death ball?","","Yes","No"))
								if("Yes")
									switch(alert(M2,"Donate power to [src.name]'s death ball?","","Yes","No"))
										if("Yes")
											var/donate = input(M2,"How much do you wish to Donate?")as num
											if(donate >= M2.powerlevel) donate = M2.powerlevel-1
											if(donate>1)
												sb_damage += donate
												missile(new/obj/charger, M2, src)
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
								missile(new/obj/charger, T, src)
								sb_damage += src.powerlevel_max * 0.05
					else
						src.overlays -= small_death_ball
						if(!M||M.safe||M.dead||M.tourny)
							src.doing=0
							src.frozen=0
							return
						src.overlays += big_death_ball
						src.charging = 0
						sleep(16)
						src<< "<font size = -1><B>Your Death Ball is complete!"
						sleep(15)
						src.overlays -= big_death_ball
						src.Icon_State("")
						if(!M||M.safe||M.dead||M.tourny)
							src.doing=0
							src.frozen=0
							return
						missile(new/obj/Techniques/Overlays/Death_Ball_Center, src, M)
						src.frozen = 0
						if(src.doing) src.doing --
						if(M.karma == "Good")
							M.Damage(sb_damage)
							M.BigKiDeathCheck(src)
						else view(6) << "\red [src]'s Death Ball didn't seem to have effected [M]"