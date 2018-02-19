mob/var
	guild_muted = 0
	gm_guild_muted = 0
	acceptingGI = 0
mob/AI/Guild_War_Agent
	name = "{NPC} Guild War Agent"
	icon = 'npcs.dmi'
	icon_state = "Nappa2"
	verb
		Talk()
			set category = "Actions"
			set src in oview(2)
			switch(alert(usr,"Greetings [usr.name]! Want to go back to earth?","Yes","No"))
				if("Yes")
					usr.loc = locate(72,210,1)
mob/PC/verb
	Guild_Create()
		set category = "Guild"
		var/requiredz=max(100000-src.level,10000)
		if(src.level < 1500)
			spawn() alert(usr,"You aren't strong enough to lead a guild(level 1500)!")
			return
		if(src.zenni < requiredz)
			spawn() alert(usr,"You require at least [commaapplier(requiredz)]z to create a guild.")
			return
		//var/list/J = new()
		var/list/guild_members = new()
		var/guild_html = input({"Enter Guild HTML here(this will show up on OOC and in "Who"},"Guild Create") as text
		guild_html=Remove_Whitespace(ReplaceTxtex(guild_html,LineBreak," "))
		var/guildn = truelength(guild_html)
		var/savefile/F = new("World Save Files/Guilds.sav")
		if(guildn == "None")
			alert(usr,"Your cannot name a guild 'None'!")
			return
		if(guildn in Guilds)
			alert(usr,"This guild name has been taken!")
			return
		if(!guild_html)
			alert(usr,"Guild name cannot be blank")
			return
		if(lentext(guild_html)>1740||lentext(guildn)>36)
			spawn() alert(usr,"Guild Name too long.")
			return
		if(lentext(guildn)<4)
			spawn() alert(usr,"Guild Name too short.")
			return
		if(src.in_guild)
			src<< "You're in a Guild!"
			return
		if(Check_For_Text(guild_html,BAD_HTML_TAGS)==TRUE)
			alert(usr,"Your guild's name may not contain size changing fonts.")
			return
		if(Check_For_Bad_Links2(guildn)==TRUE||Check_For_Bad_Links2(guild_html)==TRUE||Check_For_Text(guild_html,BAD_LINK)==TRUE||Check_For_Text(guildn,BAD_LINK)==TRUE)
			alert(usr,"You cannot advertise here.")
			return
		if(Check_For_Size(guild_html)==TRUE)return
		else
			switch(alert(usr,"So, you wish to call your guild [guildn]?","Guild Creation","Yes","No"))
				if("Yes")
					src.guild_name = guildn
					src.guild_name_html = guild_html
					src.guild_leader = 1
					src.guild_rank = "Leader"
					src.in_guild = 1
					src.zenni-=requiredz
					guild_members.Add(src.name)
					//J=list(guild_members,src.guild_name)
					Guilds.Add(src.guild_name)
					F["Guilds"] << Guilds
					src.Give_Guild_Verbs()
					src.verbs -= new/mob/PC/verb/Guild_Create()
obj/Equipment/guild
	GuildWear
		name = "Guild Wear"
		equiped = 0
		var
			iguild=""
			iname=""
		Click()
			if(src in usr:contents)
				if(src.equiped)
					src.equiped = 0
					usr.G_item -= 1
					usr.overlays -= src.icon
					usr<< "You take off the [src.name]."
					suffix = null
				else
					if(usr.guild_name == src.iguild)
						if(usr.G_item >= 2)
							usr<< "You can only have up to 2 guild items equipped"
							return
						else
							src.equiped = 1
							usr.overlays += src.icon
							usr.G_item += 1
							suffix = "(Worn)"
							usr<< "You wear the [src.name]."
					else usr<< "<b>You dont belong to [src.iguild] so you can't wear their attire."
		verb
			Pick_Up()
				set src in oview(0)
				set category = null
				if(usr.guild_name == src.iguild)
					if(Move(usr))
						if(usr.inven_min < usr.inven_max)
							usr<< "You have picked up the: <u>[src]</u>."
							usr.inven_min += 1
						else usr<< "No more room for items."
					else
						usr<< "You're unable to pick up the: <u>[src]</u>."
						return
				else usr<< "You're not in the guild: [src.iguild]"
			Drop()
				set category = null
				if(!src.equiped)
					src.loc = usr.loc
					usr<< "You have dropped the: <u>[src]</u>."
					usr.inven_min -= 1
				else
					usr<< "You're unable to drop: <u>[src.name]</u>, it's already equipped."
			Destroy()
				set category = null
				if(!src.equiped)
					switch(alert(usr,"destroy this item?","Destroy","Yes","No"))
						if("Yes")
							del src
						if("No")
							return
				else usr<< "You're unable to destroy: <u>[src.name]</u>, it's equipped."
mob/var
	Guild_Summon = 0
	Guild_War = 0
	tmp/warl = 0
	tmp/inwar = 0
var/war_use=0
mob/Guild_Leader
	verb
		Resign()
			set category = "Guild"
			set name = "Resign Guild"
			if(!usr.guild_leader)
				usr<<"This is only for the guild leader!"
			else
				var/list/newleader=new()
				newleader.Add("Cancel")
				for(var/mob/M in players) if(M.guild_name==usr.guild_name) newleader.Add(M)
				var/selectleader=input("Retire your guild to whom?","Retire") in newleader
				if(selectleader!="Cancel")
					var/mob/N=selectleader
					if(N.level<1500)
						spawn() alert(usr,"Please choose someone of the level 1,500 or higher")
						return
					N.guild_leader=1
					if(N.client) N<<"[usr] has turned over ownership of the guild [usr.guild_name_html]</font color> to you!"
					usr.guild_leader=0
					usr.guild_co_leader=1
					usr.guild_rank="Co-Leader"
					N.guildp=usr.guildp
					N.warswon=usr.warswon
					usr.guildp=0
					usr.warswon=0
					N.guild_rank="Leader"
					usr.Remove_Guild_Verbs()
					N.Remove_Guild_Verbs()
					usr.Give_Guild_Verbs()
					N.Give_Guild_Verbs()
					usr<<"You have turned over ownership of the guild [usr.guild_name_html]</font color> to [N]!"
		Guild_Summon()
			set category = "Guild"
			set name = "Guild Summon"
			var/list/Menu = new()
			for(var/mob/M in players) if(M.name != usr.name) if(M.in_guild) if(M.guild_name_html == usr.guild_name_html) if(!M.jailed) Menu.Add(M)
			var/mob/M = input("Summon Who?","Summon") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob/PC))
				if(M.dead)
					alert(usr,"You cannot summon them, they are dead")
					return
				if(usr.dead)
					alert(usr,"You cannot summon them, you're dead")
					return
				if(usr.z==6 && M.z!=6)
					usr<<"You cannot summon people into the HBTC."
					return
				if(M.z==6 && usr.z!=6)
					usr<<"You cannot summon people out of the HBTC."
					return
				if(((locate(/obj/Dragonballs/Namek) in M)||(locate(/obj/Dragonballs/Earth) in M))&&M.z!=src.z)
					src<<"A force stops you from summon [M]!"
					return
				if(M.grav_on)
					usr<<"You cannot summon [M], they are gravity training."
					return
				if(M.meditate)
					usr<<"You can't manage to summon, [M]. They appear to be busy."
					return
				if(M.jailed||usr.jailed) return
				else
					switch(alert(M,"[usr] wants to summon you, Accept?","Guild Summon","Yes","No"))
						if("Yes")
							if(M.dead)
								alert(usr,"You cannot summon them, they are dead")
								return
							if(usr.dead)
								alert(usr,"You cannot summon them, you're dead")
								return
							if(usr.z==6 && M.z!=6)
								usr<<"You cannot summon people into the HBTC."
								return
							if(M.z==6 && usr.z!=6)
								usr<<"You cannot summon people out of the HBTC."
								return
							if(M.grav_on)
								usr<<"You cannot summon [M], they are gravity training."
								return
							if(((locate(/obj/Dragonballs/Namek) in M)||(locate(/obj/Dragonballs/Earth) in M))&&M.z!=src.z)
								src<<"A force stops you from summon [M]!"
								return
							if(M.meditate)
								usr<<"You can't manage to summon, [M]. They appear to be busy."
								return
							for(var/area/house/S in view(1)) for(var/obj/O in M.contents)
								if(istype(O,/obj/Dragonballs))
									M << "You cannot enter a sz with a dragonball!"
									return
							if(M.z==6 && usr.z!=6)return
							if(usr.z==6 && M.z!=6)return
							if(M.dead||M.tourny||M.jailed||usr.jailed) return
							M.loc = locate(src.x,src.y-1,src.z)
							M << "[usr.name] has summoned you"
						if("No")
							usr<<"[M] has declined your summon."
		Guild_War()
			set category = "Guild"
			set name = "Guild War"
			if(!usr.guild_leader||guildwar)return
			var/list/Menu = new()
			Menu.Add("Cancel")
			for(var/mob/M in players) if(M.guild_leader) if(M.guild_name != usr.guild_name) Menu+=M.guild_name
			if(guildwar)return
			var/guildwarselection = input("Challenge Who?","Guild War") as null | anything in Menu
			if(!guildwarselection||guildwar||guildwarselection=="Cancel")return
			var/mob/M
			for(var/mob/N in players) if(N.guild_name==guildwarselection&&N.guild_leader){ M=N; break; }
			if(guildwar)return
			if(istype(M,/mob))
				switch(alert(M,"[usr.guild_name] is requesting a war with your guild","Guild War","Accept","Refuse"))
					if("Accept")
						if(guildwar)return
						Guild_War_Start("[usr.guild_name]","[M.guild_name]")
						return
					if("Refuse")
						usr<< "[M.guild_name] has refused to go to war"
						return
		Guild_Mutew()
			set category = "Guild"
			set name = "Guild Mute"
			var/list/Menu = new()
			for(var/mob/M in players)
				if(M.name != usr.name) if(M.in_guild) if(M.guild_name_html == usr.guild_name_html) Menu.Add(M)
			var/mob/M = input("Guild Mute Who?","Guild Mute") as mob in Menu
			if(!M||M.guild_muted)return
			if(M.guild_leader)
				usr<< "You cannot mute the leader"
				return
			if(M.guild_rank==usr.guild_rank)
				usr<< "You cannot mute someone of equal rank."
				return
			switch(alert(usr,"Are you sure you want to guild mute [M]?","Guild Mute [M]","Yes","No"))
				if("No")
					return
			var/Reason=input("Input a reason if wanted.")as null|text
			var/Time=input({"For How Long? (In Seconds)
(Max of 600 Seconds (10 Minutes))
(Input 0 or below 0 for target to remiain muted until
unmuted. Any time past 10 minutes will be lowered
to 10 minutes.)"})as num
			if(Time>=600) Time=600
			if(Time>=1) Time*=10
			if(Reason)
				if(Time) for(var/mob/X in players) if(X.guild_name == usr.guild_name) X<<"<b>[M] has been <font color=red>Guild Muted</font> by [src]. ([Reason])([Time/10] Seconds)"
				else for(var/mob/X in players) if(X.guild_name == usr.guild_name) X<<"<b>[M] has been <font color=red>Guild Muted</font> by [src]. ([Reason])"
			else
				if(Time) for(var/mob/X in players) if(X.guild_name == usr.guild_name) X<<"<b>[M] has been <font color=red>Guild Muted</font> by [src]. ([Time/10] Seconds)"
				else for(var/mob/X in players) if(X.guild_name == usr.guild_name) X<<"<b>[M] has been <font color=red>Guild Muted</font> by [src]."
			M.guild_muted=1
			if(Time<=0) return
			sleep(Time)
			if(!M)return
			M.guild_muted=0
			for(var/mob/X in players) if(X.guild_name == usr.guild_name) X<<"<b>[M] has been <font color=red>Guild Unmuted."
		Guild_Unmute()
			set category = "Guild"
			var/list/Menu = new()
			for(var/mob/M in players)
				if(M == usr) continue
				if(M.in_guild) if(M.guild_name_html == usr.guild_name_html) if(M.guild_muted && !M.gm_guild_muted) Menu.Add(M)
			var/mob/M = input("Guild UnMute Who?","Guild UnMute") as mob in Menu
			switch(alert(usr,"Are you sure you want to guild unmute [M]?","Guild UnMute [M]","Yes","No"))
				if("Yes")
					for(var/mob/X in players) if(X.guild_name == usr.guild_name) X<<"<b>[M] has been <font color=red>Guild UnMuted</font> by [src]."
					M.guild_muted = 0
		MakeGuildItem()
			set name = "Make Guild Item"
			set category="Guild"
			while(1)
				if(!usr.zenni >= 10000)
					usr<< "You need at least 10,000 zenni to make an item!"
					return
				var/iname = input("What should the name be?") as text
				if(lentext(iname)>10)
					usr<<"Please use a name under 10 characters."
					return
				var/icon/iicon = input("What should the icon be?") as icon
				var/number=input("How many do you wish to make(1,000,000 each)?") as num
				if(number < 1)
					usr<< "minimum is 1"
					continue
				var/cost = number * 10000
				if(usr.zenni >= cost)
					usr.zenni -= cost
					while(number > 0)
						var/obj/Equipment/guild/GuildWear/G=new(usr)
						G.name = iname
						G.iguild="[usr.guild_name]"
						G.icon = iicon
						var/icon/i=new(G.icon)
						i=i.ResizeWithAspect(32,32)
						G.icon=i
						G.Icon_State("")
						number -= 1
						usr<< "You've successfully created [iname]!"
				else
					usr<< "Not enough zenni"
				break
		Guild_Change_Title()
			set category = "Guild"
			var/list/Menu = new()
			for(var/mob/M in players)
				if(M.in_guild) if(M.guild_name_html == usr.guild_name_html) Menu.Add(M)
			var/mob/M = input("Change Who's Title?","Guild Change Title") as null | anything in Menu
			if(!M)return
			if(M.guild_leader&&M!=usr)
				usr<< "You cannot change this person's title."
				return
			if(M.guild_rank==usr.guild_rank&&M!=usr)
				usr<< "You cannot change this person's title."
				return
			if(istype(M,/mob))
				switch(input("What title do you wish to give [M]?")in list("Custom","Cancel"))
					if("Custom")
						switch(alert(usr,"Do you wish to Alter their Title?","Change Title","Yes","No"))
							if("Yes")
								var/new_title = input("What do you wish their Title to be called?(HTML Allowed)","Custom Title",\M.title) as text | null
								if(Check_For_Text(new_title,BAD_HTML_TAGS) == TRUE)
									alert(usr,"The title may not contain line breaks or size changing fonts.")
									return
								if(Check_For_Text(new_title,BAD_WORDS) == TRUE)
									alert(usr,"Your title may not have bad words in it.")
									return
								if(Check_For_Text(new_title,BAD_LINK) == TRUE)
									alert(usr,"You cannot advertise here.")
									return
								if(Check_For_Size(new_title)==TRUE)return
								if(lentext(truelength(new_title))>36)
									spawn() alert(usr,"Title too long.")
									return
								if(lentext(new_title) > 930)
									spawn() alert(usr,"Your message can not exceed 930 characters.")
									new_title = copytext(new_title,1,930)
								M.title = new_title
								for(var/mob/X in players) if(X.guild_name == src.guild_name) X << "<font color = #BB0EDA>Guild Information:</font> [M] has been granted the title of [new_title]!"
		Guild_Invite()
			set category = "Guild"
			var/NGuild=usr.guild_name_html
			var/list/Menu = new()
			for(var/mob/M in players) if(M.name != usr.name) if(!M.in_guild) if(!M.acceptingGI) Menu.Add(M)
			var/mob/M = input("Invite Who?","Guild Invite") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert(M,"Would you like to join [usr]'s Guild?","Guild Join","Yes","No"))
					if("Yes")
						M.guild_name = truelength(NGuild)
						M.guild_name_html = NGuild
						M.guild_member = 1
						M.guild_rank = "Member"
						M.in_guild = 1
						M.Give_Guild_Verbs()
						M.verbs -= new/mob/PC/verb/Guild_Create()
						for(var/mob/X in players) if(X.guild_name == M.guild_name) X << "<font color = #BB0EDA>Guild Information:</font> [M] has joined the Guild!"
					if("No")
						usr<< "[M] has declined your Guild Invite"
						return
		Guild_Boot()
			set category = "Guild"
			var/list/Menu = new()
			for(var/mob/M in players) if(M.name != usr.name) if(M.in_guild) if(M.guild_name_html == usr.guild_name_html) Menu.Add(M)
			var/mob/M = input("Boot Who?","Guild Boot") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(M.guild_leader)
					alert(usr,"You cannot boot the Leader!")
					return
				if(!usr.guild_leader)
					if(M.guild_co_leader)
						alert(usr,"You cannot boot the Co-Leader!")
						return
				if(usr.guild_rank==M.guild_rank&&M!=usr)return
				switch(alert(usr,"Would you like to Boot [M] from the Guild?","Guild Boot","Yes","No"))
					if("Yes")
						for(var/mob/X in players) if(X.guild_name == M.guild_name) X << "<font color = #BB0EDA>Guild Information:</font> [M] has been Booted from the Guild!"
						M.LeaveGuild()
					if("No")
						usr<< "You decided not to Boot [M]"
						return
		Guild_Change_Rank()
			set category = "Guild"
			var/list/Menu = new()
			for(var/mob/M in players-usr)
				if(M.in_guild){ if(M.guild_name_html == usr.guild_name_html){ if(!M.guild_leader&&M.guild_rank!=usr.guild_rank){ Menu.Add(M)} } }
			var/mob/M = input("Change Who's Rank?","Guild Change Rank") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(input("What rank do you wish to give [M]?")in list("Co-Leader","Member","Custom","Cancel"))
					if("Co-Leader")
						M.guild_co_leader = 1
						M.guild_rank = "Co-Leader"
						for(var/mob/X in players)
							if(X.guild_name == src.guild_name) X << "<font color = #BB0EDA>Guild Information:</font> [M] has been granted the rank of \white Co-Leader!"
					if("Member")
						M.guild_member = 1
						M.guild_co_leader = 0
						M.guild_rank = "Member"
						for(var/mob/X in players) if(X.guild_name == src.guild_name) X << "<font color = #BB0EDA>Guild Information:</font> [M] has been granted the rank of \white Member!"
					if("Custom")
						switch(alert(usr,"Do you wish to Alter their Custom Rank?","Change Rank","Yes","No"))
							if("Yes")
								var/new_rank = input("What do you wish their Rank to be called?","Custom Rank") as text | null
								if(lentext(new_rank) > 25) usr<< "New Rank cannot be more than 25 Characters"
								if(!M) return
								M.guild_rank = html_encode(new_rank)
								for(var/mob/X in players)
									if(X.guild_name == src.guild_name) X << "<font color = #BB0EDA>Guild Information:</font> [M] has been granted the rank of [M.guild_rank]!"
								switch(input("What Permissions do you wish to give them?")in list("Boot","Invite","Announce","Change Rank","Cancel"))
									if("Boot")
										M.guild_boot = 1
									if("Invite")
										M.guild_invite = 1
									if("Announce")
										M.guild_announce = 1
									if("Make Guild Item")
										M.guild_change_rank = 1
								M.guild_co_leader = 0
							if("No")
								switch(input("What Permissions do you wish to give them?")in list("Boot","Invite","Announce","Change Rank","Cancel"))
									if("Boot")
										M.guild_boot = 1
									if("Invite")
										M.guild_invite = 1
									if("Announce")
										M.guild_announce = 1
									if("Make Guild Item")
										M.guild_change_rank = 1
								M.guild_co_leader = 0
				M.Remove_Guild_Verbs()
				M.Give_Guild_Verbs()
		Guild_Announce(T as text)
			set category = "Guild"
			set desc = "Announce to the Guild"
			if(Channel_Mute && !src.GMLevel)
				src<< "All Chat Channels are Muted!"
				return
			if(src.gm_guild_muted||src.guild_muted)
				src<<"You're currently guild muted."
				return
			if(lentext(T) > 350)
				alert(usr,"Message must be less than 350 Characters!")
				return
			if(!T)
				alert(usr,"Your message may not be blank.")
				return
			if(Check_For_Bad_Links2(T)==TRUE||Check_For_Text(T,BAD_LINK) == TRUE)
				src<<"You cannot advertise here."
				return
			if(Check_For_Text(T,BAD_HTML_TAGS)==TRUE)
				src<<"You cannot use those html tags"
				return
			T=html_encode(Remove_Whitespace(ReplaceTxtex(T,LineBreak," ")))
			T="<BR>----- Guild Announce -----<BR><font color=#000066>{<font color=#FFFFFF>[src.guild_rank]<font color=#000066>}</font> [usr]: [T]<BR>"
			for(var/mob/PC/X in players)
				if(X.guild_name == usr.guild_name)
					if(X.censorme)
						if(X.GC2) X << output(Censor(T),"output2")
						else X<<Censor(T)
					else
						if(X.GC2) X << output(T,"output2")
						else X<<T
				else if(X.guildlisten==1) X << "From [src.guild_name_html]: [T]"
			SChatLog(usr,T)
mob/Guild_Verbs
	verb
		Participate_in_Guildwar()
			set category = "Guild"
			if(usr.joinguildwar)
				for(var/mob/M in players) if(M.client) if(M.guild_name==usr.guild_name) M<<"[usr] is no longer participating in guild wars!"
				usr<<"You're no longer participating in guild wars."
				usr.joinguildwar=0
			else
				for(var/mob/M in players) if(M.client) if(M.guild_name==usr.guild_name) M<<"[usr] is now participating in guild wars!"
				usr<<"You're now participating in guild wars."
				usr.joinguildwar=1
		Guild_Battle_Challenge()
			set category = "Guild"
			var/list/Menu = new()
			for(var/mob/M in players) if(M.name != usr.name) if(M.in_guild) if(M.guild_name_html == usr.guild_name_html) Menu.Add(M)
			var/mob/M = input("Challenge Who?","Guild Chalange") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert(usr,"Do you want to Challenge [M]?","Guild Challenge","Yes","No"))
					if("Yes")
						switch(alert(M,"[usr] is challanging you to a guild fight, Accept?","Guild Challenge","Yes","No"))
							if("Yes")
								for(var/mob/C in players) if(C.guild_name == usr.guild_name)
									C << "<font color=green>Guild Battle Information:<font color=white> [usr] has Challenged [M] to a guild battle!"
								usr.opponent = "[M]"
								M.opponent = "[usr]"
								usr.guildb = 1
								M.guildb = 1
							if("No")
								usr<< "[M] has declined from your Challenge"
		Guild_Chat(T as text)
			set category = "Guild"
			set desc = "Chat to the Guild"
			T=html_encode(Remove_Whitespace(ReplaceTxtex(T,LineBreak," ")))
			var/list/L
			L = list("font size")
			if(Channel_Mute && !src.GMLevel)
				src<< "All Chat Channels are Muted!"
				return
			if(src.gm_guild_muted||src.guild_muted)
				src<<"You're currently guild muted."
				return
			if(Check_For_Bad_Links2(T)==TRUE||Check_For_Text(T,BAD_LINK) == TRUE)
				src<<"You cannot advertise here."
				return
			if(usr.guild_muted)
				usr<< "You're Guild Muted"
				return
			if(Check_For_Text(T,BAD_HTML_TAGS) == TRUE)
				src<<"You cannot use those html tags"
				return
			if(lentext(T) > 300)
				spawn() alert(usr,"Message must be less than 300 characters!")
				var/extra=ReplaceTxt(copytext(T,300), "\"", "\\\"")
				if(src.ChatBar1=="Guild Chat")
					winset(src,"chat2.input2","text=\"[extra]\"")
				else
					if(src.ChatBar2=="Guild Chat")
						winset(src,"chat2.input3","text=\"[extra]")
					else
						spawn()
							var/I=input(src,"What would you like to say in Guild Chat?","Guild Chat",extra)
							if(I) call(src,"Guild_Chat") (I)
				T = copytext(T,1,300)
			if(!T)
				alert(usr,"Your message may not be blank.")
				return
			for(var/X in L)
				if(findtext(T,X))
					alert(usr,"You may not change your font size.")
					return
			T={"<font color=yellow>[src.guild_rank] | [src.name] <font color=yellow>GuildSays:<font color = yellow> [T]"}
			for(var/mob/PC/X in players)
				if(X.guild_name == usr.guild_name)
					if(X.gooc_on)
						if(X.censorme)
							if(X.GC2) X << output(Censor(T),"output2")
							else X<<Censor(T)
						else
							if(X.GC2) X << output(T,"output2")
							else X<<T
				else if(X.guildlisten==1) X<<{"GuildSay From [src.guild_name_html]: [T]"}
			SChatLog(usr,"GuildSay From [src.guild_name_html]: [T]")
		Guild_Who()
			set category = "Guild"
			var/count = 0
			usr<< "-------------------------------"
			for(var/mob/X in players)
				if(X.in_guild)
					if(X.guild_name_html == usr.guild_name_html)
						count += 1
						if(X.guild_muted) usr<< "<font color=white>[X.guild_rank]: [X](<font color=red>MUTED</font color=red>)"
						else
							if(X.gm_guild_muted) usr<< "<font color=white>[X.guild_rank]: [X](<font color=red>GM MUTED</font color=red>)"
							else usr<< "<font color=white>[X.guild_rank]: [X]"
			usr<< "Guild Members Online: [count]"
			usr<< "-------------------------------"
		Guild_Leave()
			set category = "Guild"
			if(!src.guild_leader)
				switch(alert(usr,"Are you sure you wish to leave the Guild [src.guild_name] ?","Guild Leave","Yes","No"))
					if("Yes")
						for(var/mob/X in players) if(X.guild_name_html == src.guild_name_html) X << "<font color = #BB0EDA>Guild Information:</font> [src] has left the Guild!"
						src.LeaveGuild()
			else
				switch(alert(usr,"Are you sure you wish to leave the Guild ?","Guild Leave","Yes","No"))
					if("Yes")
						var/savefile/F = new("World Save Files/Guilds.sav")
						for(var/mob/PC/M in players)
							if(!Channel_Mute && !World_Mute) if(M.ooc_on) M << "<font color = #BB0EDA>Guild Information:</font> [src] has Disbanded [src.guild_name]!"
							if(M.guild_name==src.guild_name)
								M.LeaveGuild()
						Guilds.Remove(src.guild_name)
						var/c=0
						for(var/G in guildhouses){c++;if(src.guild_name==G){guildhouses[c]="";break}}
						F["Guilds"] << Guilds
						src.LeaveGuild()
