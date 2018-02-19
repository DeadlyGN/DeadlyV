mob/proc/capes_sales()
	var/obj/Equipment/Shoulders/Custom_Cape/E = new
	var/obj/Equipment/Shoulders/Cape/O = new
	var/cost = 5000
	switch(input("What color of capes do you want to buy? [cost]Z per Cape.\n An additional 20% for a dye.")in list("Black","Blue","Green","Red","Purple","Gold","Orange","Pink","White","Custom","Never Mind"))
		if("Custom")
			cost *= 1.2
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Custom Cape.dmi'
				var/customcolor=input("What color cloak would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				E.icon = h1
				E.name = "Custom Cape"
				E.cape = h1
				usr.contents += E
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Black Cape.dmi'
				O.capes = 'Black Cape.dmi'
				O.name = "Black Cape"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Blue Cape.dmi'
				O.capes = 'Blue Cape.dmi'
				O.name = "Blue Cape"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Green Cape.dmi'
				O.capes = 'Green Cape.dmi'
				O.name = "Green Cape"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Red Cape.dmi'
				O.capes = 'Red Cape.dmi'
				O.name = "Red Cape"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Purple")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Purple Cape.dmi'
				O.capes = 'Purple Cape.dmi'
				O.name = "Purple Cape"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Gold")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Gold Cape.dmi'
				O.capes = 'Gold Cape.dmi'
				O.name = "Gold Cape"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Orange")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Orange Cape.dmi'
				O.capes = 'Orange Cape.dmi'
				O.name = "Orange Cape"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Pink")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Pink Cape.dmi'
				O.capes = 'Pink Cape.dmi'
				O.name = "Pink Cape"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'White Cape.dmi'
				O.capes = 'White Cape.dmi'
				O.name = "White Cape"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"