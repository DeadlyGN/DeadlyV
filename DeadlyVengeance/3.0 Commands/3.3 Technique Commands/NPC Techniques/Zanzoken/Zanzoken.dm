mob/var/zanzoken = 0
mob/learn
	verb/Zanzoken()
		set category = "Techniques"
		if(src.zanzoken) src<< "You stop using your Zanzoken Ability"
		else src<< "You start using your Zanzoken Ability"
		src.zanzoken = !src.zanzoken
client
	DblClick(O as obj|turf)
		usr.afk_time = 0
		var/ki_cost = round(rand(5000,(usr.ki/100)+25000))
		if(usr.jailed||usr.frozen||usr.donut_wrapped||usr.wrapped||usr.dead||usr.boxing||usr.rest||usr.dual_training||usr.selftraining||usr.meditation||usr.meditate) return
		if(usr.zanzoken)
			if(istype(O,/mob/)){ ..(); return; }
			if(istype(O,/turf/No_Walking)||istype(O,/turf/SnakeWay/)||istype(O,/obj/Equipment/)||istype(O,/turf/Trees/Sky_2_7)) return
			for(var/A in view(0,O))
				if(istype(A,/area/house/))
					for(var/obj/G in usr.contents)
						if(istype(G,/obj/Dragonballs))
							if(usr.client) usr << "You cannot enter with a dragonball!"
							return
				if((istype(A,/mob/)||istype(A,/obj/))&&usr.density&&A:density) return
			var/turf/T = O
			if(istype(T,/turf/)) if(T.density&&usr.density) return
			if(usr.ki >= ki_cost)
				if(get_step_away(usr,O,8))
					usr.After_Image()
					usr.Flick("IT")
					usr.ki -= ki_cost
					usr.x = O:x
					usr.y = O:y
			else usr<< "You don't have enough Ki!"
		else{ ..(); return; }
		usr.afk_time = 0
mob
	Monster
		After_Image
			name = ""
			powerlevel = 750
			powerlevel_max = 750
			ki = 0
			ki_max = 0
			speed = 5
			strength = 50
			defence = 15
			critical = 2
			karma = ""
			race = ""
			level = 15
			zenni = 5
			pk = 1
			exp = 100
			tnl = 100
			Wander()
				return 0
mob/proc
	After_Image()
		if(!src||!istype(src,/mob/PC/))return
		var/mob/Monster/After_Image/A = new /mob/Monster/After_Image(locate(src))
		A.icon = src.icon
		A.name = "{After Image}[name]"
		A.level = src.level
		A.owner = src.name
		A.spawnin = null
		spawn(30) del A