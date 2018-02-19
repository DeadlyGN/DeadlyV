mob/proc/belts_sales()
	var/obj/Equipment/waist/Belts/O = new
	var/cost = 3500
	switch(input("What color of Belt do you want to buy? [cost] zennie per Belt.\n An additional 20% for a dye.")in list("Custom","Black","Blue","Red","Gold","Green","Never Mind"))
		if("Custom")
			cost*=1.2
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Black Belt.dmi'
				var/customcolor=input("What color cloak would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				O.icon = h1
				O.Belts = O.icon
				usr.contents += O
				O.name = "Custom Belt"
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Black Belt.dmi'
				O.Belts = 'Black Belt.dmi'
				O.name = "Black Belt"
				usr.contents += O
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Blue Belt.dmi'
				O.Belts = 'Blue Belt.dmi'
				O.name = "Blue Belt"
				usr.contents += O
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Red Belt.dmi'
				O.Belts = 'Red Belt.dmi'
				O.name = "Red Belt"
				usr.contents += O
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Gold")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Gold Belt.dmi'
				O.Belts = 'Gold Belt.dmi'
				O.name = "Gold Belt"
				usr.contents += O
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Green Belt.dmi'
				O.Belts = 'Green Belt.dmi'
				O.name = "Green Belt"
				usr.contents += O
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"