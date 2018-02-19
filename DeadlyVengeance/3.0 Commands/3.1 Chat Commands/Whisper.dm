mob/var/whispers_off = 0
mob/PC/verb/Whisper()
	set category = "Channels"
	var/list/L
	L = list("font size")
	var/varPeople = list()
	if(World_Mute > src.GMLevel)
		src<< "The world is muted"
		return
	if(Channel_Mute > src.GMLevel)
		src<< "All Chat Channels are Muted!"
		return
	if(src.muted)
		src<< "You're muted"
		return
	if(src.jailed)
		src<<"You're currently jailed and cannot speak."
		return
	for(var/mob/PC/M in players) if(!M.whispers_off&&!M.hidden) varPeople += M
	var/varTo1 = input("Who would you like to Whisper?","Whisper") in varPeople + list("Cancel")
	if(varTo1 == "Cancel")
		return
	var/mob/varTo=varTo1
	if(!varTo)return
	if(src.key in varTo.Ignored)
		src<< "<font color=red>[varTo] is ignoring you, you may not whisper them."
		return
	var/varSay = input("What would you like to say to [varTo]?","Whisper") as text|null
	if(src.muted)
		src<< "You have been muted!"
		return
	if(Check_For_Bad_Links2(varSay)==TRUE||Check_For_Bad_Links3(varSay)==TRUE)
		src<<"You cannot advertise here."
		return
	varSay=Remove_Whitespace(ReplaceTxtex(varSay,LineBreak," "))
	for(var/X in L)
		if(findtext(varSay,X))
			spawn() alert(usr,"You may not change your font size.")
			return
	if(!varSay) return
	if(lentext(varSay) > 750)
		spawn() alert(usr,"Your message can not exceed 750 characters.")
		varSay = copytext(varSay,1,750)
	if(Check_For_Text(varSay,BAD_LINK) == TRUE)
		src<<"You cannot advertise here."
		return
	SChatLog(usr,"[src] whispered [varTo.name]: [varSay]")
	if(!src.whispers_off) src<< output("<font color = purple>To <a href=?src=\ref[varTo];action=Whisper>[varTo.name]</a>: [varSay]","output2")
	for(var/mob/G in players) spawn() if(G.whisperlisten) G<<"<a href=?src=\ref[src];action=Whisper>[src]</a> whispers <a href=?src=\ref[varTo];action=Whisper>[varTo.name]</a>: [varSay]"
	if(varTo.censorme) varSay=Censor(varSay)
	if(!varTo.whispers_off)
		if(varTo.key in src.Ignored) return
		varTo << output("<font color = blue><a href=?src=\ref[src];action=Whisper>[src.name]</a></font> Whispers: [varSay]","output2")
	src.afk_time = 0
