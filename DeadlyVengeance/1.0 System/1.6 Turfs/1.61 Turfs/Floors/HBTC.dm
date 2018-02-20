mob/var/HBTC = 0
turf/Gravity/
	Floor_HBTC
		icon = 'Floors.dmi'
		name = ""
		icon_state = "HBTC"
		Enter(mob/PC/M)
			if(ismob(M))
				if(prob(45)||(M.buku&&prob(35))) return ..()
				M.fatigue += round((rand(1,5)*(M.level/25))*(M.fatigue_max/M.fatigue))
				if(usr.powerlevel_max >= 5000000)
					if(prob(40))
						M << "You struggle a bit because of the gravity..."
						M.Damage((rand(10000,1000000)))
					if(prob(17))
						M << "You train here without a problem"
					M.Gain_Exp(rand(60,120000),"HBTC")
					M.Tired_KO()
					M.HBTC_DIE()
				if(usr.powerlevel_max >= 1000000 && usr.powerlevel_max <= 5000000)
					if(prob(15))
						M << "You do a high flying kick with little effort."
					if(prob(12))
						M << "You begin to sweat."
						M.fatigue += round(rand(2,3)*(M.level/22))
						M.Damage((rand(1,7500)))
					M.Gain_Exp(rand(150,90000),"HBTC")
					M.Tired_KO()
					M.HBTC_DIE()
				if(usr.powerlevel_max < 1000000 && usr.powerlevel_max >= 250000)
					if(prob(9))
						M << "You practice your punches and kicks with no problem"
					if(prob(16))
						M << "You feel strained while training in this room."
						M.Damage((rand(1,12500)))
					M.Gain_Exp(rand(50,90000),"HBTC")
					M.Tired_KO()
					M.HBTC_DIE()
				if(usr.powerlevel_max > 75000 && usr.powerlevel_max <= 250000)
					if(prob(8))
						M << "You do flying kicks in the air, feeling extremely strained.."
						M.fatigue += round(rand(2,3)*(M.level/17.5))
						M.Damage((rand(1,4500)))
					if(M.powerlevel > 0)
						M << "You collapse to the floor screaming...."
						M.Damage((rand(150,2200)))
						M.Gain_Exp(rand(32,74600),"HBTC")
					else
						M.Tired_KO()
						M.HBTC_DIE()
						M << "The gravity of this room overpowers you and you die."
			return ..()
mob/proc/HBTC_DIE()
	if(src.powerlevel <= 0)
		players << "<font color=#FF9900><b>Training Information:</font> \white [src] went Insane in the Hyperbolic Time Chamber!"
		src.Power_Redefine()
		src.Follower_Check()
		src.Basic_Death_vars()
		src.loc = locate(55,6,8)
		src.sight &= ~BLIND
		src.overlays += halo
		src.deaths += 1