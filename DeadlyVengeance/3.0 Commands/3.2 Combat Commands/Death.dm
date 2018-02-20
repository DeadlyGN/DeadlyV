mob
	var
		combat_points = 0
		combat_points_max = 0
		witness_deaths = 0
		android_dead = 0
		tmp/deathdone = 0
		tmp/multikill = 0
		tmp/hasmultikill = 0
		killstreak = 0
		highestmulti = 0
		highestks = 0
mob
	proc
		Killstreak()
			killstreak++
			if(killstreak>highestks) highestks=killstreak
			if(killstreak<3) return
			switch(killstreak)
				if(3) players<<"<font size=2 color=gold>[src] has started a <font color=red>KILLING SPREE</font color=red>!!</font>"
				if(5) players<<"<font size=2 color=gold>[src] has gone <font color=red>BERSERK</font color=red>!!</font>"
				if(8) players<<"<font size=2 color=gold>[src] is in a <font color=red>FRENZY</font color=red>!!</font>"
				if(10) players<<"<font size=2 color=gold>[src] is on a <font color=red>RAMPAGE</font color=red>!!</font>"
				if(15) players<<"<font size=2 color=gold>[src] is <font color=red>UNSTOPABLE</font color=red>!!</font>"
				if(20) players<<"<font size=2 color=gold>[src] is <font color=red>UNKILLABLE</font color=red>!!</font>"
				if(25) players<<"<font size=2 color=gold>[src] is <font color=red>UNBELIEVABLE</font color=red>!!</font>"
			src<<"For achieving a killstreak of <font color=blue>[killstreak]</font color>, you've gained <font color=blue>[killstreak*7]</font color> levels."
			Level_Up(7*killstreak)
		MultiKill()
			hasmultikill ++
			multikill ++
			if(multikill>highestmulti) highestmulti=multikill
			spawn(150){ hasmultikill --; if(!hasmultikill){ multikill = 0 }; }
			if(multikill<2) return
			switch(multikill)
				if(2) players<<"<font size=2 color=red>DOUBLE-KILL!!</font>"
				if(3) players<<"<font size=2 color=red>TRIPLE-KILL!!</font>"
				if(4) players<<"<font size=2 color=red>QUADRA-KILL!!</font>"
				if(5) players<<"<font size=2 color=red>PENTA-KILL!!</font>"
				if(6) players<<"<font size=2 color=red>SECTA-KILL!!</font>"
				if(7) players<<"<font size=2 color=red>SEPTA-KILL!!</font>"
				if(8) players<<"<font size=2 color=red>OCTO-KILL!!</font>"
				if(9) players<<"<font size=2 color=red>NONU-KILL!!</font>"
				if(10) players<<"<font size=2 color=red>WHAT THE HELL?!</font>"
			src<<"For achieving a multikill of <font color=blue>[multikill]</font color>, you have recieved <font color=blue>[multikill*200]</font color> levels."
			Level_Up(multikill*200)
		Rage_Unleash()
			set background = 1
			if(race == "Saiyan" && chromosome=="Honour" && !gone_ssj)
				if(powerlevel_max >= 85000)
					if(kills+pkills >= 5)
						if(!gone_ssj)
							gone_ssj = 1
							for(var/mob/PC/M in view(6))
								if(M != src)
									M << "\white <I>[name] Stands there, their face twisted with Rage..."
									spawn(10) M<<"\white <I>[name] clentchs their fists. Veins protrude from their hands and forehead as the ground rumbles"
							src<< "\white <I>You feel an uncontrollable rage burning in you as you remember the people you have killed."
							sleep(16)
							src<< "\white <I>You clentch your fists. Veins protrude from your hands and forehead as the ground rumbles"
							Icon_State("enrage")
							sleep(16)
							view(6) << "\white [name]: I WILL FOREVER BE THE STRONGEST!"
							powerlevel = powerlevel_max
							contents += new/obj/Transform/Transform
							contents += new/obj/Transform/Revert
							spawn() Saiyan_Trans()
							Explode(new /Effect/BasicBoom(loc,1,3))
		Basic_Death_vars()
			src.killstreak = 0
			src.absorbing = 0
			src.rest = 0
			src.frozen = 0
			src.boxing = 0
			src.meditation = 0
			src.meditate = 0
			src.doing = 0
			src.attacker = null
			src.beingattacked = 0
			src.Icon_State("")
			src.density = 1
			src.attack_lock = 0
			src.ki_lock = 0
			src.dead = 1
			src.tourny = 0
			src.KO = 0
			src.rage = 0
			src.sight &= ~BLIND
			src.buku = 0
			src.charging = 0
			src.it_lock = 0
			src.it_blocked = 0
			src.dual_training = 0
			src.dualtrain = 0
			src.selftraining = 0
			if(src.form=="Inverted") src.Invert_Revert()
			src.kaioken = 0
			src.grav_delay = 0
			src.grav_on = 0
			src.grav = 0
			src.regen_dead = 0
			src.overlays-=small_death_ball
			src.overlays-=godly_blast
			src.overlays-=small_spirit_bomb
			src.overlays-=small_Final_Revenger
			src.overlays-=small_vanishing_ball
			src.overlays-=small_death_ball
			src.overlays-=ely_red_elec
			src.overlays-=ely_blue_elec
			src.overlays-=big_blue_elec
			src.overlays-=small_blue_elec
			src.overlays-=big_red_elec
			src.overlays-=small_red_elec
			src.overlays-=mystic_elec
			src.overlays-=demon_elec
			src.overlays-=demon_elec_2
			src.overlays-=android_elec
			src.overlays-=ultimate_elec
			src.overlays-=big_purple_elec
			src.overlays-=small_purple_elec
			src.overlays-=small_white_elec
			src.overlays-=namek_elec
			src.overlays-=neoblue
			src.overlays-=neored
			src.overlays-=neogreen
			src.overlays-=neopurple
			src.overlays-=neoyellow
			src.overlays-=rodhead
			src.Follower_Check()
		Drop_dbs()
			for(var/obj/Dragonballs/O in contents) O.loc = loc
			e_db_1 = 0
			e_db_2 = 0
			e_db_3 = 0
			e_db_4 = 0
			e_db_5 = 0
			e_db_6 = 0
			e_db_7 = 0
			n_db_1 = 0
			n_db_2 = 0
			n_db_3 = 0
			n_db_4 = 0
			n_db_5 = 0
			n_db_6 = 0
			n_db_7 = 0
			bs_db_1 = 0
			bs_db_2 = 0
			bs_db_3 = 0
			bs_db_4 = 0
			bs_db_5 = 0
			bs_db_6 = 0
			bs_db_7 = 0
			as_db_1 = 0
			as_db_2 = 0
			as_db_3 = 0
			as_db_4 = 0
			as_db_5 = 0
			as_db_6 = 0
			as_db_7 = 0
		Follower_Check()
			for(var/mob/Monster/Clone_Simulator_NPC/W in Pets) if(W.maker == src) del W
			clones2 = 0
			for(var/mob/Monster/B in Pets) if(B.owner == src) del B
			cell_jrs = 0
			splits = 0
		Guild_Check(mob/M)
			..()
			if(guildb)
				for(var/mob/PC/N in players) if(opponent=="[N]") M=N
				for(var/mob/C in players) if(C.guild_name == guild_name)
					C << "<FONT color = green>Guild Battle Information:<FONT color = White> [src] was defeated by [M]!"
				guildb = 0
				M.guildb = 0
				src<< "<Font color=white>Your base power has been obtained."
				M << "<Font color=white>Your base power has been obtained."
				if(guildbrank >= M.guildbrank)
					M.guildbrank ++
					M << "<font color = #BB0EDA>Guild Information:</font> Your Guild Battle Rank has gone up!"
				deathdone = 1
		Arena_Check(mob/M)
			..()
			if(arenab)
				for(var/mob/PC/C in players) C << "<FONT color = #66FFFF>Arena Information:<FONT color = White> [src] was defeated by [M]!"
				for(var/mob/PC/N in arena_contenders+players) if(opponent == "[N]"){ M = N; break; }
				arena_battle_on = 0
				M.arenab = 0
				arenab = 0
				M.arena_wins ++
				M.Arena_winsM()
				arena_losses ++
				zenni /= 2
				var/zenniup = zenni
				M.zenni += zenniup
				M << "\white You gained [zenniup] Zenni!"
				src<< "\white You lost [zenniup] Zenni..."
				loc = previous_loc
				z=last_z
				if(M.previous_loc)
					M.loc = M.previous_loc
					M.z = M.last_z
				M.previous_loc=null
				previous_loc=null
				deathdone = 1
				opponent = null
				M.opponent = null
				spawn(4)
					if(dead)
						overlays -= halo
						overlays -= halo
						overlays -= halo
						overlays -= halo
						dead = 0
						overlays -= halo
						overlays -= halo
						overlays -= halo
						overlays -= halo
						safe = 1
						loc = locate(23,215,9)
				arena_contenders=new()
			/*else
			if(tourny||src in Contenders||Contenders.Find(src)||M in Contenders||Contenders.Find(M))
				loc=usr.previous_loc
				z=last_z
				tourny = 0
				overlays -= halo
				overlays -= halo
				overlays -= halo
				overlays -= halo
				dead = 0
				overlays -= halo
				overlays -= halo
				overlays -= halo
				overlays -= halo
				safe=1
				deathdone = 1
				Contenders.Remove(src)
				previous_loc=null
				if(M.powerlevel<=M.powerlevel_max) M.FullHeal()
				FullHeal()
				return*/
 /***************\
|*****************|
|***MELEE DEATH***|
|*****************|
 \***************/
