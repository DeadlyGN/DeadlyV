mob/proc/wleg_sales()
	var/obj/Equipment/Legs/Custom_Leg_Weights/E = new
	var/cost = 35000
	if(src.threaten_training_2 == "Success")
		cost = cost / 2
	if(src.threaten_training_2 == "Failure")
		cost = cost * 2
	switch(input("Want to buy a set of Leg Weights for [cost] Zenni??")in list("Leg Weights","Never Mind"))
		if("Leg Weights")
			if(src.zenni >= cost)
				src.zenni -= cost
				var/D = 'Leg Weight.dmi'
				var/customcolor=input("What color cloak would you like?") as color
				D+=(customcolor)
				var/image/h1=image(D,pixel_y=0)
				E.icon = h1
				E.wleg = h1
				usr.contents += E
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
				usr.inven_min ++
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"