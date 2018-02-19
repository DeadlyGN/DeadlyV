mob/var
 santa_suit_eq=0
 santa_hat_eq=0
 pumpkin_head_eq=0
 candy_eq=0
obj/Equipment/Chest
	Santa_suit
		condition = 500000000
		condition_max = 500000000
		density = 0
		armor_protection = 75000000
		icon = 'Santa Suit.dmi'
		equiped = 0
		value = 22500000
		var/boost = 0
		var
			Santa_suit = 'Santa Suit.dmi'
		Click()
			if(src in usr:contents)
				if(!usr.santa_suit_eq)
					if(usr.chest == "EMPTY" && usr.legs == "EMPTY")
						usr.overlays += Santa_suit
						usr<< "You have equiped the: <u>[src]</u>."
						suffix = "(Worn)"
						boost = (armor_protection*usr.karma_rating)
						usr.ki += boost
						usr.defence += boost
						usr.santa_suit_eq = 1
						src.equiped = 1
						usr.chest = src.name
						usr.legs = src.name
					else
						usr<< "Error: You already have something equipped on your Chest!"
						return
				else
					if(usr.santa_suit_eq)
						if(src.equiped)
							usr.overlays -= Santa_suit
							usr<< "You have unequiped the: <u>[src]</u>."
							suffix = null
							usr.ki -= boost
							usr.defence -= boost
							boost = 0
							usr.santa_suit_eq = 0
							src.equiped = 0
							usr.chest = "EMPTY"
							usr.legs = "EMPTY"
						else
							usr<< "Error: </b>You may only have one of: <u>[src.name]</u> equiped."
							return
		verb
			Examine()
				set category = null
				var/examine_armor = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr><td width=273 colspan=2 height=18><font face=Tahoma color=#FF0000>Saiyan Battle Armor</font></b></td></tr><tr><td width=96 height=12><font size=1 color=red face=Tahoma>Condition:</font></b></td><td width=170 height=12><font size=1><font face=Tahoma>[condition]</font></b></font><font size=1 face=Tahoma> / [condition_max]</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td><td width=174 height=12><font face=Tahoma size=1>Armor</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td><td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td></tr><tr><td width=273 colspan=2 height=48 style=font-family: Tahoma; font-size: 8pt; font-weight: bold><font face=Tahoma size=1>This armor protects the wearer from melee attacks. it provides more protection than the henchmen armor.</font></b></td></tr></table>"
				usr<< browse(examine_armor,"window=Saiyan Battle Armor;size=300x275;border=0;can_resize=0; can_minimize=0;")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr<< "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else usr<< "No more room for items."
				else
					usr<< "You're unable to pick up the: <u>[src]</u>."
					return
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr<< "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else usr<< "You're unable to drop: <u>[src.name]</u>, it's already equipped."
obj/Equipment/Head
	Santa_Hat
		name = "Santa Hat"
		icon = 'Santa Hat.dmi'
		density = 0
		equiped = 0
		value = 500
		var/boost = 0
		var
			santa_hat_icon = 'Santa Hat.dmi'
		Click()
			if(src in usr:contents)
				if(!usr.santa_hat_eq)
					if(usr.head == "EMPTY")
						usr.overlays += santa_hat_icon
						usr<< "You have equiped the: <u>[src]</u>."
						suffix = "(Worn)"
						boost = 1500000000*usr.karma_rating
						usr.defence += boost
						usr.head = src.name
						usr.helmet = 1
						usr.santa_hat_eq = 1
						src.equiped = 1
					else
						usr<< "Error: You already have something equipped on your Head!"
						return
				else
					if(src.equiped)
						usr.overlays -= santa_hat_icon
						usr<< "You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.head = "EMPTY"
						usr.defence -= boost
						boost = 0
						usr.helmet = 0
						usr.santa_hat_eq = 0
						src.equiped = 0
					else
						usr<< "Error: </b>You may only have one of: <u>[src.name]</u> equiped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr<< "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else usr<< "No more room for items."
				else
					usr<< "You're unable to pick up the: <u>[src]</u>."
					return
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr<< "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else usr<< "You're unable to drop: <u>[src.name]</u>, it's already equipped."
obj/Equipment/Hands
	Treat_Candy
		name = "Candy Bag"
		density = 0
		equiped = 0
		value = 250
		icon= 'CandyBag1.dmi'
		var/boost = 0
		var
			Candy_icon= 'CandyBag1.dmi'
		Click()
			if(src in usr:contents)
				if(!usr.candy_eq)
					if(usr.hands == "EMPTY")
						usr.overlays += Candy_icon
						usr<< "You have equiped the: <u>[src]</u>."
						suffix = "(Worn)"
						usr.hands = src.name
						usr.candy_eq = 1
						src.equiped = 1
						if(usr.karma=="Good") boost = 1500000000*usr.karma_rating
						else boost = 1500000000/usr.karma_rating
						usr.defence += boost
					else
						usr<< "Error:</b> You already have Candy equipped!"
						return
				else
					if(usr.candy_eq)
						usr.overlays -= Candy_icon
						usr<< "You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.hands = "EMPTY"
						usr.candy_eq = 0
						src.equiped = 0
						usr.defence -= boost
						boost = 0
					else
						usr<< "Error: </b>You may only have one of: <u>[src.name]</u> equiped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr<< "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else usr<< "No more room for items."
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr<< "You have dropped the: <u>[src]</u>."
				else usr<< "You're unable to drop: <u>[src.name]</u>, it's already equipped."
	Trick_Candy
		name = "Candy Bag"
		density = 0
		equiped = 0
		value = 250
		icon= 'CandyBag2.dmi'
		var/boost = 0
		var
			Candy_icon= 'CandyBag2.dmi'
		Click()
			if(src in usr:contents)
				if(!usr.candy_eq)
					if(usr.hands == "EMPTY")
						usr.overlays += Candy_icon
						usr<< "You have equiped the: <u>[src]</u>."
						suffix = "(Worn)"
						usr.hands = src.name
						usr.candy_eq = 1
						src.equiped = 1
						if(usr.karma=="Evil") boost = 1500000000*usr.karma_rating
						else boost = 1500000000/usr.karma_rating
						usr.strength += boost
					else
						usr<< "Error:</b> You already have Candy equipped!"
						return
				else
					if(usr.candy_eq)
						usr.overlays -= Candy_icon
						usr<< "You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.hands = "EMPTY"
						usr.candy_eq = 0
						src.equiped = 0
						usr.strength -= boost
						boost = 0
					else
						usr<< "Error: </b>You may only have one of: <u>[src.name]</u> equiped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr<< "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else usr<< "No more room for items."
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr<< "You have dropped the: <u>[src]</u>."
				else usr<< "You're unable to drop: <u>[src.name]</u>, it's already equipped."