mob/proc/DeathCheck()
	for(var/area/house/S in view(0,src)) if(istype(S,/area/house/)) return
	if(!pk) return
	if(powerlevel <= 0 && pk && !safe) ..()
mob/Monster/DeathCheck(mob/PC/M)
	if(powerlevel <= 0)
		var/bonus_exp = tnl
		spawn()
		if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
		if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
		if(M.client) killer = M.name
		if(!owner&&!maker)
			M.Gain_Exp(bonus_exp,"Combat")
			M.zenni += zenni
			if(race=="Android")
				var/obj/Equipment/Micro_Chip/O = new
				O.icon = 'Micro Chip.dmi'
				O.loc = loc
			M << "\white Zenni +[zenni]"
			M << "\white EXP +[bonus_exp]"
			M.Gain_Kills(1)
		M.LooseK()
		for(var/mob/PC/B in players) if(owner == B) B.cell_jrs --
		for(var/mob/PC/S in players) if(maker == S) S.splits --
		switch(race)
			if("Green Saibaman") M.green_kills ++
			if("Blue Saibaman") M.blue_kills ++
			if("Red Saibaman") M.red_kills ++
			if("White Saibaman") M.white_kills ++
			if("Black Saibaman") M.black_kills ++
			if("Henchman") M.thug_kills ++
			if("CellJ") M.cell_jr_kills ++
			if("Namekian Warrior") M.namek_kills ++
		switch(name)
			if("{NPC} Brolly") M.brolly_kill ++
			if("{NPC} Yakon") M.threat_kill ++
			if("{NPC} Android 17") M.killed_17++
			if("{NPC} Android 18") M.killed_18++
			if("{NPC} Cell") M.killed_cell++
			if("{NPC} Vegito") M.killed_vegito ++
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
mob/Saga/DeathCheck(mob/PC/M)
	if(powerlevel <= 0)
		M.Saga_Decision(name)
		var/bonus_exp = tnl
		spawn()
			if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
			if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
			M.Gain_Exp(bonus_exp,"Combat")
		M.zenni += zenni
		if(race=="Android")
			var/obj/Equipment/Micro_Chip/O = new
			O.icon = 'Micro Chip.dmi'
			O.loc = loc
		switch(name)
			if("{Saga} Raditz") M.raditz_wins++
			if("{Saga} Vegeta") M.vegeta_wins++
			if("{Saga} Nappa") M.nappa_wins++
			if("{Saga} Burter") M.burter_wins++
			if("{Saga} Captain Ginyu") M.captain_ginyu_wins++
			if("{Saga} Guldo") M.guldo_wins++
			if("{Saga} Jeice") M.jeice_wins++
			if("{Saga} Recoom") M.recoom_wins++
			if("{Saga} Frieza") M.frieza_wins++
			if("{Saga} King Cold") M.king_cold_wins++
			if("{Saga} Android 16") M.android_16_wins++
			if("{Saga} Android 17") M.android_17_wins++
			if("{Saga} Android 18") M.android_18_wins++
			if("{Saga} Cell") M.cell_wins++
			if("{Saga} Perfect Cell") M.perfect_cell_wins++
			if("{Saga} Majin Buu") M.majin_buu_wins++
			if("{Saga} Kid Buu") M.kid_buu_wins++
			if("{Saga} Goku") M.goku_wins++
			if("{Saga} Piccolo") M.piccolo_wins++
			if("{Saga} Yamcha") M.yamcha_wins++
			if("{Saga} Tien") M.tien_wins++
			if("{Saga} Krillin") M.krillin_wins++
			if("{Saga} Gohan") M.gohan_wins++
			if("{Saga} Choutzu") M.choutzu_wins++
			if("{Saga} SSJ Goku") M.SSJ_goku_wins++
			if("{Saga} Trunks") M.trunks_wins++
			if("{Saga} Gotenks") M.gotenks_wins++
			if("{Saga} Vegito") M.vegito_wins++
			if("{Saga} Bebi") M.bebi_wins++
			if("{Saga} Gold Ape Bebi") M.g_ape_wins++
			if("{Saga} Bebi Vegeta") M.bebi_vegeta_wins++
			if("{Saga} SSJ4 Goku") M.ssj4_goku_wins++
			if("{Saga} Goten") M.goten_wins++
			if("{Saga} Majuub") M.majuub_wins++
		spawn()
			M << "\white Zenni +[zenni]"
			M << "\white EXP +[bonus_exp]"
			M.Gain_Kills(1)
			M.LooseK()
			M.Good_Sagas_fin()
			M.Evil_Sagas_fin()
			M.GT_Sagas_fin()
		if(M.frieza_quest2_start)
			switch(name)
				if("{Saga} Vegeta") M.questnamekvegeta_kill = 1
				if("{Saga} Gohan") M.questnamekgohan_kill = 1
				if("{Saga} Goku")
					if(M.questnamekgoku_kill<2) M.questnamekgoku_kill ++
				if("{Saga} SSJ Goku") if(M.questnamekgoku_kill >= 2) M.questnamekgoku_kill ++
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
mob/PC/DeathCheck(mob/M)
	if(powerlevel <= 0)
		Guild_Check(M)
		Arena_Check(M)
		Follower_Check()
		if(deathdone)
			deathdone = 0
			return
		Drop_dbs()
		if(istype(M,/mob/Monster/Simulator_NPC)) spawn(15) del(M)
		if(level >= M.level / 4)
			if(M.combat_points < M.combat_points_max)
				M.combat_points += 50
				M << "Your Combat Points have increased by: \red 50"
		if(M.karma == karma) M.karma_rating -= 1
		else M.karma_rating ++
		if(M.karma_rating < 0)
			if(M.karma == "Good")
				M << "<I>You feel an Evil inside of you begin to awaken..."
				M.karma = "Evil"
				M.karma_rating = 0
			else
				M << "<I>You feel the Good inside of you begin to awaken..."
				M.karma = "Good"
				M.karma_rating = 0
		if(race == "Android")
			spawn(1) dead = 0
			android_dead = 1
			overlays -= small_death_ball
			overlays -= big_death_ball
			loc = locate(162,7,8)
			players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
			android_dead = 1
			spawn(300) android_dead = 0
		else
			if(race == "Majin")
				if(!regen_dead)
					Icon_State("Dead")
					frozen = 1
					if(!doing) doing ++
					density = 1
					attack_lock = 1
					ki_lock = 1
					dead = 0
					it_lock = 1
					regen_dead = 1
					Majin_Regenerate()
					kaioken = 0
					overlays -= small_death_ball
					overlays -= big_death_ball
					rage = 0
					sight &= ~BLIND
					return
				else
					loc = locate(55,6,8)
					overlays += halo
					src<< "Your body was completely Destroyed!"
					players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
			else
				loc = locate(55,6,8)
				overlays -= small_death_ball
				overlays -= big_death_ball
				overlays += halo
				players << "<FONT color = red>Battle Information:<FONT color = White> [src] got destroyed by [M]!"
		Basic_Death_vars()
		sight &= ~BLIND
		deaths ++
		M.pkills ++
		Gokus()
		M.LooseK()
		M.MultiKill()
		M.Killstreak()
		for(var/mob/PC/M2 in view(8,src))
			if(!M2) continue
			if(M2.race == "Saiyan" || M2.race == "Half Saiyan")
				M2.witness_deaths ++
				M2.Watchdeath()
				spawn() M2.Rage_Unleash()
			if(M2 == M) continue
			M2 << "\red You feel your Rage Grow..."
			M2.rage += round(rand(20,50))
			if(M2.rage >= 100) M2.rage = 100
 /***************\
|*****************|
|*SMALL KI  DEATH*|
|*****************|
 \***************/
