////////////////////////////////////////////////////////////////
////////////////////////////Sketh///////////////////////////////
///////////////////This is an work-in-progress//////////////////
/////////using what was already provided in the source//////////
///////////////////////and, my own work/////////////////////////
////////////////////////////////////////////////////////////////
var/
 Holiday = 0
 Halloween = 0
 Christmas = 0
 Thanksgiving = 0
 America = 0
 Valentines = 0
area
	outside
		layer = 6
		var
			lit = 1
			icon/Weather
		proc
			SetWeather(WeatherType)
				if(Weather)
					if(istype(Weather,WeatherType)) return
					icon = null
					Weather = null
				if(WeatherType)
					Weather = WeatherType
					icon = Weather
	inside
		luminosity = 1
proc
	SetMood(T as text)
		if(Holiday)return
		switch(T)
			if("Clear")
				for(var/turf/K in world)
					switch(K.type)
						if(/turf/Island_Edge/Island_Edge_005) K.Icon_State("005")
						if(/turf/Island_Edge/Grass_Edge_1) K.Icon_State("grass edge 1")
						if(/turf/Island_Edge/Grass_Edge_2) K.Icon_State("grass edge 2")
						if(/turf/Island_Edge/Grass_Edge_3) K.Icon_State("grass edge 3")
						if(/turf/Island_Edge/Grass_Edge_4) K.Icon_State("grass edge 4")
						if(/turf/Trees/PalmTree1) K.Icon_State("palm tree 1")
						if(/turf/Trees/PalmTree2) K.Icon_State("palm tree 2")
						if(/turf/Trees/PalmTree3) K.Icon_State("palm tree 3")
						if(/turf/Trees/PalmTree4) K.Icon_State("palm tree 4")
						if(/turf/Trees/PalmTree5) K.Icon_State("palm tree 5")
						if(/turf/Trees/PalmTree6) K.Icon_State("palm tree 6")
						if(/turf/Trees/PalmTree7) K.Icon_State("palm tree 7")
						if(/turf/Trees/PalmTree8) K.Icon_State("palm tree 8")
						if(/turf/Trees/OakTree1) K.Icon_State("oak tree 1")
						if(/turf/Trees/OakTree2) K.Icon_State("oak tree 2")
						if(/turf/Trees/OakTree3) K.Icon_State("oak tree 3")
						if(/turf/Trees/OakTree4) K.Icon_State("oak tree 4")
						if(/turf/Trees/OakTree5) K.Icon_State("oak tree 5")
						if(/turf/Trees/OakTree6) K.Icon_State("oak tree 6")
						if(/turf/Trees/Bush) K.Icon_State("bush")
						if(/turf/Trees/Flower) K.Icon_State("flower")
			if("Christmas")
				for(var/turf/K in world)
					switch(K.type)
						if(/turf/Island_Edge/Island_Edge_005) K.Icon_State("005x")
						if(/turf/Island_Edge/Grass_Edge_1) K.Icon_State("grass edge 1x")
						if(/turf/Island_Edge/Grass_Edge_2) K.Icon_State("grass edge 2x")
						if(/turf/Island_Edge/Grass_Edge_3) K.Icon_State("grass edge 3x")
						if(/turf/Island_Edge/Grass_Edge_4) K.Icon_State("grass edge 4x")
						if(/turf/Trees/PalmTree1) K.Icon_State("palm tree 1x")
						if(/turf/Trees/PalmTree2) K.Icon_State("palm tree 2x")
						if(/turf/Trees/PalmTree3) K.Icon_State("palm tree 3x")
						if(/turf/Trees/PalmTree4) K.Icon_State("palm tree 4x")
						if(/turf/Trees/PalmTree5) K.Icon_State("palm tree 5x")
						if(/turf/Trees/PalmTree6) K.Icon_State("palm tree 6x")
						if(/turf/Trees/PalmTree7) K.Icon_State("palm tree 7x")
						if(/turf/Trees/PalmTree8) K.Icon_State("palm tree 8x")
						if(/turf/Trees/OakTree1) K.Icon_State("oak tree 1x")
						if(/turf/Trees/OakTree2) K.Icon_State("oak tree 2x")
						if(/turf/Trees/OakTree3) K.Icon_State("oak tree 3x")
						if(/turf/Trees/OakTree4) K.Icon_State("oak tree 4x")
						if(/turf/Trees/OakTree5) K.Icon_State("oak tree 5x")
						if(/turf/Trees/OakTree6) K.Icon_State("oak tree 6x")
						if(/turf/Trees/Bush) K.Icon_State("bushx")
						if(/turf/Trees/Flower) K.Icon_State("flowerx")