obj/Equipment/Head
	Pumpkin_Helmet
		name = "Pumpkin Head"
		icon = 'Pumpkin Helm.dmi'
		density = 0
		equiped = 0
		value = 500
		var/boost = 0
		var
			pumpkin_helmet_icon = 'Pumpkin Helm.dmi'
		Click()
			if(src in usr:contents)
				if(!usr.pumpkin_head_eq)
					if(usr.head == "EMPTY")
						usr.overlays += pumpkin_helmet_icon
						usr<< "You have equiped the: <u>[src]</u>."
						suffix = "(Worn)"
						boost = 1500000000*usr.karma_rating
						usr.strength += boost
						usr.powerlevel += boost
						usr.head = src.name
						usr.helmet = 1
						usr.pumpkin_head_eq = 1
						src.equiped = 1
					else
						usr<< "Error: You already have something equipped on your Head!"
						return
				else
					if(usr.pumpkin_head_eq)
						usr.overlays -= pumpkin_helmet_icon
						usr<< "You have unequiped the: <u>[src]</u>."
						suffix = null
						usr.head = "EMPTY"
						usr.strength -= boost
						usr.powerlevel -= boost
						usr.helmet = 0
						usr.pumpkin_head_eq = 0
						src.equiped = 0
						boost = 0
					else
						usr<< "Error: </b>You may only have one of: <u>[src.name]</u> equiped."
						return
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr<< "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else
						usr<< "No more room for items."
				else
					usr<< "You're unable to pick up the: <u>[src]</u>."
					return
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr<< "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else usr<< "You're unable to drop: <u>[src.name]</u>, it's equipped to you."