mob/proc/SmallKiDeathCheck()
	for(var/area/house/S in view(0,src)) if(istype(S,/area/house/)) return
	if(!pk) return
	if(powerlevel <= 0 && pk && !safe) ..()
mob/Monster/SmallKiDeathCheck(mob/PC/M)
	if(powerlevel <= 0)
		new/obj/techs/Overlays/Crater_Small(loc)
		var/bonus_exp = tnl
		if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
		if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
		if(M.client) killer = M.name
		if(!owner&&!maker)
			if(race=="Android")
				var/obj/Equipment/Micro_Chip/O = new
				O.icon = 'Micro Chip.dmi'
				O.loc = loc
			M.Gain_Exp(bonus_exp,"Combat")
			M.zenni += zenni
			M.Gain_Kills(1)
			M << "\white Zenni +[zenni]"
			M << "\white EXP +[bonus_exp]"
		for(var/mob/PC/B in players) if(owner == B) B.cell_jrs --
		for(var/mob/PC/S in players) if(maker == S) S.splits --
		switch(race)
			if("Green Saibaman") M.green_kills ++
			if("Blue Saibaman") M.blue_kills ++
			if("Red Saibaman") M.red_kills ++
			if("White Saibaman") M.white_kills ++
			if("Black Saibaman") M.black_kills ++
			if("Henchman") M.thug_kills ++
			if("CellJ") M.cell_jr_kills ++
			if("Namekian Warrior") M.namek_kills ++
		switch(name)
			if("{NPC} Brolly") M.brolly_kill ++
			if("{NPC} Yakon") M.threat_kill ++
			if("{NPC} Android 17") M.killed_17++
			if("{NPC} Android 18") M.killed_18++
			if("{NPC} Cell") M.killed_cell++
			if("{NPC} Vegito") M.killed_vegito ++
		M.Gain_Kills(1)
		M.LooseK()
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
		..()
