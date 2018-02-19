mob/var/tmp/going = 0
obj/Props/Space_Pod
	icon = 'Space Pod.dmi'
	name = ""
	Space_Pod_1_1
		icon_state = "pod 1-1"
		density = 0
		layer = 12
	Space_Pod_1_2
		icon_state = "pod 1-2"
		density = 0
		layer = 12
	Space_Pod_1_3
		icon_state = "pod 1-3"
		density = 0
		layer = 12
	Space_Pod_1_4
		icon_state = "pod 1-4"
		density = 0
		layer = 12
	Space_Pod_1_5
		icon_state = "pod 1-5"
		density = 1
	Space_Pod_1_6
		icon_state = "pod 1-6"
		density = 1
	Space_Pod_1_7
		icon_state = "pod 1-7"
		density = 1
	Space_Pod_1_8
		icon_state = "pod 1-8"
		density = 1
	Space_Pod_1_9
		icon_state = "pod 1-9"
		density = 1
	Space_Pod_2_1
		icon_state = "pod 2-1"
		density = 1
	Space_Pod_2_2
		icon_state = "pod 2-2"
		density = 1
	Space_Pod_2_3
		icon_state = "pod 2-3"
		density = 1
	Space_Pod_2_4
		icon_state = "pod 2-4"
		density = 0
	Space_Pod_2_5
		icon_state = "pod 2-5"
		density = 0
	Space_Pod_2_6
		icon_state = "pod 2-6"
		density = 0
	Space_Pod_2_7
		icon_state = "pod 2-7"
		density = 0
mob/proc/Finish_Going()
	if(src.going_to)
		src<<"<b>Due to an error in flight patterns arrival is set back two minutes."
		switch(src.going_to)
			if(1)
				spawn(1200)
					src.loc=(locate(158,62,1))
					src.z=1
			if(2)
				spawn(1200)
					src.loc=(locate(57,189,2))
					src.z=2
			if(3)
				spawn(1200)
					src.loc=(locate(110,189,3))
					src.z=3
			//if(4)

			if(5)
				spawn(1200)
					src.loc=locate(158,62,5)
					src.z=5
		spawn(1200) src.going_to=0
turf/Passages/Space_Pod
	Go_To_Space_Pod
		name = "Space Pod"
		density = 1
		Bumped(mob/PC/M)
			if(ismob(M))
				if(M.client)
					if(M.going)return
					M.going=1
					var/list/CanGo=new()
					switch(M.z)
						if(1)
							CanGo=list("Namek","Future")
						if(2)
							CanGo=list("Earth","Future")
						if(3)
							CanGo=list("Earth","Namek")
						//if(4)

						if(5)
							CanGo=list("Earth","Namek","Future")
					if((sagas_GT||world.GetMedal("GTer",M))&&M.z!=5) CanGo+="Tuffle Infected Earth"
					CanGo+="Cancel"
					switch(input(M,"Where you you like to go?","Capsole Corps Transportation") in CanGo)
						if("Earth")
							M.loc = locate(176,85,8)
							M.it_lock = 1
							M.going_to=1
							M.going=1
							M.z=8
							sleep(1200)
							M.loc=(locate(158,62,1))
							M.z=1
						if("Namek")
							M.loc = locate(176,85,8)
							M.it_lock = 1
							M.z=8
							M.going_to=2
							M.going=1
							sleep(1200)
							M.loc=(locate(57,189,2))
							M.z=2
						if("Future")
							M.loc = locate(176,85,8)
							M.it_lock = 1
							M.z=8
							M.going_to=3
							M.going=1
							sleep(1200)
							M.loc=(locate(110,189,3))
							M.z=3
						if("Tuffle Infected Earth")
							M.loc = locate(176,85,8)
							M.it_lock = 1
							M.going_to=5
							M.going=1
							M.z=8
							sleep(1200)
							M.loc=(locate(158,62,5))
							M.z=5
						if("Cancel")
							M.going=0
							return
					M<< "You have arrived at your destination. Thank you for using <font color=aqua>Capsule Corps</font color=aqua> transportations."
					M.grav_delay = 1
					M.grav = 0
					spawn(50) M.grav_delay = 0
					M.grav_popup = 0
					M.going= 0
					M.going_to=0
					M.it_lock = 0
		//				if("Yadrat")
		//					M.loc = locate(133,2,7)
		/*	Travel_From_Yadrat
				name = "Space Pod"
				density = 1
				Bumped()
					switch(input("Where do you wish to Travel to?")in list("Earth","Namek"))
						if("Earth")
							M.loc = locate(93,85,1)
						if("Namek")
							M.loc = locate(22,118,2)
			Travel_from_Future
				name = "Space Pod to Namek"
				density = 1
				Bumped()
					switch(input("Where do you wish to Travel to?")in list("Past"))
						if("Past")
							M.loc = locate(93,85,1)*/
			else
				del(M)
				del M
obj/Computer/verb/Log_On_Computer()
	set category = "Space Pod Gravity"
	set src in oview(7)
	if(usr.grav_popup)
		usr<< "You already have a gravity window active."
		return
	usr.grav_popup = 1
	var/grav_input = input("What amount of Gravity do you Wish to Train under?","Gravity Training") as num
	var/grav_max = 2500
	if(usr.level >= 350) grav_max = 2800
	if(usr.level >= 26000) grav_max = 21000
	if(usr.level >= 80000) grav_max = 25000
	if(src in oview(7))
		if(!grav_input)
			if(usr.grav >= 1)
				if(usr.grav_delay)
					usr<< "please wait for Gravity to settle."
				else
					usr.grav_on = 0
					usr.grav_delay = 1
					usr<< "You turn the Gravity Off"
					usr.grav = 0
			else
				usr.grav_delay = 1
				usr.grav = 0
		else
			if(grav_input > grav_max)
				usr<< "Gravity cannot exceed x[grav_max]"
			else
				if(grav_input < 1)
					usr<< "Gravity cannot be below x1"
				if(grav_input < 0)
					usr<< "Gravity cannot be below x0"
				else
					if(usr.grav_delay)
						usr<< "you must wait a moment before gravity training again!"
					else
						usr.grav_on = 1
						usr.grav_delay = 1
						usr.grav = grav_input
						usr<< "<font color=red>Gravity will be switched onto x[grav_input] in 5 seconds!"
						spawn(50)
							usr<< "<font color=red>Gravity on at x[grav_input]!"
							usr.Gravity_Strain()
	spawn(50) usr.grav_delay = 0
	usr.grav_popup = 0
	usr.afk_time = 0
obj/Computer
   name = "Ship Computer"
   icon = 'Space Pod.dmi'
   icon_state = "Comp"