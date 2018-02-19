obj/Equipment/
	Senzu_Bag
		name="Senzu Bag(0)"
		icon='Senzu Bag.dmi'
		Click()
			var/eaten=0
			for(var/obj/Equipment/Consumable/Senzu/S in contents)
				if(usr.regenerating)
					usr<< "You cannot use this while regenerating."
					return
				if(usr.regen_dead)
					usr<< "You cannot use this at the moment."
					return
				if(usr.tourny)
					usr<<"You cannot use this inside a tournament!"
					return
				if(usr.KO)
					usr<< "You cannot use this at the moment."
					return
				view(6)<< "[usr] has eaten a: [S.name]."
				eaten=1
				usr.powerlevel = max(usr.powerlevel_max,usr.powerlevel)
				usr.ki = max(usr.ki_max,usr.ki)
				usr.strength = max(usr.strength_max,usr.strength)
				usr.defence = max(usr.defence_max,usr.defence)
				usr.fatigue = round(usr.fatigue/2)
				del(S)
				break
			if(!eaten) usr<<"You don't have any senzus in this bag!"
			name="Senzu Bag([contents.len])"
		verb/Eat()
			set category = null
			var/eaten=0
			for(var/obj/Equipment/Consumable/Senzu/S in contents)
				if(usr.regenerating)
					usr<< "You cannot use this while regenerating."
					return
				if(usr.regen_dead)
					usr<< "You cannot use this at the moment."
					return
				if(usr.tourny)
					usr<<"You cannot use this inside a tournament!"
					return
				if(usr.KO)
					usr<< "You cannot use this at the moment."
					return
				view(6)<< "[usr] has eaten a: [S.name]."
				eaten=1
				usr.powerlevel = max(usr.powerlevel_max,usr.powerlevel)
				usr.ki = max(usr.ki_max,usr.ki)
				usr.strength = max(usr.strength_max,usr.strength)
				usr.defence = max(usr.defence_max,usr.defence)
				usr.fatigue = round(usr.fatigue/2)
				del(S)
				break
			if(!eaten) usr<<"You don't have any senzus in this bag!"
			name="Senzu Bag([contents.len])"
mob/Enter(atom/movable/O)
	if(istype(O,/obj/Equipment/Consumable/Senzu/)){ for(var/obj/Equipment/Senzu_Bag/S2 in contents){ if(S2.contents.len<25){ O.Move(S2); S2.name="Senzu Bag([S2.contents.len])"; src.inven_min--; return;};};}
	if(!istype(O,/obj/Quests/))if(src.inven_min>=src.inven_max)return 0
	return ..()