mob/Topic(href,href_list[])
	switch(href_list["action"])
		if("Scoreboard")
			var/list/levels=new()
			var/savefile/F=new("levels.sav")
			F[("stuff")]>>(levels)
			var/Rank_Entry/player=(levels[href_list["character"]])
			var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><small><i><a href=?src=\ref[src];action=ReturnScoreboard><-Back</i></a></small>"
			html+="<h1><U><font color=red>Scoreboard<font color=green></u></h1><TABLE CELLSPACING=10>"
			if(!levels) html+="<TR><TD>No ranking to display.</TD></TR>"
			else
				html+="<tr><td>Name:</td><td>[player.Name]</td></tr>"
				html+="<tr><td>Key:</td><td><I><a target=_blank href=http://www.byond.com/members/[ckey(player.Key)]>[player.Key]</a></I></td></tr>"
				if(usr.GMLevel>3){ html+="<tr><td>IP:</td><td>[player.IP]</td></tr>"; html+="<tr><td>CID</td><td>[player.CID]</td></tr>"; }
				html+="<tr><td>Race:</td><td>[player.Race]</td></tr>"
				html+="<tr><td>Level:</td><td>[player.Level]</td></tr><tr><td>Powerlevel:</td><td>[player.PL]/[player.PLMax]</td></tr>"
				html+="<tr><td>Ki:</td><td>[player.Ki]/[player.KiMax]</td></tr><tr><td>Strength:</td><td>[player.Str]/[player.StrMax]</td></tr>"
				html+="<tr><td>Defence:</td><td>[player.Def]/[player.DefMax]</td></tr><tr><td>Stat Power:</td><td>[commaapplier(player.AverageP)]</td></tr>"
				html+="<tr><td>Date:</td><td>[(player.Date)]</td></tr>"
			winset(usr, "scoreboard","size=525x425")
			usr<<browse("[scoreboardtitle][html]","window=scoreboard")
		if("ReturnScoreboard")
			RankingDisplay(src)
		if("Whisper")
			if(!istype(src,/mob/PC)||usr==src) return
			var/message = input("What would you like to reply to [src] with?","Whisper") as null|text
			message=Remove_Whitespace(ReplaceTxtex(message,LineBreak," "))
			if(!message) return
			if(usr.jailed)
				usr<<"You're currently jailed and cannot speak."
				return
			if(Check_For_Text(message,BAD_LINK) == TRUE||Check_For_Bad_Links3(message)==TRUE||Check_For_Bad_Links2(message)==TRUE)
				usr<<"You cannot advertise here."
				return
			SChatLog(usr,"[usr] whispered [src.name]: [message]")
			usr<< output("<font color = purple>To <a href=?src=\ref[src];action=Whisper>[src.name]</a>: [message]","output2")
			for(var/mob/G in players) spawn() if(G.whisperlisten) G<<"<a href=?src=\ref[usr];action=Whisper>[usr]</a> whispers <a href=?src=\ref[src];action=Whisper>[src]</a>: [message]"
			if(src.censorme) message=Censor(message)
			if(!src.whispers_off)
				if(src.key in usr.Ignored)
					spawn() alert(usr,"[src] appears to be ignoring you now!")
					return
				if(usr.GMLevel) src<< output("<font color = red>([usr.title]) <font color = blue><a href=?src=\ref[usr];action=Whisper>[usr.name]</a></font> Whispers: [message]","output2")
				else src<< output("<font color = red><font color = blue><a href=?src=\ref[usr];action=Whisper>[usr.name]</a></font> Whispers: [message]","output2")
			else usr<<"[src] has their whispers off, you cannot contact them"
		if("IM")
			if(!istype(src,/mob/PC/)||usr==src) return
			var/msg = input("What would you like to reply?","IM") as null|text
			msg=Remove_Whitespace(ReplaceTxtex(msg,LineBreak," "))
			if(!msg) return
			if(usr.jailed)
				usr<<"You're currently jailed and cannot speak."
				return
			if(Check_For_Text(msg,BAD_LINK) == TRUE||Check_For_Bad_Links3(msg)==TRUE||Check_For_Bad_Links2(msg)==TRUE)
				usr<<"You cannot advertise here."
				return
			for(var/mob/G in players) spawn() if(G.IMlisten) G<<"<a href=?src=\ref[usr];action=Whisper>[usr]</a> IMs <a href=?src=\ref[src];action=Whisper>[src]</a>: [msg]"
			if(src.censorme) msg=Censor(msg)
			msg="\white <font color=[usr.namecolor]>[usr.name]</a></font> -> <font color=[src.namecolor]>[src]</font>: <font color=[usr.textcolor]>[msg]"
			SChatLog(usr,msg)
			if(!src.IM_on)
				if(src.IMwindow)
					winshow(src,"\ref[usr]",1)
					usr<<output(msg, "\ref[usr].msgbox")
				else src<<output("<a href=?src=\ref[usr];action=IM>[msg]","output2")
			else usr<<"[src] has their IMs off, you cannot contact them"
		if("Watch") call(usr,"Watch")(src)
		if("Ban") call(usr,"Ban")(src)
		if("Jail") call(usr,"Jail")(src)
		if("Mute") call(usr,"Mute")(src)
	. = ..()