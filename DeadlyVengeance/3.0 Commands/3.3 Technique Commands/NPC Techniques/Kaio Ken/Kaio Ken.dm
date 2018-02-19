mob/var/
 kaioken = 0
 learn_kaioken = 0
mob/learn
	verb/Kaioken()
		set category = "Techniques"
		if(src.dead)
			src<< "You cannot src Kaioken whilst dead!"
			return
		if(src.rest)
			src<< "You stop resting"
			if(src.doing) src.doing --
			src.rest = 0
			src.Icon_State("")
			src.frozen = 0
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're busy doing something!"
			return
		if(src.monkey)
			src<< "\blue Error: \font You cannot Transform whilst oozaru"
			return
		if(src.chest_implant || src.head_implant || src.arms_implant || src.legs_implant)
			src<< "Your Circuitry cannot handle the stress of Kaioken!"
			return
		if(src.race != "Namek" || src.race != "Majin" || !src.mystic)
			if(src.form!="")
				src<< "Your body cannot handle the stress of Kaioken!"
				return
		var/kaioken_bonus = input("What is the level of your Kaioken? (50 is Maximum)") as num | null
		if(src.dead)
			src<< "You cannot src Kaioken whilst dead!"
			return
		if(src.buku)
			src<< "You cannot use Kaioken whilst Flying!"
			return
		if(src.monkey)
			src<< "\blue Error: \font You cannot Transform whilst oozaru"
			return
		if(src.KO)return
		if(!kaioken_bonus)
			if(src.kaioken)
				src<< "You relax your Kaioken state"
				src.underlays -= kaio_aura
				src.aura_on = 1
				call(src,"Aura")()
				src.kaioken = 0
				src.Power_Redefine()
			else src<< "You aren't in a kaioken state"
			return
		if(src.kaioken)
			src<< "You're already using Kaioken. Reset it by Entering 0"
			return
		var/kaioken_limit = 50
		if(src.race == "Majin" || src.race == "Namek" || src.race == "Bio-Android" || src.race == "Android" && src.form==""|| src.race == "Tuffle" && src.form=="")
			kaioken_limit = 100
		if(kaioken_bonus < 0)
			src<< "You cannot enter a negative value!"
			return
		if(kaioken_bonus > kaioken_limit)
			if(src.monkey)
				src<< "\blue Error: \font You cannot Transform whilst oozaru"
				return
			view(6) << "<font color = red>[src]'s collapses from the strain of Kaioken!"
			src.underlays -= kaio_aura
			src.kaioken = 0
			src.sight |= BLIND
			src.Power_Redefine()
			sleep(100)
			src.sight &= ~BLIND
			return
		else
			if(kaioken_bonus == kaioken_limit)
				if(src.monkey)
					src<< "\blue Error: \font You cannot Transform whilst oozaru"
					return
				if(src.race != "Namek" || src.race != "Majin" || !src.mystic)
					if(src.form!="")
						src<< "Your body cannot handle the stress of Kaioken!"
						return
				view(5) << "<B><font color = white>[src]:</font> \red Super Kaioken!"
				src.powerlevel += round(src.powerlevel_max * kaioken_bonus / 10)
				if(src.race == "Majin" || src.race == "Namek" || src.race == "Bio-Android") src.speed -= 1.6
				else src.speed --
				src.strength += src.strength_max * 2.5
				src.overlays -= src.aura
				src.underlays += kaio_aura
				src.kaioken = 1
				src.Kaio_Strain()
			else
				if(kaioken_bonus >= 1)
					if(src.monkey)
						src<< "\blue Error: \font You cannot Transform whilst oozaru"
						return
					if(src.race != "Namek" || src.race != "Majin" || !src.mystic)
						if(src.form!="")
							src<< "Your body cannot handle the stress of Kaioken!"
							return
					view(5) << "<font size = -1><B><font color = white>[src]:</font> \red Kaioken times [kaioken_bonus]!"
					src.powerlevel += round(src.powerlevel_max * kaioken_bonus / 10)
					if(src.race == "Majin" || src.race == "Namek" || src.race == "Bio-Android" || src.race == "Android" ||src.race == "Tuffle") src.speed -= 1.6
					else src.speed --
					src.overlays -= src.aura
					src.underlays += kaio_aura
					src.strength += src.strength_max * 2
					src.kaioken = 1
					src.Kaio_Strain()
		src.afk_time = 0