mob/Saga/SmallKiDeathCheck(mob/PC/M)
	if(powerlevel <= 0)
		M.Saga_Decision(name)
		if(race=="Android")
			var/obj/Equipment/Micro_Chip/O = new
			O.icon = 'Micro Chip.dmi'
			O.loc = loc
		var/bonus_exp = tnl
		if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
		if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
		M.Gain_Exp(bonus_exp,"Combat")
		M.zenni += zenni
		M.Gain_Kills(1)
		switch(name)
			if("{Saga} Raditz") M.raditz_wins++
			if("{Saga} Vegeta") M.vegeta_wins++
			if("{Saga} Nappa") M.nappa_wins++
			if("{Saga} Burter") M.burter_wins++
			if("{Saga} Captain Ginyu") M.captain_ginyu_wins++
			if("{Saga} Guldo") M.guldo_wins++
			if("{Saga} Jeice") M.jeice_wins++
			if("{Saga} Recoom") M.recoom_wins++
			if("{Saga} Frieza") M.frieza_wins++
			if("{Saga} King Cold") M.king_cold_wins++
			if("{Saga} Android 16") M.android_16_wins++
			if("{Saga} Android 17") M.android_17_wins++
			if("{Saga} Android 18") M.android_18_wins++
			if("{Saga} Cell") M.cell_wins++
			if("{Saga} Perfect Cell") M.perfect_cell_wins++
			if("{Saga} Majin Buu") M.majin_buu_wins++
			if("{Saga} Kid Buu") M.kid_buu_wins++
			if("{Saga} Goku") M.goku_wins++
			if("{Saga} Piccolo") M.piccolo_wins++
			if("{Saga} Yamcha") M.yamcha_wins++
			if("{Saga} Tien") M.tien_wins++
			if("{Saga} Krillin") M.krillin_wins++
			if("{Saga} Gohan") M.gohan_wins++
			if("{Saga} Choutzu") M.choutzu_wins++
			if("{Saga} SSJ Goku") M.SSJ_goku_wins++
			if("{Saga} Trunks") M.trunks_wins++
			if("{Saga} Gotenks") M.gotenks_wins++
			if("{Saga} Vegito") M.vegito_wins++
			if("{Saga} Bebi") M.bebi_wins++
			if("{Saga} Gold Ape Bebi") M.g_ape_wins++
			if("{Saga} Bebi Vegeta") M.bebi_vegeta_wins++
			if("{Saga} SSJ4 Goku") M.ssj4_goku_wins++
			if("{Saga} Goten") M.goten_wins++
			if("{Saga} Majuub") M.majuub_wins++
		M << "\white Zenni +[zenni]"
		M << "\white EXP +[bonus_exp]"
		M.LooseK()
		M.Good_Sagas_fin()
		M.Evil_Sagas_fin()
		M.GT_Sagas_fin()
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
		..()
mob/PC/SmallKiDeathCheck(mob/M)
	if(powerlevel <= 0)
		tourny = 0
		Guild_Check(M)
		Arena_Check(M)
		Follower_Check()
		if(deathdone)
			deathdone = 0
			return
		Drop_dbs()
		new/obj/techs/Overlays/Crater_Small(loc)
		if(level >= M.level / 4)
			if(M.combat_points < M.combat_points_max)
				M.combat_points += 50
				M << "Your Combat Points have increased by: \red 50"
		if(M.karma == karma) M.karma_rating -= 1
		else M.karma_rating ++
		if(M.karma_rating < 0)
			if(M.karma == "Good")
				M << "<I>You feel an Evil inside of you begin to awaken..."
				M.karma = "Evil"
				M.karma_rating = 0
			else
				M << "<I>You feel the Good inside of you begin to awaken..."
				M.karma = "Good"
				M.karma_rating = 0
		if(race == "Android")
			spawn(1) dead = 0
			overlays -= small_death_ball
			overlays -= big_death_ball
			loc = locate(162,7,8)
			players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
			android_dead = 1
			spawn(300) android_dead = 0
		else
			if(race == "Majin")
				if(!regen_dead)
					Icon_State("Dead")
					frozen = 1
					boxing = 0
					if(!doing) doing ++
					density = 1
					attack_lock = 1
					ki_lock = 1
					charging = 0
					dead = 0
					it_lock = 1
					regen_dead = 1
					powerlevel = 0
					Majin_Regenerate()
					kaioken = 0
					overlays -= small_death_ball
					overlays -= big_death_ball
					KO = 0
					rage = 0
					sight &= ~BLIND
					return
				else
					overlays -= small_death_ball
					overlays -= big_death_ball
					loc = locate(55,6,8)
					regen_dead = 0
					overlays += halo
					src<< "Your body was completely Destroyed!"
					players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
			else
				overlays -= small_death_ball
				overlays -= big_death_ball
				loc = locate(55,6,8)
				powerlevel = 50
				overlays += halo
				players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
		Basic_Death_vars()
		sight &= ~BLIND
		deaths ++
		M.pkills ++
		Gokus()
		M.LooseK()
		M.MultiKill()
		M.Killstreak()
		for(var/mob/PC/M2 in view(12))
			if(!M2) continue
			if(M2.race == "Saiyan" || M2.race == "Half Saiyan")
				M2.witness_deaths ++
				M2.Watchdeath()
				spawn() M2.Rage_Unleash()
			if(M2 == M) continue
			M2 << "\red You feel your Rage Grow..."
			M2.rage += round(rand(20,50))
			if(M2.rage >= 100) M2.rage = 100
 /***************\
|*****************|
|**BIG KI  DEATH**|
|*****************|
 \***************/
mob/proc/BigKiDeathCheck()
	for(var/area/house/S in view(0,src)) if(istype(S,/area/house/)) return
	if(!pk) return
	if(powerlevel <= 0 && pk && !safe)
		..()
