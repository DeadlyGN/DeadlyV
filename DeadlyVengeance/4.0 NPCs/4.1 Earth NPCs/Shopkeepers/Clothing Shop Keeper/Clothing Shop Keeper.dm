mob
	AI
		Clothing_Shop_Keeper
			name = "{NPC} Clothing Items Shop Keeper"
			icon = 'Cloth Shop Keeper.dmi'
			verb
				Talk()
					set category = null
					set src in oview(2)
					switch(input("What do you want to buy?")in list("Gi's","Capes","Underclothing","Gloves","Pants","Belts","Cloaks","Never Mind"))
						if("Gi's") usr.gi_sales()
						if("Pants") usr.pants_sales()
						if("Capes") usr.capes_sales()
						if("Belts") usr.belts_sales()
						if("Underclothing") usr.underclothes_sales()
						if("Gloves") usr.gloves_sales()
						if("Cloaks") usr.cloak_sales()
mob
	AI
		Battle_Shop_Keeper
			name = "{NPC} Battle Items Shop Keeper"
			icon = 'Cloth Shop Keeper.dmi'
			verb
				Talk()
					set category = null
					set src in oview(2)
					switch(input("What do you want to buy?")in list("Henchmen Armor 50,000z","Saiyan Battle Armor 500,000z","Sword","Never Mind"))
						if("Henchmen Armor 50,000z")
							if(usr.inven_min < usr.inven_max)
								if(usr.zenni >= 50000)
									usr.zenni -= 50000
									usr.inven_min ++
									usr.contents += new/obj/Equipment/Chest/Hench_Battle_Armor
									usr<< "\white Shop Keeper: </font>Thanks for buying!"
								else usr<< "\white Shop Keeper: </font>You cant afford this!"
							else usr<< "\white Shop Keeper: </font>You dont have enough room for this!"
						if("Saiyan Battle Armor 500,000z")
							if(usr.inven_min < usr.inven_max)
								if(usr.zenni >= 500000)
									usr.zenni -= 500000
									usr.inven_min ++
									usr.contents += new/obj/Equipment/Chest/Saiyan_Battle_Armor
									usr<< "\white Shop Keeper: </font>Thanks for buying!"
								else usr<< "\white Shop Keeper: </font>You cant afford this!"
							else usr<< "\white Shop Keeper: </font>You dont have enough room for this!"
						if("Sword") usr.sword_sales()