mob/Holiday/verb
	Weather()
		set category = "Server"
		set name = "Change Weather"
		if(Holiday)return
		var/list/choices = list("Cancel","Rain","Snow","Night","Sunny","Clear","Storm")
		var/area/outside/O=locate()
		//for(O in world) break
		if(!O) return
		switch(input("What weather would you like to display?","Weather") in choices)
			if("Cancel") return
			if("Clear") O.SetWeather('blank.dmi')
			if("Sunny") O.SetWeather('sunny.dmi')
			if("Night") O.SetWeather('black50.dmi')
			if("Rain") O.SetWeather('rain.dmi')
			if("Snow") O.SetWeather('snow.dmi')
			if("Storm") O.SetWeather('stormy.dmi')
	Switch()
		set category = "Holiday"
		set name = "Switch Inside/Outside area"
		var/turf/T = loc
		if(!T) return
		if(istype(T.loc,/area/outside))
			T.loc.contents -= T
			var/area/inside/I=locate()
			//for(I in world) break
			if(!I) I = new()
			I.contents += T
			usr<< "This is an <b>inside</b> area now."
		else
			T.loc.contents -= T
			var/area/outside/O=locate()
			//for(O in world) break
			if(!O) O = new()
			O.contents += T
			usr<< "This is an <b>outside</b> area now."
	Halloween()
		set category = "Holiday"
		if(Holiday==0)
			if(Halloween==0)
				var/area/outside/O=locate()
				//for(O in world) break
				if(!O) return
				O.SetWeather('black50.dmi')
				Halloween=1
				var/mob/AI/JackOLantern/N = new
				N.loc = locate(145,62,1)
				Holiday=1
				players<<"<font color=#D81E18>H<font color=#E67529>a<font color=#D81E18>l<font color=#E67529>l<font color=#D81E18>o</font><font color=#E67529>w<font color=#D81E18>e<font color=#E67529>e<font color=#D81E18>n</font color=gray> is here!"
			else usr<<"<center><font color=gray><b><u>Error: Halloween is already on."
	Christmas()
		set category = "Holiday"
		if(Holiday==0)
			if(Christmas==0)
				//SetMood("Christmas")
				var/area/outside/O=locate()
				//for(O in world) break
				if(!O) return
				O.SetWeather('snow.dmi')
				Christmas=1
				var/santa_hat_icon = 'Santa Hat.dmi'
				for(var/mob/AI/M in world) if(istype(M,/mob/AI/)) M.overlays += santa_hat_icon
				var/mob/AI/Santa/N = new
				N.loc = locate(145,62,1)
				Holiday=1
				players<<"<font color=green>C<font color=red>h<font color=green>r<fotn color=red>i<font color=green>s<font color=red>t<font color=green>m<font color=red>a<font color=green>s <font color=white>time!"
			else usr<<"<center><white><b><u>Error: Christmas is already on."
	Thanksgiving()
		set category = "Holiday"
		if(Holiday==0)
			if(Thanksgiving==0)
				var/area/outside/O=locate()
				//for(O in world) break
				if(!O) return
				O.SetWeather('thanksgiving.dmi')
				Thanksgiving=1
				Holiday=1
				players<<"<font color=#F58A1F>T<font color=#E18022>h<font color=#CE7525>a<font color=#BA6B28>n<font color=#A6602C>k<font color=#93562F>s<font color=#7F4B32>g<font color=#835834>i<font color=#876436>v<font color=#8A7137>i<font color=#8E7D39>n<font color=#928A3B>g <font color=white> time!"
			else usr<<"<center><white><b><u>Error: Thanksgiving is already on."
	Valentines()
		set category = "Holiday"
		if(Holiday==0)
			if(Valentines==0)
				var/area/outside/O=locate()
				//for(O in world) break
				if(!O) return
				O.SetWeather('heart.dmi')
				Valentines=1
				Holiday=1
				players<<"<font color=#F971C3>V<font color=#EA4C81>a<font color=#F971C3>l<font color=#EA4C81>e<font color=#F971C3>n<font color=#EA4C81>t<font color=#F971C3>i<font color=#EA4C81>n<font color=#F971C3>e<font color=#EA4C81>s <font color=white>day!"
			else usr<<"<center><white><b><u>Error: Valentines is already on."
	July()
		set category = "Holiday"
		set name = "4th of July"
		if(Holiday==0)
			if(America==0)
				var/area/outside/O
				for(O in world) break
				if(!O) return
				O.SetWeather('america.dmi')
				America=1
				Holiday=1
				players<<"<font color=#F31010>T<font color=#F53232>h<font color=#F65454>e<font color=#F87676> <font color=#FA9999>4<font color=#FCBBBB>t<font color=#FDDDDD>h <font color=#E4DFFE>o<font color=#C9BFFC>f <font color=#947FF9>J<font color=#795FF8>u<font color=#5E3FF6>l<font color=#431FF5>y!"
			else usr<<"<center><white><b><u>Error: 4th of July is already on."
	End_Event()
		set category = "Holiday"
		var/area/outside/O=locate()
		//for(O in world) break
		if(!O) return
		O.SetWeather()
		SetMood("Clear")
		if(Holiday==1)
			if(Christmas==1)
				players<<"<font color=green>C<font color=red>h<font color=green>r<fotn color=red>i<font color=green>s<font color=red>t<font color=green>m<font color=red>a<font color=green>s <font color=white>has ended!"
				Christmas=0
				var/santa_hat_icon = 'Santa Hat.dmi'
				for(var/mob/AI/Y in world)
					Y.overlays -= santa_hat_icon
					if(Y.name=="{Holiday}Santa") del Y
			if(Halloween==1)
				players<<"<font color=#D81E18>H<font color=#E67529>a<font color=#D81E18>l<font color=#E67529>l<font color=#D81E18>o</font><font color=#E67529>w<font color=#D81E18>e<font color=#E67529>e<font color=#D81E18>n <font color=gray>has ended"
				Halloween=0
				for(var/mob/AI/U in world) if(U.name=="{Holiday}Jack-O-Lantern") del U
			if(Valentines==1)
				players<<"<font color=#F971C3>V<font color=#EA4C81>a<font color=#F971C3>l<font color=#EA4C81>e<font color=#F971C3>n<font color=#EA4C81>t<font color=#F971C3>i<font color=#EA4C81>n<font color=#F971C3>e<font color=#EA4C81>s <font color=white>Day has ended"
				Valentines=0
			if(America==1)
				players<<"<font color=#F31010>T<font color=#F53232>h<font color=#F65454>e<font color=#F87676> <font color=#FA9999>4<font color=#FCBBBB>t<font color=#FDDDDD>h <font color=#E4DFFE>o<font color=#C9BFFC>f <font color=#947FF9>J<font color=#795FF8>u<font color=#5E3FF6>l<font color=#431FF5>y <font color=red>has ended"
				America=0
			if(Thanksgiving==1)
				players<<"<font color=#F58A1F>T<font color=#E18022>h<font color=#CE7525>a<font color=#BA6B28>n<font color=#A6602C>k<font color=#93562F>s<font color=#7F4B32>g<font color=#835834>i<font color=#876436>v<font color=#8A7137>i<font color=#8E7D39>n<font color=#928A3B>g <font color=olive>has ended"
				Thanksgiving=0
			Holiday=0
