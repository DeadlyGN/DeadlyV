#define DEBUG
world
	hub_password = "DVPWNS"
	view = 10
	fps = 15
	version = 1.00
	mob = /mob/Guest
	turf = /turf/No_Walking
	name = "Deadly Vengeance"
	status = "<B><font size = -2><font color = purple>Deadly Vengeance</font> <font color = white>{Version 1.0}</font>"
	hub = "Drkidvictor.DPGDV"
	sleep_offline = 0
	map_format = TOPDOWN_MAP
	icon_size = 32
	New()
		log = file("World Save Files/ErrorLogs.txt")
		..()
		spawn(0) Updates()
		spawn(10) Check_Locs()
		spawn(250) Load_BugReports()
		spawn(3000) REPOP()
		spawn(150) Progress_Saga()
		spawn(150) dragonball_loader_all()
		spawn(150) UPDATE_PLAYERS()
		spawn(1500) CHECK_LAG()
		spawn(2500) for(var/mob/M in players) Ranking(M)
	Del()
		World_Save()
		..()
var
	max_players = 55
	player_limit_on = 0
	statusmessage
	login_attempts = 0
	trainingmode = 2
//	levelmax = 15000000
//	statmax = (15000000*100000000)
	worldsaving = 0
	gamev = "1.00"
	list/
		available_locs1=new()
		available_locs2=new()
		available_locs3=new()
		available_locs4=new()
		available_locs5=new()
		players=new()
		Pets=new()
		Monsters=new()
	Macros={"<font color=blue>    You can Walk with arrows or:</font color=blue><font colo=red>

	ASWD(Up, Down, Left, Right) - Basic Movement(A-West, S-South, W-North, D-East)
"}
mob/var{version=1.00;}
client
	AllowUpload(filename, filelength)
		if(filelength >= 786432 && mob.GMLevel<8) // 768K (0.75M)
			src << "[filename] is too big to upload! Files must be under or equal to 0.75Mb"
			return 0
		return 1
proc
	Check_Locs(){ set background = 1; var/w=1; var/q=1; var/e=1; while(e<6){ var/turf/t=locate(w,q,e); if(!t||t.density||!isturf(t)){ goto noAdd }; for(var/atom/a in view(0,t)){ if(a.density||istype(a,/area/house/)){ goto noAdd; break }}; if(e==1){ available_locs1.Add(t) }; else{ if(e==2){ available_locs2.Add(t) }; else{ if(e==3){ available_locs3.Add(t) }; else{ if(e==4){ available_locs4.Add(t) }; else{ if(e==5){ available_locs5.Add(t) }}}}}; noAdd; w++; if(w>world.maxx){ w=1; q++; }; if(q>world.maxy){ q=1; e++; }}}
	Updates()
		var/list/l = typesof(/updates/)-/updates
		var/n //= l.len
		updates={"
<center>
<br>
<b>dd/mm/yy Updates(vNum) </b><br><br>
"}
		for(n=1 to l.len)
			//world.log<<n
			var/updates/u= l[n]
			u=new u
			updates+={"<font color=blue><b>[u.date] Updates(v[u.version]):</b><br><font color=white>
			-[list2text(u.updated,"<br>-")]<br></font color=white><br>"}
			del u
	World_Save()
		worldsaving=1
		if(fexists("World Save Files/Params.sav")) fdel("World Save Files/Params.sav")
		var/savefile/X
		X= new ("World Save Files/Params.sav","-1")
		X["Log"] << LogList
		X["Updates"] << updates
		X["maxwins"] << maxwins
		X["BootedB"] << BootedB
		X["BannedK"] << BannedK
		X["BannedA"] << BannedA
		X["BannedC"] << BannedC
		X["A_GML1"] << A_GML1
		X["A_GML2"] << A_GML2
		X["A_GML3"] << A_GML3
		X["A_GML4"] << A_GML4
		X["A_GML5"] << A_GML5
		X["Locked_Admin"] << Locked_Admin
		X["guildhouses"] << guildhouses
		X["rules"] << rules
//		X["LevelCap"] << levelmax
//		X["StatCap"] << statmax
		spawn(10000) worldsaving=0
		for(var/obj/Guild_Chest/g) g.Save()
	World_Load()
		if(fexists("World Save Files/Params.sav"))
			var/savefile/X=new("World Save Files/Params.sav")
			X["Log"] >> LogList
			var/c=X["Updates"]
			if(findtextEx(gamev,c)) updates=c
			X["maxwins"] >> maxwins
			X["BootedB"] >> BootedB
			X["BannedK"] >> BannedK
			X["BannedA"] >> BannedA
			X["BannedC"] >> BannedC
			X["A_GML1"] >> A_GML1
			X["A_GML2"] >> A_GML2
			X["A_GML3"] >> A_GML3
			X["A_GML4"] >> A_GML4
			X["A_GML5"] >> A_GML5
			X["Locked_Admin"] >> Locked_Admin
			X["guildhouses"] >> guildhouses
			X["rules"] >> rules
		//	X["LevelCap"] >> levelmax
		//	X["StatCap"] >> statmax
			spawn() RulesSet()
	status_change()
		set background=1
		if(player_limit_on)
			if(statusmessage)
				world.status = "<font size = -2><B><font color=maroon>[world.name]</b><br><b><font color=olive>Players Online:</b> [players.len]/[max_players]<br><b><font color=blue>Version:</b> [gamev]<br><b><font color=red>[statusmessage]."
			else world.status = "<font size = -2><B><font color=maroon>[world.name]:</b><br><b><font color=olive>Players Online:</b> [players.len]/[max_players]<br><b><font color=blue>Version:</b> [gamev]"
		else
			if(statusmessage)
				world.status = "<font size = -2><B><font color=maroon>[world.name]:</b><br><b><font color=olive>Players Online:</b> [players.len]<br><b><font color=blue>Version:</b> [gamev]<br><b><font color=red>[statusmessage]."
			else world.status = "<font size = -2><B><font color=maroon>[world.name]:</b><br><b><font color=olive>Players Online:</b> [players.len]<br><b><font color=blue>Version:</b> [gamev]"
	/*switch_hub()
		if(world.hub=="AllStarBANG.dragonballzdarkapocalypse")
			world.hub="Drkidvictor.DragonballzNewDawn"
			world.hub_password="killer0"
			world.name="Dragonball z New Dawn"
			return
		if(world.hub=="Drkidvictor.DragonballzNewDawn")
			world.hub="AllStarBANG.dragonballzdarkapocalypse"
			world.hub_password = "7randombatshitpassword1"
			world.name="Dragonball z Deadly Vengeance"
			return*/
	UPDATE_PLAYERS()
		set background=1
		players = new()
		for(var/mob/PC/C) if(C.client) players+=C
		status_change()
	REPOP()
		set background=1
		while(TRUE)
			//world.Repop()
			spawn(3)
				for(var/obj/O)
					if(isobj(O)&&istypemulti(O,/obj/Equipment/,/obj/tech/)&&O.z)
						spawn(250) del(O)
			sleep(2350)
client
	script = "<STYLE>BODY {background: black; color: #999999;font-size: -2;font-weight: bold;font-family:arial}</STYLE>"
	perspective = EDGE_PERSPECTIVE
	New()
		if(player_limit_on && players.len >= max_players)
			if(src.key != "Theonethegame" && src.key != "Drkidvictor" && src.key !="DivineBeast15" && src.key != "[Host]" && src.key != "Archfiend Master")
				src<< "<B><font color = red>Sorry, the Server has reached the Maximum Player Count. Please try again Later."
				del(src)
		return ..()
	Del()
		if(istype(src.mob,/mob/PC/))
			PLog("[truelength(mob.name)]([key]) Disconnected. Time: [ReportDate(world.realtime)]. Address: [address]. ID: [computer_id]")
			if(!src.mob:NoCrossSave) world.SetScores(src.key,list2params(list("Logged In"=0)))
			Save_1()
		else PLog("[key] Disconnected. Time: [ReportDate(world.realtime)]. Address: [address]. ID: [computer_id]")
		if(istype(src.mob, /mob/Guest)) return ..()
		//players << "<font color =purple>[world.name] Information: <font color = white>[src.mob]([src])<font color=silver> has left the server."
		status_change()
		return ..()