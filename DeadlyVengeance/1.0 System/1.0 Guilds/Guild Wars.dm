var
	list
		GuildTeam1=new()
		GuildTeam2=new()
	guildwar=0
mob
	var
		tmp
			inguildwar=0
		joinguildwar=1
		warswon=0
		guildp=0
proc
	Guild_War_Start(guild1,guild2)
		for(var/mob/M in players)
			if(M.guild_leader) M.joinguildwar=1
			if(M.joinguildwar&&M.pk&&!M.dead&&(!M.afk||M.guild_leader))
				if(M.guild_name==guild1)
					M.loc=locate(rand(112,124),rand(148,160),9)
					GuildTeam1.Add(M)
					M.inguildwar=1
					M.ki_lock=0
					M.buku=0
					M.doing=0
					M.safe=0
					M.grav=0
					M<<"Guild war time!"
				if(M.guild_name==guild2)
					M.loc=locate(rand(126,138),rand(148,160),9)
					GuildTeam2.Add(M)
					M.inguildwar=1
					M.ki_lock=0
					M.buku=0
					M.doing=0
					M.safe=0
					M.grav=0
					M<<"Guild war time!"
		guildwar=1
		Guild_War_Battle(guild1,guild2)
	Guild_War_Battle(guild1,guild2)
		var/GT1=GuildTeam1.len
		var/GT2=GuildTeam2.len
		while(GuildTeam1.len&&GuildTeam2.len)
			if(GuildTeam1&&GuildTeam2)
				var/list/newgt1list=new()
				var/list/newgt2list=new()
				for(var/mob/A in GuildTeam1) if(A&&A.z==9&&!A.dead) newgt1list.Add(A)
				GuildTeam1=null
				GuildTeam1=newgt1list
				for(var/mob/B in GuildTeam2) if(B&&B.z==9&&!B.dead) newgt2list.Add(B)
				GuildTeam2=null
				GuildTeam2=newgt2list
			sleep(17)
		guildwar=0
		if(!GuildTeam1.len&&!GuildTeam2.len) return
		if(!GuildTeam1.len)
			for(var/mob/N in GuildTeam2)
				N<<"You've won the guild war!"
				N.loc=locate(23,215,9)
				if(N.guild_leader&&GT1>2){ N.warswon++; N.guildp++; }
		if(!GuildTeam2.len)
			for(var/mob/N in GuildTeam1)
				N<<"You've won the guild war!"
				N.loc=locate(23,215,9)
				if(N.guild_leader&&GT2>2){ N.warswon++; N.guildp++; }