mob
	AI
		JackOLantern
			name = "{Holiday}Jack-O-Lantern"
			icon = 'pumpkin.dmi'
			energy_code = 666666
			verb
				Talk()
					set category = null
					set src in oview(1)
					if(Halloween==1)
						if(usr.punished==0)
							if(usr.karma == "Evil")
								usr.punished = 1
								GiveMedal("Happy Halloween!",usr)
								usr<< "<font color = red>Jack-O-Lantern:</font> <font color=maroon>Well, [usr.name].. Trick OR Treat..."
								usr.contents += new/obj/Equipment/Hands/Trick_Candy
								usr.trick=1
								if(usr.karma_rating >= 80)
									usr<<"<font color=red>Jack-O-Lantern:<font color=maroon> You seem almost as evil as myself...Take this with you, I would like to watch your progress..."
									usr.contents += new/obj/Equipment/Head/Pumpkin_Helmet
									GiveMedal("Trick",usr)
								else usr<< "<font color=red>Jack-O-Lantern:</font> <font color=maroon>Come back after you've caused some chaos!"
							else
								usr.punished=1
								GiveMedal("Happy Halloween!",usr)
								usr<<"<font color = red>Jack-O-Lantern:</font> <font color=maroon>Well, [usr.name]...Trick OR Treat..."
								usr.contents += new/obj/Equipment/Hands/Treat_Candy
								usr.treat=1
								if(usr.karma_rating >= 80)
									usr<<"<font color=red>Jack-O-Lantern:<font color=maroon> You seem innocent...Take this with you, I would like to watch your progress..."
									usr.contents += new/obj/Equipment/Head/Pumpkin_Helmet
									GiveMedal("Treat",usr)
						else usr<< "<font color=red>Jack-O-Lantern:</font> <font color=maroon>I have nothing else for you."
