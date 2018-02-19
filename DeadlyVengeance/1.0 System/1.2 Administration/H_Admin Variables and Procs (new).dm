var/tmp/GM_WorldShutDownProc=0
//****************************//
//***World ShutDown Password
//If you would like to make it so that only those who know this password are allowed to shut
// down the world, just set one... currently it is set to 0, or null, meaning anyone can shut
// down your worlds.  I suggest you change it to some other password.
var
 GM_ShutDownPass=0
//*******************************************************************************************//
//Other sttuff... in order to make the people you want getting admin to get admin, you have to
//run the AdminLoad() proc on them at any given point, most likely at login, so if you want
//them to be added at login, then dont do anything because thats the default.
var/Host
//*******************************************************************//
//*****************Basic Loady Stuff*********************************//
//*******************************************************************//
var/list{
 BootedB
 BanRecord
 BannedK
 BannedA
 BannedC
 TempBanK
 TempBanA
 LogList
 A_GML1
 A_GML2
 A_GML3
 A_GML4
 A_GML5
 Locked_Admin
 anncments
 GM_anncments}
var
 PlayerLog=file("World Save Files/System/Connection/Player Connections.txt")
 AdminLog=file("World Save Files/System/Admin Verb Use/Admin Log.txt")
 ChatLog=file("World Save Files/System/Chat/Complete Log.txt")
mob/proc
	SAdminLog(mob/usr,Info)
		var/ISF=file("World Save Files/System/Admin Verb Use/[usr.ckey].txt")
		ISF<<"[Info]"
	SPlayerLog(client/usr,Info)
		var/ISF=file("World Save Files/System/Connection/[ckey].txt")
		ISF<<"[Info]"
	SChatLog(mob/usr,Info)
		var/ISF=file("World Save Files/System/Chat/[ckey].txt")
		Info="[time2text(world.timeofday)] - [usr]([usr.key]): "+truelength(Remove_Whitespace(ReplaceTxtex(Info,LineBreak," ")))
		ISF<<"[Info]"
		ChatLog<<"[Info]"
world
	New()
		ALog("World Opened. [ReportDate(world.realtime)] Host Address: [world.address].")
		if(fexists("DragonballzDA.dyn.rsc")) fdel("DragonballzDA.dyn.rsc")
		if(fexists("World Save Files/Player Names.sav"))
			var/savefile/N=new("World Save Files/Player Names.sav")
			Name=null
			Name=list()
			N["Name"] >> Name
		World_Load()
		TempBanK = new /list
		TempBanA = new /list
		BanRecord = new /list
		if(isnull(BannedK)) BannedK = new /list
		if(isnull(BannedA)) BannedA = new /list
		if(isnull(BannedC)) BannedC = new /list
		if(isnull(A_GML1)) A_GML1 = new /list
		if(isnull(A_GML2)) A_GML2 = new /list
		if(isnull(A_GML3)) A_GML3 = new /list
		if(isnull(A_GML4)) A_GML4 = new /list
		if(isnull(A_GML5)) A_GML5 = new /list
		if(world.address in BannedA||"127.0.0.1" in BannedA||ckey(world.host) in BannedK) del world
		..()
	Del()
		ALog("World Closed. [ReportDate(world.realtime)] Host Address: [world.address].")
		if(fexists("DragonballzDA.dyn.rsc")) fdel("DragonballzDA.dyn.rsc")
		..()
//////*****************//////
  //***Ban/Log Related***//
//////*****************//////
client/New()
	spawn(1)
