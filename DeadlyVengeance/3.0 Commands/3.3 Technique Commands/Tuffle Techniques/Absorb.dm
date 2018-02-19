mob/var/infect_kill = 0
obj/Techniques/Tuffle/Absorb
	verb/Absorb(mob/M in get_step(usr,usr.dir))
		set category = "Combat"
		set name = "Infect"
		if(!M||!ismob(M)||M.maker||M.owner) return
		if(istype(M,/mob/Saga/))
			del M
			usr<<"You cannot infect Sagas!"
			usr.Gain_Kills(1)
			usr.afk_time = 0
			return
		else
			if(istype(M,/mob/PC/) && M.client && usr.pabsorbs>=usr.pkills/5)
				usr<<"You can't infect any more players! You need <font color=blue>[5-round((usr.pkills/5)-usr.pabsorbs)]</font color> more player kills!";return
			else if(istype(M,/mob/Monster/)&&usr.infect_kill>=usr.kills/35)
				usr<<"You can't infect any more NPCs! You need <font color=blue>[35-round((usr.kills/35)-usr.infect_kill)]</font color> more kills!"; return
		if(usr.doing)
			usr<< "You're doing something already!"
			return
		if(M.race == "Android")
			usr<< "<font color=blue>Error: </font>[M] is completely mechanical, you cannot infect them!"
			return
		if(usr.dead || M.dead || usr.safe || M.safe)
			usr<< "A force stops you from attacking [M]"
			return
		if(!M.pk)
			usr<< "They're not a Combatant!"
			return
		if(!usr.pk)
			usr<< "You're not a Combatant!"
			return
		if(M.tourny||usr.tourny)
			usr<<"You cannot infect in a tournament"
			return
		if(M.arenab||usr.arenab)
			usr<<"You cannot absorb inside of a arena!"
			return
		if(!M.KO && M.powerlevel > 0)
			usr<< "They must be knocked out first!"
			return
		else
			usr.doing ++
			usr.frozen = 1
			sleep(16)
			usr.Icon_State("")
			usr.frozen = 0
			if(usr.doing) usr.doing --
			if(M.powerlevel_max>=(usr.powerlevel_max*100))
				usr<<"[M] is too powerful for you to absorb!"
				M.Damage(M.powerlevel)
				M.AbsorbDeathCheck(usr)
				return
			if(prob(80))
				if(!M) return
				if(M.key)
					usr.pabsorbs++
					if(M.powerlevel_max/(52+usr.pabsorbs) > usr.powerlevel_max) {usr<<"<font color=aqua>You have gained [usr.powerlevel_max] powerlevel.";usr.powerlevel_max += usr.powerlevel_max}
					else {usr<<"<font color=aqua>You have gained [M.powerlevel_max/(52+usr.pabsorbs)] powerlevel.";usr.powerlevel_max += round(M.powerlevel_max/(52+usr.pabsorbs))}
					M<<"<font color=red>You have lost [M.powerlevel_max/(64+usr.pabsorbs)] powerlevel."
					M.powerlevel_max -= M.powerlevel_max/(64+usr.pabsorbs)
					if(M.ki_max/(52+usr.pabsorbs) > usr.ki_max) {usr<<"<font color=aqua>You have gained [usr.ki_max] ki.";usr.ki_max += usr.ki_max}
					else {usr<<"<font color=aqua>You have gained [M.ki_max/(52+usr.pabsorbs)] ki.";usr.ki_max += round(M.ki_max/(52+usr.pabsorbs))}
					M<<"<font color=red>You have lost [M.ki_max/(64+usr.pabsorbs)] ki."
					M.ki_max -= M.ki_max/(64+usr.pabsorbs)
					if(M.strength_max/(52+usr.pabsorbs) > usr.strength_max) {usr<<"<font color=aqua>You have gained [usr.strength_max] strength.";usr.strength_max += usr.strength_max}
					else {usr<<"<font color=aqua>You have gained [M.strength_max/(52+usr.pabsorbs)] strength.";usr.strength_max += round(M.strength_max/(52+usr.pabsorbs))}
					M<<"<font color=red>You have lost [M.strength_max/(64+usr.pabsorbs)] strength."
					M.strength_max -= M.strength_max/(64+usr.pabsorbs)
					if(M.defence_max/(52+usr.pabsorbs) > usr.defence_max) {usr<<"<font color=aqua>You have gained [usr.defence_max] defence.";usr.defence_max += usr.defence_max}
					else {usr<<"<font color=aqua>You have gained [M.defence_max/(52+usr.pabsorbs)] defence.";usr.defence_max += round(M.defence_max/(52+usr.pabsorbs))}
					M<<"<font color=red>You have lost [M.defence_max/(64+usr.pabsorbs)]defence."
					M.defence_max -= M.defence_max/(64+usr.pabsorbs)
				else
					if(M.powerlevel_max/(42+usr.infect_kill) > usr.powerlevel_max) {usr<<"<font color=aqua>You have gained [usr.powerlevel_max] powerlevel.";usr.powerlevel_max += usr.powerlevel_max}
					else {usr<<"<font color=aqua>You have gained [M.powerlevel_max/(52+usr.infect_kill)] powerlevel.";usr.powerlevel_max += round(M.powerlevel_max/(42+usr.infect_kill))}
					if(M.ki_max/(42+usr.infect_kill) > usr.ki_max) {usr<<"<font color=aqua>You have gained [usr.ki_max] ki.";usr.ki_max += usr.ki_max}
					else {usr<<"<font color=aqua>You have gained [M.ki_max/(52+usr.infect_kill)] ki.";usr.ki_max += round(M.ki_max/(42+usr.infect_kill))}
					if(M.strength_max/(42+usr.infect_kill) > usr.strength_max) {usr<<"<font color=aqua>You have gained [usr.strength_max] strength.";usr.strength_max += usr.strength_max}
					else {usr<<"<font color=aqua>You have gained [M.strength_max/(52+usr.infect_kill)] strength.";usr.strength_max += round(M.strength_max/(42+usr.infect_kill))}
					if(M.defence_max/(42+usr.infect_kill) > usr.defence_max) {usr<<"<font color=aqua>You have gained [usr.defence_max] defence.";usr.defence_max += usr.defence_max}
					else {usr<<"<font color=aqua>You have gained [M.defence_max/(52+usr.infect_kill)] defence.";usr.defence_max += round(M.defence_max/(42+usr.infect_kill))}
			else usr<<"You were unable to absorb anything from [M]."
			M.Damage(M.powerlevel)
			M.AbsorbDeathCheck(usr)
			usr.infect_kill ++
			usr.afk_time = 0