mob
	AI
		Santa
			name = "{Holiday}Santa"
			icon = 'Santa.dmi'
			energy_code = 122514
			verb
				Talk()
					set category = null
					set src in oview(1)
					if(Christmas==1)
						if(usr.karma == "Good")
							if(usr.gifted==0)
								if(usr.karma_rating)
									usr<< "<font color = white>Santa:</font> <font color=green>Ho Ho Ho! Why hello there, [usr.name], <font color=red>I have an gift for you !"
									usr.contents += new/obj/Equipment/Head/Santa_Hat
									usr.gifted = 1
									GiveMedal("Merry Christmas!",usr)
									if(usr.karma_rating >= 80)
										usr<< "<font color = white>Santa:</font> <font color=red>Well well! Its seems you have been VERY good this year...<font color=green> I have something special for you..."
										usr.contents += new/obj/Equipment/Chest/Santa_suit
								else usr<<"<font color=white>Santa: <font color=green> [usr.name], come	see me once your <font color=red>karma raises alittle more."
							else usr<< "<font color=white>Santa:</font> <font color=red>Now [usr.name]... You've already gotten your gift.<font color=green> Don't be greedy or you might not be on the nice list next year."
						else
							if(usr.gifted==0)
								/*usr<< "<font color=white>Santa:</font><font color=green> Well [usr.name]... you havn't been very nice this year ."*/
								usr.gifted = 1
								GiveMedal("Merry Christmas!",usr)
								/*if(usr.karma_rating >= 80)
									usr<< "<font color=white>Santa:<font color=red> It seems you have been a very naughty child this year [usr.name]... <font color=green>I have something very special for you..."*/