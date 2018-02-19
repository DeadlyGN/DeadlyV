mob/var
 tmp/say_delay = 0
 tmp/spammed = 0
 tmp/oocdelay = 0
 censorme = 0
var
 World_Mute=0
 Channel_Mute = 0

mob/var
	Text_Color ="#CCCCCC"
	Name_Color ="#999999"

mob/PC/verb/Change_Name_Color(c as color)
			set category = "Channels"
			set hidden = 0
			Name_Color = c
mob/PC/verb/Change_Chat_Color(c as color)
			set category = "Channels"
			set hidden = 0
			Text_Color = c

mob/PC/verb/OOC(T as text)
	set category = "Channels"
	T=Remove_Whitespace(ReplaceTxt(T,LineBreak," "))
	if(!T) return
	if(src.muted)
		src<< "You have been muted!"
		return
	if(src.GMLevel<World_Mute)
		src<< "The world is muted!"
		return
	if(!src.ooc_on)
		src<<"Your OOC is curently off, please turn it on to chat."
		return
	if(src.oocdelay||src.say_delay>2)
		src<<"Try not to talk so fast."
		return
	if(src.jailed)
		src<<"You're currently jailed and cannot speak."
		return
	if(lentext(T) > 260)
		spawn() alert(usr,"Your message can not exceed 260 characters.")
		var/extra=ReplaceTxt(copytext(T,260), "\"", "\\\"")
		if(src.ChatBar1=="OOC")
			winset(src,"chat2.input2","text=\"[extra]\"")
		else
			if(src.ChatBar2=="OOC")
				winset(src,"chat2.input3","text=\"[extra]\"")
			else
				spawn()
					var/I=input(src,"What would you like to say in OOC?","OOC",extra)
					if(I) call(src,"OOC") (I)
		T = copytext(T,1,260)
	T=ReplaceTxtex(s_smileys(html_encode(ReplaceTxtex(T,"'","©"))),"©","'")
	if(!T) return
	if(Check_For_Text(T,BAD_LINK)==TRUE||Check_For_Bad_Links2(T)==TRUE||Check_For_Bad_Links3(T)==TRUE) src<<"You cannot advertise here."
	else
		src.oocdelay++
		var/AdminOptions={"<a href=?src=\ref[src];action=Watch>[Remove_Whitespace(s_smileys("aq32573a"))]</a> <a href=?src=\ref[src];action=Mute>[Remove_Whitespace(s_smileys("aq32576d"))]</a> <a href=?src=\ref[src];action=Jail>[Remove_Whitespace(s_smileys("aq32575c"))]</a> <a href=?src=\ref[src];action=Ban>[Remove_Whitespace(s_smileys("aq32574b"))]</a>"}
		T={"<font color="#000066">{<font color="#FFFFFF">[src.title]<font color="#000066">}</font></font><font color=#999999>{[src.rank]}<font color=[src.Name_Color]>[src.name]</font color=[src.Name_Color]><a href=?src=\ref[src];action=Whisper>[Remove_Whitespace(s_smileys("aq32577e"))]</a> OOC:<font color = [Text_Color]> [T]</font></font></font>"}
		if(src.in_guild) T={"<font color="#000066">{<font color="#FFFFFF">[src.guild_name_html]<font color="#000066">}"}+T
		for(var/mob/C in players)
			if(C.Ignored.Find(src.key)) continue
			spawn() if(C.ooc_on||src.GMLevel>=2)
				if(C.censorme){ if(C.GMLevel>2){ C <<Censor(T)+AdminOptions}; else{ C <<Censor(T) };}
				else{ if(C.GMLevel>2){ C <<T+AdminOptions}; else{ C << T };}
	SChatLog(usr,T)
	src.say_delay ++
	spawn(5) if(src.oocdelay) src.oocdelay--
	src.afk_time = 0
	spawn(12) if(src.say_delay) src.say_delay --
mob/PC/verb/Emote(T as text)
	set category = "Channels"
	T=Remove_Whitespace(ReplaceTxtex(T,LineBreak," "))
	if(isnull(T) || T == "" || !T)
		alert(usr,"Your message may not be blank.")
		return
	if(lentext(T) > 120)
		var/extra=ReplaceTxt(copytext(T,120), "\"", "\\\"")
		if(src.ChatBar1=="Emote")
			winset(src,"chat2.input2","text=\"[extra]\"")
		else
			if(src.ChatBar2=="Emote")
				winset(src,"chat2.input3","text=\"[extra]")
			else
				spawn()
					var/I=input(src,"What would you like to say in Emote?","Emote",extra)
					if(I) call(src,"Emote") (I)
		T=copytext(T,1,120)
	var/list/L
	L = list("font size")
	if(World_Mute > src.GMLevel)
		src<< "The world is muted!"
		return
	if(Channel_Mute > src.GMLevel)
		src<< "All Chat Channels are Muted!"
		return
	if(src.muted)
		src<< "You have been muted!"
		return
	if(src.jailed)
		src<<"You're currently jailed and cannot speak."
		return
	if(Check_For_Bad_Links2(T)==TRUE||Check_For_Text(T,BAD_LINK)==TRUE||Check_For_Bad_Links3(T)==TRUE)
		src<<"You cannot advertise here."
		return
	if(src.say_delay>2)
		alert(usr,"Flood Supression: You must wait a moment before using chat again.")
		return
	for(var/X in L)
		if(findtext(T,X))
			alert(usr,"You may not change your font size.")
			return
	if(Check_For_Text(T,BAD_LINK) == TRUE)
		src<<"You cannot advertise here."
		return
	T = html_encode(T)
	var/AdminOptions={"<a href=?src=\ref[src];action=Watch>[Remove_Whitespace(s_smileys("aq32573a"))]</a> <a href=?src=\ref[src];action=Mute>[Remove_Whitespace(s_smileys("aq32576d"))]</a> <a href=?src=\ref[src];action=Jail>[Remove_Whitespace(s_smileys("aq32575c"))]</a> <a href=?src=\ref[src];action=Ban>[Remove_Whitespace(s_smileys("aq32574b"))]</a>"}
	T = {"<font color="#0099CC">[src.name] [lowertext(T)]"}
	for(var/mob/C in players)
		if(C.Ignored.Find(src.key)) continue
		spawn() if(C.ooc_on||src.GMLevel>=3)
			if(C.censorme){ if(C.GMLevel>2){ C <<Censor(T)+AdminOptions}; else{ C <<Censor(T) };}
			else{ if(C.GMLevel>2){ C <<T+AdminOptions}; else{ C << T };}
	SChatLog(usr,T)
	src.say_delay ++
	spawn(15) src.say_delay --