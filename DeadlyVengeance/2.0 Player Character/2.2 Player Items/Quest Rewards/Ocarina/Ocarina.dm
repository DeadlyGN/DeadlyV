mob/var
 Tapion=0
 ocar_eq=0
obj/Equipment/weapon
	Ocarina
		name = "Ocarina"
		icon = 'Ocarina.dmi'
		density = 0
		equiped = 0
		value = 1000
		var
			Ocarina_icon = 'Ocarina.dmi'
		Click()
			if(src in usr:contents)
				if(!usr.ocar_eq)
					if(usr.weapon == "EMPTY")
						if(!usr.Tapion)
							usr.overlays += Ocarina_icon
							strboost = (usr.ki/15)
							if(usr.karma=="Good") strboost = strboost+(usr.karma_rating*usr.level)
							else strboost = strboost-(usr.karma_rating*usr.level)
							usr<< "You have equiped the: <u>[src]</u>."
							suffix = "(Worn)"
							usr.ki += strboost
							usr.defence += strboost/3
							usr.weapon = src.name
							usr.verbs += new/mob/learn/verb/Ocarina_Song
							usr.Tapion = 1
							usr.ocar_eq = 1
							src.equiped = 1
					else usr<< "Error: You already have a weapon equiped!"
				else
					if(usr.Tapion)
						if(src.equiped)
							usr.overlays -= Ocarina_icon
							usr<< "You have unequiped the: <u>[src]</u>."
							suffix = null
							usr.weapon = "EMPTY"
							usr.ki -= strboost
							usr.defence -= strboost/3
							strboost = 0
							usr.verbs -= new/mob/learn/verb/Ocarina_Song
							usr.Tapion = 0
							usr.ocar_eq = 0
							src.equiped = 0
						else usr<< "Error: </b>You may only have one of: <u>[src.name]</u> equiped."
		verb
			Examine()
				set category = null
				var/examine_turban = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr><td width=273 colspan=2 height=18><font face=Tahoma color=#FF0000>Ocarina</font></b></td></tr><tr><td width=96 height=12><font size=1 color=red face=Tahoma>Condition:</font></b></td><td width=170 height=12><font size=1><font face=Tahoma>[condition]</font></b></font><font size=1 face=Tahoma> / [condition_max]</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td><td width=174 height=12><font face=Tahoma size=1>Weapon (Namek Only)</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td><td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td></tr><tr><td width=273 colspan=2 height=48 style=font-family: Tahoma; font-size: 8pt; font-weight: bold><font face=Tahoma size=1>Ocarina which was used by Tapion. It increases the users ki and defence</font></b></td></tr></table>"
				usr<< browse(examine_turban,"window=Ocarina;size=300x275;border=0;can_resize=0; can_minimize=0;")
			Pick_Up()
				set src in oview(0)
				set category = null
				if(Move(usr))
					if(usr.inven_min < usr.inven_max)
						usr<< "You have picked up the: <u>[src]</u>."
						usr.inven_min += 1
					else usr<< "No more room for items."
				else usr<< "You're unable to pick up the: <u>[src]</u>."
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr<< "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else usr<< "You're unable to drop: <u>[src.name]</u>, it's already equipped."
mob/learn
	verb
		Ocarina_Song()
			set category="Techniques"
			var/obj/tech/H = new/obj/tech/Ocarina_Song(o=src)
			H.ki_damage = round(((usr.ki_skill / usr.ki_skill_max) * usr.level) + usr.powerlevel_max * 0.40)
			var/ki_cost = round(src.ki_max * 0.24)
			if(src.ki >= ki_cost)
				if(!src.doing)
					if(!src.doing) src.doing ++
					usr.Icon_State("attack")
					sleep(11)
					usr.Icon_State("")
					src.ki -= ki_cost
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					if(H) H:dir = src.dir
					if(H) H:loc = src.loc
					while(H)
						step(H,H:dir)
						if(!H)break
						var/T = H:loc
						var/turf/K=T
						var/obj/L=T
						var/area/U=T
						if((U.density||K.density||L.density)&&!istypemulti(K,/turf/Island_Edge/,/turf/Namek_Island_Edge/))
							del(H)
							break
						if(istype(U,/area/house/))
							del(H)
							break
						for(var/mob/M as mob in T)
							var/absorb_max = round(M.powerlevel_max)
							var/ki_absorbed = round(M.ki_shield_strength - H.ki_damage)
							if(M == src && src == M)
								del(H)
								del H
								return
							if(!M.dead && !M.safe && M.pk)
								Explode(new /Effect/BasicBoom(M.loc,1,3))
								if(src.doing) src.doing --
								src.frozen = 0
								if(M.ki_shield)
									if(ki_absorbed >= 1)
										src<< "<font color = #00C3ED>[M]'s ki shield absorbed the attack's damage!"
										M << "<font color = #00C3ED>Your ki shield absorbed [src]'s attack!"
									H.ki_damage=round(ki_absorbed)
									M.ki_shield_strength -= round(H.ki_damage)
								else
									if(M.absorbing)
										if(absorb_max > H.ki_damage)
											M << "\red [src]'s attack hits you, but you managed to absorb the energy!"
											src<<"\red Your Ocarina was absorbed by [M]!"
											M.gooda+=1
											M.UTBA()
											M.ki += H.ki_damage; if(M.ki>M.ki_max*1300){ M.KiExplosion() }
											return
										else M << "\red You tried to absorb [src]'s Ocarina, but it was too strong!"
								M.Damage(H.ki_damage)
								M.SmallKiDeathCheck(src)
								//if(prob(30))
								//	M << "\blue [usr.name]'s song calms you into a sleep."
							del(H)
						sleep(1)
obj/tech/Ocarina_Song
	icon = 'Song.dmi'