/*		if(BootedB.Find(ckey))
			src<< "\red You're temporarely booted from [world.name]"
			AdminMessage("[key] tried connecting from [address] Time: [ReportDate(world.realtime)]")
			spawn(1) del src
			return*/
		if(BannedC.Find(computer_id))
			if(BanRecord.Find(ckey))
				src<<"<font color=red>You're banned from [world.name]"
				spawn() del src
				return
			AdminMessage("[key] tried connecting from [address]([computer_id]) Time: [ReportDate(world.realtime)]")
			ALog("Computer Ban: [key] was prevented from connecting from [address]([computer_id]). Time: [ReportDate(world.realtime)]")
			usr<<"<font color=red> You're banned from this server"
			BanRecord+=ckey
			spawn() del src
			return
		if(TempBanK.Find(ckey)&&TempBanA.Find(address))
			if(BanRecord.Find(ckey))
				src<<"<font color=red>You're banned from [world.name]"
				spawn() del src
				return
			AdminMessage("[key] tried connecting from [address]([computer_id]) Time: [ReportDate(world.realtime)]")
			ALog("Temp Ban: [key] was prevented from connecting from [address]([computer_id]) but was temp key and ip banned. Time: [ReportDate(world.realtime)]")
			usr<<"<font color=red>You're banned from this server"
			BanRecord+=ckey
			spawn() del src
			return
		if(TempBanK.Find(ckey))
			if(BanRecord.Find(ckey))
				src<<"<font color=red>You're banned from [world.name]"
				spawn() del src
				return
			AdminMessage("[key] tried connecting from [address]([computer_id]) Time: [ReportDate(world.realtime)]")
			ALog("Temp Ban: [key] was prevented from connecting from [address]([computer_id]) but was temp key banned. Time: [ReportDate(world.realtime)]")
			usr<<"<font color=red>You're banned from this server"
			BanRecord+=ckey
			spawn() del src
			return
		if(TempBanA.Find(address))
			if(BanRecord.Find(ckey))
				src<<"<font color=red>You're banned from [world.name]"
				spawn() del src
				return
			AdminMessage("[key] tried connecting from [address]([computer_id]) Time: [ReportDate(world.realtime)]")
			ALog("Temp Ban: [key] was prevented from connecting from [address]([computer_id]) but was temp ip banned. Time: [ReportDate(world.realtime)]")
			usr<<"<font color=red>You're banned from [world.name]"
			BanRecord+=ckey
			spawn() del src
			return
		if(BannedK.Find(ckey)&&BannedA.Find(address))
			if(BanRecord.Find(ckey))
				src<<"<font color=red>You're banned from [world.name]"
				spawn() del src
				return
			AdminMessage("[key] tried connecting from [address]([computer_id]) Time: [ReportDate(world.realtime)]")
			ALog("Ban: [key] was prevented from connecting from address [address]([computer_id]). Time: [ReportDate(world.realtime)]")
			BanRecord+=ckey
			usr<<"<font color=red>You're banned from [world.name]"
			spawn() del src
			return
		if(BannedK.Find(ckey))
			if(BanRecord.Find(ckey))
				src<<"<font color=red>You're banned from [world.name]"
				spawn() del src
				return
			AdminMessage("[key] tried connecting from [address]([computer_id]) Time: [ReportDate(world.realtime)]")
			ALog("Ban: [key] was prevented from connecting from address [address]([computer_id]). Time: [ReportDate(world.realtime)]")
			BanRecord+=ckey
			usr<<"<font color=red>You're banned from [world.name]"
			spawn() del src
			return
		if(BannedA.Find(address))
			if(BanRecord.Find(ckey))
				src<<"<font color=red>You're banned from [world.name]"
				spawn() del src
				return
			AdminMessage("[key] tried connecting from [address]([computer_id]) Time: [ReportDate(world.realtime)]")
			ALog("Ban: [key] was prevented from connecting from address [address]([computer_id]). Time: [ReportDate(world.realtime)]")
			BanRecord+=ckey
			usr<<"<font color=red>You're banned from [world.name]"
			spawn() del src
			return
	..()
	spawn(5) PLog("[key] Connected. Mob Name: [mob.name]. Time: [ReportDate(world.realtime)]. Address: [address]. ID: [computer_id]")
//*******************//
//***Special Procs***//
//*******************//
mob/proc
	GMLockCheck()
		if(!usr.GMLock) return usr.GMLevel
		return 0
