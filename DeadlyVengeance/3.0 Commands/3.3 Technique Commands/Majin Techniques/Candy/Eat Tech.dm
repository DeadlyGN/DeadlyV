mob/learn/Majin
	verb/Candy_Ray(mob/M in oview(1))
		set category = "Combat"
		if(!M||!ismob(M)||M.maker||M.owner||src.buku) return
		if(istype(M,/mob/Saga/))
			del M
			src<<"You cannot eat Sagas!"
			src.afk_time = 0
			return
		else
			if(istype(M,/mob/PC/) && M.client && usr.pabsorbs>=usr.pkills/5)
				usr<<"You can't infect any more players! You need <font color=blue>[5-round((usr.pkills/5)-usr.pabsorbs)]</font color> more player kills!";return
			else if(istype(M,/mob/Monster/)&&usr.infect_kill>=usr.kills/35)
				usr<<"You can't infect any more NPCs! You need <font color=blue>[35-round((usr.kills/35)-usr.infect_kill)]</font color> more kills!"; return
		if(src.doing)
			src<< "You're doing something already!"
			return
		if(M.race == "Android")
			src<< "<font color=blue>Error: </font>[M] is completely mechanical, you cannot infect them!"
			return
		if(src.dead || M.dead || src.safe || M.safe)
			src<< "A force stops you from attacking [M]"
			return
		if(!M.pk)
			src<< "They're not a Combatant!"
			return
		if(!src.pk)
			src<< "You're not a Combatant!"
			return
		if(M.tourny||src.tourny)
			src<<"You cannot infect in a tournament"
			return
		if(M.arenab||src.arenab)
			src<<"You cannot absorb inside of a arena!"
			return
		if(!M.KO && M.powerlevel > 0)
			src<< "They must be knocked out first!"
			return
		if(M.KO)
			if(M.key) src.pabsorbs++
			src.doing ++
			sleep(3)
			if(M)
				view(6)<<"[src]: Candy Ray!"
				missile(new/obj/Candy_Beam, src, M)
				sleep(10)
				if(!M)return
				var/obj/Equipment/Candy_Obj/O=new
				O.name = "[M.name] Candy"
				O.loc = M.loc
				if(M.powerlevel_max>=(src.powerlevel_max*100))
					src<<"[M] is too powerful for you to absorb!"
					del O
					return
				if(prob(80))
					if(!M) return
					if(M.key)
						usr.pabsorbs++
						if(M.powerlevel_max/(62+usr.pabsorbs) > usr.powerlevel_max) {O.powerlevel_bonus += usr.powerlevel_max}
						else {O.powerlevel_bonus += round(M.powerlevel_max/(62+usr.pabsorbs))}
						M<<"<font color=red>You have lost [M.powerlevel_max/(74+usr.pabsorbs)] powerlevel."
						M.powerlevel_max -= M.powerlevel_max/(74+usr.pabsorbs)
						if(M.ki_max/(62+usr.pabsorbs) > usr.ki_max) {O.ki_bonus += usr.ki_max}
						else {O.ki_bonus += round(M.ki_max/(62+usr.pabsorbs))}
						M<<"<font color=red>You have lost [M.ki_max/(74+usr.pabsorbs)] ki."
						M.ki_max -= M.ki_max/(74+usr.pabsorbs)
						if(M.strength_max/(62+usr.pabsorbs) > usr.strength_max) {O.strength_bonus += usr.strength_max}
						else {O.strength_bonus += round(M.strength_max/(62+usr.pabsorbs))}
						M<<"<font color=red>You have lost [M.strength_max/(74+usr.pabsorbs)] strength."
						M.strength_max -= M.strength_max/(74+usr.pabsorbs)
						if(M.defence_max/(62+usr.pabsorbs) > usr.defence_max) {O.defence_bonus += usr.defence_max}
						else {O.defence_bonus += round(M.defence_max/(62+usr.pabsorbs))}
						M<<"<font color=red>You have lost [M.defence_max/(74+usr.pabsorbs)]defence."
						M.defence_max -= M.defence_max/(74+usr.pabsorbs)
					else
						if(M.powerlevel_max/(52+usr.eats) > usr.powerlevel_max) {O.powerlevel_bonus += usr.powerlevel_max}
						else {O.powerlevel_bonus += round(M.powerlevel_max/(52+usr.eats))}
						if(M.ki_max/(52+usr.eats) > usr.ki_max) {O.ki_bonus += usr.ki_max}
						else {O.ki_bonus += round(M.ki_max/(52+usr.eats))}
						if(M.strength_max/(52+usr.eats) > usr.strength_max) {O.strength_bonus += usr.strength_max}
						else {O.strength_bonus += round(M.strength_max/(52+usr.eats))}
						if(M.defence_max/(52+usr.eats) > usr.defence_max) {O.defence_bonus += usr.defence_max}
						else {O.defence_bonus += round(M.defence_max/(52+usr.eats))}
				else usr<<"You were unable to absorb anything from [M]."
				M.CandyDeathCheck(src)
				spawn(20) if(src.doing) src.doing --