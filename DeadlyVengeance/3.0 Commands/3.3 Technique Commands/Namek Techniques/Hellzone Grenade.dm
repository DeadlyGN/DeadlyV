obj/grenade/icon = 'Ki Attack.dmi'
mob/var/tmp/hzg_lock = 0
mob/learn/Namek
	verb
		Hellzone_Grenade(/*mob/M in oview(7)*/)
			set category = "Techniques"
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
				src<< "You're already doing something!"
				return
			if(src.safe||src.dead)
				src<< "You're currently safe and cannot attack."
				return
			/*if(!M||M.safe||M.dead||M.tourny)
				src<< "[M] is currently safe and cannot be attack."
				return
			if(!M.pk)
				src<< "[M] Must be a combatant to engage in combat with players!"
				return*/
			if(src.wrapped)
				src<< "Your ki has been contained in the goo!"
				return
			if(src.ki_lock)
				src<< "Cannot use this Technique at this time"
				return
			if(src.hzg_lock)
				src<< "You're recovering from your last blast..."
				return
			if(!src.pk)
				src<< "You're not a Combatant!"
				return
			/*for(var/area/house/S in view(4,M))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6,M))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/King_Kai/D in view(6,M))
				src<< "They're in a Safe Zone!"
				return*/
			var/ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.ki_max * 0.50)
			var/ki_cost = src.ki_max
			if(src.ki >= ki_cost)
				if(!src.doing)
					var/list/l=list()
					for(var/mob/M in view())
						if(istype(M,/mob/AI/)||!M.pk||M.dead||M.safe) continue
						if(usr==M) continue
						l.Add(M)
					if(!l.len) return
					src.ki_lock = 1
					spawn(10) src.ki_lock = 0
					if(!src.doing) src.doing ++
					//src.ki -= ki_cost
					view(6) << "<font color = white>[src]:</font> Hell..."
					sleep(16)
					view(6) << "<font color = white>[src]:</font> ZONE..."
					sleep(15)
					view(6) << "<font color = white>[src]:</font> GRENADE!!!"
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					var/dam=round((ki_damage)/l.len)
					for(var/mob/M in l)
						if(!src.ki||!M) continue
						spawn()
							for(var/turf/T in view(M,4))
								var/chance = roll(1,4)
								if(chance == 3) missile(new/obj/grenade, T, M)
							M.Damage(dam)
							usr.ki-=dam
							M.BigKiDeathCheck(src)
						sleep(1)
					l=null
					/*src.ki_lock = 1
					spawn(10) src.ki_lock = 0
					if(!src.doing) src.doing ++
					src.ki -= ki_cost
					view(6) << "<font color = white>[src]:</font> Hell..."
					sleep(16)
					view(6) << "<font color = white>[src]:</font> ZONE..."
					sleep(15)
					view(6) << "<font color = white>[src]:</font> GRENADE!!!"
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					if(!M||M.safe||M.dead||M.tourny) return
					for(var/turf/T in view(src,8))
						var/chance = roll(1,8)
						if(chance == 6) missile(new/obj/grenade, T, M)
					if(prob(M.dodge))
						src<< "\red [M] has avoided some of the blasts."
						M << "<font color=lime>You avoided some of the damage!"
						var/ki_damage = round(((src.ki_skill / src.ki_skill_max) * src.level) + src.powerlevel_max * 0.04)
						M.Damage(H.ki_damage)
					else M.Damage(H.ki_damage)
					M.BigKiDeathCheck(src)*/
					src.hzg_lock = 1
					spawn(150) src.hzg_lock = 0
			src.afk_time = 0