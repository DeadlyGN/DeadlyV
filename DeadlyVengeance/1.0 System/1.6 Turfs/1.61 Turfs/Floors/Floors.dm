turf/Floors
	icon = 'Floors.dmi'
	name = ""
	Floor_1_1
		icon_state = "floor 1-1"
		density = 0
	Floor_1_2
		icon_state = "floor 1-2"
		density = 0
	Floor_1_3
		icon_state = "floor 1-3"
		density = 0
	Floor_1_4
		icon_state = "floor 1-4"
		density = 0
	Floor_1_5
		icon_state = "floor 1-5"
		density = 0
	Floor_1_6
		icon_state = "floor 1-6"
		density = 0
	Floor_1_7
		icon_state = "wooden 1"
		density = 0
	Floor_1_8
		icon_state = "floor 1-7"
		density = 0
	Floor_1_9
		icon_state = "floor 100"
		density = 0
	Floor_2_9
		icon_state = "floor 101"
		density = 0
	Floor_3_4b
		icon_state = "floor 3-4b"
		density = 0
	Grand_Chair
		icon_state = "#22"
		density = 0
	Chair
		icon_state = "#23"
		density = 0
	Badass_Chair
		icon_state = "#24"
		density = 0
	Killer_Chair
		icon_state = "#25"
	Uber_Chair
		icon_state = "#26"
		density = 0
	Cool_Chair
		icon_state = "#27"
		density = 0
	Skeths_Chair
		icon_state = "#28"
		density = 0
	Gravity_Floor
		icon_state = "floor 1-5"
		density = 0
		Entered(var/mob/M)
			if(!ismob(M)){ del M; return; }
			for(var/obj/Gravity_Room/Gravity_Control/C in view(24))
				if(!C.gravon) return
				else
					M.random = rand(30,55)
					M.Damage(M.random * C.grav)
					M.GRAVITYDeath()
					M.random = rand(10,50)
					if(!M.dead)
						var/bonus_exp = C.grav * 0.33
						if("exp_buff" in usr.buffs) bonus_exp = bonus_exp * 0.47
						M.Gain_Exp(bonus_exp)
		Exited(var/mob/M)
			if(!ismob(M)){ del M; return; }
			M.grav_on=0
			M.grav=0
	Guild_Gravity_Floor
		icon_state = "floor 1-5"
		density = 0
		Entered(var/mob/M)
			if(!ismob(M)){ del M; return; }
			for(var/obj/Gravity_Room/Guild_Gravity_Control/C in view(24))
				if(!C.gravon) return
				else
					if(!usr.grav)
						M.random = rand(25,50)
						M.Damage(M.random * C.grav)
						M.GRAVITYDeath()
						M.random = rand(10,25)
						if(!M.dead)
							var/bonus_exp = C.grav * 0.33
							if("exp_buff" in usr.buffs)
								bonus_exp = bonus_exp * 0.47
							M.Gain_Exp(bonus_exp)
		Exited(var/mob/M)
			if(!ismob(M)){ del M; return; }
			M.grav_on=0
			M.grav=0
	Stairs
		icon_state = "stairs"
		density = 0
turf/Floors/Craters
	Crater_1
		icon_state = "crater top 1"
		density = 0
	Crater_2
		icon_state = "crater top 2"
		density = 0
	Crater_3
		icon_state = "crater top 3"
		density = 0
	Crater_4
		icon_state = "crater middle 1"
		density = 0
	Crater_5
		icon_state = "crater middle 2"
		density = 0
	Crater_6
		icon_state = "crater middle 3"
		density = 0
	Crater_7
		icon_state = "crater bottom 1"
		density = 0
	Crater_8
		icon_state = "crater bottom 2"
		density = 0
	Crater_9
		icon_state = "crater bottom 3"
		density = 0
	Crater_Small
		icon_state = "small crater"
		density = 0
	Crater_1b
		icon_state = "crater top 12"
		density = 0
	Crater_2b
		icon_state = "crater top 22"
		density = 0
	Crater_3b
		icon_state = "crater top 32"
		density = 0
	Crater_4b
		icon_state = "crater middle 12"
		density = 0
	Crater_5b
		icon_state = "crater middle 22"
		density = 0
	Crater_6b
		icon_state = "crater middle 32"
		density = 0
	Crater_7b
		icon_state = "crater bottom 12"
		density = 0
	Crater_8b
		icon_state = "crater bottom 22"
		density = 0
	Crater_9b
		icon_state = "crater bottom 32"
		density = 0
	Crater_Smallb
		icon_state = "small crater2"
		density = 0
/obj/techs/Overlays
	mouse_opacity=0
/obj/techs/Overlays/Crater_Center
	icon = 'Floors.dmi'
	icon_state = "crater middle 2"
	density = 0
	New()
		src.overlays += new/obj/techs/Overlays/Crater_Top_Right
		src.overlays += new/obj/techs/Overlays/Crater_Top_Center
		src.overlays += new/obj/techs/Overlays/Crater_Top_Left
		src.overlays += new/obj/techs/Overlays/Crater_Middle_Left
		src.overlays += new/obj/techs/Overlays/Crater_Middle_Right
		src.overlays += new/obj/techs/Overlays/Crater_Bottom_Right
		src.overlays += new/obj/techs/Overlays/Crater_Bottom_Left
		src.overlays += new/obj/techs/Overlays/Crater_Bottom_Center
		spawn(100) del(src)
/obj/techs/Overlays/Crater_Top_Right
	icon = 'Floors.dmi'
	icon_state = "crater top 3"
	density = 0
	New()
		pixel_y = 32
		pixel_x = 32
/obj/techs/Overlays/Crater_Top_Center
	icon = 'Floors.dmi'
	icon_state = "crater top 2"
	density = 0
	New()
		pixel_y = 32
		pixel_x = 0
/obj/techs/Overlays/Crater_Top_Left
	icon = 'Floors.dmi'
	icon_state = "crater top 1"
	density = 0
	New()
		pixel_y = 32
		pixel_x = -32
/obj/techs/Overlays/Crater_Middle_Left
	icon = 'Floors.dmi'
	icon_state = "crater middle 1"
	density = 0
	New()
		pixel_x = -32
/obj/techs/Overlays/Crater_Middle_Right
	icon = 'Floors.dmi'
	icon_state = "crater middle 3"
	density = 0
	New()
		pixel_x = 32
/obj/techs/Overlays/Crater_Bottom_Right
	icon = 'Floors.dmi'
	icon_state = "crater bottom 3"
	density = 0
	New()
		pixel_x = 32
		pixel_y = -32
/obj/techs/Overlays/Crater_Bottom_Left
	icon = 'Floors.dmi'
	icon_state = "crater bottom 1"
	density = 0
	New()
		pixel_x = -32
		pixel_y = -32
/obj/techs/Overlays/Crater_Bottom_Center
	icon = 'Floors.dmi'
	icon_state = "crater bottom 2"
	density = 0
	New()
		pixel_y = -32
/obj/techs/Overlays/Crater_Small
	icon = 'Floors.dmi'
	icon_state = "small crater"
	density = 0
	New()
		pixel_y = -8
		spawn(80) del(src)