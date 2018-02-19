var/list/
	EarthBalls=new()
	NamekBalls=new()
	BSBalls=new()
	ASBalls=new()
/obj/Dragonballs
	Earth
		icon = 'dragonball.dmi'
		New()
			..()
			EarthBalls+=src
		Del()
			EarthBalls-=src
			..()
		verb
			Summon_Dragon()
				set category = null
				usr.Summon_Dragon()
		Earth_Dragonball_1
			name = "Earth Dragonball 1"
			icon_state = "1"
			density = 0
			Del()
				dragonball_loader()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.e_db_1++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.e_db_1 = 0
		Earth_Dragonball_2
			name = "Earth Dragonball 2"
			icon_state = "2"
			density = 0
			Del()
				dragonball_loader2()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.e_db_2++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.e_db_2 = 0
		Earth_Dragonball_3
			name = "Earth Dragonball 3"
			icon_state = "3"
			density = 0
			Del()
				dragonball_loader3()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.e_db_3++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.e_db_3 = 0
		Earth_Dragonball_4
			name = "Earth Dragonball 4"
			icon_state = "4"
			density = 0
			Del()
				dragonball_loader4()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.e_db_4++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					src.loc=usr.loc
					usr.e_db_4 = 0
		Earth_Dragonball_5
			name = "Earth Dragonball 5"
			icon_state = "5"
			density = 0
			Del()
				dragonball_loader5()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.e_db_5++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.e_db_5 = 0
		Earth_Dragonball_6
			name = "Earth Dragonball 6"
			icon_state = "6"
			density = 0
			Del()
				dragonball_loader6()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.e_db_6++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.e_db_6 = 0
		Earth_Dragonball_7
			name = "Earth Dragonball 7"
			icon_state = "7"
			density = 0
			Del()
				dragonball_loader7()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.e_db_7++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.e_db_7 = 0
//********************************************************************************************//
//********************************************************************************************//
//************************************Namekian Dragonballs************************************//
//********************************************************************************************//
//********************************************************************************************//
	Namek
		icon = 'namek dbs.dmi'
		New()
			..()
			NamekBalls+=src
		Del()
			NamekBalls-=src
			..()
		verb
			Summon_Porunga()
				set category = null
				usr.Summon_Porunga()
		Namek_Dragonball_1
			name = "Namek Dragonball 1"
			icon_state = "1"
			density = 0
			Del()
				dragonball_loadern()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.n_db_1++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.n_db_1 = 0
		Namek_Dragonball_2
			name = "Namek Dragonball 2"
			icon_state = "2"
			density = 0
			Del()
				dragonball_loadern2()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.n_db_2++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.n_db_2 = 0
		Namek_Dragonball_3
			name = "Namek Dragonball 3"
			icon_state = "3"
			density = 0
			Del()
				dragonball_loadern3()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.n_db_3++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.n_db_3 = 0
		Namek_Dragonball_4
			name = "Namek Dragonball 4"
			icon_state = "4"
			density = 0
			Del()
				dragonball_loadern4()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.n_db_4++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.n_db_4 = 0
		Namek_Dragonball_5
			name = "Namek Dragonball 5"
			icon_state = "5"
			density = 0
			Del()
				dragonball_loadern5()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.n_db_5++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.n_db_5 = 0
		Namek_Dragonball_6
			name = "Namek Dragonball 6"
			icon_state = "6"
			density = 0
			Del()
				dragonball_loadern6()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.n_db_6++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.n_db_6 = 0
		Namek_Dragonball_7
			name = "Namek Dragonball 7"
			icon_state = "7"
			density = 0
			Del()
				dragonball_loadern7()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.n_db_7++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.n_db_7 = 0
