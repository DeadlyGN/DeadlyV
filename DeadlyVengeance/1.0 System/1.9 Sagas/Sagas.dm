var
	//--General Saga Vars---
	sagas_on 				= 0
	sagas_evil				= 0
	sagas_good				= 0
	sagas_GT				= 0
	saga 					= "Not On"
	part					= "Not On"
	saga_difficulty			= "Medium"
	location				= "Not On"
	sagas_stopped			= 0
	list/sagas				= new()
mob
	Saga
		New()
			..()
			sagas.Add(src)
			spawnin=locate(x,y,z)
			spawn() Wander()
		Del()
			sagas.Remove(src)
			sagas-=src
			..()
		var
			gotboost		= 0
			turf/spawnin
			mob/PC/P
		Bump(mob/M)
			if(istype(M,/mob/PC)) Attack2(M)
		proc
			Wander()
				while(src)
					var{Found = FALSE; powering_up = 0;}
					for(P in oview(7))
						if(powerlevel < powerlevel_max * 0.1 && powering_up < 3)
							powering_up ++
							step_away(src,P)
							src.powering_pl = 1
							if(!src.doing) src.doing ++
							src.Icon_State("enrage")
							src.overlays += src.aura
							src.Powering_PL()
						else
							if(!attacker||attacker == P)
								if(P in get_step(src,get_dir(src,P))){ Attack2(P); if(src.buku){call(src,"Land")()};}
								else
									if(!step_to(src,P,1)||P.buku){call(src,"Flight")()}
									if(!(P in view(1,src))&&dir<5) Ki_Blast_Shoot()
								Found = TRUE
								break
					if(Found != TRUE){ sleep(18); if(src.loc!=src.spawnin){if(!step_to(src,spawnin)){call(src,"Flight")()}}else{ call(src,"Land")() }; }
					sleep(round(speed,0.1))
			Attack2(mob/M)
				var/text = ""
				text = "\red [src] [pick("punches","kicks")] you in the [pick("face","chest","side","stomach")]"
				dir=get_dir(src,M)
				if(!M||src.attack_lock||src.cooldown||M.safe||M.dead||M.KO) return
				var/attack_power = round(src.strength + (src.powerlevel/5))
				var/defence_power = M.defence
				var/damage = attack_power - defence_power
				if(damage < 1) damage = 1
				if(M.type == /mob/PC)
					if(!src.cooldown)
						src.Flick("attack")
						if(prob(M.dodge)) M.Flick("IT")
						else
							if(prob(M.block)) damage = round(damage/4)
							else
								if(prob(usr.critical))
									M << "[text]"
									damage = round(damage*2.5)
								else M << "[text]"
					M.attacker(src)
					M.Damage(damage)
					M.DeathCheck(src)
					src.cooldown = 1
					spawn(src.speed * 2) src.cooldown = 0
