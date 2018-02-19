mob/learn/
	verb
		Super_Dragon_Fist(mob/M in oview(6))
			set category = "Techniques"
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
				src<< "You're already doing something!"
				return
			if(M.safe||M.dead||M.tourny||M in Contenders||src.tourny||src in Contenders)
				src<< "A force stops you from attacking [M]"
				return
			if(src.safe||src.dead||src.tourny||src in Contenders)
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
			if(src.z>4){src<<"You seem to be unable to use this techinque in this area."; return;}
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
			var/ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 27)
			var/ki_cost = round(src.ki_max * 0.62)
			if(src.ki >= ki_cost)
				if(!src.doing)
					src.ki_lock = 1
					spawn(70) src.ki_lock = 0
					if(!src.doing) src.doing ++
					src.ki -= ki_cost
					src.overlays += ray_charge
					view(6) << "<font color = blue>[src]:</font> Super Dragon"
					sleep(14)
					view(6) << "<font color = blue>[src]:</font> Fist!!!"
					sleep(15)
					view(6) << "<font color = blue>[src]:</font> HA!!!!!!"
					src.overlays -= ray_charge
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					spawn(150) src.ray_lock = 0
					if(!M||M.safe||M.dead||M.tourny||M in Contenders||src.tourny||src in Contenders) return
					missile('LB8.dmi', src, M)
					M.Damage(round(ki_damage))
					M << "\red [src.name]'s Super Dragon Fist plows into you"
					M.SmallKiDeathCheck(src)
					if(src.doing) src.doing --
					src.frozen = 0