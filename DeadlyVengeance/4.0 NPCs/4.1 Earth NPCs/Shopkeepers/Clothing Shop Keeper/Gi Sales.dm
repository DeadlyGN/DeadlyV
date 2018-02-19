mob/proc/gi_sales()
	var/obj/Equipment/Chest/Custom_Gi/E = new
	var/obj/Equipment/Chest/Gi/O = new
	var/cost = 5000
	switch(input("What color of Gi do you want to buy? [cost]Z per Gi.\n An additional 20% for a dye.")in list("Black","Blue","Green","Red","Purple","Gold","Orange","Pink","White","Custom","Never Mind"))
		if("Custom")
			cost *= 1.2
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Custom Gi.dmi'
				var/customcolor=input("What color cloak would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				E.icon = h1
				E.name = "Custom Gi"
				E.gi = h1
				usr.contents += E
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Black Gi.dmi'
				O.gi = 'Black Gi.dmi'
				O.name = "Black Gi"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Blue Gi.dmi'
				O.gi = 'Blue Gi.dmi'
				O.name = "Blue Gi"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Green Gi.dmi'
				O.gi = 'Green Gi.dmi'
				O.name = "Green Gi"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Red Gi.dmi'
				O.gi = 'Red Gi.dmi'
				O.name = "Red Gi"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Purple")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Purple Gi.dmi'
				O.gi = 'Purple Gi.dmi'
				O.name = "Purple Gi"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Gold")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Gold Gi.dmi'
				O.gi = 'Gold Gi.dmi'
				O.name = "Gold Gi"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Orange")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Orange Gi.dmi'
				O.gi = 'Orange Gi.dmi'
				O.name = "Orange Gi"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Pink")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Pink Gi.dmi'
				O.gi = 'Pink Gi.dmi'
				O.name = "Pink Gi"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'White Gi.dmi'
				O.gi = 'White Gi.dmi'
				O.name = "White Gi"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"