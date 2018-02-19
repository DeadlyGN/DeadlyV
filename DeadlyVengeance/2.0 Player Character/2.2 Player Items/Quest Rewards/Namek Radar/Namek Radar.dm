obj/Equipment/Consumable
	Namek_Radar
		icon = 'Dragon Radar.dmi'
		icon_state = "DBRadar"
		Click()
			if(src in usr:contents)
				for(var/obj/Dragonballs/B in NamekBalls)
					if(B.x==0||B.y==0||B.z==0) usr<<"<font color = lime>[B.name]: </font> [B.loc]"
					else usr << "<font color = lime>[B.name]: </font> [B.x], [B.y], [B.z]"
		verb
			Examine()
				set category = null
				var/examine_dragon = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr><td width=273 colspan=2 height=18><font face=Tahoma color=#FF0000>Namek Radar</font></b></td></tr><tr><td width=96 height=12><font size=1 color=red face=Tahoma>Condition:</font></b></td><td width=170 height=12><font size=1><font face=Tahoma>[condition]</font></b></font><font size=1 face=Tahoma> / [condition_max]</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td><td width=174 height=12><font face=Tahoma size=1>Detect Namek Dragonballs</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td><td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td></tr><tr><td width=273 colspan=2 height=48 style=font-family: Tahoma; font-size: 8pt; font-weight: bold><font size=1 face=Tahoma>Capable of detecting all the Dragonballs on namek. The front piece has a display that shows where and how far away you're from the nearest Namek Dragonball(s). You can also set the range as to how much area you want to cover.&nbsp;</font></b></td></tr></table>"
				usr<< browse(examine_dragon,"window=Namek Radar;size=300x275;border=0;can_resize=0; can_minimize=0;")
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
					src.Icon_State("DBRadar")
					usr<< "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else usr<< "You're unable to drop: <u>[src.name]</u>, it's already equipped."





