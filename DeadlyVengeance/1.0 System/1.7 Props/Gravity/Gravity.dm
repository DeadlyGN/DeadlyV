obj
	var
		grav = 0
		gravon = 0
obj/Gravity_Room
	icon = 'Gravity Well.dmi'
	density = 1
	Gravity_Well_1
		icon_state = "1"
		layer=8
	Gravity_Well_2
		icon_state = "2"
		layer=8
	Gravity_Well_3
		icon_state = "3"
		layer=8
	Gravity_Well_4
		icon_state = "4"
		layer=8
	Gravity_Well_5
		icon_state = "5"
		layer=8
	Gravity_Well_6
		icon_state = "6"
		layer=8
	Gravity_Well_7
		icon_state = "7"
		layer=8
	Gravity_Well_8
		icon_state = "8"
		layer=8
	Gravity_Well_9
		icon_state = "9"
		layer=8
	Gravity_Well_10
		icon_state = "10"
		density = 0
		layer = 8
	Gravity_Well_11
		icon_state = "11"
		density = 0
		layer = 8
	Gravity_Well_12
		icon_state = "12"
		density = 0
		layer = 8
	Gravity
		icon_state = "gravity"
		density = 0
		layer = 7
	Gravity_Pull
		icon_state = "gravity pull"
		density = 0
		layer = 9
	Gravity_Control
		verb
			Set_Gravity()
				set src in oview(3)
				set category = "Gravity Controls"
				while(1)
					var/gravset = input("What do you what to set the gravity to?","Gravity") as num
					var/max = 2500
					if(usr.level >= 35000)
						max = 5500
					if(usr.level >= 250000)
						max = 15000
					if(usr.level >= 500000)
						max = 28000
					if(usr.level >= 800000)
						max = 45000
					if(gravset > max)
						gravset = max
					if(!gravset)
						spawn() alert(usr,"Gravity Switched off")
						gravon = 0
						grav = 0
						break
					if(gravset < 0)
						if(src.grav)
							src.grav = 0
							src.gravon = 0
						else
							spawn() alert(usr,"You cannot have negative gravity.")
							continue
					else
						view(10) << "\red Gravity will be set to x[gravset] in 5 Seconds"  //gives a ten sec. warning for the weeklings
						sleep(50)
						view(10) << "\red Gravity is now x[gravset]"
						grav = gravset
						gravon = 1
					break
			Check_Gravity()
				set src in oview(3)
				set category = "Gravity Controls"
				usr<< "\red Gravity is set to: x[grav]"
	Guild_Gravity_Control
		verb
			Set_Gravity()
				set src in oview(3)
				set category = "Gravity Controls"
				while(1)
					var/gravset = input("What do you what to set the gravity too?","Gravity") as num
					var/max = 2500
					if(usr.level >= 35000)
						max = 7500
					if(usr.level >= 250000)
						max = 18000
					if(usr.level >= 500000)
						max = 32000
					if(usr.level >= 800000)
						max = 47500
					if(gravset > max)
						gravset = max
					if(!gravset)
						spawn() alert(usr,"Gravity Switched off")
						gravon = 0
						grav = 0
						break
					if(gravset < 0)
						if(src.grav)
							src.grav = 0
							src.gravon = 0
						else
							spawn() alert(usr,"You cannot have negative gravity.")
							continue
					else
						view(10) << "\red Gravity will be set to x[gravset] in 5 Seconds"  //gives a ten sec. warning for the weeklings
						sleep(50)
						view(10) << "\red Gravity is now x[gravset]"
						grav = gravset
						gravon = 1
					break
			Check_Gravity()
				set src in oview(3)
				set category = "Gravity Controls"
				usr<< "\red Gravity is set to: x[grav]"