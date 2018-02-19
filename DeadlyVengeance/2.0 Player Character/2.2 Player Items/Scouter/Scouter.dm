mob
	Scouter
		verb
			Scouter(msg as text)
				set category = "Channels"
				if(src.jailed) return
				if(lentext(msg) > 120)
					spawn() alert(src,"Your message can not exceed 120 characters.")
					var/extra=copytext(msg,120)
					if(src.ChatBar1=="Scouter")
						winset(src,"chat2.input2","text=\"[extra]")
					else
						if(src.ChatBar2=="Scouter")
							winset(src,"chat2.input3","text=\"[extra]")
						else
							spawn()
								var/I=input(src,"What would you like to say in Scouter Chat?","Scouter",extra)
								if(I) call(src,"Scouter") (I)
					msg = copytext(msg,1,120)
				if(Check_For_Text(msg,BAD_LINK)==TRUE||Check_For_Bad_Links2(msg)==TRUE||Check_For_Bad_Links3(msg)==TRUE)
					usr<<"You cannot advertise here."
					return
				msg=Remove_Whitespace(ReplaceTxt(msg,LineBreak," "))
				msg=html_encode(msg)
				msg="<font color=#000066>{<font color=lime><font face = Tahoma>Scouter([src.scouter_channel])<font color=#000066>} \white [src]: \green [msg]"
				if(src.scouter_eq){ if(!src.scouter_channel){src.scouter_channel=1;}; SChatLog(usr,msg); for(var/mob/PC/M in players){ if(!M.saylisten){ if(!M.scouter_eq||M.scouter_channel != src.scouter_channel||src.key in M.Ignored){ continue }}; if(M.censorme){ M << Censor(msg)}; else {M << msg}}};
				else {src<< "You must have your <u>Scouter</u> equiped."}