//********************************************************************************************//
//********************************************************************************************//
//***********************************Black Star Dragonballs***********************************//
//********************************************************************************************//
//********************************************************************************************//
	BlackStar
		icon = 'BlackStarBalls.dmi'
		New()
			..()
			BSBalls+=src
		Del()
			BSBalls-=src
			..()
		verb
			Summon_Omega_Shenron()
				set category = null
				usr.Summon_Omega_Shenron()
		Black_Star_Dragonball_1
			name = "Black Star Dragonball 1"
			icon_state = "1"
			density = 0
			Del()
				dragonball_loaderbs()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.bs_db_1++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.bs_db_1 = 0
		Black_Star_Dragonball_2
			name = "Black Star Dragonball 2"
			icon_state = "2"
			density = 0
			Del()
				dragonball_loaderbs2()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.bs_db_2++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.bs_db_2 = 0
		Black_Star_Dragonball_3
			name = "Black Star Dragonball 3"
			icon_state = "3"
			density = 0
			Del()
				dragonball_loaderbs3()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.bs_db_3++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.bs_db_3 = 0
		Black_Star_Dragonball_4
			name = "Black Star Dragonball 4"
			icon_state = "4"
			density = 0
			Del()
				dragonball_loaderbs4()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.bs_db_4++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.bs_db_4 = 0
		Black_Star_Dragonball_5
			name = "Black Star Dragonball 5"
			icon_state = "5"
			density = 0
			Del()
				dragonball_loaderbs5()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.bs_db_5++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.bs_db_5 = 0
		Black_Star_Dragonball_6
			name = "Black Star Dragonball 6"
			icon_state = "6"
			density = 0
			Del()
				dragonball_loaderbs6()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.bs_db_6++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.bs_db_6 = 0
		Black_Star_Dragonball_7
			name = "Black Star Dragonball 7"
			icon_state = "7"
			density = 0
			Del()
				dragonball_loaderbs7()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.bs_db_7++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.bs_db_7 = 0
//********************************************************************************************//
//********************************************************************************************//
//************************************All Star Dragonballs************************************//
//********************************************************************************************//
//********************************************************************************************//
	AllStar
		icon = 'All Star Balls.dmi'
		New()
			..()
			ASBalls+=src
		Del()
			ASBalls-=src
			..()
		verb
			Summon_the_All_Star_Dragon()
				set category = null
				usr.Summon_the_All_Star_Dragon()
		All_Star_Dragonball_1
			name = "All Star Dragonball 1"
			icon_state = "1"
			density = 0
			Del()
				dragonball_loaderas()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.as_db_1++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.as_db_1 = 0
		All_Star_Dragonball_2
			name = "All Star Dragonball 2"
			icon_state = "2"
			density = 0
			Del()
				dragonball_loaderas2()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.as_db_2++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.as_db_2 = 0
		All_Star_Dragonball_3
			name = "All Star Dragonball 3"
			icon_state = "3"
			density = 0
			Del()
				dragonball_loaderas3()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.as_db_3++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.as_db_3 = 0
		All_Star_Dragonball_4
			name = "All Star Dragonball 4"
			icon_state = "4"
			density = 0
			Del()
				dragonball_loaderas4()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.as_db_4++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.as_db_4 = 0
		All_Star_Dragonball_5
			name = "All Star Dragonball 5"
			icon_state = "5"
			density = 0
			Del()
				dragonball_loaderas5()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.as_db_5++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.as_db_5 = 0
		All_Star_Dragonball_6
			name = "All Star Dragonball 6"
			icon_state = "6"
			density = 0
			Del()
				dragonball_loaderas6()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.as_db_6++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.as_db_6 = 0
		All_Star_Dragonball_7
			name = "All Star Dragonball 7"
			icon_state = "7"
			density = 0
			Del()
				dragonball_loaderas7()
				return ..()
			verb
				Pick_Up()
					set src in oview(1)
					set category = null
					if(!usr.pk)
						usr<< "You're not a Combatant!"
						return
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
							usr.as_db_7++
						else
							usr<< "No more room for items."
							return
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				Drop()
					set category = null
					src.loc = usr.loc
					usr<< "You drop the [src]"
					usr.as_db_7 = 0