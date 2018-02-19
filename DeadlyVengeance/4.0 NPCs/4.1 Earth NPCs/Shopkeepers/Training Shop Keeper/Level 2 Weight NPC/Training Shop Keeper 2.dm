mob/var/threaten_training_2 = ""
mob
	AI
		Advanced_Training_Shop_Keeper
			name = "{NPC} Advanced Training Items Shop Keeper"
			icon = 'Training Item Shop Keeper.dmi'
			verb
				Talk()
					set category = null
					set src in oview(2)
					switch(input("What do you want to browse?")in list("Weighted Clothing","Weighted Sword","Never Mind"))
						if("Weighted Clothing")
							switch(input("What do you want to buy?")in list("Advanced Ankle Weights","Advanced Wrist Weights","Advanced Weighted Cape","Advanced Weighted Gi","Advanced Weighted Turben (Namek Only)","Advanced Weighted Arm Weights","Advanced Weighted Leg Weights","Never Mind"))
								if("Advanced Ankle Weights")
									usr.ankle_sales2()
								if("Advanced Wrist Weights")
									usr.wrist_sales2()
								if("Advanced Weighted Cape")
									usr.wcape_sales2()
								if("Advanced Weighted Gi")
									usr.wgi_sales2()
								if("Advanced Weighted Turben (Namek Only)")
									usr.wturben_sales2()
								if("Advanced Weighted Arm Weights")
									usr.warm_sales()
								if("Advanced Weighted Leg Weights")
									usr.wleg_sales()
						if("Weighted Sword")
							var/obj/Equipment/weapon/Swords/S=locate(/obj/Equipment/weapon/Swords) in usr.contents
							if(S)
								if(S.equiped)
									usr.overlays -= S.Swords
									usr<< "You have unequiped the: <u>[S]</u>."
									S.suffix = null
									usr.weapon = "EMPTY"
									usr.strength -= S.strboost
									S.strboost = 0
									usr.swordd = 0
									usr.swordd_eq = 0
									S.equiped = 0
								switch(input("Would you like to weigh your sword?(850,000z+Sword)","Weighted Sword") in list("Lets do it!","Not right now."))
									if("Lets do it!")
										if(usr.inven_min>usr.inven_max)
											usr<<"<font color=white>[src]:</font> You can't carry that!";return
										if(usr.zenni>=850000)
											usr.zenni-=850000
											usr.contents-=S
											var/obj/Equipment/weapon/AdvancedWeighted_Swords/O = new
											O.icon = 'WeightedSword.dmi'
											O.wsword = 'WeightedSword.dmi'
											usr.contents+=O
											usr<<"<font color=white>[src]:</font> Thank you! Come back when you need something else!"
										else usr<<"<font color=white>[src]:</font> You don't have enough for that! Come back when you're prepaired."
									if("Not right now.")
										usr<<"<font color=white>[src]:</font> Come back when you're ready."