mob/var/
 tmp/cooldown = 0
 tmp/killer = ""
obj/var/looter = ""
obj/Saibaman_Corpse
	icon = 'Saibaman - Form 1.dmi'
	layer = MOB_LAYER
	New()
		spawn(250) del src
		..()
	verb
		Loot()
			set src in oview(1)
			set category = null
			if(!looter||looter == usr.name||findtext(looter,"{NPC}"))
				var{Gained=0;Had=0;}
				for(var/obj/O in src.contents)
					Had++
					if(usr.inven_min<usr.inven_max){usr<< "You loot: <I>\green [O.name]</I>"; usr.contents += O; usr.inven_min++; Gained++; }
					else {usr<< "You were unable to loot: <I>\green [O.name]</I>"; O.loc=locate(src); }
				if(!Had) usr<< "This Saibaman didn't bear any fruit."
				else if(!Gained) usr<<"You failed to harvest anything from this saibman."
				sleep(7)
				del(src)
			else usr<< "You do not have permission to loot that corpse!"
obj/Equipment/Consumable/Saiba_Skin
	icon= 'Saibaman - Form 1.dmi'
	icon_state= "Loot"
	New(obj/o)
		if(o)
			src.icon=o.icon
			src.transform=turn(o.transform,90)
		..()
	Click()
		call(src,"Eat")()
	verb/Eat()
		set category = null
		if(src in usr.contents)
			if(usr.regenerating)
				usr<< "You cannot use this while regenerating."
				return
			if(usr.regen_dead)
				usr<< "You cannot use this at the moment."
				return
			if(usr.KO)
				usr<< "You cannot use this at the moment."
				return
			view(6)<< "[usr] has eaten a: [src.name]."
			usr.powerlevel = round(max(usr.powerlevel_max/2,usr.powerlevel))
			usr.ki = round(max(usr.ki_max/2,usr.ki))
			usr.strength = round(max(usr.strength_max/2,usr.strength))
			usr.defence = round(max(usr.defence_max/2,usr.defence))
			usr.fatigue -= round(usr.fatigue/4)
			usr.inven_min -= 1
			del(src)
mob
	Monster
		Green_Saiba_Man
			name = "{NPC} Saibaman"
			icon = 'Saibaman - Form 1.dmi'
			powerlevel = 175000
			powerlevel_max = 175000
			ki = 10
			ki_max = 10
			speed = 5
			strength = 500000
			defence = 150000
			critical = 2
			karma = "Evil"
			race = "Green Saibaman"
			level = 15
			zenni = 15
			pk = 1
			exp = 100
			tnl = 100
			var/Color="Green"
			New()
				..()
				var/Boost=1
				verbs+=/mob/learn/verb/Self_Destruct
				Color=pick(1000;"Green",100;"Blue",10;"Red",1;"Black/White")
				switch(Color)
					if("Green")
						icon='Saibaman - Form 1.dmi'
						Color="Green"
					if("Blue")
						Boost=100
						icon='Saibaman - Form 3.dmi'
						Color="Blue"
					if("Red")
						Boost=1000
						icon='Saibaman - Form 2.dmi'
						Color="Red"
					if("Black/White")
						Boost=10000
						if(prob(50))
							icon='Saibaman - Form 5.dmi'
							Color="Black"
						else
							icon='Saibaman - Form 7.dmi'
							Color="White"
				if(Boost>1) Level_Up(Boost)
				powerlevel*=Boost
				powerlevel_max*=Boost
				ki*=Boost
				ki_max*=Boost
				defence*=Boost
				defence_max*=Boost
				strength*=Boost
				strength_max*=Boost
				race="[Color] Saibaman"
			Del()
				var/obj/M = new/obj/Saibaman_Corpse
				if(src.oldloc) M.loc = src.oldloc
				else M.loc = src.loc
				M.icon=src.icon
				M.transform = turn(src.transform, 90)
				M.looter = src.killer
				if(prob(25)) new/obj/Equipment/Consumable/Saiba_Skin(M)
				else if(prob(0.8))
					var/obj/Equipment/Chest/Gi/O = new
					var/type = rand(1,4)
					switch(type)
						if(1)
							O.name = "Gi of Saiba Strength"
							O.icon = 'Gi of Strength.dmi'
							O.gi = 'Gi of Strength.dmi'
							O.str_bonus += src.strength_max
						if(2)
							O.name = "Gi of Saiba Durability"
							O.icon = 'Gi of Defence.dmi'
							O.gi = 'Gi of Defence.dmi'
							O.def_bonus += src.defence_max
						if(3)
							O.name = "Gi of Saiba Power"
							O.icon = 'Gi of Power.dmi'
							O.gi = 'Gi of Power.dmi'
							O.pl_bonus += src.powerlevel_max
						if(4)
							O.name = "Gi of Saiba Energy"
							O.icon = 'Gi of Ki.dmi'
							O.gi = 'Gi of Ki.dmi'
							O.ki_bonus += src.ki_max
					O.has_stats = 1
					M.contents += O
				..()
			Wander()
				spawn()
					while(src)
						var{Found = FALSE}
						for(P in oview(7))
							if(!attacker||attacker == P)
								if(P in get_step(src,get_dir(src,P))) Attack2(P)
								else
									step_to(src,P,1)
									if(prob(32)&&get_dist(src,P)<=2&&dir<5) call(src,"Self Destruct")()
								Found = TRUE
								break
						if(Found != TRUE){ sleep(18); if(src.loc!=src.spawnin) step_to(src,spawnin)}
						sleep(round(speed,0.1))