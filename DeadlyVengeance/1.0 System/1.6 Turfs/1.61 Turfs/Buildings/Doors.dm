obj/Buildings
	icon = 'Buildings.dmi'
	name = ""
	Door_1
		density = 1
		icon_state = "door 1-1"
		var/open = 0
		layer = 5
		Bumped()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
			if(usr.client) if(!usr.safe) usr.safe = 1
			if(!src.open)
				src.Icon_State("door 1-2")
				src.density = 0
				sleep(30)
				src.Icon_State("door 1-1")
				src.density = 1
		Enter()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(!src.open||usr.doing)return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
	Door_2
		density = 1
		icon_state = "door 2-1"
		var/open = 0
		layer = 5
		Bumped()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
			if(usr.client) if(!usr.safe) usr.safe = 1
			if(!src.open)
				src.Icon_State("door 2-2")
				src.density = 0
				sleep(30)
				src.Icon_State("door 2-1")
				src.density = 1
		Enter()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(!src.open||usr.doing)return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
	Door_2b
		density = 1
		icon_state = "door 2-1b"
		var/open = 0
		layer = 5
		Bumped()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
			if(usr.client) if(!usr.safe) usr.safe = 1
			if(!src.open)
				src.Icon_State("door 2-2b")
				src.density = 0
				sleep(30)
				src.Icon_State("door 2-1b")
				src.density = 1
		Enter()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(!src.open||usr.doing)return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
	Door_3
		density = 1
		icon_state = "door 2-2"
	Door_4
		density = 1
		icon_state = "side2"
		var/open = 0
		layer = 2
		Bumped()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
			if(usr.client) if(!usr.safe) usr.safe = 1
			if(!src.open)
				var/mob/A=usr
				sleep(2)
				src.dir=A.dir
				src.Icon_State("side3a")
				src.density = 0
				sleep(30)
				icon_state = "side2"
				src.density = 1
		Enter()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(!src.open||usr.doing)return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
	Door_5
		density = 1
		icon_state = "side1"
		var/open = 0
		layer = 2
		Bumped()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
			if(usr.client) if(!usr.safe) usr.safe = 1
			if(!src.open)
				var/mob/A=usr
				sleep(2)
				src.dir=A.dir
				src.Icon_State("side3b")
				src.density = 0
				sleep(30)
				icon_state = "side1"
				src.density = 1
		Enter()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(!src.open||usr.doing)return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
	Door_6
		density = 1
		icon_state = "side5"
		var/open = 0
		layer = 2
		Bumped()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
			if(usr.client) if(!usr.safe) usr.safe = 1
			if(!src.open)
				var/mob/A=usr
				sleep(2)
				src.dir=A.dir
				src.Icon_State("side4")
				src.density = 0
				sleep(30)
				icon_state = "side5"
				src.density = 1
		Enter()
			if(isobj(usr))
				del usr
				del(usr)
				return
			if(!src.open||usr.doing)return
			if(usr.client) for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<< "You cannot enter with a dragonball!"
					return
atom/proc/Bumped(atom/movable/A)
atom/movable/Bump(atom/A)
     ..()
     A.Bumped(src)