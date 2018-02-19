obj/Rball/icon = 'Revenge Ball Charge.dmi'
mob/var/tmp/Rball_lock = 0
mob/learn/
	verb
		Revenge_Ball(mob/M in oview(7))
			set category = "Techniques"
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
				src<< "You're already doing something!"
				return
			if(src.safe||src.dead)
				src<< "You're currently safe and cannot attack."
				return
			if(!M||M.safe||M.dead||M.tourny)
				src<< "[M] is currently safe and cannot be attack."
				return
			if(!M.pk)
				src<< "[M] Must be a combatant to engage in combat with players!"
				return
			if(src.wrapped)
				src<< "Your ki has been contained in the goo!"
				return
			if(src.ki_lock)
				src<< "Cannot use this Technique at this time"
				return
			if(src.Rball_lock)
				src<< "You're recovering from your last blast..."
				return
			if(!src.pk)
				src<< "You're not a Combatant!"
				return
			if(src.monkey)
				src<<"You cannot use this whilist in oozaru."
				return
			for(var/area/house/S in view(4,M))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6,M))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/King_Kai/D in view(6,M))
				src<< "They're in a Safe Zone!"
				return
			var/ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 0.45)
			var/ki_cost = src.ki_max
			if(src.ki >= ki_cost)
				if(!src.doing)
					src.ki_lock = 1
					spawn(10) src.ki_lock = 0
					src.frozen = 1
					if(!src.doing) src.doing ++
					src.ki -= ki_cost
					src.overlays += ball_charge
					src.Icon_State("spirit bomb")
					view(6) << "<font color = white>[src]:</font> Revenge..."
					sleep(16)
					view(6) << "<font color = white>[src]:</font> Ball..."
					sleep(16)
					view(6) << "<font color = white>[src]:</font> HAA!!!"
					src.overlays -= ball_charge
					src.Icon_State("")
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					if(!M||M.safe||M.dead||M.tourny)
						src.doing=0
						src.frozen=0
						return
					for(var/turf/T in view(src,8))
						var/chance = roll(1,8)
						if(chance)missile('Revege Ball.dmi', src, M)
					if(prob(M.dodge))
						src<< "\red [M] has avoided some of the damage."
						M << "<font color=lime>You avoided some of the damage!"
						ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 0.30)
					M.Damage(ki_damage)
					M.BigKiDeathCheck(src)
					src.Rball_lock = 1
					spawn(150) src.Rball_lock = 0
			src.afk_time = 0
/obj/Techniques/Overlays/R_Ball
	icon = 'Revenge Ball Charge.dmi'
	density = 0
	layer = 990
	New()
		pixel_y = 50
		pixel_x = 0
mob
	var
		ball_charge = new/obj/Techniques/Overlays/R_Ball