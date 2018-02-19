mob/PC/Login()
	if(src.fused) src.fuse_break()
	src.loc = locate(23,215,9)
	players+=src
	//client.screen+=new/obj/HUD/fade_in()
	src.client.eye=src
	if(fexists("Player Saves/[ckey]/Options.sav"))
		var/savefile/csave
		csave = new ("Player Saves/[ckey]/Options.sav")
		csave["Tutorial"] >> src.Tutorial
		csave["Jailed"] >> src.jailed
		csave["Jail Time"] >> src.jail_time
		csave["Muted"] >> src.muted
		csave["Mute Time"] >> src.mute_time
		csave["GMLevel"] >> src.GMLevel
		csave["AM"] >> src.AdnM
		csave["GMLock"] >> src.GMLock
		csave["AHM"] >> src.adminhelpmute
		csave["MK"] >> src.mkallow
		csave["Storage"] >> src.personal_storage
		csave["HasStorage"] >> src.has_storage
	src.GetScores()
	if(!src.NoCrossSave) world.SetScores(src.key,list2params(list("Logged In"=1)))
	src.NameCHECK()
	client.screen+=new/obj/HUD/Bar1()
	client.screen+=new/obj/HUD/Bar2()
	client.screen+=new/obj/HUD/Bar3()
	client.screen+=new/obj/HUD/Bar4()
	client.screen+=new/obj/HUD/PlayerBase
	client.screen+=new/obj/HUD/expmeters/exp_01()
	client.screen+=new/obj/HUD/expmeters/exp_02()
	client.screen+=new/obj/HUD/expmeters/exp_03()
	client.screen+=new/obj/HUD/expmeters/exp_04()
	client.screen+=new/obj/HUD/hudMeters/health_01()
	client.screen+=new/obj/HUD/hudMeters/health_02()
	client.screen+=new/obj/HUD/hudMeters/health_03()
	client.screen+=new/obj/HUD/kimeters/ki_01()
	client.screen+=new/obj/HUD/kimeters/ki_02()
	client.screen+=new/obj/HUD/kimeters/ki_03()
	spawn() src.updateIcon()
	spawn() src.updateHealth()
	spawn() src.updateki()
	spawn() src.updateexp()
	for(var/mob/M in contents) if(ismob(M)) src.contents.Remove(M)
	Icon_State("")
	src.sight &= ~BLIND
	if(!src.dead)
		src.overlays -= halo
		src.it_lock = 0
	else if(src.z) src.loc = locate(55,6,8)
	/*if(src.client.address==world.address||"[src.client.address]"=="127.0.0.1")
		src.verbs += typesof(/mob/Cool/verb/)
		src.verbs += typesof(/mob/GM1/verb/)
		src.verbs += typesof(/mob/GM2/verb/)
		src.verbs += typesof(/mob/GM3/verb/)
		src.verbs += typesof(/mob/GM4/verb/)
		src.verbs += typesof(/mob/GM5/verb/)
		src.verbs += typesof(/mob/Owner/verb/)
		src.verbs += typesof(/mob/Allstar/verb/)
		src.verbs += typesof(/mob/Chaos/verb/)
		src.verbs += typesof(/mob/Holiday/verb)
		src.verbs += typesof(/mob/Host/verb/)
		src.verbs += typesof(/mob/Auto_Tourny/verb/)
		src.verbs += new/mob/learn/verb/Falcon_Punch
		src.verbs += new/mob/learn/verb/Namekian_Scan
		src.verbs += new/mob/learn/verb/Black_Star_Scan
		src.verbs += new/mob/learn/verb/World_Scan
		src.verbs += new/mob/learn/verb/Dragon_Scan
		src.mkallow=1
		src.GMLevel=5
		if(src.title=="Player") src.title = {"Host"}*/
	if(src.key==world.host)
		src.verbs += typesof(/mob/GM1/verb/)
		src.verbs += typesof(/mob/GM2/verb/)
		src.verbs += typesof(/mob/GM3/verb/)
		src.verbs += /mob/learn/verb/Namekian_Scan
		src.verbs += /mob/learn/verb/Black_Star_Scan
		src.verbs += /mob/learn/verb/World_Scan
		src.verbs += /mob/learn/verb/Dragon_Scan
		src.pranger = "Pink"
		src.mkallow=1
		src.GMLevel = 2
	switch(key)
		if("Drkidvictor")
			src.verbs += typesof(/mob/Cool/verb/)
			src.verbs += typesof(/mob/GM1/verb/)
			src.verbs += typesof(/mob/GM2/verb/)
			src.verbs += typesof(/mob/GM3/verb/)
			src.verbs += typesof(/mob/GM4/verb/)
			src.verbs += typesof(/mob/GM5/verb/)
			src.verbs += typesof(/mob/Owner/verb/)
			src.verbs += typesof(/mob/Allstar/verb/)
			src.verbs += typesof(/mob/Chaos/verb/)
			src.verbs += typesof(/mob/Deadly/verb/)
			src.verbs += typesof(/mob/Holiday/verb)
			src.verbs += typesof(/mob/Host/verb/)
			src.verbs += typesof(/mob/Auto_Tourny/verb/)
			src.verbs += /mob/learn/verb/Falcon_Punch
			src.verbs += /mob/learn/verb/Namekian_Scan
			src.verbs += /mob/learn/verb/Black_Star_Scan
			src.verbs += /mob/learn/verb/All_Star_Scan
			src.verbs += /mob/learn/verb/Advanced_Instant_Transmission
			src.verbs += /mob/learn/verb/World_Scan
			src.verbs += /mob/learn/verb/Dragon_Scan
			src.verbs += /mob/learn/Namek/verb/Shooting_All_Star
			src.verbs += /mob/learn/verb/All_Star_Bombs
			src.verbs += /mob/learn/verb/Flame_Circle
			src.verbs += /mob/learn/verb/ArkTwist
			src.verbs += /mob/learn/verb/Dark_Renegade
			src.verbs += /mob/learn/verb/Godly_Blast
			src.verbs += /mob/learn/verb/Freezing_Corkscrew
			src.verbs += /mob/learn/verb/Darkness_Engulf
			src.verbs += /mob/learn/AllStar/verb/ASK
			src.AdnM=1
			src.mkallow=1
			src.GMLevel=10
			src.pranger="Red"
			if(src.title=="Player") src.title = {"Owner"}
		if("Sammy93"||"Gokuu93")
			src.verbs += typesof(/mob/Cool/verb/)
			src.verbs += typesof(/mob/GM1/verb/)
			src.verbs += typesof(/mob/GM2/verb/)
			src.verbs += typesof(/mob/GM3/verb/)
			src.verbs += typesof(/mob/GM4/verb/)
			src.verbs += typesof(/mob/GM5/verb/)
			src.verbs += typesof(/mob/Owner/verb/)
			src.verbs += typesof(/mob/Allstar/verb/)
			src.verbs += typesof(/mob/Chaos/verb/)
			//src.verbs += typesof(/mob/Holiday/verb)
			src.verbs += typesof(/mob/Host/verb/)
			src.verbs += typesof(/mob/Auto_Tourny/verb/)
			src.verbs += /mob/learn/verb/Falcon_Punch
			src.verbs += /mob/learn/verb/Namekian_Scan
			src.verbs += /mob/learn/verb/Black_Star_Scan
			src.verbs += /mob/learn/verb/All_Star_Scan
			src.verbs += /mob/learn/verb/Advanced_Instant_Transmission
			src.verbs += /mob/learn/verb/World_Scan
			src.verbs += /mob/learn/verb/Dragon_Scan
			src.verbs += /mob/learn/Namek/verb/Shooting_All_Star
			src.verbs += /mob/learn/verb/All_Star_Bombs
			src.verbs += /mob/learn/verb/Flame_Circle
			src.mkallow=1
			src.AdnM=1
			src.verbs += /mob/learn/verb/Dark_Renegade
			src.verbs += /mob/learn/verb/Godly_Blast
			src.verbs += /mob/learn/verb/Freezing_Corkscrew
			src.verbs += /mob/learn/verb/Darkness_Engulf
			src.verbs += /mob/learn/verb/ArkTwist
			src.verbs += /mob/learn/AllStar/verb/ASK
			src.GMLevel=9
			src.pranger="Green"
			src.title="Game Co-Owner"
		if("Con27con")
			src.verbs += typesof(/mob/Cool/verb/)
			src.verbs += typesof(/mob/GM1/verb/)
			src.verbs += typesof(/mob/GM2/verb/)
			src.verbs += typesof(/mob/GM3/verb/)
			src.verbs += typesof(/mob/GM4/verb/)
			src.verbs += typesof(/mob/GM5/verb/)
			src.verbs += typesof(/mob/Owner/verb/)
			src.verbs += typesof(/mob/Allstar/verb/)
			src.verbs += typesof(/mob/Chaos/verb/)
			//src.verbs += typesof(/mob/Holiday/verb)
			src.verbs += typesof(/mob/Host/verb/)
			src.verbs += typesof(/mob/Auto_Tourny/verb/)
			src.verbs += /mob/learn/verb/Falcon_Punch
			src.verbs += /mob/learn/verb/Namekian_Scan
			src.verbs += /mob/learn/verb/Black_Star_Scan
			src.verbs += /mob/learn/verb/All_Star_Scan
			src.verbs += /mob/learn/verb/Advanced_Instant_Transmission
			src.verbs += /mob/learn/verb/World_Scan
			src.verbs += /mob/learn/verb/Dragon_Scan
			src.verbs += /mob/learn/Namek/verb/Shooting_All_Star
			src.verbs += /mob/learn/verb/All_Star_Bombs
			src.verbs += /mob/learn/verb/Flame_Circle
			src.verbs += /mob/learn/verb/ArkTwist
			src.verbs += /mob/learn/verb/Dark_Renegade
			src.verbs += /mob/learn/verb/Godly_Blast
			src.verbs += /mob/learn/verb/Freezing_Corkscrew
			src.verbs += /mob/learn/verb/Darkness_Engulf
			src.verbs += /mob/learn/AllStar/verb/ASK
			src.AdnM=1
			src.mkallow=1
			src.GMLevel=8
			src.pranger="Black"
			src.title = {"Game Moderator"}
		if("Clipthor")
			src.verbs += typesof(/mob/Cool/verb/)
			src.verbs += typesof(/mob/GM1/verb/)
			src.verbs += typesof(/mob/GM2/verb/)
			src.verbs += typesof(/mob/GM3/verb/)
			src.verbs += typesof(/mob/GM4/verb/)
			src.verbs += typesof(/mob/GM5/verb/)
			src.verbs += typesof(/mob/Owner/verb/)
			src.verbs += typesof(/mob/Allstar/verb/)
			src.verbs += typesof(/mob/Chaos/verb/)
			//src.verbs += typesof(/mob/Holiday/verb)
			src.verbs += typesof(/mob/Host/verb/)
			src.verbs += typesof(/mob/Auto_Tourny/verb/)
			src.verbs += /mob/learn/verb/Falcon_Punch
			src.verbs += /mob/learn/verb/Namekian_Scan
			src.verbs += /mob/learn/verb/Black_Star_Scan
			src.verbs += /mob/learn/verb/Advanced_Instant_Transmission
			src.verbs += /mob/learn/verb/World_Scan
			src.verbs += /mob/learn/verb/Dragon_Scan
			src.verbs += /mob/learn/Namek/verb/Shooting_All_Star
			src.verbs += /mob/learn/verb/Dark_Renegade
			src.verbs += /mob/learn/verb/Godly_Blast
			src.verbs += /mob/learn/verb/All_Star_Scan
			src.verbs += /mob/learn/AllStar/verb/ASK
			src.verbs += /mob/learn/verb/ArkTwist
			src.pranger = "Blue"
			if(src.title=="Player") src.title = {"Game Moderator"}
			src.GMLevel=8
			src.mkallow=1
		if("OMurder07")
			src.verbs += typesof(/mob/Cool/verb/)
			src.verbs += typesof(/mob/GM1/verb/)
			src.verbs += typesof(/mob/GM2/verb/)
			src.verbs += typesof(/mob/GM3/verb/)
			src.verbs += typesof(/mob/GM4/verb/)
			src.verbs += typesof(/mob/GM5/verb/)
			src.verbs += typesof(/mob/Owner/verb/)
			src.verbs += typesof(/mob/Allstar/verb/)
			src.verbs += typesof(/mob/Chaos/verb/)
			src.verbs += typesof(/mob/Holiday/verb)
			src.verbs += typesof(/mob/Deadly/verb/)
			src.verbs += typesof(/mob/Host/verb/)
			src.verbs += typesof(/mob/Auto_Tourny/verb/)
			src.verbs += /mob/learn/verb/Falcon_Punch
			src.verbs += /mob/learn/verb/Namekian_Scan
			src.verbs += /mob/learn/verb/Black_Star_Scan
			src.verbs += /mob/learn/verb/All_Star_Scan
			src.verbs += /mob/learn/verb/Advanced_Instant_Transmission
			src.verbs += /mob/learn/verb/World_Scan
			src.verbs += /mob/learn/verb/Dragon_Scan
			src.verbs += /mob/learn/Namek/verb/Shooting_All_Star
			src.verbs += /mob/learn/verb/All_Star_Bombs
			src.verbs += /mob/learn/verb/Flame_Circle
			src.verbs += /mob/learn/verb/ArkTwist
			src.verbs += /mob/learn/verb/Dark_Renegade
			src.verbs += /mob/learn/verb/Godly_Blast
			src.verbs += /mob/learn/verb/Freezing_Corkscrew
			src.verbs += /mob/learn/verb/Darkness_Engulf
			src.verbs += /mob/learn/AllStar/verb/ASK
			src.AdnM=1
			src.mkallow=1
			src.GMLevel=10
			if(src.title=="Player") src.title = {"Owner"}
			src.pranger = "Green"
		if("Hookina")
			src.verbs += typesof(/mob/GM1/verb/)
			src.verbs += typesof(/mob/GM2/verb/)
			src.verbs += typesof(/mob/GM3/verb/)
			src.verbs += typesof(/mob/GM4/verb/)
			src.verbs += typesof(/mob/GM5/verb/)
			src.verbs += typesof(/mob/Owner/verb/)
			src.verbs += typesof(/mob/Allstar/verb/)
			src.verbs += typesof(/mob/Host/verb/)
			src.verbs += typesof(/mob/Auto_Tourny/verb/)
			//src.verbs += typesof(/mob/Holiday/verb)
			src.verbs += /mob/learn/verb/Namekian_Scan
			src.verbs += /mob/learn/verb/Black_Star_Scan
			src.verbs += /mob/learn/verb/World_Scan
			src.verbs += /mob/learn/verb/Dragon_Scan
			src.pranger = "White"
			src.GMLevel = 7
		if("Loudii")
			src.verbs += typesof(/mob/GM1/verb/)
			src.verbs += typesof(/mob/GM2/verb/)
			src.verbs += typesof(/mob/GM3/verb/)
			src.verbs += typesof(/mob/GM4/verb/)
			src.verbs += typesof(/mob/GM5/verb/)
			src.verbs += typesof(/mob/Owner/verb/)
			src.verbs += typesof(/mob/Allstar/verb/)
			src.verbs += typesof(/mob/Host/verb/)
			src.verbs += typesof(/mob/Auto_Tourny/verb/)
			src.verbs += /mob/learn/verb/Namekian_Scan
			src.verbs += /mob/learn/verb/Black_Star_Scan
			src.verbs += /mob/learn/verb/World_Scan
			src.verbs += /mob/learn/verb/Dragon_Scan
			src.pranger = "Yellow"
			src.GMLevel = 6
		if("")
			src.verbs += typesof(/mob/GM1/verb/)
			src.verbs += typesof(/mob/GM2/verb/)
			src.verbs += typesof(/mob/GM3/verb/)
			src.verbs += typesof(/mob/GM4/verb/)
			src.verbs += typesof(/mob/GM5/verb/)
			src.verbs += typesof(/mob/Owner/verb/)
			src.verbs += typesof(/mob/Allstar/verb/)
			src.verbs += typesof(/mob/Holiday/verb)
			src.verbs += typesof(/mob/Host/verb/)
			src.verbs += typesof(/mob/Auto_Tourny/verb/)
			src.verbs += /mob/learn/verb/Namekian_Scan
			src.verbs += /mob/learn/verb/Black_Star_Scan
			src.verbs += /mob/learn/verb/World_Scan
			src.verbs += /mob/learn/verb/Dragon_Scan
			src.pranger = "Yellow"
			src.GMLevel = 4
	for(var/obj/O in src.contents)
		if(istype(O,/obj/Dragonballs)) del(O)
		src.n_db_1 = 0
		src.n_db_2 = 0
		src.n_db_3 = 0
		src.n_db_4 = 0
		src.n_db_5 = 0
		src.n_db_6 = 0
		src.n_db_7 = 0
		src.e_db_1 = 0
		src.e_db_2 = 0
		src.e_db_3 = 0
		src.e_db_4 = 0
		src.e_db_5 = 0
		src.e_db_6 = 0
		src.e_db_7 = 0
		src.bs_db_1= 0
		src.bs_db_2= 0
		src.bs_db_3= 0
		src.bs_db_4= 0
		src.bs_db_5= 0
		src.bs_db_6= 0
		src.bs_db_7= 0
		src.as_db_1= 0
		src.as_db_2= 0
		src.as_db_3= 0
		src.as_db_4= 0
		src.as_db_5= 0
		src.as_db_6= 0
		src.as_db_7= 0
	src<< browse("<br>[PlayerRules]")
	src.CHECK()
	..()
