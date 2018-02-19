mob/proc/wrist_sales()
	var/obj/Equipment/Hands/Wrist_Weights/O = new
	var/cost = 12500
	if(src.threaten_training == "Success")
		cost = cost / 2
	if(src.threaten_training == "Failure")
		cost = cost * 2
	switch(input("Want to buy a set of Wrist Weights for [cost] Zenni??.\n An additional 20% for a dye.")in list("Custom Wrist Weights","Red Wrist Weights","Blue Wrist Weights","Green Wrist Weights","White Wrist Weights","Black Wrist Weights","Never Mind"))
		if("Custom Wrist Weights")
			cost*=1.2
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				var/D = 'Black Wrist Weight.dmi'
				var/customcolor=input("What color cloak would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				O.icon=h1
				O.wwrist = O.icon
				O.level = 1
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green Wrist Weights")
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				O.icon = 'Green Wrist Weight.dmi'
				O.wwrist = 'Green Wrist Weight.dmi'
				O.level = 1
				usr.contents += O
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black Wrist Weights")
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				O.icon = 'Black Wrist Weight.dmi'
				O.wwrist = 'Black Wrist Weight.dmi'
				O.level = 1
				usr.contents += O
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White Wrist Weights")
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				O.icon = 'White Wrist Weight.dmi'
				O.wwrist = 'White Wrist Weight.dmi'
				O.level = 1
				usr.contents += O
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue Wrist Weights")
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				O.icon = 'Blue Wrist Weight.dmi'
				O.wwrist = 'Blue Wrist Weight.dmi'
				O.level = 1
				usr.contents += O
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red Wrist Weights")
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				O.icon = 'Red Wrist Weight.dmi'
				O.wwrist = 'Red Wrist Weight.dmi'
				O.level = 1
				usr.contents += O
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
mob/proc/wrist_sales2()
	var/obj/Equipment/Hands/Wrist_Weights/O = new
	var/cost = 25000
	if(src.threaten_training == "Success")
		cost = cost / 2
	if(src.threaten_training == "Failure")
		cost = cost * 2
	switch(input("Want to buy a set of Wrist Weights??.\n An additional 20% for a dye.")in list("Custom Wrist Weights","Red Wrist Weights","Blue Wrist Weights","Green Wrist Weights","White Wrist Weights","Black Wrist Weights","Never Mind"))
		if("Custom Wrist Weights")
			cost*=1.2
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				var/D = 'Black Wrist Weight.dmi'
				var/customcolor=input("What color cloak would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				O.icon=h1
				O.wwrist = O.icon
				O.level = 1
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green Wrist Weights")
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				O.icon = 'Green Wrist Weight.dmi'
				O.wwrist = 'Green Wrist Weight.dmi'
				O.level = 1
				usr.contents += O
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black Wrist Weights")
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				O.icon = 'Black Wrist Weight.dmi'
				O.wwrist = 'Black Wrist Weight.dmi'
				O.level = 1
				usr.contents += O
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White Wrist Weights")
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				O.icon = 'White Wrist Weight.dmi'
				O.wwrist = 'White Wrist Weight.dmi'
				O.level = 1
				usr.contents += O
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue Wrist Weights")
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				O.icon = 'Blue Wrist Weight.dmi'
				O.wwrist = 'Blue Wrist Weight.dmi'
				O.level = 1
				usr.contents += O
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red Wrist Weights")
			if(usr.zenni >= cost)
				usr.zenni -= cost
				usr.inven_min ++
				O.icon = 'Red Wrist Weight.dmi'
				O.wwrist = 'Red Wrist Weight.dmi'
				O.level = 1
				usr.contents += O
				usr<< "<font size = -1><B><font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font size = -1><B><font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"