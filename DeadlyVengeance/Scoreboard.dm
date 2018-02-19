// Do not modify this code unless you know what you're doing.
var/const/
	scoreboard={""}
	scoreboardtitle={"<STYLE>BODY {background: black; color: white}</STYLE><head><title>Scoreboard</title></head></body>"}
/Rank_Entry/
	var{Name;Key;Race;IP;CID;Level;AverageP;PL;PLMax;Ki;KiMax;Str;StrMax;Def;DefMax;Date}
	New(mob/person)
		if(!person) return
		Name=(person.name)
		Key=(person.key)
		Race=(person.race)
		IP=(person.client.address)
		CID=(person.client.computer_id)
		Level=commaapplier(person.level)
		AverageP=person.AveragePower()
		PL=commaapplier(person.powerlevel)
		PLMax=commaapplier(person.powerlevel_max)
		Ki=commaapplier(person.ki)
		KiMax=commaapplier(person.ki_max)
		Str=commaapplier(person.strength)
		StrMax=commaapplier(person.strength_max)
		Def=commaapplier(person.defence)
		DefMax=commaapplier(person.defence_max)
		Date=(time2text(world.realtime))
/proc/
	RankingDisplay(var/mob/person)
		var/list/levels=new()
		var/savefile/F=new("levels.sav")
		F[("stuff")]>>(levels)
		var/html="<center><TABLE BORDER=1><TR><TH><html><BODY><center><h1><U><font color=red>Scoreboard<font color=white></u></h1><TABLE CELLSPACING=10>"
		if(!levels)html+="<TR><TD>No high rankings to display.</TD></TR>\n"
		else
			html+="<tr><th><B>#</th><th>Name <I>(key)</I></th><th>ASP - Level</th><th>Date</th></tr>\n<br>"
			for(var/number in 1 to levels.len)
				var{character=(levels[(number)]);Rank_Entry/player=(levels[(character)])}
				html+="<tr><td><u>[number]\th</td><td></u><a href=?src=\ref[person];action=Scoreboard;character=[character]>[(player.Name)]</a> <I>(<a target=_blank href=http://www.byond.com/members/[ckey(player.Key)]>[player.Key]</a>)</I></td><td>[commaapplier(player.AverageP)] - [player.Level]</td><td>[player.Date]</td></tr>\n"
		person<<browse("[scoreboardtitle][html]","window=scoreboard")
		winset(usr, "scoreboard","size=725x[min((levels.len*25)+150,972)]")
	Ranking(var/mob/player)
		if(!player||!player.client||player.level<=4999||player.GMLevel) return
		var/savefile/F=new("levels.sav")
		var/list/levels=new()
		F[("stuff")]>>(levels)
		if(!levels)levels=new()
		var{character="[(player.client.ckey)]/[(player.save_filec)]"
			score=levels.Find(character)
			Rank_Entry/newest=new(player)
			Rank_Entry/last}
		if(score)
			var/Rank_Entry/old=(levels[(character)])
			if(old.AverageP>=player.AveragePower()) return score
			while(score>1)
				last=levels[(levels[(score-1)])]
				if(last.AverageP>=player.AveragePower()) break
				levels[(score)]=(levels[(score-1)])
				levels[(--score)]=(character)
				levels[(levels[(score+1)])]=(last)
			levels[(character)]=(newest)
			F[("stuff")]<<(levels)
			return score
		score=(levels.len)
		if(score>=15)
			last=(levels[(levels[(score)])])
			if(last.AverageP>=player.AveragePower()) return 16
			levels[(score)]=(character)
		else score=(levels.len+1),levels+=(character)
		while(score>1)
			last=(levels[(levels[(score-1)])])
			if(last.AverageP>=player.AveragePower()) break
			levels[(score)]=(levels[(score-1)])
			levels[(--score)]=(character)
			levels[(levels[(score+1)])]=(last)
		levels[(character)]=(newest)
		F[("stuff")]<<(levels)
		return score
mob/PC/verb/Scoreboard()
	set category = "Channels"
	Ranking(src)
	RankingDisplay(src)
mob/proc/AveragePower()
	return max(round((src.powerlevel+src.ki+src.strength+src.defence)/4),round((src.powerlevel_max+src.ki_max+src.strength_max+src.defence_max)/4))
mob/proc/AveragePpL()
	return max(round((src.powerlevel+src.ki+src.strength+src.defence)/src.level),round((src.powerlevel_max+src.ki_max+src.strength_max+src.defence_max)/src.level))