proc
	Progress_Saga()
		set background=1
		sagas_on=1
		while(TRUE)
			if(sagas_stopped)
				sagas_on=0
				sagas_stopped=0
				sagas_evil=0
				sagas_good=0
				return
			if(sagas_on&&!sagas_good&&!sagas_evil)
				switch(rand(1,2))
					if(1)
						sagas_evil=0
						sagas_good=1
					if(2)
						sagas_good=0
						sagas_evil=1
			if(sagas.len) goto Skip2
			if(sagas_evil)
				if(!sagas_GT)
					switch(saga)
						if("Not On")
							switch(part)
								if("Not On")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Sagas have been Activated!\n\
									<font color = lime>Saga Information:</font> Saiyan Saga: Part I - A New Power!"
									saga = "Saiyan"
									part = "Raditz"
									location = "Earth"
									var/Raditz = /mob/Saga/Raditz
									new Raditz(locate(65,230,1))
						if("Saiyan")
							switch(part)
								if("Raditz")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Raditz has been Defeated! Pfft...\n\
									<font color = lime>Saga Information:</font> Saiyan Saga: Part II - Saiyan Invasion!"
									part = "Vegeta and Nappa"
									var/Vegeta = /mob/Saga/Evil_Vegeta
									new Vegeta(locate(23,122,1))
									var/Nappa = /mob/Saga/Nappa
									new Nappa(locate(27,122,1))
								if("Vegeta and Nappa")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Nappa and Vegeta have been Defeated! Come on!\n\
									<font color = lime>Saga Information:</font> Frieza Saga: Part I - The Ginyu Force!"
									saga = "Frieza"
									part = "Ginyu Force"
									location = "Namek"
									var/Jeice = /mob/Saga/Jeice
									new Jeice(locate(214,210,2))
									var/Burter = /mob/Saga/Burter
									new Burter(locate(215,210,2))
									var/Recoom = /mob/Saga/Recoom
									new Recoom(locate(213,210,2))
									var/Guldo = /mob/Saga/Guldo
									new Guldo(locate(214,211,2))
									var/Ginyu = /mob/Saga/Captain_Ginyu
									new Ginyu(locate(162,144,2))
						if("Frieza")
							switch(part)
								if("Ginyu Force")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> The Ginyu Force has been Defeated! Still not impressed\n\
									<font color = lime>Saga Information:</font> Frieza Saga: Part II - Lord Frieza's Awakening!"
									part = "Frieza Form I"
									var/Frieza = /mob/Saga/Frieza_1
									new Frieza(locate(111,235,2))
								if("Frieza Form I")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Form I Frieza has been Defeated! Not Bad...\n\
									<font color = lime>Saga Information:</font> Frieza Saga: Part III - Frieza's New Form!"
									part = "Frieza Form II"
									var/Frieza2 = /mob/Saga/Frieza_2
									new Frieza2(locate(111,235,2))
								if("Frieza Form II")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Form II Frieza has been Defeated! You're pretty good.\n\
									<font color = lime>Saga Information:</font> Frieza Saga: Part IV - Frieza's Unstoppable Power!"
									part = "Frieza Form III"
									var/Frieza3 = /mob/Saga/Frieza_3
									new Frieza3(locate(111,235,2))
								if("Frieza Form III")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Form III Frieza has been Defeated! Whoa...!\n\
									<font color = lime>Saga Information:</font> Frieza Saga: Part V - Another Form!?"
									part = "Frieza Form IV"
									var/Frieza4 = /mob/Saga/Frieza_4
									new Frieza4(locate(111,235,2))
								if("Frieza Form IV")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Form IV Frieza has been Defeated! o_o\n\
									<font color = lime>Saga Information:</font> Frieza Saga: Part VI - 100% Power!"
									part = "Frieza 100% Power"
									var/Frieza4 = /mob/Saga/Frieza_4_100
									new Frieza4(locate(111,235,2))
								if("Frieza 100% Power")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Form IV 100% Frieza has been Defeated! WOW!\n\
									<font color = lime>Saga Information:</font> Android Saga: Part I - Frieza's Revenge!"
									saga = "Android"
									part = "Cyborg Frieza"
									location = "Earth"
									var/Cyborg_Frieza = /mob/Saga/Metal_Frieza
									new Cyborg_Frieza(locate(170,180,1))
									var/King_Cold = /mob/Saga/King_Cold
									new King_Cold(locate(171,180,1))
						if("Android")
							switch(part)
								if("Cyborg Frieza")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Cyborg Frieza and King Cold have been Defeated! You're damn strong!\n\
									<font color = lime>Saga Information:</font> Android Saga: Part II - The Doctors new Creation!"
									part = "Android 19 and 20"
									var/Android_19 = /mob/Saga/Android_19
									new Android_19(locate(200,56,1))
									var/Dr_Gero = /mob/Saga/Dr_Gero
									new Dr_Gero(locate(201,56,1))
								if("Android 19 and 20")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Android 19 and Dr Gero have been Defeated! I can't believe this!\n\
									<font color = lime>Saga Information:</font> Android Saga: Part III - The Deadly Trio!"
									part = "Android 16, 17 and 18"
									var/Android_16 = /mob/Saga/Android_16
									new Android_16(locate(100,190,1))
									var/Android_17 = /mob/Saga/Android_17
									new Android_17(locate(101,190,1))
									var/Android_18 = /mob/Saga/Android_18
									new Android_18(locate(102,190,1))
								if("Android 16, 17 and 18")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Android 16, 17 and 18 have been Defeated! You own!\n\
									<font color = lime>Saga Information:</font> Cell Saga: Part I - Super Warrior!"
									saga = "Cell"
									part = "Cell Form I"
									var/Cell = /mob/Saga/Cell_1
									new Cell(locate(205,200,1))
						if("Cell")
							switch(part)
								if("Cell Form I")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Form I Cell has been Defeated! Keep going!\n\
									<font color = lime>Saga Information:</font> Cell Saga: Part II - Cell's new Form!"
									part = "Imperfect Cell"
									var/Imperfect_Cell = /mob/Saga/Cell_2
									new Imperfect_Cell(locate(205,200,1))
								if("Imperfect Cell")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Imperfect Cell has been Defeated! O_O!!!\n\
									<font color = lime>Saga Information:</font> Cell Saga: Part III - Perfection!"
									part = "Perfect Cell"
									var/Perfect_Cell = /mob/Saga/Cell_3
									new Perfect_Cell(locate(40,37,1))
								if("Perfect Cell")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Perfect Cell has been Defeated! You've proved me wrong!\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part I - Might of the Demon Lord!"
									saga = "Buu"
									part = "Babidi and Dabura"
									var/Dabura = /mob/Saga/Dabura
									new Dabura(locate(30,112,1))
									var/Babidi = /mob/Saga/Babidi
									new Babidi(locate(31,112,1))
						if("Buu")
							switch(part)
								if("Babidi and Dabura")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Babidi and Dabura have fallen! Hail Mary!\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part II - Majin Buu?!"
									part = "Fat Buu"
									new/mob/Saga/Fat_Buu(locate(28,134,1))
								if("Fat Buu")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Majin Buu has been Defeated! Untouchable...\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part III - A New Buu?!"
									part = "Skinny Buu"
									var/Skinny_Buu = /mob/Saga/Skinny_Buu
									new Skinny_Buu(locate(28,134,1))
								if("Skinny Buu")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Skinny Buu has been Defeated! You're a god among men...\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part IV - Buu's Rampage!"
									part = "Super Buu"
									location = "Dende"
									var/Super_Buu = /mob/Saga/Super_Buu
									new Super_Buu(locate(233,240,8))
								if("Super Buu")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super Buu has been Defeated! You're badass!\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part V - Kid Form!"
									part = "Kid Buu"
									location = "Supreme Kai"
									var/Kid_Buu = /mob/Saga/Kid_Buu
									new Kid_Buu(locate(128,209,8))//131,156
								if("Kid Buu")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Kid Buu has been Defeated! You did it! You saved the earth!"
									sleep(120)
									for(var/mob/PC/m) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi Saga: Part I - Babi!"
									saga = "Bebi"
									part = "Bebi"
									location = "Tuffle Infected Earth"//"M-2"
									sagas_GT = 1
									var/Babi = /mob/Saga/Bebi
									new Babi(pick(available_locs5))
									spawn(1) Babi:z=5
				else
					switch(saga)
						if("Bebi")
							switch(part)
								if("Bebi")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi Saga: Part II - Bebi Vegeta!"
									part = "Bebi Vegeta"
									location = "Tuffle Infected Earth"
									var/Babi = /mob/Saga/Bebi_Vegeta
									new Babi(pick(available_locs5))
									spawn(1) Babi:z=5
								if("Bebi Vegeta")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi Saga: Part III - Super Bebi Vegeta!"
									part = "Super Bebi Vegeta"
									var/Babi = /mob/Saga/Bebi_Vegeta
									new Babi(pick(available_locs5))
									spawn(1) Babi:z=5
								if("Super Bebi Vegeta")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi Saga: Part IV - Super Bebi Vegeta 2!"
									part = "Super Bebi Vegeta 2"
									var/Babi = /mob/Saga/Bebi_Vegeta2
									new Babi(pick(available_locs5))
									spawn(1) Babi:z=5
								if("Super Bebi Vegeta 2")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi Saga: Part V - Great Golden Ape Bebi!"
									part = "Golden Great Ape Bebi"
									var/Babi = /mob/Saga/Gold_Great_Ape
									new Babi(pick(available_locs5))
									spawn(1) Babi:z=5
								if("Golden Great Ape Bebi")
									//for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super 17 Saga: Part I - Hell Unleashed!"
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi saga has ended, Earth is once again safe.\n\
									<i>More GT sagas coming soon!</i>."
									saga = "Not On"
									part = "Not On"
									sagas_evil = 0
									sagas_good = 0
									sagas_GT = 0
									//saga = "Super 17"
									//part = "Hell Unleashed"
									//location = "Tuffle Infected Earth"
									//four random fighters. Nappa, Pui Pui, Yakon, Android 19, Saibaman, Android 17.
						if("Super 17")
							switch(part)
								if("Hell Unleashed")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super 17 Saga: Part II - Hell Fighter 17!"
									part = "Hell Fighter 17"
									//var/Hell_Fighter_17 = /mob/Saga/Hell_Fighter_17
									//new Hell_Fighter_17(locate(1,1,1))
								if("Hell Fighter 17")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super 17 Saga: Part III - Frieza and Cell!"
									part = "Frieza and Cell"
									//var/Frieza =
									//var/Cell =
								if("Frieza and Cell")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super 17 Saga: Part IV - Super Android 17!"
									part = "Super Android 17"
									//var/Super_Android_17 = /mob/Saga/Super_Android_17
									//new Super_Android_17(locate(1,1,1))
								if("Super Android 17")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Shadow Dragon Saga: Part I - Dragon Hunt!"
									//Haze, Rage, Oceanus, Naturon
						if("Shadow Dragon")
							switch(part)
								if("Dragon Hunt")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Shadow Dragon Saga: Part II - Fire and Ice!"
									part = "Fire and Ice"
								if("Fire and Ice")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Shadow Dragon Saga: Part III - Rise of the Ultimate Enemy!"
									part = "Rise of the Ultimate Enemy"
								if("Rise of the Ultimate Enemy")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Shadow Dragon Saga: Part IV - Omega Shenron!"
									part = "Omega Shenron"
								if("Omega Shenron")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Omega Shenron has been..slain! The Universe is safe!"
				if(sagas.len) goto Skip2
				for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Evil Saga's Complete!"
				saga = "Not On"
				part = "Not On"
				location = "Not On"
				sleep(15)
				sagas_evil=0
				sagas_good=1
				sagas_GT=0
				sleep(120)
			if(sagas_good)
				if(!sagas_GT)
					switch(saga)
						if("Not On")
							switch(part)
								if("Not On")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Sagas have been Activated! You don't have a chance.\n\
									<font color = lime>Saga Information:</font> Saiyan Saga: Part I - A New Alliance!"
									saga = "Saiyan"
									part = "Goku and Piccolo"
									location = "Earth"
									var/Goku = /mob/Saga/Goku
									new Goku(locate(65,228,1))
									var/Piccolo = /mob/Saga/Piccolo
									new Piccolo(locate(64,228,1))
						if("Saiyan"||"Not On")
							switch(part)
								if("Goku and Piccolo")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Goku and Piccolo have been Defeated! Pfft...\n\
									<font color = lime>Saga Information:</font> Saiyan Saga: Part II - The Z Force!"
									part = "The Z Force"
									var/Piccolo = /mob/Saga/Piccolo_2
									new Piccolo(locate(192,183,1))
									var/Gohan = /mob/Saga/Gohan
									new Gohan(locate(193,183,1))
									var/Tien = /mob/Saga/Tien
									new Tien(locate(193,184,1))
									var/Yamcha = /mob/Saga/Yamcha
									new Yamcha(locate(191,182,1))
									var/Krillin = /mob/Saga/Krillin
									new Krillin(locate(192,181,1))
									var/Choutzu = /mob/Saga/Choutzu
									new Choutzu(locate(191,183,1))
								if("The Z Force")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> The Z Force has been Defeated! Come on.\n\
									<font color = lime>Saga Information:</font> Saiyan Saga: Part III - Goku's Arrival!"
									part = "Goku"
									var/Goku = /mob/Saga/Goku_2
									new Goku(locate(27,123,1))
								if("Goku")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Goku has been Defeated! Still not impressed\n\
									<font color = lime>Saga Information:</font> Namek Saga: Part I - Hunt for the Dragonballs! "
									saga = "Namek"
									part = "The Z Force Part II"
									location = "Namek"
									var/Gohan = /mob/Saga/Gohan_2
									new Gohan(locate(24,138,2))
									var/Krillin = /mob/Saga/Krillin_2
									new Krillin(locate(25,138,2))
									var/Vegeta = /mob/Saga/Vegeta_2
									new Vegeta(locate(160,37,2))
						if("Namek")
							switch(part)
								if("The Z Force Part II")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> The Z Force has been Defeated! Not bad\n\
									<font color = lime>Saga Information:</font> Namek Saga: Part II - The Renewed Goku!"
									part = "Goku Part II"
									var/Goku = /mob/Saga/Goku_3
									new Goku(locate(131,107,2))
								if("Goku Part II")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Goku has been Defeated! Still not impressed\n\
									<font color = lime>Saga Information:</font> Namek Saga: Part I - Hunt for the Dragonballs!"
									part = "Super Puccolo"
									var/Gohan = /mob/Saga/Gohan_2
									new Gohan(locate(24,138,2))
									var/Krillin = /mob/Saga/Krillin_2
									new Krillin(locate(25,138,2))
									var/Vegeta = /mob/Saga/Vegeta_2
									new Vegeta(locate(160,37,2))
								if("Super Puccolo")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> The Z Force has been Defeated! Not bad\n\
									<font color = lime>Saga Information:</font> Namek Saga: Part II - The Renewed Goku!"
									part = "Goku Part III"
									var/Goku = /mob/Saga/Goku_3
									new Goku(locate(131,107,2))
								if("Goku Part III")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Goku has been Defeated! o_o\n\
									<font color = lime>Saga Information:</font> Namek Saga: Part V - Super Saiyan Goku!?"
									part = "Super Saiyan Goku"
									var/Goku = /mob/Saga/Goku_5
									new Goku(locate(120,93,2))
								if("Super Saiyan Goku")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super Saiyan Goku has been Defeated! WOW!\n\
									<font color = lime>Saga Information:</font> Android Saga: Part I - Mysterious Youth!"
									saga = "Android"
									part = "Trunks"
									location = "Earth"
									var/Trunks = /mob/Saga/Trunks
									new Trunks(locate(41,124,1))
						if("Android")
							switch(part)
								if("Trunks")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Trunks has been Defeated! You're damn strong!\n\
									<font color = lime>Saga Information:</font> Android Saga: Part II - A Weakend Saiyan!"
									part = "Super Saiyan Goku"
									var/Goku = /mob/Saga/Goku_6
									new Goku(locate(71,199,1))
								if("Super Saiyan Goku")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super Saiyan Goku has been Defeated I can't believe this!\n\
									<font color = lime>Saga Information:</font> Android Saga: Part II - The Super Saiyan Prince!"
									part = "Super Saiyan Vegeta"
									var/Vegeta = /mob/Saga/Vegeta_3
									new Vegeta(locate(212,171,1))
								if("Super Saiyan Vegeta")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super Saiyan Vegeta has been Defeated! You own!\n\
									<font color = lime>Saga Information:</font> Android Saga: Part III - The Super Namek!"
									part = "Super Piccolo"
									var/Piccolo = /mob/Saga/Piccolo_4
									new Piccolo(locate(197,60,1))
								if("Super Piccolo")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super Piccolo 2 has been Defeated! O_O!!!\n\
									<font color = lime>Saga Information:</font> Cell Saga: Part I - Super Vegeta!"
									saga = "Cell"
									part = "Ascended Vegeta"
									var/Vegeta = /mob/Saga/Vegeta_4
									new Vegeta(locate(171,180,1))
						if("Cell")
							switch(part)
								if("Ascended Vegeta")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super Vegeta has been Defeated! You kick ass!!\n\
									<font color = lime>Saga Information:</font> Cell Saga: Part II - Super Trunks!"
									part = "Super Trunks"
									var/Trunks = /mob/Saga/Trunks_2
									new Trunks(locate(171,180,1))
								if("Super Trunks")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super Trunks has been Defeated! Un-freakin-believable!\n\
									<font color = lime>Saga Information:</font> Cell Saga: Part III - Cell Games!"
									part = "Cell Games"
									var/Goku = /mob/Saga/Goku_7
									new Goku(locate(35,38,1))
									var/Gohan = /mob/Saga/Gohan_3
									new Gohan(locate(37,38,1))
									var/Tien = /mob/Saga/Tien_2
									new Tien(locate(36,41,1))
									var/Yamcha = /mob/Saga/Yamcha_2
									new Yamcha(locate(37,41,1))
									var/Trunks = /mob/Saga/Trunks_2
									new Trunks(locate(38,41,1))
									var/Vegeta = /mob/Saga/Vegeta_4
									new Vegeta(locate(41,40,1))
									var/Piccolo = /mob/Saga/Piccolo_5
									new Piccolo(locate(39,40,1))
								if("Cell Games")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> The Z Force has been Defeated! Keep going! Untouchable!\n\
									<font color = lime>Saga Information:</font> Cell Saga: Part IV - Explosion of Anger!"
									part = "Super Saiyan 2 Gohan"
									var/Gohan = /mob/Saga/Gohan_4
									new Gohan(locate(38,38,1))
								if("Super Saiyan 2 Gohan")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super Saiyan 2 Gohan has been Defeated! You're INSANE!\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part I - Earth's Protector!"
									saga = "Buu"
									part = "Gohan"
									var/Gohan = /mob/Saga/Gohan_5
									new Gohan(locate(30,117,1))
						if("Buu")
							switch(part)
								if("Gohan")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Gohan has been Defeated! No one stands a chance!\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part II - Last Hope..."
									part = "Super Saiyan 2 Goku"
									var/Goku = /mob/Saga/Goku_8
									new Goku(locate(208,66,1))
								if("Super Saiyan 2 Goku")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super Saiyan 2 Goku has been Defeated! I'm honored to be your announcer!\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part III - Fusion!"
									part = "Gotenks"
									location = "Dende"
									var/Gotenks = /mob/Saga/Gotenks
									new Gotenks(locate(233,240,8))
								if("Gotenks")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Gotenks has been Defeated! You must love the taste of blood!\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part IV - Gohan Reborn!"
									part = "Mystic Gohan"
									location = "Earth"
									var/Gohan = /mob/Saga/Gohan_6
									new Gohan(locate(55,178,1))
								if("Mystic Gohan")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Mystic Gohan has been Defeated! You're a god among men!\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part V - Vegito?!"
									part = "Vegito"
									var/Vegito = /mob/Saga/Vegito
									new Vegito(locate(28,51,1))
								if("Vegito")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Vegito has been Defeated! Good god!\n\
									<font color = lime>Saga Information:</font> Buu Saga: Part V - The Last Stand!"
									part = "Goku and Vegeta"
									location = "Supreme Kai"
									var/Goku = /mob/Saga/Goku_9
									new Goku(locate(126,209,8))
									var/Vegeta = /mob/Saga/Vegeta_5
									new Vegeta(locate(127,209,8))
								if("Goku and Vegeta")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Goku and Vegeta have been Defeated! You're pure evil!"
									sleep(120)
									for(var/mob/PC/m) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi Saga: Part I - Goku, Pan and Trunks!"
									saga = "Bebi"
									sagas_GT = 1
									var/Goku = /mob/Saga/Goku_7
									new Goku(pick(available_locs5))
									Goku:z=5
									var/icon/i= new(Goku:icon)
									Goku:icon=i.ResizeWithAspect(16,16)
									var/Trunks = /mob/Saga/Trunks_3
									new Trunks(pick(available_locs5))
									Trunks:z=5
									part = "Goku and Trunks"
									location = "Tuffle Infected Earth"//M-2
				else
					switch(saga)
						if("Bebi")
							switch(part)
								if("Goku and Trunks")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi Saga: Part II - Saiyan Hunting!"
									part = "Saiyan Hunting"
									//location = "Tuffle Infected Earth"
									var/Goten = /mob/Saga/Goten
									new Goten(pick(available_locs5))
									spawn(1) Goten:z=5
									var/Gohan = /mob/Saga/Gohan_6
									new Gohan(pick(available_locs5))
									spawn(1) Gohan:z=5
									var/Piccolo = /mob/Saga/Piccolo_5
									new Piccolo(pick(available_locs5))
									spawn(1) Piccolo:z=5
									var/Vegeta = /mob/Saga/Vegeta_5
									new Vegeta(pick(available_locs5))
									spawn(1) Vegeta:z=5
									var/Goku = /mob/Saga/Goku_8
									new Goku(pick(available_locs5))
									var/icon/i= new(Goku:icon)
									Goku:icon=i.ResizeWithAspect(16,16)
									spawn(1) Goku:z=5
								if("Saiyan Hunting")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi Saga: Part III - Goku Super Saiyan 3!"
									//Goten, Gohan, Piccolo, VegetaSSJ, Goku
									part = "Goku Super Saiyan 3"
									var/Goku = /mob/Saga/Goku_9
									new Goku(pick(available_locs5))
									spawn(1) Goku:z=5
									var/icon/i= new(Goku:icon)
									Goku:icon=i.ResizeWithAspect(16,16)
								if("Goku Super Saiyan 3")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi Saga: Part IV - Goku's Student, Uub!"
									part = "Majuub"
									//location = "Tuffle Infected Earth"
									var/Uub = /mob/Saga/Majuub
									new Uub(pick(available_locs5))
									spawn(1) Uub:z=5
								if("Majuub")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi Saga: Part V - Goku Super Saiyan 4!"
									part = "Goku's Super Saiyan 4"
									var/Goku = /mob/Saga/SSJ4_Goku
									new Goku(pick(available_locs5))
									spawn(1) Goku:z=5
								if("Goku's Super Saiyan 4")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Bebi saga has ended, Earth is once again in ruins.\n\
									<i>More GT sagas coming soon!</i>."
									saga = "Not On"
									part = "Not On"
									sagas_evil = 0
									sagas_good = 0
									sagas_GT = 0
									/*for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super 17 Saga: Part I - Hell Unleashed!"
									saga = "Super 17"
									part = "Hell Unleashed"
									location = "Earth"*/
						if("Super 17")
							switch(part)
								if("Hell Unleashed")
									//Trunks, Android 18 and Krillin
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super 17 Saga: Part II - Vegeta Arrives!"
									part = "Vegeta Arrives"
									//var/Vegeta = /mob/Saga/Vegeta_GT
									//new Vegeta(locate(1,1,1))
								if("Vegeta Arrives")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super 17 Saga: Part III - The Resistance!"
									part = "The Resistance"
								if("The Resistance")
									//Everyone but Majuub go to SSJ1, Vegeta goes to SSJ2
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Super 17 Saga: Part IV - Final Bout!"
									part = "Final Bout"
								if("Final Bout")
									//Goku goes straight to SSJ4
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Shadow Dragon Saga: Part I - Dragon Hunt!"
									part = "Shadow of the Dragon Balls"
						if("Shadow Dragon")
							switch(part)
								if("Shadow of the Dragon Balls")
									//Goku/SSJ4 and Pan
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Shadow Dragon Saga: Part II - Fire and Ice!"
									part = "The Tide Turns...and Turns Back"
								if("The Tide Turns...and Turns Back")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Shadow Dragon Saga: Part III - Rise of the Ultimate Enemy!"
									part = "Final Sacrifices"
								if("Final Sacrifices")
									for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Shadow Dragon Saga: Part IV - Omega Shenron!"
									part = "Universal Power"
								//if("Universal Power")
				if(sagas.len) goto Skip2
				for(var/mob/PC/m in players) spawn() if(m.tab_saga) m << "<font color = lime>Saga Information:</font> Good Saga's Complete!"
				saga = "Not On"
				part = "Not On"
				location = "Not On"
				sleep(15)
				sagas_evil=1
				sagas_good=0
				sagas_GT=0
				sleep(120)
			Skip2
			spawn() SAGA_DIFFICULTY()
			sleep(250)
	SAGA_DIFFICULTY()
		if(sagas_GT)
			for(var/mob/Saga/M in sagas) if(!M.gotboost)
				M.powerlevel *= 10
				M.ki *= 10
				M.strength *= 10
				M.defence *= 10
				M.powerlevel_max *= 10
				M.ki_max *= 10
				M.strength_max *= 10
				M.defence_max *= 10
		switch(saga_difficulty)
			if("Easy")
				for(var/mob/Saga/M in sagas) if(!M.gotboost)
					M.powerlevel *= 4200
					M.ki *= 4200
					M.strength *= 4200
					M.defence *= 4200
					M.powerlevel_max *= 4200
					M.ki_max *= 4200
					M.strength_max *= 4200
					M.defence_max *= 4200
					M.zenni *= 32
					M.exp *= 120
					M.tnl *= 120
					M.gotboost=1
			if("Medium")
				for(var/mob/Saga/M in sagas) if(!M.gotboost)
					M.powerlevel *= 8000
					M.ki *= 8000
					M.strength *= 8000
					M.defence *= 8000
					M.powerlevel_max *= 8000
					M.ki_max *= 8000
					M.strength_max *= 8000
					M.defence_max *= 8000
					M.zenni *= 52
					M.exp *= 220
					M.tnl *= 220
					M.gotboost=2
			if("Hard")
				for(var/mob/Saga/M in sagas) if(!M.gotboost)
					M.powerlevel *= 31200
					M.ki *= 31200
					M.strength *= 31200
					M.defence *= 31200
					M.powerlevel_max *= 31200
					M.ki_max *= 31200
					M.strength_max *= 31200
					M.defence_max *= 31200
					M.zenni *= 200
					M.exp *= 420
					M.tnl *= 420
					M.gotboost=3
			if("Extreme")
				for(var/mob/Saga/M in sagas) if(!M.gotboost)
					M.powerlevel *= 350000
					M.ki *= 350000
					M.strength *= 350000
					M.defence *= 350000
					M.powerlevel_max *= 350000
					M.ki_max *= 350000
					M.strength_max *= 350000
					M.defence_max *= 350000
					M.zenni *= 365
					M.exp *= 600
					M.tnl *= 600
					M.gotboost=4