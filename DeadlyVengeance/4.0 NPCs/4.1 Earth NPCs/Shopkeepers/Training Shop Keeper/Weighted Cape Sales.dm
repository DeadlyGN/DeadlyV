mob/proc/wcape_sales()
	var/obj/Equipment/Shoulders/Weighted_Cape/O=new
	var/obj/Equipment/Shoulders/Custom_Weighted_Cape/E=new
	var/cost = 35000
	if(src.threaten_training == "Success")
		cost /= 2
	if(src.threaten_training == "Failure")
		cost *= 2
	switch(input("What type of Cape do you want to buy for [cost] Zenni?.\n An additional 20% for a dye.")in list("Black Weighted Cape","Blue Weighted Cape","Green Weighted Cape","Red Weighted Cape","Pink Weighted Cape","White Weighted Cape","Custom","Never Mind"))
		if("Custom")
			cost *= 1.2
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Black Cape.dmi'
				var/customcolor=input("What color cape would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				E.icon = h1
				E.name = "Custom Weighted Cape"
				E.wcape = h1
				usr.contents += E
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				usr.inven_min ++
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Black Cape.dmi'
				O.wcape = 'Black Cape.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Blue Cape.dmi'
				O.wcape = 'Blue Cape.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Green Cape.dmi'
				O.wcape = 'Green Cape.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Red Cape.dmi'
				O.wcape = 'Red Cape.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Pink Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Pink Cape.dmi'
				O.wcape = 'Pink Cape.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'White Cape.dmi'
				O.wcape = 'White Cape.dmi'
				O.level = 1
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
mob/proc/wcape_sales2()
	var/obj/Equipment/Shoulders/Custom_Weighted_Cape/E=new
	var/obj/Equipment/Shoulders/Weighted_Cape/O=new
	var/cost = 55000
	if(src.threaten_training == "Success")
		cost = cost / 2
	if(src.threaten_training == "Failure")
		cost = cost * 2
	switch(input("What type of Cape do you want to buy?.\n An additional 20% for a dye.")in list("Black Weighted Cape","Blue Weighted Cape","Green Weighted Cape","Red Weighted Cape","Pink Weighted Cape","White Weighted Cape","Custom","Never Mind"))
		if("Custom")
			cost *= 1.2
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Black Cape.dmi'
				var/customcolor=input("What color cape would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				E.icon = h1
				E.name = "Custom Weighted Cape"
				E.level = 2
				E.wcape = h1
				usr.contents += E
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Black Cape.dmi'
				O.wcape = 'Black Cape.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Blue Cape.dmi'
				O.wcape = 'Blue Cape.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Green Cape.dmi'
				O.wcape = 'Green Cape.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Red Cape.dmi'
				O.wcape = 'Red Cape.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Pink Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Pink Cape.dmi'
				O.wcape = 'Pink Cape.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White Weighted Cape")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'White Cape.dmi'
				O.wcape = 'White Cape.dmi'
				O.level = 2
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"