mob/Monster/BigKiDeathCheck(mob/PC/M)
	if(powerlevel <= 0)
		new/obj/techs/Overlays/Crater_Center(loc)
		var/bonus_exp = tnl
		if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
		if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
		if(M.client) killer = M.name
		if(!owner&&!maker)
			if(race=="Android")
				var/obj/Equipment/Micro_Chip/O = new
				O.icon = 'Micro Chip.dmi'
				O.loc = loc
			M.Gain_Kills(1)
			M.Gain_Exp(bonus_exp,"Combat")
			M.zenni += zenni
			M << "\white Zenni +[zenni]"
			M << "\white EXP +[bonus_exp]"
		for(var/mob/PC/B in players) if(owner == B) B.cell_jrs --
		for(var/mob/PC/S in players) if(maker == S) S.splits --
		switch(race)
			if("Green Saibaman") M.green_kills ++
			if("Blue Saibaman") M.blue_kills ++
			if("Red Saibaman") M.red_kills ++
			if("White Saibaman") M.white_kills ++
			if("Black Saibaman") M.black_kills ++
			if("Henchman") M.thug_kills ++
			if("CellJ") M.cell_jr_kills ++
			if("Namekian Warrior") M.namek_kills ++
		switch(name)
			if("{NPC} Brolly") M.brolly_kill ++
			if("{NPC} Yakon") M.threat_kill ++
			if("{NPC} Android 17") M.killed_17++
			if("{NPC} Android 18") M.killed_18++
			if("{NPC} Cell") M.killed_cell++
			if("{NPC} Vegito") M.killed_vegito ++
			if("{NPC} Raditz") M.raditz_wins++
			if("{NPC} Vegeta") M.vegeta_wins++
		M.LooseK()
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
mob/Saga/BigKiDeathCheck(mob/PC/M)
	if(powerlevel <= 0)
		M.Saga_Decision(name)
		if(race=="Android"&&!owner&&!maker)
			var/obj/Equipment/Micro_Chip/O = new
			O.icon = 'Micro Chip.dmi'
			O.loc = loc
		var/bonus_exp = tnl
		if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
		if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
		M.Gain_Exp(bonus_exp,"Combat")
		M.zenni += zenni
		switch(name)
			if("{Saga} Raditz") M.raditz_wins++
			if("{Saga} Vegeta") M.vegeta_wins++
			if("{Saga} Nappa") M.nappa_wins++
			if("{Saga} Burter") M.burter_wins++
			if("{Saga} Captain Ginyu") M.captain_ginyu_wins++
			if("{Saga} Guldo") M.guldo_wins++
			if("{Saga} Jeice") M.jeice_wins++
			if("{Saga} Recoom") M.recoom_wins++
			if("{Saga} Frieza") M.frieza_wins++
			if("{Saga} King Cold") M.king_cold_wins++
			if("{Saga} Android 16") M.android_16_wins++
			if("{Saga} Android 17") M.android_17_wins++
			if("{Saga} Android 18") M.android_18_wins++
			if("{Saga} Cell") M.cell_wins++
			if("{Saga} Perfect Cell") M.perfect_cell_wins++
			if("{Saga} Majin Buu") M.majin_buu_wins++
			if("{Saga} Kid Buu") M.kid_buu_wins++
			if("{Saga} Goku") M.goku_wins++
			if("{Saga} Piccolo") M.piccolo_wins++
			if("{Saga} Yamcha") M.yamcha_wins++
			if("{Saga} Tien") M.tien_wins++
			if("{Saga} Krillin") M.krillin_wins++
			if("{Saga} Gohan") M.gohan_wins++
			if("{Saga} Choutzu") M.choutzu_wins++
			if("{Saga} SSJ Goku") M.SSJ_goku_wins++
			if("{Saga} Trunks") M.trunks_wins++
			if("{Saga} Gotenks") M.gotenks_wins++
			if("{Saga} Vegito") M.vegito_wins++
			if("{Saga} Bebi") M.bebi_wins++
			if("{Saga} Gold Ape Bebi") M.g_ape_wins++
			if("{Saga} Bebi Vegeta") M.bebi_vegeta_wins++
			if("{Saga} SSJ4 Goku") M.ssj4_goku_wins++
			if("{Saga} Goten") M.goten_wins++
			if("{Saga} Majuub") M.majuub_wins++
		M << "\white Zenni +[zenni]"
		M << "\white EXP +[bonus_exp]"
		M.Gain_Kills(1)
		M.LooseK()
		M.Good_Sagas_fin()
		M.Evil_Sagas_fin()
		M.GT_Sagas_fin()
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
mob/PC/BigKiDeathCheck(mob/M)
	if(powerlevel <= 0)
		tourny = 0
		new/obj/techs/Overlays/Crater_Center(loc)
		Guild_Check(M)
		Arena_Check(M)
		Follower_Check()
		if(deathdone)
			deathdone = 0
			return
		Drop_dbs()
		if(level >= M.level / 4)
			if(M.combat_points < M.combat_points_max)
				M.combat_points += 50
				M << "Your Combat Points have increased by: \red 50"
		if(M.karma == karma) M.karma_rating -= 1
		else M.karma_rating ++
		if(M.karma_rating < 0)
			if(M.karma == "Good")
				M.karma = "Evil"
				M << "<I>You feel an Evil inside of you begin to awaken..."
				M.karma_rating = 0
			else
				M.karma = "Good"
				M << "<I>You feel the Good inside of you begin to awaken..."
				M.karma_rating = 0
		if(race == "Android")
			overlays -= small_death_ball
			overlays -= big_death_ball
			loc = locate(162,7,8)
			spawn(1) dead = 0
			powerlevel = 50
			sight &= ~BLIND
			players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
			android_dead = 1
			spawn(300) android_dead = 0
		else
			if(race == "Majin")
				if(!regen_dead)
					Icon_State("Dead")
					frozen = 1
					boxing = 0
					if(!doing) doing ++
					density = 1
					attack_lock = 1
					overlays -= small_death_ball
					charging = 0
					overlays -= big_death_ball
					ki_lock = 1
					it_lock = 1
					regen_dead = 1
					dead = 0
					powerlevel = 0
					Majin_Regenerate()
					kaioken = 0
					KO = 0
					rage = 0
					sight &= ~BLIND
					return
				else
					loc = locate(55,6,8)
					powerlevel = 50
					overlays += halo
					src<< "Your body was completely Destroyed!"
					players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
			else
				overlays -= small_death_ball
				overlays -= big_death_ball
				loc = locate(55,6,8)
				powerlevel = 50
				overlays += halo
				players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of [M]!"
		Basic_Death_vars()
		sight &= ~BLIND
		deaths ++
		M.pkills ++
		Gokus()
		M.LooseK()
		M.MultiKill()
		M.Killstreak()
		for(var/mob/PC/M2 in view(12))
			if(!M2) continue
			if(M2.race == "Saiyan" || M2.race == "Half Saiyan")
				M2.witness_deaths ++
				M2.Watchdeath()
				spawn() M2.Rage_Unleash()
			if(M2 == M) continue
			M2 << "\red You feel your Rage Grow..."
			M2.rage += round(rand(20,50))
			if(M2.rage >= 100) M2.rage = 100
 /***************\
|*****************|
|**ABSORB  DEATH**|
|*****************|
 \***************/
mob/proc/AbsorbDeathCheck()
	for(var/area/house/S in view(0,src)) if(istype(S,/area/house/)) return
	if(!pk) return
	if(powerlevel <= 0 && pk && !safe) ..()
