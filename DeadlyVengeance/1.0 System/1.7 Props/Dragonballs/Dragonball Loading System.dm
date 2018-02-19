proc
	dragonball_loader_all()
		dragonball_loadere_all()
		dragonball_loadern_all()
		dragonball_loaderbs_all()
		dragonball_loaderas_all()
	dragonball_loadere_all()
		dragonball_loader()
		dragonball_loader2()
		dragonball_loader3()
		dragonball_loader4()
		dragonball_loader5()
		dragonball_loader6()
		dragonball_loader7()
	dragonball_loader()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs1[rand(1,available_locs1.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Earth/Earth_Dragonball_1/bs1 in EarthBalls)
				if(bs1) dragonballcount++
				if(dragonballcount>1)
					del(bs1)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Earth/Earth_Dragonball_1(T)
	dragonball_loader2()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs1[rand(1,available_locs1.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Earth/Earth_Dragonball_2/bs2 in EarthBalls)
				if(bs2) dragonballcount++
				if(dragonballcount>1)
					del(bs2)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Earth/Earth_Dragonball_2(T)
	dragonball_loader3()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs1[rand(1,available_locs1.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Earth/Earth_Dragonball_3/bs3 in EarthBalls)
				if(bs3) dragonballcount++
				if(dragonballcount>1)
					del(bs3)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Earth/Earth_Dragonball_3(T)
	dragonball_loader4()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs1[rand(1,available_locs1.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Earth/Earth_Dragonball_4/bs4 in EarthBalls)
				if(bs4) dragonballcount++
				if(dragonballcount>1)
					del(bs4)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Earth/Earth_Dragonball_4(T)
	dragonball_loader5()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs1[rand(1,available_locs1.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Earth/Earth_Dragonball_5/bs5 in EarthBalls)
				if(bs5) dragonballcount++
				if(dragonballcount>1)
					del(bs5)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Earth/Earth_Dragonball_5(T)
	dragonball_loader6()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs1[rand(1,available_locs1.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Earth/Earth_Dragonball_6/bs6 in EarthBalls)
				if(bs6) dragonballcount++
				if(dragonballcount>1)
					del(bs6)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Earth/Earth_Dragonball_6(T)
	dragonball_loader7()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs1[rand(1,available_locs1.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Earth/Earth_Dragonball_7/bs7 in EarthBalls)
				if(bs7) dragonballcount++
				if(dragonballcount>1)
					del(bs7)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Earth/Earth_Dragonball_7(T)
		players << "<font face=arial narrow><Font color=blue>The dragonballs have been revived on Earth!"
	dragonball_loadern_all()
		dragonball_loadern()
		dragonball_loadern2()
		dragonball_loadern3()
		dragonball_loadern4()
		dragonball_loadern5()
		dragonball_loadern6()
		dragonball_loadern7()
	dragonball_loadern()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs2[rand(1,available_locs2.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Namek/Namek_Dragonball_1/bs1 in NamekBalls)
				if(bs1) dragonballcount++
				if(dragonballcount>1)
					del(bs1)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Namek/Namek_Dragonball_1(T)
	dragonball_loadern2()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs2[rand(1,available_locs2.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Namek/Namek_Dragonball_2/bs2 in NamekBalls)
				if(bs2) dragonballcount++
				if(dragonballcount>1)
					del(bs2)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Namek/Namek_Dragonball_2(T)
	dragonball_loadern3()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs2[rand(1,available_locs2.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Namek/Namek_Dragonball_3/bs3 in NamekBalls)
				if(bs3) dragonballcount++
				if(dragonballcount>1)
					del(bs3)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Namek/Namek_Dragonball_3(T)
	dragonball_loadern4()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs2[rand(1,available_locs2.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Namek/Namek_Dragonball_4/bs4 in NamekBalls)
				if(bs4) dragonballcount++
				if(dragonballcount>1)
					del(bs4)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Namek/Namek_Dragonball_4(T)
	dragonball_loadern5()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs2[rand(1,available_locs2.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Namek/Namek_Dragonball_5/bs5 in NamekBalls)
				if(bs5) dragonballcount++
				if(dragonballcount>1)
					del(bs5)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Namek/Namek_Dragonball_5(T)
	dragonball_loadern6()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs2[rand(1,available_locs2.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Namek/Namek_Dragonball_6/bs6 in NamekBalls)
				if(bs6) dragonballcount++
				if(dragonballcount>1)
					del(bs6)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Namek/Namek_Dragonball_6(T)
	dragonball_loadern7()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=available_locs2[rand(1,available_locs2.len)]
			var/dragonballcount= 0
			for(var/obj/Dragonballs/Namek/Namek_Dragonball_7/bs7 in NamekBalls)
				if(bs7) dragonballcount++
				if(dragonballcount>1)
					del(bs7)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/Namek/Namek_Dragonball_7(T)
		players << "<font face=arial narrow><Font color=lime>The dragonballs have been revived on Namek!"
	dragonball_loaderbs_all()
		dragonball_loaderbs()
		dragonball_loaderbs2()
		dragonball_loaderbs3()
		dragonball_loaderbs4()
		dragonball_loaderbs5()
		dragonball_loaderbs6()
		dragonball_loaderbs7()
	dragonball_loaderbs()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_1/bs1 in BSBalls)
				if(bs1) dragonballcount++
				if(dragonballcount>1)
					del(bs1)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/BlackStar/Black_Star_Dragonball_1(T)
	dragonball_loaderbs2()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_2/bs2 in BSBalls)
				if(bs2) dragonballcount++
				if(dragonballcount>1)
					del(bs2)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/BlackStar/Black_Star_Dragonball_2(T)
	dragonball_loaderbs3()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_3/bs3 in BSBalls)
				if(bs3) dragonballcount++
				if(dragonballcount>1)
					del(bs3)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/BlackStar/Black_Star_Dragonball_3(T)
	dragonball_loaderbs4()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_4/bs4 in BSBalls)
				if(bs4) dragonballcount++
				if(dragonballcount>1)
					del(bs4)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/BlackStar/Black_Star_Dragonball_4(T)
	dragonball_loaderbs5()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_5/bs5 in BSBalls)
				if(bs5) dragonballcount++
				if(dragonballcount>1)
					del(bs5)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/BlackStar/Black_Star_Dragonball_5(T)
	dragonball_loaderbs6()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_6/bs6 in BSBalls)
				if(bs6) dragonballcount++
				if(dragonballcount>1)
					del(bs6)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/BlackStar/Black_Star_Dragonball_6(T)
	dragonball_loaderbs7()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_7/bs7 in BSBalls)
				if(bs7) dragonballcount++
				if(dragonballcount>1)
					del(bs7)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/BlackStar/Black_Star_Dragonball_7(T)
		players << "<font face=arial narrow><Font color=gray>The Black Star DragonBalls have been revived!"
	dragonball_loaderas_all()
		dragonball_loaderas()
		dragonball_loaderas2()
		dragonball_loaderas3()
		dragonball_loaderas4()
		dragonball_loaderas5()
		dragonball_loaderas6()
		dragonball_loaderas7()
	dragonball_loaderas()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2,available_locs3))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_1/bs1 in ASBalls)
				if(bs1) dragonballcount++
				if(dragonballcount>1)
					del(bs1)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/AllStar/All_Star_Dragonball_1(T)
	dragonball_loaderas2()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2,available_locs3))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_2/bs2 in ASBalls)
				if(bs2) dragonballcount++
				if(dragonballcount>1)
					del(bs2)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/AllStar/All_Star_Dragonball_2(T)
	dragonball_loaderas3()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2,available_locs3))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_3/bs3 in ASBalls)
				if(bs3) dragonballcount++
				if(dragonballcount>1)
					del(bs3)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/AllStar/All_Star_Dragonball_3(T)
	dragonball_loaderas4()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2,available_locs3))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_4/bs4 in ASBalls)
				if(bs4) dragonballcount++
				if(dragonballcount>1)
					del(bs4)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/AllStar/All_Star_Dragonball_4(T)
	dragonball_loaderas5()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2,available_locs3))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_5/bs5 in ASBalls)
				if(bs5) dragonballcount++
				if(dragonballcount>1)
					del(bs5)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/AllStar/All_Star_Dragonball_5(T)
	dragonball_loaderas6()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2,available_locs3))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_6/bs6 in ASBalls)
				if(bs6) dragonballcount++
				if(dragonballcount>1)
					del(bs6)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/AllStar/All_Star_Dragonball_6(T)
	dragonball_loaderas7()
		spawn(1) for(var/Balls=1,Balls>0,Balls--)
			var/turf/T=pick(pick(available_locs1,available_locs2,available_locs3))
			var/dragonballcount= 0
			for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_7/bs7 in ASBalls)
				if(bs7) dragonballcount++
				if(dragonballcount>1)
					del(bs7)
					dragonballcount--
			if(!dragonballcount) new/obj/Dragonballs/AllStar/All_Star_Dragonball_7(T)
		players << "<font face=arial narrow><Font color=aqua>The All Star DragonBalls have been revived!"