mob
	proc
		LeaveGuild()
			spawn()
				src.Remove_Guild_Verbs()
				src.guild_name = "None"
				src.guild_name_html = "None"
				src.guild_leader = 0
				src.guild_co_leader = 0
				src.guild_member = 0
				src.guildp = 0
				src.warswon = 0
				if(!src.GMLevel) src.title = "<font color=white>Player</font>"
				src.guild_invite = 0
				src.guild_announce = 0
				src.guild_boot = 0
				src.guild_change_rank = 0
				src.guild_rank = ""
				src.in_guild = 0
				src.verbs += new/mob/PC/verb/Guild_Create()
		Give_Guild_Verbs()
			if(src.guild_leader)
				src.verbs += typesof(/mob/Guild_Leader/verb)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
			if(src.guild_co_leader)
				src.verbs += typesof(/mob/Guild_Leader/verb)
				src.verbs += typesof(/mob/Guild_Verbs/verb)
			if(src.guild_member) src.verbs += typesof(/mob/Guild_Verbs/verb)
			if(src.guild_invite) src.verbs += new/mob/Guild_Leader/verb/Guild_Invite()
			if(src.guild_boot) src.verbs += new/mob/Guild_Leader/verb/Guild_Boot()
			if(src.guild_announce) src.verbs += new/mob/Guild_Leader/verb/Guild_Announce()
			if(src.guild_change_rank) src.verbs += new/mob/Guild_Leader/verb/MakeGuildItem()
		Remove_Guild_Verbs()
			if(src.guild_leader)
				src.verbs -= typesof(/mob/Guild_Leader/verb)
				src.verbs -= typesof(/mob/Guild_Verbs/verb)
			if(src.guild_co_leader)
				src.verbs -= typesof(/mob/Guild_Leader/verb)
				src.verbs -= typesof(/mob/Guild_Verbs/verb)
			if(src.guild_member) src.verbs -= typesof(/mob/Guild_Verbs/verb)
			if(src.guild_invite) src.verbs -= new/mob/Guild_Leader/verb/Guild_Invite()
			if(src.guild_boot) src.verbs -= new/mob/Guild_Leader/verb/Guild_Boot()
			if(src.guild_announce) src.verbs -= new/mob/Guild_Leader/verb/Guild_Announce()
			if(src.guild_change_rank) src.verbs -= new/mob/Guild_Leader/verb/MakeGuildItem()