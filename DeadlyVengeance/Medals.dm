mob/var
	raditz_wins=0
	nappa_wins=0
	stylest=0
	vegeta_wins=0
	burter_wins=0
	popo_medal=0
	captain_ginyu_wins=0
	guldo_wins=0
	jeice_wins=0
	recoom_wins=0
	trick=0
	treat=0
	frieza_wins=0
	king_cold_wins=0
	guildlisten=0
	whisperlisten=0
	android_16_wins=0
	android_17_wins=0
	android_18_wins=0
	cell_wins=0
	suicidal=0
	tmp/save_filec=0
	perfect_cell_wins=0
	checkingmedals
	majin_buu_wins=0
	kid_buu_wins=1
	salone=0
	Z_Fighter_wins=0
	Z_killer_wins=0
	kills3=0
	tournywin=0
	gifted=0
	punished=0
	Tapion_done=0
	gooda=0
	goodb=0
	goneafk=0
	saylisten=0
	backafk=0
	rejected=0
	lost=0
	tails=0
	Sec=0
	Mins=0
	Hrs=0
	popular=0
	sponser=0
	forum=0
	havefuse=0
	demon=0
	goku_wins=0
	piccolo_wins=0
	yamcha_wins=0
	tien_wins=0
	krillin_wins=0
	gohan_wins=0
	choutzu_wins=0
	SSJ_goku_wins=0
	trunks_wins=0
	gotenks_wins=0
	vegito_wins=0
	bebi_wins=0
	g_ape_wins=0
	bebi_vegeta_wins=0
	ssj4_goku_wins=0
	goten_wins=0
	majuub_wins=0
	know=0
	tmp/afk=0
	eatend=0
mob
	proc
		Watchdeath()
			if(src.witness_deaths>12) GiveMedal("Anger Management",src)
		FSMedal()
			if(src.sponser&&src.forum) GiveMedal("Web Seeker",src)
		UTBA()
			if(src.gooda>=10) GiveMedal("Untouchable",src)
			src.goodb = gooda/10
		Gokus()
			if(src.deaths >=200) GiveMedal("Goku's Style",src)
		LooseK()
			if(src.kills+src.pkills >=1000) GiveMedal("Loose Killer",src)
		Arena_winsM()
			if(src.arena_wins >=50) GiveMedal("Fighter",src)
		Good_Sagas_fin()
			if(src.raditz_wins <=0||src.vegeta_wins <=0||src.nappa_wins <=0||src.burter_wins <=0) return
			if(src.captain_ginyu_wins <=0||src.guldo_wins <=0||src.jeice_wins <=0||src.recoom_wins <=0||src.frieza_wins <=0||src.king_cold_wins <=0||src.android_16_wins <=0) return
			if(src.android_17_wins <=0||src.android_18_wins <=0||src.cell_wins <=0||src.perfect_cell_wins <=0||src.majin_buu_wins <=1||src.kid_buu_wins <=0) return
			GiveMedal("Z-Fighter",src)
			src.Z_Fighter_wins+=1
		Evil_Sagas_fin()
			if(src.goku_wins<2||src.piccolo_wins<2||src.yamcha_wins<2||src.tien_wins<2) return
			if(src.krillin_wins <=1||src.gohan_wins <=1||src.choutzu_wins <=0||src.vegeta_wins <=1) return
			if(src.SSJ_goku_wins <=0||src.trunks_wins <=1||src.gotenks_wins <=0||src.vegito_wins <=0) return
			GiveMedal("Z-Killer",src)
			src.Z_killer_wins+=1
		GT_Sagas_fin()
			if(src.goten_wins&&src.ssj4_goku_wins&&src.majuub_wins)
				GiveMedal("GTer",src)
			if(src.bebi_wins&&src.bebi_vegeta_wins>1&&src.g_ape_wins)
				GiveMedal("GTer",src)
		Time()
			set background=1
			while(src)
				sleep(600)
				src.Mins+=1
				src.Time2()
		Time2()
			set background=1
			while(src.Mins>=60)
				src.Hrs+=1
				src.Mins-=60
			src.Time3()
		Time3()
			set background=1
			if(src.Hrs==80) GiveMedal("Nothing But Time",src)