//*************//
//*Log Related*//
//*************//
proc
	ALog(Text)
		AdminLog<<"[Text]"
	lockadmin(key)
		Locked_Admin+="[ckey(key)]"
		for(var/mob/M in players) if("[ckey(M.key)]"=="[ckey(key)]") M.GMLock=1
	PLog(Text)
		PlayerLog<<"[Text]"
	RulesSet()
		if(rules==null)rules=initial(rules)
		PlayerRules = {"<html>
<b><font color = red><body bgcolor=black><center>
<font color="green" size="-1" face="Arial, Helvetica, sans-serif"><big><font color="Blue">Player
Guidelines</font></big><br>
<br>
<i>These rules must be read carefully. Dont follow them and you will be punished.</i><br>
<br>
-Remember: Stupidity IS punishable.<br>"}
		for(var/R in rules)PlayerRules+="[R]<br>"
		PlayerRules+={"</font><br><br><br>


<b><font color = white><body bgcolor=black><center>
[AdminRules]
<br>
<br>
<br>
<font color="#FFFFFF" size="-1" face="Arial, Helvetica, sans-serif"><big><font color="#FF0000">Server Specs.
</font></big><br><br>
<b>Server Host: </b>[Host]<br>
<b>Host OS: </b>[world.system_type]<br>
<b>Host Connection: </b>Broadband<br>
<b>BYOND Version: </b>[world.byond_version]<br>
<br>
<font color="#FFFFFF" size="-1" face="Arial, Helvetica, sans-serif"><big><font color="#FF0000">Energy Codes
</font></big><br><br><br>
**************~Earth NPCs~***************<br>
Banker: 5432211<br>
Barber: 5432233<br>
Broker: 9384736<br>
Bulma: 5534561<br>
Dende: 6574567<br>
Dr Briefs: 1242351<br>
Goku: 2290876<br>
Korin: 5564321<br>
Krillin: 5321659<br>
Master Roshi: 9987654<br>
Shop Keeper (Clothing): 5445677<br>
Shop Keeper (Weights): 4456744<br>
Shop Keeper (Misc): 8879554<br>
Tien: 8876976<br>
Trunks: 7234561<br>
Vegeta: 7227361<br>
Videl: 2245332<br>
Yamcha: 1356437<br><br>
************~Planet Namek NPCs~************<br>
Frieza: 1980776<br>
Guru: 6678554<br>
Piccolo: 2254343<br><br>
************~Future NPCs~************<br>
Tapion: 2290876<br>
Yadrat: 2291346<br><br>
************~Other World NPCs~************<br>
Dabura: 2234155<br>
King Kai: 2215368<br>
Supreme Kai: 3317954<br></font>
Supreme Kai: 3317954<br></font>
<br>
</font></big><br>
"}
		AdminRules={"[AdminRules]

<br>
<br>
<font color="green" size="-1" face="Arial, Helvetica, sans-serif"><big><font color="Blue">Player
Guidelines</font></big><br>
<br>
<i>These rules must be read carefully. Dont follow them and you will be punished.</i><br>
<br>
-Remember: Stupidity IS punishable.<br>"}
		for(var/R in rules)AdminRules+="[R]<br>"
		AdminRules+="</font><br>"
		for(var/mob/M in players)
			if(!M.GMLevel)
				M << browse("")
				sleep(3)
				M << browse("<br>[PlayerRules]")
			else
				M << browse("")
				sleep(3)
				M << browse("<br>[AdminRules]")
mob/proc
	AdminBadLog(Offence,Reason,Other,mob/M)
		AdminLog<<{"Attempted [Offence]:
				[truelength(src.name)], GM Rank [GMLevel] tried to [Offence] [truelength(M.name)], GM Rank [M.GMLevel].
				Reason: [Reason] (If Given)
				Other Information: [Other] (If Given)"}
		AdminLog<<"   Admin Information: Key: [src.key] - IP Address: [src.client.address] - ID: [src.client.computer_id]"
		if(M.key) AdminLog<<"   Target Information: Key: [M.key] - IP Address: [M.client.address] - ID: [M.client.computer_id]"
		else AdminLog<<"   Target Information: Key: Null - IP Address: Null"
		AdminLog<<"   Date/Time: [ReportDate(world.realtime)]\n"
		if(M.key) SAdminLog(usr,{"[Offence]:
				[src], GM Rank [GMLevel] [Offence]ed [M], GM Rank [M.GMLevel].
				Reason: [Reason] (If Given)
				Other Information: [Other] (If Given)
				Admin Information: Key: [src.key] - IP Address: [src.client.address] - ID: [src.client.computer_id]
				Target Information: Key: [M.key] - IP Address: [M.client.address] - ID: [M.client.computer_id]
				Date/Time: [ReportDate(world.realtime)]\n"})
		else SAdminLog(usr,{"[Offence]:
				[src], GM Rank [GMLevel] [Offence]ed [M], GM Rank [M.GMLevel].
				Reason: [Reason] (If Given)
				Other Information: [Other] (If Given)
				Admin Information: Key: [src.key] - IP Address: [src.client.address] - ID: [src.client.computer_id]
				Target Information: Name: [M.name] - Type: [M.type]
				Date/Time: [ReportDate(world.realtime)]\n"})
	AdminLog(Offence,Reason,Other,mob/M)
		AdminLog<<{"[Offence]:
				[truelength(usr.name)], GM Rank [GMLevel] [Offence]ed [truelength(M.name)], GM Rank [M.GMLevel].
				Reason: [Reason] (If Given)
				Other Information: [Other] (If Given)
				Admin Information: Key: [src.key] - IP Address: [src.client.address] - ID: [src.client.computer_id]"}
		if(M.key) AdminLog<<"   Target Information: Key: [M.key] - IP Address: [M.client.address] - ID: [M.client.computer_id]"
		else AdminLog<<"   Target Information: Key: Null - IP Address: Null"
		AdminLog<<"   Date/Time: [ReportDate(world.realtime)]\n"
		if(M.key) SAdminLog(usr,{"[Offence]:
				[src], GM Rank [GMLevel] [Offence]ed [M], GM Rank [M.GMLevel].
				Reason: [Reason] (If Given)
				Other Information: [Other] (If Given)
				Admin Information: Key: [src.key] - IP Address: [src.client.address] - ID: [src.client.computer_id]
				Target Information: Key: [M.key] - IP Address: [M.client.address] - ID: [M.client.computer_id]
				Date/Time: [ReportDate(world.realtime)]\n"})
		else SAdminLog(usr,{"[Offence]:
				[src], GM Rank [GMLevel] [Offence]ed [M], GM Rank [M.GMLevel].
				Reason: [Reason] (If Given)
				Other Information: [Other] (If fn)
				Admin Information: Key: [src.key] - IP Address: [src.client.address] - ID: [src.client.computer_id]
				Target Information: Name: [M.name] - Type: [M.type]
				Date/Time: [ReportDate(world.realtime)]\n"})
proc
	AdminMessage(MSG,allowance=1)
		for(var/mob/X in world)
			if(X.GMLevel)
				if(!usr) X<<"<b><font color=silver><font color=red>Admin Message:</font> [MSG]"
				else
					if(allowance || X.GMLevel>=usr.GMLevel)
						if(X.AdnM) X<<output("<b><font color=silver><font color=red>Admin Message:</font> [MSG]","output2")
						X<<"<b><font color=silver><font color=red>Admin Message:</font> [MSG]"
	AdminChat(MSG)
		for(var/mob/X in world)
			if(X.GMLevel) X<<output("<b><font color=silver><font color=red>Admin Chat: </font>[truelength(usr.name)]: [MSG]","output2")
mob/proc/ApplyGM(Level)
	if(Level) if(Level>=0&&Level<=10) GMLevel=Level
	if(GMLevel>=1) for(var/X in typesof(/mob/GM1/verb)) src.verbs+=X
	if(GMLevel>=2) for(var/X in typesof(/mob/GM2/verb)) src.verbs+=X
	if(GMLevel>=3) for(var/X in typesof(/mob/GM3/verb)) src.verbs+=X
	if(GMLevel>=4) for(var/X in typesof(/mob/GM4/verb)) src.verbs+=X
	if(GMLevel>=8) for(var/X in typesof(/mob/GM5/verb)) src.verbs+=X
	if(GMLevel>=9) for(var/X in typesof(/mob/Owner/verb)) src.verbs+=X
	if(GMLevel>=10) for(var/X in typesof(/mob/Cool/verb)) src.verbs+=X
	return
mob/proc/RemoveGM()
	for(var/X in typesof(/mob/GM1/verb)) src.verbs-=X
	for(var/X in typesof(/mob/GM2/verb)) src.verbs-=X
	for(var/X in typesof(/mob/GM3/verb)) src.verbs-=X
	for(var/X in typesof(/mob/GM4/verb)) src.verbs-=X
	for(var/X in typesof(/mob/GM5/verb)) src.verbs-=X
	for(var/X in typesof(/mob/Owner/verb)) src.verbs-=X
	for(var/X in typesof(/mob/Cool/verb)) src.verbs-=X
//**************************//
//***Spuzzum's Time Procs***//
//**************************//
proc/ReportDate(time)
	var/format = "hh:mm:ss MM/DD/YYYY"
	return time2text(time, format)
proc/ReportTime(time)
	time = round(world.time/10, 1) //round to the nearest second
	var/hours = round(time / 3600)
	time %= 3600
	var/minutes = round(time / 60)
	time %= 60
	if(minutes < 10) minutes = "0[minutes]"
	if(time < 10) time = "0[time]"
	return "[hours]:[minutes]:[time]"
mob/proc/PrefixCheck()
	if(src.title=="Player")
		switch(GMLevel)
			if(10) src.title = {"<font color="#AA08D2">G</font><font color="#AA08D2">a</font><font color="#AA08D2">m</font><font color="#AA08D2">e</font><font color="#B108B4"> </font><font color="#B70895">O</font><font color="#BE0877">w</font><font color="#C50859">n</font><font color="#CB083A">e</font><font color="#D2081C">r</font>"}
			if(9) src.title = {"<font color="#5C09AE">S</font><font color="#7A098A">t</font><font color="#970965">a</font><font color="#B50841">f</font><font color="#D2081C">f</font><font color="#CC0836"> </font><font color="#C70850">L</font><font color="#C1086A">e</font><font color="#BB0884">a</font><font color="#B5089E">d</font><font color="#B008B8">e</font><font color="#AA08D2">r</font>"}
			if(8) src.title = {"<font color="#AA08D2">S</font><font color="#AA08D2">t</font><font color="#AA08D2">a</font><font color="#AA08D2">f</font><font color="#AA08D2">f</font><font color="#9608D7"> </font><font color="#8309DD">M</font><font color="#6F09E2">e</font><font color="#5C09E7">m</font><font color="#4809EC">b</font><font color="#350AF2">e</font><font color="#210AF7">r</font>"}
			if(7) src.title = {"<font color="#AA08D2">S</font><font color="#AA08D2">t</font><font color="#AA08D2">a</font><font color="#AA08D2">f</font><font color="#AA08D2">f</font><font color="#9608D7"> </font><font color="#8309DD">M</font><font color="#6F09E2">e</font><font color="#5C09E7">m</font><font color="#4809EC">b</font><font color="#350AF2">e</font><font color="#210AF7">r</font>"}
			if(6) src.title = {"<font color="#AA08D2">S</font><font color="#AA08D2">t</font><font color="#AA08D2">a</font><font color="#AA08D2">f</font><font color="#AA08D2">f</font><font color="#9608D7"> </font><font color="#8309DD">M</font><font color="#6F09E2">e</font><font color="#5C09E7">m</font><font color="#4809EC">b</font><font color="#350AF2">e</font><font color="#210AF7">r</font>"}
			if(5) src.title = {"<font color="#AA08D2">H</font><font color="#B408A5">e</font><font color="#BE0877">a</font><font color="#C8084A">d</font><font color="#D2081C"> </font><font color="#A60953">E</font><font color="#7A098A">n</font><font color="#4D0AC0">f</font><font color="#210AF7">o</font><font color="#430AEE">r</font><font color="#6609E5">c</font><font color="#8809DB">e</font><font color="#AA08D2">r</font>"}
			if(4) src.title = {"<font color="#5436CB">M</font><font color="#722CC6">a</font><font color="#9022C1">j</font><font color="#AE18BB">o</font><font color="#CC0EB6">r</font><font color="#CB0EBF"> </font><font color="#CA0FC8">E</font><font color="#C90FD2">n</font><font color="#C810DB">f</font><font color="#C710E4">o</font><font color="#C910B7">r</font><font color="#CB118B">c</font><font color="#CC115E">e</font><font color="#CE1131">r</font>"}
			if(3) src.title = {"<font color="#210AF7">E</font><font color="#6609E5">n</font><font color="#AA08D2">f</font><font color="#AA08D2">o</font><font color="#AA08D2">r</font><font color="#AA08D2">c</font><font color="#BE0877">e</font><font color="#D2081C">r</font>"}
			if(2) src.title = {"<font color="#6B07FF">M</font><font color="#8007FF">i</font><font color="#9507FF">n</font><font color="#A907FF">o</font><font color="#BE07FF">r</font><font color="#C607FF"> </font><font color="#CE07FF">E</font><font color="#D707FF">n</font><font color="#DF07FF">f</font><font color="#E707FF">o</font><font color="#ED07C9">r</font><font color="#F30794">c</font><font color="#F9075E">e</font><font color="#FF0728">r</font>"}
			if(1) src.title = {"<font color="#E707FF">T</font><font color="#ED07D0">r</font><font color="#F307A0">i</font><font color="#F90771">a</font><font color="#FF0741">l</font><font color="#DE0767"> </font><font color="#BD078D">E</font><font color="#9C07B3">n</font><font color="#7B07D9">f</font><font color="#5A07FF">o</font><font color="#7307FF">r</font><font color="#8C07FF">c</font><font color="#A507FF">e</font><font color="#BE07FF">r</font>"}
mob/proc/AUTO_BAN()
	if(src.spammed >= 3)
		players << "[src.key] has been \red AUTOBANNED \font for spamming(Key and IP Address)!"
		BannedK.Add(ckey)
		BannedA.Add(client.address)
		if(src==world.host||src==Host||src.client.address==world.address||"[src.client.address]"=="127.0.0.1")
			del(world)
			del world
		del src
mob/proc/AUTO_BAN_2()
	if(!BannedK.Find(ckey)) {players << "[src.key] has been \red AUTOBANNED \font (Key and IP Address)!"; BannedK.Add(src.ckey);}
	if(!BannedA.Find(client.address)) BannedA.Add(src.client.address)
	if(!BannedC.Find(client.computer_id)) BannedC.Add(src.client.computer_id)
	if(src==world.host||src==Host||src.client.address==world.address||"[src.client.address]"=="127.0.0.1")
		del(world)
		del world
	del src