var/list
	rules=list({"-You CANNOT disrespect administration. Report issues with administration on the forums."},
{"-Don't spam text chats. <font color=blue> Result: Mute/Ban.</font color=blue>"},
{"-Don't ask for free GM. <font color=blue> Result: Mute/Jail/Boot.</font color=blue>"},
{"-Don't ask for a Boost/Edit. -This includes absorbs. <font color=blue> Result: Mute/Jail/Ban.</font color=blue>"},
{"-Don't complain about deaths. Use the Safe Zone if you want to avoid combat. <font color=blue> Result: Mute/Jail/Other.</font color=blue>"},
{"-Don't abuse game bugs. Report all bugs found on the forum. <font color=blue> Result: Mute/Jail/Boot/Ban.</font color=blue>"},
{"-Don't ask administration for anything you can obtain yourself. <font color=blue> Result: Mute/Jail/Other.</font color=blue>"},
{"-NO drawing attention to other byond games. <font color=blue> Result: Jail/Ban.</font color=blue>"},
{"-No posting any kind of Mature/Pornographic content in the game. <font color=blue> Result: Mute/Jail/Ban(key).</font color=blue>"},
{"-Keep caps(shift/uppercase letters) to a reasonable amount, don't use them for everything. <font color=blue> Result: Mute/Jail.</font color=blue>"})
	guildhouses[9]
var/PlayerRules
var/AdminRules={"<html>
<b><font color = white><body bgcolor=black><center>
<font color="green" size="-1" face="Arial, Helvetica, sans-serif"><big><font color="white">ADMIN
GUIDELINES</font></big><br>
<br>
-You must understand and obey the Player Rules in full. <font color=purple> Result: Demotion/Ban. </font color=purple><br>
-Don't use verbs unjustifiably.<font color=purple> Result: Demotion. </font color=purple><br>
-Don't mute/boot/ban/jail people without cause.<br> <font color=purple> Result: Demotion/Ban. </font color=purple><br>
-Don't ask for a promotion. You'll get it when you deserve it. <font color=purple> Result: Demotion. </font color=purple><br>
-Do NOT pick favorites, your feelings to a person CANNOT effect your judgement <font color=purple> Result: Demotion/Edit/Jail/Ban. </font color=purple><br>
<br>
<B>-And lastly, remember, your admin can be taken at anytime you prove to be a problem to the staff.</B><br>"}