mob/var/tmp/
 who_delay = 0
 who_returned = 0
mob/PC/verb/Who()
	set category = "Channels"
	UPDATE_PLAYERS()
	var/html
	var/html_heading = {"<head><title>Players Online</title></head>
	<body bgcolor="#000000" text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<table width="650" border="0" bordercolor="#000000">
  <tr>
    <td width="35%"><strong><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"><center>Name:</center></font></strong></td>
    <td width="25%"><strong><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"><center>Race:</center></font></strong></td>
    <td width="40%"><strong><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"><center>Guild:</center></font></strong></td>
  </tr>
</table>

"}
	src.who()
	for(var/mob/PC/C in players)
		if(src.who_returned) return
		if(C.hidden) continue
		//var/obj/o=new()
		//o.icon='Member Symbol.dmi'
		html += {"<table width="650" border="0" bordercolor="#000000">"}
		if(C)
			html+={"<td width="35%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"><center><font color=[C.namecolor]>[C.name]</font color=[C.namecolor]> "}
			//if(C.client.IsByondMember())html+="<IMG CLASS=\"icon\" SRC=\"\ref[o.icon]\"\>"
			if(C.afk) html += {"(<font color=red>AFK</font color=red>)</center></td>"}
			html += {"
<td width="25%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"><center>[C.race]</center></font></td>
<td width="40%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"><center>[C.guild_name_html]</center></font></td>
</tr>
</table>"}
	var/count_html = {"<br><table width="650" border="0" bordercolor="#000000">
		<tr>
				<td width="35%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"></font></td>
				<td width="25%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"><b><center>Player Count: <font color=blue>[players.len]</font color=blue></center></b></font></td>
				<td width="40%"><font color="#FFFFFF" face="Tahoma, Tahoma, Helvetica, sans-serif"></font></td>
		</tr>
</table>"}
	src<< browse("[html_heading][html][count_html]","size=700x[min((players.len*25)+125,975)],window=Players Online")
	usr.afk_time = 0
mob/PC
	verb
		Online_Enforcers()
			set category = "Channels"
			if(src.SIdelay) return
			src.SIdelay+=50
			var/count = 0
			var/highestlevel=10
			var/finish=""
			finish+="-------------------------------<br>"
			finish+="Online Enforcers:<br>"
			while(highestlevel>0)
				for(var/mob/X in players)
					if(X.GMLevel==highestlevel)
						count ++
						finish+="{[X.GMLevel]}[X]</font color>  - [X.key]<br>"
				highestlevel--
			finish+="Total Online: [count]<br>"
			finish+="-------------------------------"
			usr<<"[finish]"
			sleep(src.SIdelay)
			src.SIdelay=0
mob/proc/who()
	if(src.who_delay)
		src<< "You must wait before using this command again."
		src.who_returned = 1
	else
		src.who_delay = 1
		spawn(23)
		src.who_delay = 0
		src.who_returned = 0