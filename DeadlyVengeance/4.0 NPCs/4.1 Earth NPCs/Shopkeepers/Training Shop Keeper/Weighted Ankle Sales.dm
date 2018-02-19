mob/proc/ankle_sales()
	var/obj/Equipment/Feet/Ankle_Weights/O = new
	var/cost = 12500
	switch(input("Want to buy a set of Ankle Weights for [cost] Zenni??.\n An additional 20% for a dye.")in list("Custom Ankle Weights","Green Ankle Weights","White Ankle Weights","Blue Ankle Weights","Black Ankle Weights","Red Ankle Weights","Never Mind"))
		if("Custom Ankle Weights")
			cost*=1.2
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					var/D = 'Black Ankle Weight.dmi'
					var/customcolor=input("What color cloak would you like?") as color
					D+=(customcolor)
					var/image/h1=image(D,pixel_y=0)
					O.icon = h1
					O.name = "Custom Ankle Weights"
					O.wankle = O.icon
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red Ankle Weights")
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					O.icon = 'Red Ankle Weight.dmi'
					O.wankle = 'Red Ankle Weight.dmi'
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White Ankle Weights")
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					O.icon = 'White Ankle Weight.dmi'
					O.wankle = 'White Ankle Weight.dmi'
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black Ankle Weights")
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					O.icon = 'Black Ankle Weight.dmi'
					O.wankle = 'Black Ankle Weight.dmi'
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue Ankle Weights")
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					O.icon = 'Blue Ankle Weight.dmi'
					O.wankle = 'Blue Ankle Weight.dmi'
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green Ankle Weights")
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					O.icon = 'Green Ankle Weight.dmi'
					O.wankle = 'Green Ankle Weight.dmi'
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
mob/proc/ankle_sales2()
	var/obj/Equipment/Feet/Ankle_Weights/O = new
	var/cost = 25000
	if(src.threaten_training_2 == "Success")
		cost = cost / 2
	if(src.threaten_training_2 == "Failure")
		cost = cost * 2
	switch(input("Want to buy a set of Ankle Weights for [cost]??.\n An additional 20% for a dye.")in list("Custom Ankle Wieghts","Green Ankle Weights","White Ankle Weights","Blue Ankle Weights","Black Ankle Weights","Red Ankle Weights","Never Mind"))
		if("Custom Ankle Weights")
			cost*=1.2
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					var/D = 'Black Ankle Weight.dmi'
					var/customcolor=input("What color cloak would you like?") as color
					D+=(customcolor)
					var/image/h1=image(D,pixel_y=0)
					O.icon = h1
					O.wankle = h1
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Red Ankle Weights")
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					O.icon = 'Red Ankle Weight.dmi'
					O.wankle = 'Red Ankle Weight.dmi'
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("White Ankle Weights")
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					O.icon = 'White Ankle Weight.dmi'
					O.wankle = 'White Ankle Weight.dmi'
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Black Ankle Weights")
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					O.icon = 'Black Ankle Weight.dmi'
					O.wankle = 'Black Ankle Weight.dmi'
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Blue Ankle Weights")
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					O.icon = 'Blue Ankle Weight.dmi'
					O.wankle = 'Blue Ankle Weight.dmi'
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"
		if("Green Ankle Weights")
			if(usr.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					usr.zenni -= cost
					usr.inven_min ++
					O.icon = 'Green Ankle Weight.dmi'
					O.wankle = 'Green Ankle Weight.dmi'
					O.level = 1
					usr.contents += O
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"