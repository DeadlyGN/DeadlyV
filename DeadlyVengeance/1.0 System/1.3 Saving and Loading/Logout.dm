mob/PC/
	verb/Relog()
		set category = "Channels"
		if(src.KO) src.DeathCheck(src.attacker)
		if(src.fused) src.ForceEndFusion()
		src.client.Save_1()
		players-=src
		players.Remove(src)
		players << "<font color =purple>[world.name] Information: <font color = white>[src]([src.key])<font color=silver> has logged off."
		src.client.screen=null
		if(!src.NoCrossSave) world.SetScores(src.key,list2params(list("Logged In"=0)))
		src.client.mob = new /mob/Guest/
		del(src)
mob/Logout(mob/M,relog=0)
	if(src.key==world.host) src.GMLevel=0
	if(istype(src,/mob/PC/))
		src:SetScores()
		players-=src
		players.Remove(src)
		if(!src:NoCrossSave) world.SetScores(src.key,list2params(list("Logged In"=0)))
		status_change()
		if(!relog) players<<"<font color =purple>[world.name] Information: <font color = white>[src]([src.key])<font color=silver> has left the server."
	src:RemoveGM()
	if(src.KO) src.DeathCheck(src.attacker)
	if(src.fused) src.ForceEndFusion()
	var/mob/leaving=src
	src:Arena_Check(src)
	src:Guild_Check(src)
	if(src:KO) src:DeathCheck(src:attacker)
	if(src:fused) src:ForceEndFusion()
	spawn()
		GuildTeam1:Remove(leaving)
		GuildTeam2:Remove(leaving)
	GuildTeam1:Remove(src)
	GuildTeam2:Remove(src)
	Contenders:Remove(src)
	Contenders -= src
	for(var/obj/O in contents)
		if(istype(O,/obj/Dragonballs)) O.loc = src:loc
	src:Follower_Check()
	..()
	spawn(1)
		del(leaving)
		del(src)