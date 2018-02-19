mob/var
 tmp/adminsay_delay = 0
 admin_muted = 0
mob/PC/verb
	Admin_Help(T as text)
		set category = "Channels"
		if(src.GMLevel||src.adminhelpmute)return
		if(!T)
			spawn() alert(usr,"Your message may not be blank.")
			return
		if(src.admin_muted)
			src<< "You have been muted!"
			return
		if(src.adminsay_delay >= 3)
			spawn() alert(usr,"Flood Supression: You must wait 10 seconds before using Admin Say again.")
			src.admin_muted = 1
			return
		T = html_encode(T)
		if(lentext(T) > 120)
			spawn() alert(usr,"Your message can not exceed 120 characters.")
			T = copytext(T,1,120)
		T = "<font color=yellow> (ADMIN HELP) [src.name]([src.key]) Says: [lowertext(T)]"
		SChatLog(usr,T)
		for(var/mob/C in players)
			if(!C.GMLevel) continue
			C << T
		src.adminsay_delay ++
		sleep(100)
		src.adminsay_delay = 0
		src.admin_muted = 0
		src.afk_time = 0
	Page_Admin()
		set category = "Channels"
		var/list/adminz=list()
		if(src.adminhelpmute)return
		for(var/mob/M in players) if(M.GMLevel) adminz.Add(M)
		switch(alert(usr,"This is for serious cases, are you sure?","Page admins","Yes","No"))
			if("Yes")
				var/client/Admun=input("Page","Whom do you wish to page?") in adminz
				var/Message=input("Page","What would you like to page?") as text
				if(usr.client.SendPage("[Message] -[usr]([usr.key]) from [world.name]",Admun)) alert(usr,"Your page to [Admun] was recieved.")
				else{alert(usr,"Your page to [Admun] has failed."); return;}
				SChatLog(usr,"Admin Page: [usr]([usr.key]) from [world.name] paged [Admun]: [Message]")
	Admin_Fix()
		set category = "Channels"
		if(src.GMLevel > 0)
			src.ApplyGM()
			src<< " You should have your tab back now."
		else
			src<< "This is for admin use only."
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
				if("Sammy93")
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
					src.title="Co-Owner"
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
					src.GMLevel=8
					src.pranger="Gold"
					if(src.title=="Player") src.title = {"Game Moderator"}
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
					src.verbs += typesof(/mob/Holiday/verb)
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
					src.pranger = "Black"
					if(src.title=="Player") src.title = {"Connor"}
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
					src.verbs += typesof(/mob/Holiday/verb)
					src.verbs += /mob/learn/verb/Namekian_Scan
					src.verbs += /mob/learn/verb/Black_Star_Scan
					src.verbs += /mob/learn/verb/World_Scan
					src.verbs += /mob/learn/verb/Dragon_Scan
					src.pranger = "White"
					src.GMLevel = 6
				if("")
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
					src.pranger = ""
					src.GMLevel = 2
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
	Visit_Hub()
		set category = "Channels"
		src<< link("http://www.byond.com/games/[world.hub]")
		src<<"<a href=http://www.byond.com/games/[world.hub]>Click Here</a> if nothing pops up."
		src.forum=1
		src.FSMedal()
	Visit_Forum()
		set category = "Channels"
		src<< link("http://newdawnforums.freeforums.org/")
		src<<"<a href=http://newdawnforums.freeforums.org/>Click Here</a> if nothing pops up."
		src.sponser=1
		src.FSMedal()