mob/Monster/AbsorbDeathCheck(mob/PC/M)
	if(powerlevel <= 0)
		new/obj/techs/Overlays/Crater_Center(loc)
		var/bonus_exp = tnl
		if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
		if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
		if(M.client) killer = M.name
		if(!owner&&!maker)
			M.Gain_Kills(1)
			M.Gain_Exp(bonus_exp,"Combat")
			M.zenni += zenni
			M << "\white Zenni +[zenni]"
			M << "\white EXP +[bonus_exp]"
		for(var/mob/PC/B in players) if(owner == B) B.cell_jrs --
		for(var/mob/PC/S in players) if(maker == S) S.splits --
		switch(race)
			if("Green Saibaman") M.green_kills ++
			if("Blue Saibaman") M.blue_kills ++
			if("Red Saibaman") M.red_kills ++
			if("White Saibaman") M.white_kills ++
			if("Black Saibaman") M.black_kills ++
			if("Henchman") M.thug_kills ++
			if("CellJ") M.cell_jr_kills ++
			if("Namekian Warrior") M.namek_kills ++
		switch(name)
			if("{NPC} Brolly") M.brolly_kill ++
			if("{NPC} Yakon") M.threat_kill ++
			if("{NPC} Android 17") M.killed_17++
			if("{NPC} Android 18") M.killed_18++
			if("{NPC} Cell") M.killed_cell++
			if("{NPC} Vegito") M.killed_vegito ++
		M.LooseK()
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
mob/Saga/AbsorbDeathCheck(mob/PC/M)
	if(powerlevel <= 0)
		M.Saga_Decision(name)
		var/bonus_exp = tnl
		if("minor_exp_buff" in M.buffs) bonus_exp *= 1.05
		if("exp_buff" in M.buffs) bonus_exp *= 1.25
		M.Gain_Exp(bonus_exp,"Combat")
		M.zenni += zenni
		switch(name)
			if("{Saga} Raditz") M.raditz_wins++
			if("{Saga} Vegeta") M.vegeta_wins++
			if("{Saga} Nappa") M.nappa_wins++
			if("{Saga} Burter") M.burter_wins++
			if("{Saga} Captain Ginyu") M.captain_ginyu_wins++
			if("{Saga} Guldo") M.guldo_wins++
			if("{Saga} Jeice") M.jeice_wins++
			if("{Saga} Recoom") M.recoom_wins++
			if("{Saga} Frieza") M.frieza_wins++
			if("{Saga} King Cold") M.king_cold_wins++
			if("{Saga} Android 16") M.android_16_wins++
			if("{Saga} Android 17") M.android_17_wins++
			if("{Saga} Android 18") M.android_18_wins++
			if("{Saga} Cell") M.cell_wins++
			if("{Saga} Perfect Cell") M.perfect_cell_wins++
			if("{Saga} Majin Buu") M.majin_buu_wins++
			if("{Saga} Kid Buu") M.kid_buu_wins++
			if("{Saga} Goku") M.goku_wins++
			if("{Saga} Piccolo") M.piccolo_wins++
			if("{Saga} Yamcha") M.yamcha_wins++
			if("{Saga} Tien") M.tien_wins++
			if("{Saga} Krillin") M.krillin_wins++
			if("{Saga} Gohan") M.gohan_wins++
			if("{Saga} Choutzu") M.choutzu_wins++
			if("{Saga} SSJ Goku") M.SSJ_goku_wins++
			if("{Saga} Trunks") M.trunks_wins++
			if("{Saga} Gotenks") M.gotenks_wins++
			if("{Saga} Vegito") M.vegito_wins++
			if("{Saga} Bebi") M.bebi_wins++
			if("{Saga} Gold Ape Bebi") M.g_ape_wins++
			if("{Saga} Bebi Vegeta") M.bebi_vegeta_wins++
			if("{Saga} SSJ4 Goku") M.ssj4_goku_wins++
			if("{Saga} Goten") M.goten_wins++
			if("{Saga} Majuub") M.majuub_wins++
		M << "\white Zenni +[zenni]"
		M << "\white EXP +[bonus_exp]"
		M.Gain_Kills(1)
		M.LooseK()
		M.Good_Sagas_fin()
		M.Evil_Sagas_fin()
		M.GT_Sagas_fin()
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
mob/PC/AbsorbDeathCheck(mob/M)
	if(powerlevel <= 0)
		tourny = 0
		Guild_Check(M)
		Arena_Check(M)
		Follower_Check()
		if(deathdone)
			deathdone = 0
			return
		Basic_Death_vars()
		Drop_dbs()
		if(level >= M.level / 4)
			if(M.combat_points < M.combat_points_max)
				M.combat_points += 50
				M << "Your Combat Points have increased by: \red 50"
		if(M.karma == karma) M.karma_rating -= 1
		else M.karma_rating ++
		if(M.karma_rating < 0)
			if(M.karma == "Good")
				M << "<I>You feel an Evil inside of you begin to awaken..."
				M.karma = "Evil"
				M.karma_rating = 0
			else
				M << "<I>You feel the Good inside of you begin to awaken..."
				M.karma = "Good"
				M.karma_rating = 0
		loc = locate(55,6,8)
		if(race=="Android")
			loc = locate(162,7,8)
			dead = 0
		overlays -= small_death_ball
		overlays -= big_death_ball
		powerlevel = 50
		sight &= ~BLIND
		overlays += halo
		Gokus()
		deaths ++
		M.pkills ++
		M.LooseK()
		players << "<FONT color = red>Battle Information:<FONT color = White> [src] was Absorbed by [M]!"
		M.MultiKill()
		M.Killstreak()
		for(var/mob/PC/M2 in view(8,src))
			if(!M2) continue
			if(M2.race == "Saiyan" || M2.race == "Half Saiyan")
				M2.witness_deaths ++
				M2.Watchdeath()
				spawn() M2.Rage_Unleash()
			if(M2 == M) continue
			M2 << "\red You feel your Rage Grow..."
			M2.rage += round(rand(20,50))
			if(M2.rage >= 100) M2.rage = 100
mob
	proc
		GRAVITYDeath()
			if(powerlevel <= 0)
				Drop_dbs()
				grav_on = 0
				grav = 0
				grav_popup = 0
				players << "<FONT color = #F3982D>Training Information:<FONT color = White> [src] died whilst Gravity Training!"
				Follower_Check()
				Basic_Death_vars()
				if(race == "Android")
					dead = 0
					powerlevel = powerlevel_max
					ki = ki_max
					strength = strength_max
					defence = defence_max
					speed = speed_max
					overlays -= small_death_ball
					overlays -= big_death_ball
					loc = locate(162,7,8)
					powerlevel = 50
					sight &= ~BLIND
					deaths ++
					Gokus()
					tourny = 0
					android_dead = 1
					spawn(300) android_dead = 0
				else
					if(race == "Majin")
						loc = locate(55,6,8)
						powerlevel = 50
						sight &= ~BLIND
						overlays += halo
						deaths ++
						Gokus()
						src<< "Your body was completely Destroyed!"
					else
						overlays -= small_death_ball
						overlays -= big_death_ball
						loc = locate(55,6,8)
						powerlevel = 50
						sight &= ~BLIND
						overlays += halo
						Gokus()
						deaths ++
 /***************\
|*****************|
|**ABSORB  DEATH**|
|*****************|
 \***************/
