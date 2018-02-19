mob/PC/verb/Say(T as text)
	set category = "Channels"
	if(src.say_delay)
		src<<"Try not to talk so fast"
		return
	if(Channel_Mute > src.GMLevel)
		src<< "All Chat Channels are Muted!"
		return
	if(src.muted)
		src<< "You have been muted"
		return
	if(src.jailed)
		src<<"You're currently jailed and cannot speak."
		return
	T=Remove_Whitespace(ReplaceTxtex(T,LineBreak," "))
	if(!T)
		spawn() alert(usr,"Your message may not be blank.")
		return
	if(Check_For_Bad_Links2(T)==TRUE||Check_For_Text(T,BAD_LINK)==TRUE||Check_For_Bad_Links3(T)==TRUE)
		src<<"You cannot advertise here."
		return
	if(lentext(T) > 160)
		var/extra=ReplaceTxt(copytext(T,160), "\"", "\\\"")
		if(src.ChatBar1=="Say")
			winset(src,"chat2.input2","text=\"[extra]\"")
		else
			if(src.ChatBar2=="Say")
				winset(src,"chat2.input3","text=\"[extra]")
			else
				spawn()
					var/I=input(src,"What would you like to say in Say?","Say",extra)
					if(I) call(src,"Say") (I)
		T = copytext(T,1,160)
	T=ReplaceTxtex(s_smileys(html_encode(ReplaceTxtex(T,"'","©"))),"©","'")
	T="\icon[getFlatIcon(usr)]<font color=[src.namecolor]>[src.name] Says:<font color = [src.textcolor]> [T]"
	for(var/mob/M in view(src)) if(!M.Ignored.Find(src.key))
		if(M.censorme) M<< Censor(T)
		else M<< T
	SChatLog(usr,T)
	for(var/mob/G in players) if(G.saylisten==1) G<<"From([src.x],[src.y],[src.z]): [T] "
	src.afk_time = 0
	src.say_delay ++
	sleep(3*src.say_delay)
	if(src.say_delay) src.say_delay --