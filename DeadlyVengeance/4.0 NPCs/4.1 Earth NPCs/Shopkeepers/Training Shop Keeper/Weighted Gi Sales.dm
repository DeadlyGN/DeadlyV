mob/proc/wgi_sales()
	var/obj/Equipment/Chest/Custom_Weighted_Gi/E=new
	var/obj/Equipment/Chest/Weighted_Gi/O=new
	var/cost = 35000
	if(src.threaten_training == "Success")
		cost /= 2
	if(src.threaten_training == "Failure")
		cost *= 2
	switch(input("What type of Gi do you want to buy for [cost] Zenni?.\n An additional 20% for a dye.")in list("Black Weighted Gi","Blue Weighted Gi","Green Weighted Gi","Red Weighted Gi","Pink Weighted Gi","White Weighted Gi","Custom","Never Mind"))
		if("Custom")
			cost *= 1.2
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Black Gi.dmi'
				var/customcolor=input("What color cloak would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				E.icon = h1
				E.name = "Custom Weighted Gi"
				E.wgi = h1
				usr.contents += E
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Black Gi.dmi'
				O.wgi = 'Black Gi.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Blue Gi.dmi'
				O.wgi = 'Blue Gi.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Green Gi.dmi'
				O.wgi = 'Green Gi.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Red Gi.dmi'
				O.wgi = 'Red Gi.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Pink Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Pink Gi.dmi'
				O.wgi = 'Pink Gi.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'White Gi.dmi'
				O.wgi = 'White Gi.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
mob/proc/wgi_sales2()
	var/obj/Equipment/Chest/Custom_Weighted_Gi/E=new
	var/obj/Equipment/Chest/Weighted_Gi/O=new
	var/cost = 85000
	if(src.threaten_training_2 == "Success")
		cost = cost / 2
	if(src.threaten_training_2 == "Failure")
		cost = cost * 2
	switch(input("What type of Gi do you want to buy for [cost] Zenni?.\n An additional 20% for a dye.")in list("Black Weighted Gi","Blue Weighted Gi","Green Weighted Gi","Red Weighted Gi","Pink Weighted Gi","White Weighted Gi","Custom","Never Mind"))
		if("Custom")
			cost *= 1.2
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Black Gi.dmi'
				var/customcolor=input("What color gi would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				E.icon = h1
				E.name = "Custom Weighted Gi"
				E.level = 2
				E.wgi = h1
				usr.contents += E
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				usr.inven_min ++
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Black Gi.dmi'
				O.wgi = 'Black Gi.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Blue Gi.dmi'
				O.wgi = 'Blue Gi.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Green Gi.dmi'
				O.wgi = 'Green Gi.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Red Gi.dmi'
				O.wgi = 'Red Gi.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Pink Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Pink Gi.dmi'
				O.wgi = 'Pink Gi.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White Weighted Gi")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'White Gi.dmi'
				O.wgi = 'White Gi.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"