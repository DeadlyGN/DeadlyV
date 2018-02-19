mob/var/tmp/trans_delay = 0
obj/Transform/Transform
	verb
		Transform()
			set category = "Combat"
			if(usr.monkey)
				usr<< "\blue Error: \font You cannot Transform whilst oozaru"
				return
			if(usr.form=="Ranger")
				usr<<"You shouldn't transform while in your Ranger state."
				return
			if(usr.doing)
				usr<< "You're already doing something!"
				return
			if(usr.rest)
				usr<< "You cannot Transform whilst resting!"
				return
			if(usr.trans_delay)
				usr<< "You body is still recovering from Transforming!"
				return
			if(usr.boxing)
				usr<< "You cannot Transform whilst self training!"
				return
			if(usr.form=="Inverted")
				usr<<"You cannot trans while inverted!"
				return
			if(usr.kaioken)
				usr<< "You relax your Kaioken state"
				usr.underlays -= kaio_aura
				usr.underlays -= kaio_aura
				usr.aura_on = 0
				usr.kaioken = 0
				usr.Power_Redefine()
			switch(usr.race)
				if("Namek")
					if("pl_buff" in usr.buffs||"def_buff" in usr.buffs||"str_buff" in usr.buffs)
						usr<< "You cannot Transform whilst you're Buffed!"
						return
					usr.Namek_Trans()
				if("Half Saiyan")
					usr.Half_Saiyan_Trans()
				if("Majin")
					if("pl_buff" in usr.buffs||"def_buff" in usr.buffs||"str_buff" in usr.buffs)
						usr<< "You cannot Transform whilst you're Buffed!"
						return
					usr.Majin_Trans()
				if("Changling") if(!usr.metal_converted) usr.Changling_Trans()
				if("Saiyan") usr.Saiyan_Trans()
				if("Pikkon") usr.Pikkon_Trans()
				if("Xicor") usr.Xicor_Trans()
				if("Hybrid") usr.Hybrid_Trans()
				if("Vampire") usr.Vampire_Trans()
				if("Konats") usr.Konats_Trans()
				if("Cooler") if(!usr.metal_converted) usr.Cooler_Trans()
				if("Uub") usr.Uub_Trans()
				if("Human") usr.Human_Trans()
				if("Tuffle") usr.Tuffle_Trans()
				if("Bio-Android") usr.Bio_Trans()
				if("Demon") usr.Demon_Trans()
				if("Android") usr.Android_Trans()
				if("Bojack") usr.Bojack_Trans()
				if("Dragon") usr.Dragon_Trans()
				if("Saibaman") usr.Saibaman_Trans()
				if("Kai") usr.Kai_Trans()
				if("Dark Angel") usr.Dark_Angel_Trans()
				if("Legend") usr.Legend_Trans()
				if("All Star") usr.All_Star_Trans()
				if("Makenshi") usr.Makenshi_Trans()
				if("Dark Neo") usr.Neo_Trans()
				if("Bardock") usr.Bardock_Trans()
				if("Evil Saiyan") usr.Evil_Trans()
				if("Nightmire Dragon") usr.NightDra_Trans()
				if("Slayer") usr.Slayer_Trans()
				if("Bio Warrior") usr.Bio_W_Trans()
				if("Jester") usr.Jester_Trans()
				if("Burter") usr.Burter_Trans()
			usr.overlays-=usr.coloredhair
			usr.afk_time = 0