mob/proc/cloak_sales()
	var/obj/Equipment/Chest/Custom_Cloak/E = new
	var/obj/Equipment/Chest/Cloak/O = new
	var/cost = 10000
	switch(input("What color of cloak do you want to buy? [cost] zennie per cloak.\n An additional 20% for a dye.")in list("Grey","Custom","Never Mind"))
		if("Custom")
			cost *= 1.2
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Custom Cloak.dmi'
				var/customcolor=input("What color cloak would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				E.icon = h1
				E.name = "Custom Cloak"
				E.cloaks = h1
				usr.contents += E
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Grey")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Cloak.dmi'
				O.cloak = 'Cloak.dmi'
				O.name = "Cloak"
				usr.contents += O
				usr.inven_min ++
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"