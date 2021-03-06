obj/charger2/icon = 'VanishingBallEnergy.dmi'
mob/var/charging1 = 0
mob/learn
	verb/Vanishing_Ball(mob/M in oview(6))
		set category = "Techniques"
		var/vb_damage = ((src.ki * 0.95) + (src.ki_skill * src.level))
		for(var/area/house/S in view(4))
			if(S in oview(6))
				src<< "You're in a Safe Zone!"
				return
		if(usr.monkey)
			usr<< "You cannot use this technique at the moment"
			return
		if(!M.pk)
			usr<< "[M] Must be a combatant to engage in combat with players!"
			return
		if(!M||M.safe||M.dead||M.tourny)
			src<< "A force stops you from attacking [M]"
			return
		if(!usr.pk)
			usr<< "You must be a combatant to engage in combat with players!"
			return
		if(src.safe||src.dead)
			src<< "You're currently safe and cannot attack."
			return
		if(vb_damage < 0) vb_damage = 100
		if(src.charging1) return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.karma == "Good")
			src<< "You must pure hatred to use the Vanishing Ball technique"
			return
		if(src.rage > 0)
			src<< "You must be Calm to use the Vanishing Ball technique"
			return
		if(vb_damage <= src.powerlevel)
			src<< "<font size = -1><B>You begin to concentrait your enegry into a Vanishing Ball!"
			src.frozen = 1
			if(!src.doing) src.doing ++
			src.Icon_State("vanishing ball")
			src.overlays += small_vanishing_ball
			src.charging1 = 1
			sleep(11)
			for(var/mob/PC/M2 in view(6))
				if(M2 == src||M2 == M||(M2.type != /mob/PC)) continue
				switch(alert(src,"Allow people to donate power to your vanishing ball?","","Yes","No"))
					if("Yes")
						switch(alert(M2,"Donate power to [src.name]'s vanashing ball?","","Yes","No"))
							if("Yes")
								var/donate = input(M2,"How much do you wish to Donate?")as num
								if(donate >= M2.powerlevel) donate = M2.powerlevel-1
								if(donate > 1)
									vb_damage += donate
									missile(new/obj/charger2, M2, src)
									M2.Damage(donate)
						continue
			while(src.charging)
				if(!M||M.safe||M.dead||M.tourny)
					src.doing=0
					src.frozen=0
					src.charging = 0
					return
				switch(alert(src,"Continue Charging the vanishing ball?","","Yes","No"))
					if("Yes")
						for(var/mob/PC/M2 in view(6))
							if(M2 == src||M2 == M||M2.type != /mob/PC)continue
							switch(alert(src,"Allow people to donate power to your vanashing ball?","","Yes","No"))
								if("Yes")
									switch(alert(M2,"Donate power to [src.name]'s vanashing ball?","","Yes","No"))
										if("Yes")
											var/donate = input(M2,"How much do you wish to Donate?")as num
											if(donate >= M2.powerlevel) donate = M2.powerlevel-1
											if(donate>1)
												vb_damage += donate
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
								vb_damage += src.ki_max * 0.05
					else
						if(!M)return
						src.overlays -= small_vanishing_ball
						src.overlays += big_vanishing_ball
						src.charging1 = 0
						sleep(14)
						if(!M)return
						src<< "<font size = -1><B>Your Vanishing Ball is complete!"
						sleep(15)
						src.overlays -= big_vanishing_ball
						if(!M||M.safe||M.dead||M.tourny)
							src.doing=0
							src.frozen=0
							return
						missile(new/obj/techs/Overlays/Vanishing_Ball_Center, src, M)
						src.Icon_State("")
						src.frozen = 0
						if(src.doing) src.doing --
						if(M.karma == "Evil")
							M.Damage(vb_damage)
							M.BigKiDeathCheck(src)
						else view(6) << "\red [src]'s Vanishing Ball didn't seem to have effected [M]"