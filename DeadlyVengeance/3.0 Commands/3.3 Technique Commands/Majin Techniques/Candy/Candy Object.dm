obj/Equipment/Candy_Obj
	name =  "Candy"
	layer=4
	icon = 'Candy.dmi'
	var/powerlevel_bonus = 0
	var/strength_bonus = 0
	var/defence_bonus = 0
	Click()
		src<< "<B><font color = red>You pop the [src.name] in your mouth and crunch down on it!"
		if(usr.race == "Majin")
			usr<<"<font color=aqua>You have gained [powerlevel_bonus] powerlevel.<br>You have gained [ki_bonus] ki.<br>You have gained [strength_bonus] strength.<br>You have gained [defence_bonus] defence."
			usr.powerlevel_max += powerlevel_bonus
			usr.ki_max += ki_bonus
			usr.strength_max += strength_bonus
			usr.defence_max += defence_bonus
		usr.powerlevel += powerlevel_bonus
		usr.ki += ki_bonus
		usr.strength += strength_bonus
		usr.defence += defence_bonus
		usr.eats ++
		del(src)
	verb
		Pick_Up()
			set src in oview(0)
			set category = null
			if(Move(usr)) usr<< "You pick up the [src]"
			else usr<< "You cannot pick up the [src]"
		Drop()
			set category = null
			if(src.equiped == 0)
				src.loc = usr.loc
				usr<< "You drop the [src]"
			else usr<< "You cannot drop this, It's equipped!"
obj/Candy_Beam
	name = "Candy Ray"
	icon = 'Candy Ray.dmi'