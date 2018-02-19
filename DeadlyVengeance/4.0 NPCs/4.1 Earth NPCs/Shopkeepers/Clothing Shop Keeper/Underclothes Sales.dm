mob/proc/underclothes_sales()
	var/obj/Equipment/Underclothing/Custom_Underclothes/E=new
	var/obj/Equipment/Underclothing/Underclothes/O=new
	var/cost = 5000
	switch(input("What color Underclothing do you want to buy? [cost]Z per Underclothing.\n An additional 20% for a dye.")in list("Black","Blue","Green","Red","Purple","Gold","Orange","Pink","White","Custom","Never Mind"))
		if("Custom")
			cost *= 1.2
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Custom Under.dmi'
				var/customcolor=input("What color cloak would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				E.icon = h1
				E.name = "Custom Underclothes"
				E.UNDER = h1
				usr.contents += E
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Black Under.dmi'
				O.UNDER = 'Black Under.dmi'
				O.name = "Black Underclothes"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Blue Under.dmi'
				O.UNDER = 'Blue Under.dmi'
				O.name = "Blue Underclothes"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Green Under.dmi'
				O.UNDER = 'Green Under.dmi'
				O.name = "Green Underclothes"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Red Under.dmi'
				O.UNDER = 'Red Under.dmi'
				O.name = "Red Underclothes"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Purple")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Purple Under.dmi'
				O.UNDER = 'Purple Under.dmi'
				O.name = "Purple Underclothes"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Gold")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Gold Under.dmi'
				O.UNDER = 'Gold Under.dmi'
				O.name = "Gold Underclothes"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Orange")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Orange Under.dmi'
				O.UNDER = 'Orange Under.dmi'
				O.name = "Orange Underclothes"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Pink")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Pink Under.dmi'
				O.UNDER = 'Pink Under.dmi'
				O.name = "Pink Underclothes"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'White Under.dmi'
				O.UNDER = 'White Under.dmi'
				O.name = "White Underclothes"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"