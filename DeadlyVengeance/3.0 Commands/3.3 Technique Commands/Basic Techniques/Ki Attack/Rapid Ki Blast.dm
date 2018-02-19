mob/learn
	verb
		Rapid_Ki_Blast(mob/M in oview(7))
			set category = "Techniques"
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
				src<< "You're already doing something!"
				return
			if(src.safe||src.dead)
				src<< "You're currently safe and cannot attack."
				return
			if(!M||M.safe||M.dead||M.tourny)
				src<< "A force stops you from attacking [M]"
				return
			if(src.wrapped)
				src<< "Your ki has been contained in the goo!"
				return
			if(src.ki_lock)
				src<< "Cannot use this Technique at this time"
				return
			if(!M.pk)
				src<< "[M] Must be a combatant to engage in combat with players!"
				return
			if(!src.pk)
				src<< "You're not a Combatant!"
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
			src.afk_time = 0
			var/ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 0.23)
			var/ki_cost = round(src.ki_max * 0.43)
			if(src.level >= 5000)ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 0.33)
			if(src.level >= 7500)ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 0.43)
			if(src.level >= 12500)ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 0.55)
			if(src.ki >= ki_cost)
				if(!src.doing)
					src.ki_lock = 1
					spawn(10) src.ki_lock = 0
					if(!src.doing) src.doing ++
					src.ki -= ki_cost
					src.overlays += kamehameha_charge
					view(6) << "<font color = white>[src]:</font> Rapid Ki Blast..."
					sleep(15)
					view(6) << "<font color = white>[src]:</font> HA!!!"
					src.overlays -= kamehameha_charge
					missile(new/obj/tech/Ki_Blast, src, M)
					M.Damage(round(ki_damage)/6)
					sleep(13)
					view(6) << "<font color = white>[src]:</font> HA!!!"
					missile(new/obj/tech/Ki_Blast, src, M)
					M.Damage(round(ki_damage)/6)
					sleep(13)
					view(6) << "<font color = white>[src]:</font> HA!!!"
					missile(new/obj/tech/Ki_Blast, src, M)
					M.Damage(round(ki_damage)/6)
					sleep(13)
					view(6) << "<font color = white>[src]:</font> HA!!!"
					missile(new/obj/tech/Ki_Blast, src, M)
					M.Damage(round(ki_damage)/6)
					sleep(13)
					view(6) << "<font color = white>[src]:</font> HA!!!"
					missile(new/obj/tech/Ki_Blast, src, M)
					M.Damage(round(ki_damage)/6)
					sleep(13)
					view(6) << "<font color = white>[src]:</font> HA!!!"
					missile(new/obj/tech/Ki_Blast, src, M)
					M.Damage(round(ki_damage)/6)
					sleep(13)
					view(6) << "<font color = white>[src]:</font> HA!!!"
					missile(new/obj/tech/Ki_Blast, src, M)
					M.Damage(round(ki_damage)/6)
					M.SmallKiDeathCheck(src)
					if(src.doing) src.doing --
					src.frozen = 0