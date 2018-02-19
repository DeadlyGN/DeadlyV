mob
	AI
		Misc_Shop_Keeper
			name = "{NPC} Miscellaneous Items Shop Keeper"
			icon = 'Misc Shop Keeper.dmi'
			verb
				Talk()
					set category = null
					set src in oview(2)
					switch(input("What do you want to buy?")in list("Dragon Radar","Scouter","Never Mind"))
						if("Dragon Radar")
							usr.radar_sales()
						if("Scouter")
							usr.scouter_sales()