mob/proc/CandyDeathCheck()
	for(var/area/house/S in view(0,src)) if(istype(S,/area/house/)) return
	if(!pk) return
	if(powerlevel <= 0 && pk && !safe)
		..()
mob/Monster/CandyDeathCheck(mob/PC/M)
	if(powerlevel <= 0)
		new/obj/techs/Overlays/Crater_Center(loc)
		var/bonus_exp = tnl
		if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
		if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
		if(M.client) killer = M.name
		if(!owner&&!maker)
			M.Gain_Kills(1)
			M.Gain_Exp(bonus_exp,"Combat")
			M.zenni += zenni
			M << "\white Zenni +[zenni]"
			M << "\white EXP +[bonus_exp]"
		for(var/mob/PC/B in players) if(owner == B) B.cell_jrs --
		for(var/mob/PC/S in players) if(maker == S) S.splits --
		switch(race)
			if("Green Saibaman") M.green_kills ++
			if("Blue Saibaman") M.blue_kills ++
			if("Red Saibaman") M.red_kills ++
			if("White Saibaman") M.white_kills ++
			if("Black Saibaman") M.black_kills ++
			if("Henchman") M.thug_kills ++
			if("CellJ") M.cell_jr_kills ++
			if("Namekian Warrior") M.namek_kills ++
		switch(name)
			if("{NPC} Brolly") M.brolly_kill ++
			if("{NPC} Yakon") M.threat_kill ++
			if("{NPC} Android 17") M.killed_17++
			if("{NPC} Android 18") M.killed_18++
			if("{NPC} Cell") M.killed_cell++
			if("{NPC} Vegito") M.killed_vegito ++
		M.LooseK()
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
mob/Saga/CandyDeathCheck(mob/PC/M)
	if(powerlevel <= 0)
		M.Saga_Decision(name)
		var/bonus_exp = tnl
		if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
		if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
		M.Gain_Exp(bonus_exp,"Combat")
		M.zenni += zenni
		switch(name)
			if("{Saga} Raditz") M.raditz_wins++
			if("{Saga} Vegeta") M.vegeta_wins++
			if("{Saga} Nappa") M.nappa_wins++
			if("{Saga} Burter") M.burter_wins++
			if("{Saga} Captain Ginyu") M.captain_ginyu_wins++
			if("{Saga} Guldo") M.guldo_wins++
			if("{Saga} Jeice") M.jeice_wins++
			if("{Saga} Recoom") M.recoom_wins++
			if("{Saga} Frieza") M.frieza_wins++
			if("{Saga} King Cold") M.king_cold_wins++
			if("{Saga} Android 16") M.android_16_wins++
			if("{Saga} Android 17") M.android_17_wins++
			if("{Saga} Android 18") M.android_18_wins++
			if("{Saga} Cell") M.cell_wins++
			if("{Saga} Perfect Cell") M.perfect_cell_wins++
			if("{Saga} Majin Buu") M.majin_buu_wins++
			if("{Saga} Kid Buu") M.kid_buu_wins++
			if("{Saga} Goku") M.goku_wins++
			if("{Saga} Piccolo") M.piccolo_wins++
			if("{Saga} Yamcha") M.yamcha_wins++
			if("{Saga} Tien") M.tien_wins++
			if("{Saga} Krillin") M.krillin_wins++
			if("{Saga} Gohan") M.gohan_wins++
			if("{Saga} Choutzu") M.choutzu_wins++
			if("{Saga} SSJ Goku") M.SSJ_goku_wins++
			if("{Saga} Trunks") M.trunks_wins++
			if("{Saga} Gotenks") M.gotenks_wins++
			if("{Saga} Vegito") M.vegito_wins++
			if("{Saga} Bebi") M.bebi_wins++
			if("{Saga} Gold Ape Bebi") M.g_ape_wins++
			if("{Saga} Bebi Vegeta") M.bebi_vegeta_wins++
			if("{Saga} SSJ4 Goku") M.ssj4_goku_wins++
			if("{Saga} Goten") M.goten_wins++
			if("{Saga} Majuub") M.majuub_wins++
		M << "\white Zenni +[zenni]"
		M << "\white EXP +[bonus_exp]"
		M.Gain_Kills(1)
		M.LooseK()
		M.Good_Sagas_fin()
		M.Evil_Sagas_fin()
		M.GT_Sagas_fin()
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
mob/PC/CandyDeathCheck(mob/M)
	if(powerlevel <= 0)
		tourny = 0
		Guild_Check(M)
		Arena_Check(M)
		Follower_Check()
		if(deathdone)
			deathdone = 0
			return
		Drop_dbs()
		Basic_Death_vars()
		if(level >= M.level / 4)
			if(M.combat_points < M.combat_points_max)
				M.combat_points += 50
				M << "Your Combat Points have increased by: \red 50"
		if(M.karma == karma) M.karma_rating -= 1
		else M.karma_rating ++
		if(M.karma_rating < 0)
			if(M.karma == "Good")
				M << "<I>You feel an Evil inside of you begin to awaken..."
				M.karma = "Evil"
				M.karma_rating = 0
			else
				M << "<I>You feel the Good inside of you begin to awaken..."
				M.karma = "Good"
				M.karma_rating = 0
		loc = locate(55,6,8)
		overlays -= small_death_ball
		overlays -= big_death_ball
		powerlevel = 50
		sight &= ~BLIND
		overlays += halo
		deaths ++
		Gokus()
		M.pkills ++
		M.LooseK()
		players << "<FONT color = red>Battle Information:<FONT color = White> [src] was transformed into some candy by [M]!"
		M.MultiKill()
		M.Killstreak()
		for(var/mob/PC/M2 in view(8,src))
			if(!M2) continue
			if(M2.race == "Saiyan" || M2.race == "Half Saiyan")
				M2.witness_deaths ++
				M2.Watchdeath()
				spawn() M2.Rage_Unleash()
			if(M2 == M) continue
			M2 << "\red You feel your Rage Grow..."
			M2.rage += round(rand(20,50))
			if(M2.rage >= 100) M2.rage = 100
mob/proc/BigKiDeathCheck2()
	for(var/area/house/S in view(0,src)) if(istype(S,/area/house/)) return
	if(!pk) return
	if(powerlevel <= 0 && pk && !safe)
		..()
