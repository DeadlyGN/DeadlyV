mob/proc/gloves_sales()
	var/obj/Equipment/Hands/Gloves/O = new
	var/cost = 2500
	switch(input("What color of Gloves do you want to buy? [cost]Z per Gloves.\n An additional 20% for a dye.")in list("White","Custom","Never Mind"))
		if("White")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'White Gloves.dmi'
				O.gloves = 'White Gloves.dmi'
				O.name = "White Gloves"
				usr.contents += O
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Custom")
			cost *= 1.2
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Custom Gloves.dmi'
				var/customcolor=input("What color cloak would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				O.icon = h1
				O.name = "Custom Gloves"
				usr.contents += O
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"