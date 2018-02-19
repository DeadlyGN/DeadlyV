mob/learn/
	verb
		Darkness_Engulf(mob/M in oview(6))
			set category = "Techniques"
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
				src<< "You're already doing something!"
				return
			if(M.safe||M.dead||M.tourny||Contenders.Find(M)||Contenders.Find(src))
				src<< "A force stops you from attacking [M]"
				return
			if(src.safe||src.dead)
				src<< "You're currently safe and cannot attack."
				return
			if(src.wrapped)
				src<< "Your ki has been contained in the goo!"
				return
			if(src.ki_lock)
				src<< "Cannot use this Technique at this time"
				return
			if(src.disk_lock)
				src<< "You're recovering from your last blast..."
				return
			if(!M.pk)
				src<< "[M] Must be a combatant to engage in combat with players!"
				return
			if(!src.pk)
				src<< "You're not a Combatant!"
				return
			for(var/area/house/S in view(4))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6,M))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/King_Kai/D in view(6,M))
				src<< "They're in a Safe Zone!"
				return
			src.afk_time = 0
			var/ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 15)
			var/ki_cost = round(src.ki_max * 0.95)
			if(src.ki >= ki_cost)
				if(!src.doing)
					M.powerlevel /= 2
					src.ki_lock = 1
					spawn(70) src.ki_lock = 0
					if(!src.doing) src.doing ++
					src.ki -= ki_cost
					src.overlays += ray_charge
					view(6) << "<font color = blue>[src]:</font> You dare attack me???"
					sleep(14)
					view(6) << "<font color = blue>[src]:</font> Darkness..."
					sleep(15)
					view(6) << "<font color = blue>[src]:</font> Engulf!!!"
					src.overlays -= ray_charge
					if(M.safe||M.dead||M.tourny||Contenders.Find(M)||Contenders.Find(src))
						src.doing=0
						src.frozen=0
						return
					missile(big_Darkness_Engulf, src, M)
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					spawn(150) src.ray_lock = 0
					if(prob(7))
						M.powerlevel = 0
						M << "\blue [usr.name]'s Darkness Engulf Blows through your Chest!"
					else
						M.Damage(round(ki_damage))
						M << "\red [usr.name]'s Darkness Engulf plows into you"
					M.SmallKiDeathCheck(src)
					if(src.doing) src.doing --
					src.frozen = 0
/*obj/charger/icon = 'Final Revenger Charge.dmi'
mob/learn
	verb/Super_Spirit_Bomb(mob/M in oview(6))
		set category = "Techniques"
		var/sb_damage = src.powerlevel * 0.25
		for(var/area/house/S in view(4))
			if(S in oview(6))
				usr<< "You're in a Safe Zone!"
				return
		if(usr.monkey)
			usr<< "You cannot use this technique at the moment"
			return
		if(M.safe||M.dead||M.tourny||Contenders.Find(M)||Contenders.Find(src))
			src<< "A force stops you from attacking [M]"
			return
		if(!M.pk)
			usr<< "[M] Must be a combatant to engage in combat with players!"
			return
		if(!usr.pk)
			usr<< "You must be a combatant to engage in combat with players!"
			return
		if(src.safe||src.dead)
			src<< "You're currently safe and cannot attack."
			return
		if(sb_damage < 0) sb_damage = 100
		if(src.charging) return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(sb_damage <= src.powerlevel)
			src<< "<font size = -1><B>You begin to concentrait your enegry into a Super Spirit Bomb!"
			src.frozen = 1
			if(!src.doing) src.doing ++
			src.charging = 1
			src.overlays += big_Final_Revenger
			sleep(15)
			for(var/mob/PC/M2 in view(6))
				if(M2 == src||M2 == M||(M2.type != /mob/PC)continue
				switch(alert(src,"Allow people to donate power to your omega blaster?","""Yes","No")))
					if("Yes")
						switch(alert(M2,"Donate power to [src.name]'s omega blaster?","""Yes","No")))
							if("Yes")
								var/donate = input(M2,"How much do you wish to Donate?")as num
								if(donate >= M2.powerlevel) donate = M2.powerlevel-1
								if(donate > 1)
									sb_damage += donate
									missile(new/obj/charger3, M2, src)
									M2.Damage(donate)
					continue
			while(src.charging)
				if(!M||M.safe||M.dead||M.tourny)
					src.doing=0
					src.frozen=0
					src.charging = 0
					return
				switch(alert(src,"Continue Charging the super Spirit Bomb?","""Yes","No")))
					if("Yes")
						for(var/mob/PC/M2 in view(6))
							if(M2 == src||M2 == M||M2.type != /mob/PC)continue
							switch(alert(src,"Allow people to donate power to your omega blaster?","""Yes","No")))
								if(!M||M.safe||M.dead||M.tourny)
									src.doing=0
									src.frozen=0
									src.charging = 0
									return
								if("Yes")
									switch(alert(M2,"Donate power to [src.name]'s omega blaster?","""Yes","No")))
										if(!M||M.safe||M.dead||M.tourny)
											src.doing=0
											src.frozen=0
											src.charging = 0
											return
										if("Yes")
											var/donate = input(M2,"How much do you wish to Donate?")as num
											if(donate >= M2.powerlevel) donate = M2.powerlevel-1
											if(donate>1)
												sb_damage += donate
												missile(new/obj/charger3, M2, src)
												M2.Damage(donate)
								continue
						for(var/turf/T in view(src,8))
							var/chance = roll(1,8)
							if(chance == 6)
								missile(new/obj/charger, T, src)
								sb_damage += src.powerlevel_max * 0.05
					else
						src.charging = 0
						sleep(14)
						src.overlays -= big_Final_Revenger
						if(!M)return
						src<< "<font size = -1><B>Your Super Spirit Bomb is complete!"
						sleep(15)
						missile(new/obj/Techniques/Overlays/Final_Revenger_Center, src, M)
						src.Icon_State("")
						src.frozen = 0
					if(src.doing) src.doing --
						M.Damage(sb_damage)
						M.BigKiDeathCheck(src)
				sleep(25)*/