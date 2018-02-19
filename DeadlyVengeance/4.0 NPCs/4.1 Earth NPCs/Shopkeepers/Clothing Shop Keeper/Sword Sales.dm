mob/proc/sword_sales()
	var/obj/Equipment/weapon/Swords/O = new
	var/cost = 10000
	switch(input("What color of Belt do you want to buy? [cost]Z per sword")in list("Sword","Never Mind"))
		if("Sword")
			if(src.zenni >= cost)
				src.zenni -= cost
				O.icon = 'Sword.dmi'
				O.Swords = 'Sword.dmi'
				O.name = "Sword"
				usr.contents += O
				usr<< "<font color = white>Shop Keep:</font> Thanks for buying!"
			else usr<< "<font color = white>Shop Keep:</font> You cannot afford this! You need [cost] zennie!"