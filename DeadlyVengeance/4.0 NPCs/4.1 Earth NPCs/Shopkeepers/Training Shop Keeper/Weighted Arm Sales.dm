mob/proc/warm_sales()
	var/obj/Equipment/Arm/Custom_Arm_Weights/E = new
	var/cost = 15000
	if(src.threaten_training_2 == "Success")
		cost = cost / 2
	if(src.threaten_training_2 == "Failure")
		cost = cost * 2
	switch(input("Want to buy a set of Arm Weights for [cost] Zenni??")in list("Arm Weights","Never Mind"))
		if("Arm Weights")
			if(src.zenni >= cost)
				if(usr.inven_min < usr.inven_max)
					src.zenni -= cost
					var/D = 'Arm Weight.dmi'
					var/customcolor=input("What color cloak would you like?") as color
					D+=(customcolor)
					var/image/h1=image(D,pixel_y=0)
					E.icon = h1
					E.name = "Arm Weights"
					E.warm = h1
					usr.contents += E
					usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
					usr.inven_min ++
				else usr<< "No more room for items."
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"