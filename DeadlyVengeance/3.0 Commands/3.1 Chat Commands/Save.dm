mob/PC/verb/Save()
	set category = "Channels"
	switch(alert(usr,"Do you wish to Save your game?","Save","Save to Server"/*,"Download Save File"*/))
		if("Save to Server")
			//if(src.fused||src.fusing)return
			spawn(2) src.client.Save_1()
var
 tournytimer=1
 rebootrate=65
mob/var
	tmp/SIdelay = 0
	notifysave = 0
mob/PC/verb
	ServerInfo()
		set name = "Server Information" //Name that shows up in the set category.
		set category = "Channels" //Category u want it under.
		var/calcLag = abs(world.cpu - 100)
		if(src.SIdelay) return
		src.SIdelay+=50
		sleep(5)
		var/server
		if(world.host) server+= {"<font color=red><small>Server Hosted By: <font color=blue>[world.host]</font><br>"}
		server+= {"<font color=red><small>Server Version: <font color=blue>[gamev]</font><br>"}
		server+= {"<font color=red><small>Server Hosted On: <font color=blue>[world.system_type]</font><br>"}
		server+= {"<font color=red><small>Server BYOND v: <font color=blue>[world.byond_version]</font><br>"}
		server+= {"<font color=red><small>Server Efficiency: <font color=blue>[calcLag]%</font><br>"}
		server+= {"<font color=red><small>Server Address: byond://[world.address]:[world.port]</font><br>"}
		server+= {"<font color=red><small>Time Hosted: <font color=blue>[world.time/100](Seconds)</font>"}
		if(auto_tournament)
			if(tournytimer) server+= {"<br><font color=red><small>Next Tournament: <font color=blue>[tournytimer] minutes.</font>"}
			else server+= {"<br><font color=red><small>Next Tournament: <font color=blue>Active.</font>"}
		else server+= {"<br><font color=red><small>Next Tournament: <font color=blue>Offline.</font>"}
		if(statusmessage) server+= {"<br><font color=red><small>Special Message: <font color=blue>[statusmessage].</font>"}
		if(src.GMLevel)
			server+= {"<br><font color=red><small>GM Tournament allowance: <font color=blue>[gmallow].</font>"}
			if(src.GMLevel>3) server+= {"<br><font color=red><small>Auto Reboot Requirement: <font color=blue>[rebootrate].</font>"}
		src<<server
		spawn(src.SIdelay) src.SIdelay=0
proc
	CHECK_LAG()
		while(TRUE)
			if(tournament){ sleep(600); continue; }
			var/LagPercentage = abs(world.cpu - 100)
			if(LagPercentage<=rebootrate)
				players<<"World Efficiency too low, rebooting."
				world.Reboot()
			else
				if(world.tick_lag>1.35) world.tick_lag=0.75
				if(auto_tournament&&tournytimer) tournytimer -= 1
				if(!tournytimer){ spawn(){ Start_Auto_Tournament()}; sleep(600); continue; }
				spawn() World_Save()
			sleep(600)