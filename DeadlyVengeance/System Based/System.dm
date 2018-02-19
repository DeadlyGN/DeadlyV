var
	earthmapsetup={"
	<html><b><font color = white><body bgcolor=black><center><b><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/EarthsMap.png></img>"}
	namekmapsetup={"
	<html><b><font color = white><body bgcolor=black><center><b><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/NamekMaps.png></img>"}
	futuremapsetup={"
	<html><b><font color = white><body bgcolor=black><center><b><img src=http://i273.photobucket.com/albums/jj221/Drkidvictor/FutureMap.png></img>"}
proc
	/*pick_list()
		var/dlist=args[1]
		var/list/newlist=new()
		var/list/types=new()
		for(var/n=2 to args.len) types+=args[n]
		for(var/datum/d in dlist)
			if(istypemulti(d.type,arglist(types)))
				newlist += d
		return pick(newlist)*/
	istypemulti()
		if(!args) return FALSE
		for(var/n=2 to args.len) if(istype(args[1],args[n])) return args[n]
	switchdir(n as num)
		switch(n)
			if(0)
				return "Center"
			if(1)
				return "North"
			if(2)
				return "South"
			if(4)
				return "East"
			if(5)
				return "North-East"
			if(6)
				return "South-East"
			if(8)
				return "West"
			if(9)
				return "North-West"
			if(10)
				return "South-West"
mob
	var
		tmp
			mapdelay
			ChatBar1="OOC"
			ChatBar2="Say"
	verb
		SetChat1()
			set hidden = 1
			set category = null
			src.SetChatBar(1)
		SetChat2()
			set hidden = 1
			set category = null
			src.SetChatBar(2)
	proc
		SetChatBar(var/n)
			if(istype(src,/mob/Guest/))
				alert(src,"Please log in before using chats.","Chat bar")
				return
			var/list/AvailableChats=list("OOC","Say","Emote","Command Bar")
			if(src.scouter_eq) AvailableChats+="Scouter"
			if(src.GMLevel) AvailableChats+="Admin Chat"
			if(src.in_guild) AvailableChats+="Guild Chat"
			AvailableChats.Remove(src.ChatBar1,src.ChatBar2)
			var/SelectedChat=input(src,"What would you like your Chat Bar #[n] to be?","Chat Bar #[n]") as null|anything in AvailableChats
			switch(SelectedChat)
				if("OOC")
					winset(src,"chat2.input[n+1]","command=\"OOC \\\"\"")
				if("Emote")
					winset(src,"chat2.input[n+1]","command=\"Emote \\\"\"")
				if("Say")
					winset(src,"chat2.input[n+1]","command=\"Say \\\"\"")
				if("Scouter")
					winset(src,"chat2.input[n+1]","command=\"Scouter \\\"\"")
				if("Admin Chat")
					winset(src,"chat2.input[n+1]","command=\"Admin-Chat \\\"\"")
				if("Guild Chat")
					winset(src,"chat2.input[n+1]","command=\"Guild-Chat \\\"\"")
				if("Command Bar")
					winset(src,"chat2.input[n+1]","command=")
			if(SelectedChat)
				src.vars["ChatBar[n]"] = SelectedChat
				winset(src,"chat2.button[n]","text=\"[SelectedChat]")
		LoadChatBars()
			var/n=1
			while(n<3)
				var/SelectedChat=src.vars["ChatBar[n]"]
				switch(SelectedChat)
					if("OOC")
						winset(src,"chat2.input[n+1]","command=\"OOC \\\"\"")
					if("Emote")
						winset(src,"chat2.input[n+1]","command=\"Emote \\\"\"")
					if("Say")
						winset(src,"chat2.input[n+1]","command=\"Say \\\"\"")
					if("Scouter")
						winset(src,"chat2.input[n+1]","command=\"Scouter \\\"\"")
					if("Admin Chat")
						winset(src,"chat2.input[n+1]","command=\"Admin-Chat \\\"\"")
					if("Guild Chat")
						winset(src,"chat2.input[n+1]","command=\"Guild-Chat \\\"\"")
					if("Command Bar")
						winset(src,"chat2.input[n+1]","command=")
				if(SelectedChat) winset(src,"chat2.button[n]","text=\"[SelectedChat]")
				n++
	PC/verb
		View_Map()
			set category = "Channels"
			if(src.mapdelay)return
			src.mapdelay+=500
			if(src.z<4&&src.z>0)
				switch(src.z)
					if(1) src<< browse(earthmapsetup)
					if(2) src<< browse(namekmapsetup)
					if(3) src<< browse(futuremapsetup)
			else src<<"There is no map for your current location!"
			sleep(src.mapdelay)
			src.mapdelay=0
		Check_Guild_Houses()
			set category = "Channels"
			src.guildhouseview()