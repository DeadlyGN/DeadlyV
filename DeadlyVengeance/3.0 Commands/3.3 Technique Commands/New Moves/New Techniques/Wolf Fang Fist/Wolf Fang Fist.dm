mob/var/learn_wolf_fang_fist = 0
mob/var/wolf_fang_fist = 'Wolf Fang Fist.dmi'
mob/learn
	verb/Wolf(mob/M in oview(6))
		set category = "Techniques"
		src.afk_time = 0
		if(!M)return
		var/ki_damage = round(src.powerlevel / rand(45,60))
		var/ki_absorbed = round(M.ki_shield_strength - ki_damage)
		var/ki_cost = (src.ki_max / 10)
		if(ki_damage <= 0) ki_damage = 0
		if(M.ki_shield_strength == 0) ki_damage = round(src.powerlevel / rand(15,30))
		if(ki_absorbed <= 0) ki_absorbed = 0
		if(src.doing||src.buku||src.dual_training)
			src<< "You're already doing something!"
			return
		if(src.ki_lock)
			src<< "Cannot use this Technique at this time"
			return
		if(M.safe||M.dead||src.dead||M.tourny||Contenders.Find(M)||Contenders.Find(src)) return
		if(M.type == /mob/PC)
			if(src.ki >= ki_cost)
				if(!src.doing) src.doing ++
				src<< "You begin to charge up <font color = Silver>Wolf Fang Fist!<font>"
				src.overlays += src.wolf_fang_fist
				src.frozen = 1
				sleep(30)
				if(!M)return
				if(M.z == src.z)
					src.overlays -= src.wolf_fang_fist
					if(!M||M.safe||M.dead||M.tourny)
						src.doing=0
						src.frozen=0
						return
					missile('Wolf Fang Fist.dmi', src, M)
					src.ki -= ki_cost
					sleep(14)
					if(!M)return
					if(M.z == src.z)
						if(M.safe||M.dead||M.tourny||Contenders.Find(M)||Contenders.Find(src))
							if(src.doing) src.doing --
							src.frozen=0
							return
						if(M.ki_shield)
							if(ki_absorbed >= 1)
								src<< "<font color = #00C3ED>[M] Ki Shield takes [round(ki_absorbed)] damage!"
								M << "<font color = #00C3ED>Your Ki Shield takes [round(ki_absorbed)] worth of power from that attack!"
								M.Damage(round(ki_absorbed))
								M.ki_shield_strength -= round(ki_damage)
						else
							M.Damage(round(ki_damage))
							M << "\red [src]'s Wolf Fang Fist hits you for [round(ki_damage)] damage!"
							src<<"\red Your Wolf Fang Fist hits [M] for [round(ki_damage)] damage!"
						spawn(5) if(src.doing) src.doing --
						src.frozen = 0
						M.SmallKiDeathCheck(src)
						return
				src.overlays -= src.wolf_fang_fist
				src<< "[M] is gone! Where did they go?!"
				spawn(5) if(src.doing) src.doing --
				src.frozen = 0
			else src<< "You do not have enough Ki!"
		else
			if(src.ki >= ki_cost)
				if(!src.doing) src.doing ++
				src<< "You begin to charge up <font color = gray>Wolf Fang Fist!<font>"
				src.overlays += src.wolf_fang_fist
				src.frozen = 1
				sleep(30)
				src.overlays -= src.wolf_fang_fist
				if(!M)return
				if(M.z == src.z)
					if(!M||M.safe||M.dead||M.tourny)
						src.doing=0
						src.frozen=0
						return
					missile('Wolf Fang Fist.dmi', src, M)
					src.ki -= ki_cost
					sleep(14)
					if(!M)return
					if(M.z == src.z)
						M.Damage(round(ki_damage))
						spawn(5) if(src.doing) src.doing --
						M.SmallKiDeathCheck(src)
						src.frozen = 0
						return