mob/Monster/BigKiDeathCheck2(mob/PC/M)
	if(powerlevel <= 0)
		new/obj/techs/Overlays/Crater_Center(loc)
		var/bonus_exp = tnl
		if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
		if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
		if(M.client) killer = M.name
		if(!owner&&!maker)
			M.Gain_Kills(1)
			M.Gain_Exp(bonus_exp,"Combat")
			M.zenni += zenni
			M << "\white Zenni +[zenni]"
			M << "\white EXP +[bonus_exp]"
		for(var/mob/PC/B in players) if(owner == B) B.cell_jrs --
		for(var/mob/PC/S in players) if(maker == S) S.splits --
		switch(race)
			if("Green Saibaman") M.green_kills ++
			if("Blue Saibaman") M.blue_kills ++
			if("Red Saibaman") M.red_kills ++
			if("White Saibaman") M.white_kills ++
			if("Black Saibaman") M.black_kills ++
			if("Henchman") M.thug_kills ++
			if("CellJ") M.cell_jr_kills ++
			if("Namekian Warrior") M.namek_kills ++
		switch(name)
			if("{NPC} Brolly") M.brolly_kill ++
			if("{NPC} Yakon") M.threat_kill ++
			if("{NPC} Android 17") M.killed_17++
			if("{NPC} Android 18") M.killed_18++
			if("{NPC} Cell") M.killed_cell++
			if("{NPC} Vegito") M.killed_vegito ++
		M.LooseK()
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
mob/Saga/BigKiDeathCheck2(mob/PC/M)
	if(powerlevel <= 0)
		M.Saga_Decision(name)
		var/bonus_exp = tnl
		if("minor_exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.05
		if("exp_buff" in M.buffs) bonus_exp += bonus_exp * 0.25
		M.Gain_Exp(bonus_exp,"Combat")
		M.zenni += zenni
		switch(name)
			if("{Saga} Raditz") M.raditz_wins++
			if("{Saga} Vegeta") M.vegeta_wins++
			if("{Saga} Nappa") M.nappa_wins++
			if("{Saga} Burter") M.burter_wins++
			if("{Saga} Captain Ginyu") M.captain_ginyu_wins++
			if("{Saga} Guldo") M.guldo_wins++
			if("{Saga} Jeice") M.jeice_wins++
			if("{Saga} Recoom") M.recoom_wins++
			if("{Saga} Frieza") M.frieza_wins++
			if("{Saga} King Cold") M.king_cold_wins++
			if("{Saga} Android 16") M.android_16_wins++
			if("{Saga} Android 17") M.android_17_wins++
			if("{Saga} Android 18") M.android_18_wins++
			if("{Saga} Cell") M.cell_wins++
			if("{Saga} Perfect Cell") M.perfect_cell_wins++
			if("{Saga} Majin Buu") M.majin_buu_wins++
			if("{Saga} Kid Buu") M.kid_buu_wins++
			if("{Saga} Goku") M.goku_wins++
			if("{Saga} Piccolo") M.piccolo_wins++
			if("{Saga} Yamcha") M.yamcha_wins++
			if("{Saga} Tien") M.tien_wins++
			if("{Saga} Krillin") M.krillin_wins++
			if("{Saga} Gohan") M.gohan_wins++
			if("{Saga} Choutzu") M.choutzu_wins++
			if("{Saga} SSJ Goku") M.SSJ_goku_wins++
			if("{Saga} Trunks") M.trunks_wins++
			if("{Saga} Gotenks") M.gotenks_wins++
			if("{Saga} Vegito") M.vegito_wins++
			if("{Saga} Bebi") M.bebi_wins++
			if("{Saga} Gold Ape Bebi") M.g_ape_wins++
			if("{Saga} Bebi Vegeta") M.bebi_vegeta_wins++
			if("{Saga} SSJ4 Goku") M.ssj4_goku_wins++
			if("{Saga} Goten") M.goten_wins++
			if("{Saga} Majuub") M.majuub_wins++
		M << "\white Zenni +[zenni]"
		M << "\white EXP +[bonus_exp]"
		M.Gain_Kills(1)
		M.LooseK()
		M.Good_Sagas_fin()
		M.Evil_Sagas_fin()
		M.GT_Sagas_fin()
		src.oldloc=src.loc
		src.oldloc=src.loc
		src.x=0
		spawn(1) del src
		..()
mob/PC/BigKiDeathCheck2(mob/M)
	if(powerlevel <= 0)
		tourny = 0
		new/obj/techs/Overlays/Crater_Center(loc)
		Guild_Check(M)
		Arena_Check(M)
		Follower_Check()
		if(deathdone)
			deathdone = 0
			return
		Drop_dbs()
		if(level >= M.level / 4)
			if(M.combat_points < M.combat_points_max)
				M.combat_points += 50
				M << "Your Combat Points have increased by: \red 50"
		if(M.karma == karma) M.karma_rating -= 1
		else M.karma_rating ++
		if(M.karma_rating < 0)
			if(M.karma == "Good")
				M.karma = "Evil"
				M << "<I>You feel an Evil inside of you begin to awaken..."
				M.karma_rating = 0
			else
				M.karma = "Good"
				M << "<I>You feel the Good inside of you begin to awaken..."
				M.karma_rating = 0
		if(race == "Android")
			spawn(1) dead = 0
			overlays -= small_death_ball
			overlays -= big_death_ball
			loc = locate(162,7,8)
			powerlevel = 50
			players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of All Star!"
			tourny = 0
			android_dead = 1
			spawn(300) android_dead = 0
		else
			if(race == "Majin")
				if(!regen_dead)
					Icon_State("Dead")
					frozen = 1
					boxing = 0
					if(!doing) doing ++
					density = 1
					attack_lock = 1
					overlays -= small_death_ball
					charging = 0
					overlays -= big_death_ball
					ki_lock = 1
					it_lock = 1
					regen_dead = 1
					powerlevel = 0
					Majin_Regenerate()
					kaioken = 0
					KO = 0
					rage = 0
					sight &= ~BLIND
					return
				else
					loc = locate(55,6,8)
					powerlevel = 50
					overlays += halo
					src<< "Your body was completely Destroyed!"
					players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of All Star!"
			else
				overlays -= small_death_ball
				overlays -= big_death_ball
				loc = locate(55,6,8)
				powerlevel = 50
				overlays += halo
				players << "<FONT color = red>Battle Information:<FONT color = White> [src] died at the hands of All Star!"
		Basic_Death_vars()
		sight &= ~BLIND
		deaths ++
		M.pkills ++
		Gokus()
		M.LooseK()
		M.MultiKill()
		M.Killstreak()
		for(var/mob/PC/M2 in view(12))
			if(!M2 || M2 == M) continue
			M2.witness_deaths ++
			M2.Watchdeath()
			spawn() M2.Rage_Unleash()
			M2 << "\red You feel your Rage Grow..."
			M2.rage += round(rand(20,50))
			if(M2.rage >= 100) M2.rage = 100