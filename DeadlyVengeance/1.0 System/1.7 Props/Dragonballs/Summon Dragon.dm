var
	Shenron = {"<html><b><font color = white><body bgcolor=black><center><b><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/Shenron.jpg></img>"}
	Porunga = {"<html><b><font color = white><body bgcolor=black><center><b><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/porunga.jpg></img>"}
	ASDragon = {"<html><b><font color = white><body bgcolor=black><center><b><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/ASDragon.jpg></img>"}
	BSShenron = {"<html><b><font color = white><body bgcolor=black><center><b><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/BlackStarShenron.jpg></img>"}
mob/proc
	Summon_Dragon()
		if(src.wishes < 5)
			if(src.e_db_1 && src.e_db_2 && src.e_db_3 && src.e_db_4 && src.e_db_5 && src.e_db_6 && src.e_db_7)
				for(var/obj/Dragonballs/O in src){ if(findtext(O.name,"Earth")){ del O }}
				src.e_db_1 = 0
				src.e_db_2 = 0
				src.e_db_3 = 0
				src.e_db_4 = 0
				src.e_db_5 = 0
				src.e_db_6 = 0
				src.e_db_7 = 0
				players << "<font color = green>The Sky Darkens on Earth as Shenron is summoned!</font>"
				src<< browse(Shenron,"display=0")
				src<< 'ShenronWish.wav'
				src<< browse("<body bgcolor=\"black\"><center><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/Shenron.jpg><p><font color = \"yellow\" size = 4>You Have Summoned Shenron! </center>")
				while(1)
					switch(input("What is your wish?", "", text) in list ("Zenni","Level","Power","Good Karma","Evil Karma","Change EC","Medal"))
						if("Change EC")
							src.energy_code = rand(0000001,9999999)
							src<< "Your new energy code is <font color=green>[src.energy_code]</font>!"
						if("Medal")
							if(!GiveMedal("Shenron Grants",src))
								src<<"You're unable to obtain this medal!"
								continue
						if("Evil Karma")
							var/karmab=10
							if(karma!="Evil")
								if(karma_rating<karmab)
									karmab-=karma_rating
									karma_rating=karmab
									karma = "Evil"
								else karma_rating-=karmab
							else karma_rating += karmab
						if("Good Karma")
							var/karmab=10
							if(karma!="Good")
								if(karma_rating<karmab)
									karmab-=karma_rating
									karma_rating=karmab
									karma = "Good"
								else karma_rating-=karmab
							else karma_rating += karmab
						if("Zenni")
							src.zenni += 8500
						if("Level")
							src.Give_Levels(5000,"Dragonballs")
						if("Power")
							var/pboost = rand(100000,2000000)
							src<< "<font color=white>Shenron: </font>You gained <font color =white>[pboost]</font> power!"
							src.powerlevel_max += pboost
					break
				src.wishes ++
				src<< browse("<br>[PlayerRules]")
				spawn() alert(usr,"Shenron: Your wish has been granted!")
				players << "<font color = green>The sky turns to it's normal color as Shenron grants the wish and departs from Earth!</font>"
				src<< 'ShenronGrants.wav'
		else alert(usr,"Shenron: You have used all your wishes up!")
	//********************************************************************************************//
	//********************************************************************************************//
	//************************************Namekian Dragonballs************************************//
	//********************************************************************************************//
	//********************************************************************************************//
	Summon_Porunga()
		if(src.namek_wishes < 3)
			if(src.n_db_1 && src.n_db_2 && src.n_db_3 && src.n_db_4 && src.n_db_5 && src.n_db_6 && src.n_db_7)
				for(var/obj/Dragonballs/O in src){ if(findtext(O.name,"Namek")){ del O }}
				src.n_db_1 = 0
				src.n_db_2 = 0
				src.n_db_3 = 0
				src.n_db_4 = 0
				src.n_db_5 = 0
				src.n_db_6 = 0
				src.n_db_7 = 0
				players << "<font color = green>The Sky Darkens on Namek as Porunga is summoned!</font>"
				src<< browse(Porunga,"display=0")
				src<< 'PorungaWish.wav'
				src<< browse("<body bgcolor=\"black\"><center><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/porunga.jpg><p><font color = \"yellow\" size = 4>You Have Summoned Porunga! </center>")
				while(1)
					switch(input("What is your wish?", "", text) in list ("Zenni","Level","Power","Training Points","Good Karma","Evil Karma","Medal"))
						if("Zenni")
							src.zenni += 12500
						if("Evil Karma")
							var/karmab=15
							if(karma!="Evil")
								if(karma_rating<karmab)
									karmab-=karma_rating
									karma_rating=karmab
									karma = "Evil"
								else karma_rating-=karmab
							else karma_rating += karmab
						if("Medal")
							if(!GiveMedal("Porunga Grants",src))
								src<<"You're unable to obtain this medal!"
								continue
						if("Good Karma")
							var/karmab=15
							if(karma!="Good")
								if(karma_rating<karmab)
									karmab-=karma_rating
									karma_rating=karmab
									karma = "Good"
								else karma_rating-=karmab
							else karma_rating += karmab
						if("Level")
							src.Give_Levels(10000,"Dragonballs")
						if("Training Points")
							src.tp += rand(300000,6000000)
						if("Power")
							var/pboost = rand(250000,4500000)
							src.powerlevel_max += pboost
							src<< "<font color=white>Shinron: </font>You gained <font color =white>[pboost]</font> power!"
					break
				src.namek_wishes ++
				src<< browse("<br>[PlayerRules]")
				players << "<font color = green>The sky turns to it's normal color as Porunga grants the wish and departs from Namek!</font>"
				spawn() alert(usr,"Porunga: Your wish has been granted!")
				src<< 'PorungaWishGranted.wav'
		else alert(usr,"Porunga: You have used all your wishes up!")
	//********************************************************************************************//
	//********************************************************************************************//
	//************************************Black Star Dragonballs**********************************//
	//********************************************************************************************//
	//********************************************************************************************//
	Summon_Omega_Shenron()
		if(src.bs_wishes < 3)
			if(src.bs_db_1 && src.bs_db_2 && src.bs_db_3 && src.bs_db_4 && src.bs_db_5 && src.bs_db_6 && src.bs_db_7)
				for(var/obj/Dragonballs/O in src){ if(findtext(O.name,"Black")){ del O }}
				src.bs_db_1 = 0
				src.bs_db_2 = 0
				src.bs_db_3 = 0
				src.bs_db_4 = 0
				src.bs_db_5 = 0
				src.bs_db_6 = 0
				src.bs_db_7 = 0
				players << "<font color = gray>The Sky Darkens Over The Whole Universe as Black Star Shenron is Summoned!</font>"
				src<< browse(BSShenron,"display=0")
				src<< 'BlackStarShenronWish.wav'
				src<< browse("<body bgcolor=\"black\"><center><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/BlackStarShenron.jpg><p><font color = \"red\" size = 4>You Have Summoned Shinron! </center>")
				while(1)
					switch(input("What is your wish?", "", text) in list ("Zenni","Level","Power","Training Points","Change EC","Good Karma","Evil Karma","Medal"))
						if("Zenni")
							src.zenni += 75000
						if("Level")
							src.Give_Levels(20000,"Dragonballs")
						if("Medal")
							if(!GiveMedal("Omega Shenron's Nightmire",src))
								src<<"You're unable to obtain this medal!"
								continue
						if("Training Points")
							var/tpboost = rand(1000000,5000000)
							src.tp += tpboost
						if("Power")
							var/pboost = rand(10000000,200000000)
							src<< "<font color=white>Shinron: </font>You gained <font color =white>[pboost]</font> power!"
							src.powerlevel_max += pboost
						if("Change EC")
							src.energy_code = rand(000001,999999)
						if("Evil Karma")
							var/karmab=20
							if(karma!="Evil")
								if(karma_rating<karmab)
									karmab-=karma_rating
									karma_rating=karmab
									karma = "Evil"
								else karma_rating-=karmab
							else karma_rating += karmab
						if("Good Karma")
							var/karmab=20
							if(karma!="Good")
								if(karma_rating<karmab)
									karmab-=karma_rating
									karma_rating=karmab
									karma = "Good"
								else karma_rating-=karmab
							else karma_rating += karmab
					break
				src<< browse("<br>[PlayerRules]")
				players << "<font color = gray>The sky clams as Black Star Shenron departs!</font>"
				src.bs_wishes ++
				spawn() alert(usr,"Black Star Shenron: Your wish has been granted!")
				src<< 'BlackStarShenronWishGranted.wav'
		else alert(usr,"Black Star Shenron: You have used all your wishes up!")
	Summon_the_All_Star_Dragon()
		if(src.as_wishes < 2)
			if(src.as_db_1 && src.as_db_2 && src.as_db_3 && src.as_db_4 && src.as_db_5 && src.as_db_6 && src.as_db_7)
				for(var/obj/Dragonballs/O in src){ if(findtext(O.name,"All Star")){ del O }}
				src.as_db_1 = 0
				src.as_db_2 = 0
				src.as_db_3 = 0
				src.as_db_4 = 0
				src.as_db_5 = 0
				src.as_db_6 = 0
				src.as_db_7 = 0
				players << "<font color = aqua>The Sky lights up around the universe as the All Star Dragon is Summoned!</font>"
				src<< browse(ASDragon,"display=0")
				src<< browse("<body bgcolor=\"black\"><center><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/ASDragon.jpg><p><font color = \"yellow\" size = 4>You Have Summoned the All Star Dragon! </center>")
				while(1)
					switch(input("What is your wish?", "", text) in list ("Zenni","Level","Power","Training Points","Good Karma","Evil Karma","Medal"))
						if("Zenni")
							src.zenni += 150000
						if("Level")
							src.Give_Levels(50000,"Dragonballs")
						if("Medal")
							if(!GiveMedal("Wish upon a...All Star?",src))
								src<<"You're unable to obtain this medal!"
								continue
						if("Training Points")
							var/tpboost = rand(5000000,9000000)
							src.tp += tpboost
						if("Power")
							var/pboost = rand(50000000,600000000)
							src<< "<font color=white>All Star Dragon: </font>You gained <font color =white>[pboost]</font> power!"
							src.powerlevel_max += pboost
						if("Evil Karma")
							var/karmab=30
							if(karma!="Evil")
								if(karma_rating<karmab)
									karmab-=karma_rating
									karma_rating=karmab
									karma = "Evil"
								else karma_rating-=karmab
							else karma_rating += karmab
						if("Good Karma")
							var/karmab=30
							if(karma!="Good")
								if(karma_rating<karmab)
									karmab-=karma_rating
									karma_rating=karmab
									karma = "Good"
								else karma_rating-=karmab
							else karma_rating += karmab
					break
				src.as_wishes ++
				players << "<font color = aqua>The sky calms as the All Star Dragon departs!</font>"
				src<< browse("<br>[PlayerRules]")
				spawn() alert(usr,"All Star Dragon: Your wish has been granted!")
		else alert(usr,"All Star Dragon: You have used all your wishes up!")