obj/Equipment/Head
	Scouter
		name = "Scouter"
		icon = 'Scouter.dmi'
		density = 0
		equiped = 0
		value = 750
		condition = 500
		condition_max = 500
		var
			scouter = 'Scouter.dmi'
		Click()
			if(src in usr:contents)
				if(!usr.scouter_eq)
					if(usr.head == "EMPTY")
						if(!usr.scouter)
							usr.overlays += scouter
							usr<< "You have equiped the: <u>[src]</u>."
							usr.verbs += typesof(/mob/Scouter/verb/)
							src.suffix = "(Worn)"
							usr.head = src.name
							usr.scouter = 1
							usr.scouter_eq = 1
							src.equiped = 1
					else usr<< "Error: You already have something equipped on your Head!"
				else
					if(usr.scouter)
						if(src.equiped)
							usr.overlays -= scouter
							usr<< "You have unequiped the: <u>[src]</u>."
							usr.verbs -= typesof(/mob/Scouter/verb/)
							suffix = null
							usr.head = "EMPTY"
							usr.scouter = 0
							usr.scouter_eq = 0
							src.equiped = 0
							usr.scouter_channel = 0
						else usr<< "Error: </b>You may only have one of: <u>[src.name]</u> equiped."
		verb
			Examine()
				set category = null
				var/examine_scouter = "<body bgcolor=#000000 text=#FFFFFF><table border=0 cellspacing=1 width=250 id=AutoNumber1 height=210><tr><td width=273 colspan=2 height=18><font face=Tahoma color=#FF0000>Scouter</font></b></td></tr><tr><td width=96 height=12><font size=1 color=red face=Tahoma>Condition:</font></b></td><td width=170 height=12><font size=1><font face=Tahoma>[condition]</font></b></font><font size=1 face=Tahoma> / [condition_max]</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Trait</font><font size=1 color=red face=Tahoma>:</font></b></td><td width=174 height=12><font face=Tahoma size=1>Examine people's Stats</font></b></td></tr><tr><td width=96 height=12><font face=Tahoma size=1 color=#FF0000>Owner:</font></b></td><td width=174 height=12><font face=Tahoma size=1>[usr]</font></b></td></tr><tr><td width=273 colspan=2 height=48 style=font-family: Tahoma; font-size: 8pt; font-weight: bold><font face=Tahoma size=1>A one eye piece head set worn on one side of the head, it is a device used to determine the power, speed and distance of opponents. All information can be seen through the green eye piece. It can also be used as a communicator. </font></b></td></tr></table>"
				usr<< browse(examine_scouter,"window=Hench;size=300x275;border=0;can_resize=0; can_minimize=0;")
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
			Scouter_Channel()
				set category = null
				if(src.equiped)
					var/scouter_chan = input("What channel do you want to tune you scouter to?","Scouter Channel") as num
					if(!scouter_chan) return
					usr.scouter_channel = scouter_chan
				else usr<< "You must have the: <u>[src.name]</u> equiped before proceeding."
			Scan(mob/M in oview(7))
				set category = null
				if(src.equiped)
					var/form = M.form
					if(M.form=="") form = "Base form"
					if(M.form=="Ranger") form = "<font color=[M.pranger]>Ranger"
					usr<< "<center>---------------------</center>"
					usr<< "<center><font size = 4>[M]</size></center>"
					usr<< "<center><font size = 2>Key: [M.key]</size></center>"
					usr<< ""
					usr<< "<center>Karma: [M.karma] :[M.karma_rating]%</center>"
					usr<< "<center>Level: [commaapplier(M.level)]</center>"
					usr<< "<center>Powerlevel: [commaapplier(M.powerlevel)] / [commaapplier(M.powerlevel_max)]</center>"
					usr<< "<center>Ki: [commaapplier(M.ki)] / [commaapplier(M.ki_max)]</center>"
					usr<< "<center>Strength: [commaapplier(M.strength)] / [commaapplier(M.strength_max)]</center>"
					usr<< "<center>Defence: [commaapplier(M.defence)] / [commaapplier(M.defence_max)]</center>"
					usr<< ""
					usr<< "<center>Currently In: [form]</center>"
					usr<< "<center>Energy Code: [num2text(M.energy_code,7)]</center>"
					usr<< "<center>---------------------</center>"
					usr.afk_time = 0
				else usr<< "You must have: <u>[src.name]</u> equiped."
mob
	DblClick()
		..()
		if(usr.see) return
		usr.see=1
		if(src.client)
			if((usr.scouter_eq&&(src in view(7)))||usr.GMLevel>3)
				var/form1 = src.form
				if(src.form=="") form1 = "Base form"
				if(src.form=="Ranger") form1 = "<font color=[src.pranger]>Ranger"
				usr<< "<center>---------------------</center>"
				usr<< "<center><font size = 4>[src.name]</size></center>"
				usr<< "<center><font size = 2>Key: [src.key]</size></center>"
				usr<< ""
				usr<< "<center>Karma: [src.karma] :[src.karma_rating]%</center>"
				usr<< "<center>Level: [commaapplier(src.level)]</center>"
				usr<< "<center>Powerlevel: [commaapplier(src.powerlevel)] / [commaapplier(src.powerlevel_max)]</center>"
				usr<< "<center>Ki: [commaapplier(src.ki)] / [num2text(src.ki_max)]</center>"
				usr<< "<center>Strength: [commaapplier(src.strength)] / [commaapplier(src.strength_max)]</center>"
				usr<< "<center>Defence: [commaapplier(src.defence)] / [commaapplier(src.defence_max)]</center>"
				usr<< ""
				usr<< "<center>Currently In: [form1]</center>"
				usr<< "<center>Energy Code: [num2text(src.energy_code,7)]</center>"
				usr<< "<center>---------------------</center>"
			else usr<<"<center>[src.name]:<br>[src.level]"
		usr.afk_time = 0
		spawn(30) usr.see=0
mob/var/tmp/see = 0