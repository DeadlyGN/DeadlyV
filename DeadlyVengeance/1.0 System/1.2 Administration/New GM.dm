mob
	GM1
		verb
			Admin_Chat(T as text)
				set category = "Administration"
				AdminChat(T)
				ALog("Admin Chat: [truelength(usr.name)]([usr.key]): [T]")
				SAdminLog(usr,"Admin Chat: [truelength(usr.name)]([usr.key]): [T]")
				SChatLog(usr,"Admin Chat: [T]")
			Reset_BugReports()
				set category = "Server"
				Load_BugReports()
			Get_Moves()
				set category = "Administration"
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has given theirself all moves.")
						else AdminMessage("[usr]([usr.key]) has given theirself all moves.",0)
				else AdminMessage("[usr]([usr.key]) has given theirself all moves.")
				usr.verbs += typesof(/mob/learn/verb/)
				usr.verbs += new/mob/learn/Demon/verb/Stone_Spit
				usr.verbs += new/mob/learn/Demon/verb/Mouth_Blast
				usr.verbs += new/mob/learn/Changling/verb/Changling_Distructo_Disk
				usr.verbs += new/mob/learn/Saiyan/verb/X10_Kamehameha
				usr.verbs += new/mob/learn/Saiyan/verb/Fake_Moon
				usr.verbs += new/mob/learn/Majin/verb/Candy_Ray
				usr.verbs += new/mob/learn/Namek/verb/Hellzone_Grenade
				usr.verbs += new/mob/learn/Namek/verb/Light_Grenade
			Teleport()
				set category = "Administration"
				set desc="Teleport To Coordinates"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/mob/WH
				var/YN
				while(1)
					var/XT=alert(usr,"Teleport Someone Else or Yourself","Teleporting","Self","Other","Cancel")
					if(XT=="Cancel") return
					var/LocX=input("Teleport [XT] to what X location?(1-[world.maxx])")as num
					if(LocX<=0)LocX=1
					if(LocX>world.maxx)LocX=world.maxx
					var/LocY=input("Teleport [XT] to what Y location?(1-[world.maxy])")as num
					if(LocY<=0)LocY=1
					if(LocY>world.maxy)LocY=world.maxy
					var/LocZ=input("Teleport [XT] to what Z location?(1-[world.maxz])")as num
					if(LocZ<=0)LocZ=1
					if(LocZ>world.maxz)LocZ=world.maxz
					switch(XT)
						if("Other")
							WH=input("Whom Do You Wish To Teleport?")as mob in world
							YN=alert(usr,{"Is This Correct?
				Teleport: [WH]
				Target Location: [LocX], [LocY], [LocZ]"},"Correct?","Yes","No","Cancel")
						if("Self")
							WH=usr
							YN=alert(usr,{"Is This Correct?
				Teleport: [XT]
				Target Location: [LocX], [LocY], [LocZ]"},"Correct?","Yes","No","Cancel")
					switch(YN)
						if("No") continue
						if("Cancel") break
					if(usr.GMLevel>3)
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[usr] ([usr.key]) has teleported [WH] from [WH.x],[WH.y],[WH.z] to [LocX],[LocY],[LocZ].")
							else AdminMessage("[usr] ([usr.key]) has teleported [WH] from [WH.x],[WH.y],[WH.z] to [LocX],[LocY],[LocZ].",0)
					else AdminMessage("[usr] ([usr.key]) has teleported [WH] from [WH.x],[WH.y],[WH.z] to [LocX],[LocY],[LocZ].")
					WH:loc=locate(LocX,LocY,LocZ)
					break
			Teleport_To()
				set category = "Administration"
				set desc="Teleport Self or Other to Target"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/mob/WH
				var/YN
				while(1)
					var/XT=alert(usr,"Teleport Someone Else or Yourself","Teleporting","Self","Other","Cancel")
					var/mob/Targ
					switch(XT)
						if("Other")
							WH=input("Whom Do You Wish To Teleport?")as mob in world
							Targ=input("Whom do you wish to teleport [WH] to?")as mob in world
							YN=alert(usr,{"Is This Correct?
				Teleport: [WH]
				Target: [Targ]"},"Correct?","Yes","No")
						if("Self")
							Targ=input("Whom do you wish to teleport to?")as mob in world
							WH=usr
							YN=alert(usr,{"Is This Correct?
				Teleport: [XT]
				Target [Targ]"},"Correct?","Yes","No","Cancel")
						if("Cancel")
							break
					switch(YN)
						if("No") continue
						if("Cancel") break
					if(usr.GMLevel>3)
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[usr]([usr.key]) has teleported [WH] from [WH.x],[WH.y],[WH.z] to [Targ]([Targ.x],[Targ.y],[Targ.z]).")
							else AdminMessage("[usr]([usr.key]) has teleported [WH] from [WH.x],[WH.y],[WH.z] to [Targ]([Targ.x],[Targ.y],[Targ.z]).",0)
					else AdminMessage("[usr]([usr.key]) has teleported [WH] from [WH.x],[WH.y],[WH.z] to [Targ]([Targ.x],[Targ.y],[Targ.z]).")
					WH:loc=Targ.loc
					break
			Admin_Who()
				set category="Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				for(var/mob/M)
					if(!M.key) continue
					if(M.name == M.key) usr<< M.name
					else usr<< "[M.name] ([M.key])"
			Watch(M as mob in world)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				client.eye = M
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr] ([usr.key]) has started watching [M].",1)
						else AdminMessage("[usr] ([usr.key]) has started watching [M].",0)
				else AdminMessage("[usr] ([usr.key]) has started watching [M].")
				usr<< "<b>Your Now watching [M]"
				client.perspective = 255
			Stop_Watching()
				set category = "Administration"
				client.eye = usr
				usr<< "<b>You stop watching who ever you were watching because they got boring."
			Admin_Room()
				set category = "Administration"
				src.loc = locate(202,72,7)
			Meeting_Room()
				set category = "Administration"
				src.loc = locate(213,215,7)
			/*Log_Information(T as null|text)
				set category = "Owner"
				set desc="Log Information In The Admin Log That Any Admin Can Read"
				if(!T)
					return
				if(length(T)>=750)
					usr<<"Length Is Not To Exceed 750, Break It Down."
					return
				var/Z=alert(usr,{"Is This Correct?"[usr] Logs: [T]""},"Correct?""Yes","No"))
				if(Z=="No")
					return
				ALog("[truelength(usr.name)] Logs: [T]")*/
			Boot(mob/M in world)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(alert(usr,"Are you sure you want to boot [M]?","Boot [M]","Yes","No"))
					if("Yes")
						if(M.GMLevel>=GMLevel)
							AdminMessage("[usr] tried Booting [M].")
							AdminBadLog("Boot","No Reason","No Other",M)
							return
						else
							var/Reason=input("Input a reason if wanted.")as null|text
							AdminLog("Boot","[Reason]","No Other",M)
							if(Reason)
								players<<"<b>[M]([M.key])has been <font color = red>Booted</font> by [src]([src.key]). ([Reason])"
								del M
							else
								players<<"<b>[M]([M.key])has been <font color = red>Booted</font> by [src]([src.key])."
								del M
						if("No")
							return
	//**********//
	//***Mute***//
	//**********//
			Mute(mob/PC/M in players)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(alert(usr,"Are you sure you want to mute [M]?","Mute [M]","Yes","No"))
					if("No")
						return
				if(M.GMLevel>=GMLevel)
					AdminMessage("[usr]([usr.key]) tried Muting [M]")
					AdminBadLog("Mute","No Reason","No Other",M)
				else
					var/Reason=input("Input a reason if wanted.")as null|text
					var/Time=input({"For How Long? (In Seconds)
	(Max of 600 Seconds (10 Minutes))
	(Input 0 or below 0 for target to remiain muted until
	unmuted. Any time past 10 minutes will be lowered
	to 10 minutes.)"})as num
					if(Time>=600) Time=600
					if(Time>=1) Time*=10
					if(Reason)
						if(Time) players<<"<font color = blue>[world.name] Administration Information:\white<b>[M]([M.key])has been <font color=red>Muted</font> by [src]([src.key]). ([Reason])([Time/10] Seconds)"
						else players<<"<font color = blue>[world.name] Administration Information:\white<b>[M]([M.key])has been <font color=red>Muted</font> by [src]([src.key]). ([Reason])"
					else
						if(Time) players<<"<font color = blue>[world.name] Administration Information:\white<b>[M]([M.key])has been <font color=red>Muted</font> by [src]. ([Time/10] Seconds)"
						else players<<"<font color = blue>[world.name] Administration Information:\white<b>[M]([M.key])has been <font color=red>Muted</font> by [src]."
					M.muted ++
					M.mute_time = Time
					AdminLog("Mute","[Reason]","Time: [Time/10] Seconds",M)
					if(Time<=0) return
					sleep(Time)
					if(!M)return
					if(M.muted>0) M.muted --
					if(!M.muted) players<<"<b>[M]([M.key])has been <font color=red>Unmuted."
			GM_Guild(mob/PC/M in players)
				set category = "Administration"
				set name="Guild Admin-Mute"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(input("Mute or Unmute?")in list("Mute","Unmute"))
					if("Mute")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						switch(alert(usr,"Are you sure you want to guild mute [M]?","Guild Mute [M]","Yes","No"))
							if("No")
								return
						if(M.GMLevel>=GMLevel)
							AdminMessage("[usr] tried Guild Muting [M]")
							AdminBadLog("Mute","No Reason","No Other",M)
						else
							var/Reason=input("Input a reason if wanted.")as null|text
							var/Time=input({"For How Long? (In Seconds)
			(Max of 600 Seconds (10 Minutes))
			(Input 0 or below 0 for target to remiain muted until
			unmuted. Any time past 10 minutes will be lowered
			to 10 minutes.)"})as num
							if(Time>=600) Time=600
							if(Time>=1) Time*=10
							if(Reason)
								if(Time) players<<"<b><font color = blue>[world.name] Administration Information:\white[M]([M.key])has been <font color=red>Guild Muted</font> by [src]. ([Reason])([Time/10] Seconds)"
								else players<<"<b><font color = blue>[world.name] Administration Information:\white[M]([M.key])has been <font color=red>Guild Muted</font> by [src]. ([Reason])"
							else
								if(Time) players<<"<b><font color = blue>[world.name] Administration Information:\white[M]([M.key])has been <font color=red>Guild Muted</font> by [src]. ([Time/10] Seconds)"
								else players<<"<b><font color = blue>[world.name] Administration Information:\white[M]([M.key])has been <font color=red>Guild Muted</font> by [src]."
							M.gm_guild_muted=1
							M.guild_muted=1
							AdminLog("GuildMute","[Reason]","Time: [Time/10] Seconds",M)
							if(Time<=0) return
							sleep(Time)
							if(!M)return
							if(M.gm_guild_muted)
								M.gm_guild_muted=0
								M.guild_muted=0
								players<<"<b>[M]([M.key])has been <font color=red>Guild Unmuted."
					if("Unmute")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						switch(alert(usr,"Are you sure you want to guild unmute [M]?","Guild UnMute [M]","Yes","No"))
							if("Yes")
								players<<"<b>[M]([M.key])has been <font color=red>Guild UnMuted</font> by [src]([src.key])."
								M.gm_guild_muted=0
								M.guild_muted = 0
								AdminLog("Guild UnMute","No Reason","No Other",M)
			Unmute(mob/PC/M in players)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(alert(usr,"Are you sure you want to unmute [M]?","UnMute [M]","Yes","No"))
					if("Yes")
						players<<"<font color = blue>[world.name] Administration Information:\white<b>[M]([M.key])has been <font color=red>UnMuted</font> by [src]([src.key])."
						M.muted=0
						AdminLog("UnMute","No Reason","No Other",M)
			Warn(mob/PC/M in players)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(alert(usr,"Are you sure you want to warn [M]?","Warn [M]","Yes","No"))
					if("No")
						return
				var/Warn=input("Include What In The Warning? (Admin Warning: \[Warning\])")as text
				var/Type=input("Alert (Popup) or send in chat bar?")in list(/*"Alert"*/,"Text")
				if(Type=="Alert") M<<alert(usr,"Admin Warning: [Warn] ~ [usr]")
				if(Type=="Text") M<<"<font color =silver><font color=red>Admin Warning: </font>[Warn] ~ [usr]([usr.key])"
				AdminLog("Warn","[Warn]","[Type]",M)
				AdminMessage("[usr]([usr.key]) Warned [M]([M.key]): [Warn].")
	GM2
		verb
			Jail(mob/PC/M in players)
				set category = "Administration"
				if(GMLockCheck()<2)
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(alert(usr,"Are you sure you want to Jail [M]?","Jail [M]","Yes","No"))
					if("No")
						return
				if(M.GMLevel>=GMLevel)
					AdminMessage("[usr]([src.key]) tried Jailing [M]")
					AdminBadLog("Mute","No Reason","No Other",M)
					return
				else
					var/Time=input({"For How Long? (In Minutes)
	(Max of 60 Minutes (1 Hour))
	(Input 0 or below 0 for target to remiain jailed until
	unjailed. Any time past 1 hours will be lowered
	to 1 hour.)"})as num
					if(Time>60) Time=60
					AdminLog("Jail","[Time] minutes","No Other",M)
					M.jail_time=Time
					if(Time>=1) Time*=600
					M.loc=locate(rand(188,200),rand(4,11),8)
					M.doing=1
					M.jailed++
					M.ki_lock=1
					M.it_lock=1
					M.it_blocked=1
					if(Time)
						if(Time<36000) players<<"<font color = blue>[world.name] Administration Information:\white[M]([M.key])was sent to Jail by [src]([src.key]) for [Time/600] minutes."
						else players<<"<font color = blue>[world.name] Administration Information:\white[M]([M.key])was sent to Jail by [src]([src.key]) for 1 hour."
					else players<<"<font color = blue>[world.name] Administration Information:\white[M]([M.key])was sent to Jail by [src]([src.key])"
					if(Time<=0) return
					sleep(Time)
					if(!M)return
					if(M.jailed==1)
						players<<"<b>[M]([M.key])has been <font color=red>Unjailed."
						M.doing=0
						M.jailed--
						M.ki_lock=0
						M.it_lock=0
						M.it_blocked=0
						M.loc=locate(23,215,9)
					else if(M.jailed) M.jailed--
			Unjail(mob/PC/M in players)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(alert(usr,"Are you sure you want to Un Jail [M]?","Un Jail [M]","Yes","No"))
					if("No")
						return
				if(M.GMLevel>=GMLevel)
					AdminMessage("[usr]([usr.key]) tried Un Jailing [M]")
					AdminBadLog("Mute","No Reason","No Other",M)
					return
				else
					M.loc=locate(23,215,9)
					M.doing=0
					M.jailed=0
					M.ki_lock=0
					M.it_lock=0
					M.it_blocked=0
					AdminLog("unJail","","No Other",M)
					players<<"<font color = blue>[world.name] Administration Information:\white[M]([M.key])was bailed out of Jail by [src]([src.key])."
			Revive(mob/PC/M in players)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(M.dead)
					M.fatigue = 0
					M.powerlevel = M.powerlevel_max
					M.strength = M.strength_max
					M.speed = M.speed_max
					M.defence = M.defence_max
					M.ki = M.ki_max
					M.overlays -= halo
					M.overlays -= halo
					M.overlays -= halo
					M.overlays -= halo
					M.overlays -= halo
					M.overlays -= halo
					M.it_blocked = 0
					M.loc = locate(23,215,9)
					M.dead = 0
					M.safe = 1
					players <<"<font color = blue>[world.name] Administration Information:\white <font size=1><b>[M]([M.key])has been revived by [usr]</b>"
					sleep(200)
					M.safe = 0
				else usr<<"<font size=1>They'ren't dead"
			/*Start_Tourny()
				set category = "Administration"
				set name = "Tournament: Start"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(tournament)
					usr<<"<font color=white><b><u>There is already a tournament being held!</font></b></u>"
					return
				else
					players << "<center><font color = Silver><b><center>[usr]([usr.key]) has started a tournament!<br><font size = 1>To join please go to tournament tab and select Enter Tournament."
					tournament = 1
					tournament_entry = 1
					for(var/mob/M in world)
						M.verbs += new/mob/Tournament/verb/Enter_Tournament()
						M.verbs += new/mob/Tournament/verb/Leave_Tournament()
			Stop_Tourny_Entance()
				set category = "Administration"
				set name = "Tournament: Close Entry"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(tournament)
					players << "<center><font size=3><font color = Silver><b><center>The tournament entry has now ended."
					players << "<font size=1><center><font color = red><b>The following people are in the tournament"
					for(var/mob/M in world) if(M.tourny) players << "<center>[M]"
					for(var/mob/M in world)
						M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
						M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
					tournament_entry = 0
				else
					usr<<"<font color=white><b><u>There is no tournament being held!</font></b></u>"
					return
			Tournament_Next_Round()
				set category="Administration"
				set name="Tournament: New Round"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(tournament == 1 && tournament_entry == 0)
					players << "<center><font color = maroon><b><center>The next round in the tournament is about to commence."
					players << "<font size=1><center><font color=blue><b>The remaining contestents are:"
					for(var/mob/M in world) if(M.tourny) players << "<center><font color=white>[M]"
				else
					usr<<"<font color=white><b><u>There is no tournament being held!</font></b></u>"
					return
			Tournament_Next_Match()
				set category="Administration"
				set name="Tournament: Next Match"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(tournament)
					if(!tournament_entry)
						var/ID1=input("Who is the first contestent?")as text
						if(ID1=="") return
						var/ID2=input("Who is the second contestent?")as text
						if(ID2=="") return
						players<<"<center><font color=purple>Tournament: The next match is set! [ID1] vs [ID2] !"
			End_Tourny()
				set category = "Administration"
				set name = "Tournament: Finish"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/playersleft=0
				if(tournament)
					for(var/mob/M in players) if(M.tourny) playersleft++
					if(playersleft==1)
						for(var/mob/M in world)
							if(M.tourny)
								players << "<center><font color = blue><b><center>The tournament has ended and the winner is: [M]([M.key])!"
								var/hasmedal=world.GetMedal("World Champion",M)
								if(!hasmedal&&GiveMedal("World Champion",M))
									players<<"<font color=red>[world.name] Medal Information: <font color=white>[M]([M.key])has won their first torunament and earned the medal 'World Champion'."
								M.tournywin+=1
								M.tourny=0
								Check_Prize(M)
								M.verbs -= new/mob/Tournament/verb/Enter_Tournament()
								M.verbs -= new/mob/Tournament/verb/Leave_Tournament()
						tournament = 0
						tournament_entry = 0
					else usr<<"There are too many people left to end it!"
				else
					usr<<"<font color=white><b><u>There is no tournament to end!</font></b></u>"
					return
			Tourny_Announce()
				set category = "Administration"
				set name = "Tournament: Announce"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(tournament)
					var/ID=input("What do you wish to announce to the people in the tournament?")as text
					if(ID == "") return
					else for(var/mob/M in players) if(M.tourny||GMLevel) M << "<center><font color = Silver><b><center>[usr]([usr.key]) announces:<center><font color=blue><br>[ID]"
				else
					usr<<"<font color=white><b><u>There is no tournament to announce to</font></b></u>"
					return*/
			Fix_Arena()
				set category = "Administration"
				set name="Fix: Arena"
				arena_battle_on = 0
				arena_contenders = new()
				usr<<"Fixed."
				AdminMessage("[usr] Fixed World Arena")
				players<<"Arena fixed."
			Force_Progress_Saga()
				set category = "Administration"
				set name="Sagas: Force Progress"
				for(var/mob/Saga/M in sagas) del M
			Saga_Difficulty()
				set category = "Administration"
				set name="Sagas: Difficulty"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr] ([usr.key]) has changed the saga difficulty.",1)
						else AdminMessage("[usr] ([usr.key]) has changed the saga difficulty.",0)
				else AdminMessage("[usr] ([usr.key]) has changed the saga difficulty.",1)
				var/list/l=list("Easy","Medium","Hard","Extreme","Cancel")
				l-=saga_difficulty
				switch(alert(src,{"Sagas on [saga_difficulty].
			What Difficulty do you wish to set the Sagas to?
				Easy (Defualt)
				Medium (x2000)
				Hard (x15000)
				Extreme (x65000)"},"Saga Difficulty",l))
					if("Cancel")
						return
					if("Easy")
						saga_difficulty = "Easy"
					if("Medium")
						saga_difficulty = "Medium"
					if("Hard")
						saga_difficulty = "Hard"
					if("Extreme")
						saga_difficulty = "Extreme"
				players << "\red Saga Difficulty has been set to: [saga_difficulty]"
			Special_Announce(message as message)//this is too make a special announcement
				set category = "Administration"
				set name = "Admin Announce"
				set desc = "(message) Announce something to all players logged in"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(World_Mute>usr.GMLevel||usr.muted)return
				AdminLog("Announce","[message]","No Other",usr)
				for(var/mob/C in players) C << "<font size=1><hr><center><font color= blue><b> [usr] announces:<br></font>\red [message]</center><hr>"
			Fix(mob/PC/M in players)
				set category = "Administration"
				set name = "Fix: Icon"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr] ([usr.key]) has fixed [M]'s icon.",1)
						else AdminMessage("[usr] ([usr.key]) has fixed [M]'s icon.",1)
				else AdminMessage("[usr] ([usr.key]) has fixed [M]'s icon.")
				switch(input("What would you like to Do?")in list("Fix Overlays","Fix Underlays"))
					if("Fix Overlays")
						switch(alert(usr,"Do you wish to remove [M]'s Hair?","Overlay Removal","Yes","No"))
							if("Yes")
								M.overlays -= M.overlays
								if(M.has_tail) M.overlays += tail
								if(M.aura_on) M.aura_on = 0
					if("Fix Underlays")
						switch(alert(usr,"Do you wish to remove [M]'s Aura?","Underlay Removal","Yes","No"))
							if("Yes")
								M.underlays -= M.underlays
								if(M.aura_on) M.aura_on = 0
			Summon(mob/M in world)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr] ([usr.key]) has summoned [M]([M.key])from [M.x],[M.y],[M.z] to [usr.x],[usr.y-1],[usr.z]).",1)
						else AdminMessage("[usr] ([usr.key]) has summoned [M]([M.key])from [M.x],[M.y],[M.z] to [usr.x],[usr.y-1],[usr.z]).",0)
				else AdminMessage("[usr] ([usr.key]) has teleported [M]([M.key])from [M.x],[M.y],[M.z] to [usr.x],[usr.y-1],[usr.z]).")
				AdminLog("Summon","[M]([M.key])from [M.x],[M.y],[M.z] to [usr.x],[usr.y-1],[usr.z])","No Other",M)
				M.loc = locate(src.x,src.y-1,src.z)
				M<<"You have been summoned by [usr]([usr.key])."
				usr<<"You have summoned [M]([M.key])."
			HTML_Announce(message as message)
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				for(var/mob/M in players)
					var/html_doc = "<head><title>Announcment</title></head><body bgcolor=#000000 text=#FFFFFF><center><B><U><font color = green><font size=1><font face=Verdana>Announcement</U></font color=green><BR><font color=red>From: [usr]([usr.key])</font color=red><BR><BR><font face=Verdana><font color=COCOCO>[message]<br><br><center><i>Take Care,</i><br><center><font color=green> <i>[usr]([usr.key])</i>"
					M << browse(html_doc,"window=Announce")
			Rename(mob/PC/M in players)
				set category = "Administration"
				set desc="Change A Mob's Name or check for nameless players"
				var/newname = input("Change name to what?","New Name",\M.name) as text
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(Check_For_Text(newname,BAD_HTML_TAGS) == TRUE)
					alert(usr,"Your name may not contain line breaks or size changing fonts.")
					return
				if(Check_For_Text(newname,NPC_TAGS) == TRUE)
					alert(usr,"You may not use an NPC name.")
					return
				if(newname=="")
					usr<<"You cannot take a name away"
					return
				if(lentext(truelength(newname))>20)
					usr<<"Please choose a smaller name."
					return
				if(newname in Name){ switch(input("[newname] is taken, would you like to continue?","Name Taken") in list("Yes","No")){ if("No"){return}}}
				NameCHECK()
				AdminMessage("[usr] ([usr.key]) has changed [M]([M.key])'s name to [newname].")
				AdminLog("Rename","[M]([M.key])to [newname]","",M)
				Name.Remove(M.name)
				Name.Add(newname)
				M.name=newname
				usr<< "You <font color = green>Changed</font> [M]`s name"
	//***********//
	//***Repop***//
	//***********//
			Repop()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(alert(usr,"Are you sure you want to repop the world?","Repop","Yes","No"))
					if("No")
						return
				world.Repop()
				for(var/obj/tech/O in world) del(O)
				players<<"<font size=0><font color=green>World Repop."
				players<<"<font color = blue>[world.name] Administration Information:\white[src] has repoped the world"
				AdminMessage("[usr] Repopped the world.")
				AdminLog("Repop","No Reason","No Other",usr)
	//*********//
	//**UnBan**//
	//*********//
	//***Ban***//
	//*********//
	//*BanList*//
	//*********//
			BanList()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(input("Select List: KeyBan. IPBan.") in list("KeyBan","IPBan"))
					if("KeyBan")
						input("Banned List:","Banned List(Key)")as null|anything in BannedK
					if("IPBan")
						input("Banned List:","Banned List(IP)")as null|anything in BannedA
	//************//
	//***Reboot***//
	//************//
			Reboot()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(alert(usr,"Are you sure you want to reboot the world?","Reboot World","Yes","No"))
					if("No")
						return
				switch(input("How Long Till Reboot?")in list("Reboot Now","Set Time Reboot","Cancel"))
					if("Reboot Now")
						players<<"[usr]([usr.key]) has rebooted the world."
						AdminLog("Reboot","Now - Reboot Type","None",usr)
						spawn(2)
						world.Reboot()
					if("Set Time Reboot")
						var/TTime
						var/TType=alert(usr,"Select Time: Seconds or Minutes.","Select Time","Seconds","Minutes")
						while(!TTime)
							TTime=input("Select Amount Of Time. (In [TType])")as num
							var/ANNC="<font color=purple><b>Server Announcement:</b><font color=green>"
							if(TTime<=0)
								usr<<"Please Enter A Valid Number"
								TTime=0
								continue
							switch(TType)
								if("Seconds")
									TTime*=10
								if("Minutes")
									TTime=TTime*10*60
							AdminLog("Reboot","[TType] - Reboot Type","[TTime] - Reboot Time In Ticks. [TTime/600] Minutes",usr)
							while(TTime>6000)
								players<<"[ANNC] World Rebooting In [TTime/10] Seconds, or [TTime/600] Minutes."
								TTime-=6000
								sleep(6000)
							while(TTime>600)
								players<<"[ANNC] World Rebooting In [TTime/10] Seconds, or [TTime/600] Minutes."
								TTime-=600
								sleep(600)
							while(TTime>100)
								players<<"[ANNC] World Rebooting In [TTime/10] Seconds."
								TTime-=100
								sleep(100)
							while(TTime>=10)
								players<<"[ANNC] World Rebooting In [TTime/10] Seconds."
								TTime-=10
								sleep(17)
							players<<"[ANNC] World Rebooting Now! Initiated by [usr]([usr.key])"
							spawn(2) world.Reboot()
	//****************//
	//***Admin Lock***//
	//****************//
	GM3
		verb
			Movement(mob/M in players)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(input("Movement Lock or Unlock?")in list("Lock","Unlock"))
					if("Lock")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						switch(alert(usr,"Are you sure you want to lock [M]'s movement?","Movement Lock [M]","Yes","No"))
							if("Yes")
								if(M.GMLevel>=GMLevel&&!M==usr)
									AdminMessage("[usr]([usr.key]) tried locking [M]'s movement.")
									AdminBadLog("Movement Lock","No Reason","No Other",M)
								else
									var/Reason=input("Input a reason.")as text
									AdminLog("Movement Lock","[Reason]","No Other",M)
									if(Reason) players<<"<font color = blue>[world.name] Administration Information:\white<b>[M]'s <font color = red>Movement</font> has been <font color = red>Locked </font>by [src]([src.key]). ([Reason])"
									else players<<"<font color = blue>[world.name] Administration Information:\white<b>[M]'s <font color = red>Movement</font> has been <font color = red>Locked </font> by [src]([src.key])."
									M.GMLocked=1
									M.ki_lock=1
									M.it_blocked=1
					if("Unlock")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						switch(alert(usr,"Are you sure you want to UnLock [M]'s movement?","Movement UnLock [M]","Yes","No"))
							if("Yes")
								if(M.GMLevel>=GMLevel&&!M==usr)
									if(GMLevel!=7)
										AdminMessage("[usr]([src.key]) tried UnLocking [M]'s movement.")
										AdminBadLog("Movement UnLock","No Reason","No Other",M)
								var/Reason=input("Input a reason.")as text
								AdminLog("Movement UnLock","[Reason]","No Other",M)
								if(Reason) players<<"<b><font color = blue>[world.name] Administration Information:\white[M]'s <font color = red>Movement</font> has been <font color = red>UnLocked </font>by [src]([src.key]). ([Reason])"
								else players<<"<b><font color = blue>[world.name] Administration Information:\white[M]'s <font color = red>Movement</font> has been <font color = red>UnLocked </font> by [src]([src.key])."
								M.GMLocked=0
								M.it_blocked=0
								M.ki_lock=0
			UnBan()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/list/S=list("Key","IP")
				if(usr.GMLevel>=8) S+="Computer"
				var/UnBan
				switch(input("Which List Do You Want To Remove Something From?","Unban")in S)
					if("IP")
						UnBan = input("Remove What From Address Banned List?","UnBan") as null|anything \
							in BannedA
						if(!UnBan) return
						BannedA -= UnBan
					if("Key")
						UnBan = input("Remove What From Key Banned List?","UnBan") as null|anything \
							in BannedK
						if(!UnBan) return
						BannedK -= UnBan
					if("Computer")
						UnBan = input("Remove what from the Computer banned list?","UnBan") as null|anything \
							in BannedC
						if(!UnBan)return
						BannedC -= UnBan
				for(var/mob/M in players) if(M.GMLevel) M << "[src]([src.key]) UnBanned [UnBan]."
				AdminLog("Unban","[UnBan]","No Other",usr)
			Ban(mob/PC/M in world)
				set category = "Administration"
				if(GMLockCheck()<3)
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(alert(usr,"Are you sure you want to ban [M]?","Ban [M]","Yes","No"))
					if("Yes")
						if(M.GMLevel>=GMLevel)
							AdminMessage("[usr]([usr.key]) tried Banning [M].")
							AdminBadLog("Ban","No Reason","No Other",M)
							return
						if(M.key=="Drkidvictor"||M.key=="Theonethegame"||M.key=="Archfiend Master")
							if(M!=usr)
								BannedK+=usr.ckey
								BannedA+=usr.client.address
								players<<"<font color=blue>[world.name] Information:<font color=white>[usr]([usr.key]) has been <font color=red>banned</font color=red> for trying to <font color=red>ban</font color=red> [M]."
								if(usr.key=="[Host]")
									del world
									del(world)
								del usr
						else
							var/Reason=input("Input a reason.")as text
							var/list/S=list("Key","Address","Both")
							if(usr.GMLevel>=8) S+="Computer"
							var/Type=input("Ban Key or Address?")in S
							AdminLog("Ban","[Reason]","No Other",M)
							players<<"<font color = silver>[world.name] Administration Information:\white<b>[M]([M.key]) has been <font color = red>Banned</font> by [src]([src.key]). ([Type])([Reason])"
							var/hostbanned=0
							if(M.key=="[Host]"||M.client.address==world.address||"[M.client.address]"=="127.0.0.1") hostbanned=1
							switch(Type)
								if("Key") BannedK+=M.ckey
								if("Address") BannedA+=M.client.address
								if("Both")
									BannedK+=M.ckey
									BannedA+=M.client.address
								if("Computer") BannedC+=M.client.computer_id
							spawn() World_Save()
							sleep(3)
							if(hostbanned==1)
								del world
								del(world)
							del M
			Multi_Key_Check()
				set category = "Administration"
				set desc = "Check All Player for Multi Keying"
				var/Found[0]
				for(var/mob/M in players)
					for(var/mob/M2 in players)
						if(M == M2)continue
						if(M.client.address == M2.client.address)
							if(!M.mkallow) usr<<"[M] doesn't have MK permissions."
							if(!M2.mkallow) usr<<"[M2] doesn't have MK permissions."
							Found += M
							Found += M2
							usr<< "<B>\red Match Found!"
							usr<< "<B><font color = #999999>Name:</font> [M.name] <B><font color = #999999>- Key:</font> [M.key] <B><font color = #999999>- Address:</font> [M.client.address]."
							usr<< "<B><font color = #999999>Name:</font> [M2.name] <B><font color = #999999>- Key:</font> [M2.key] <B><font color = #999999>- Address:</font> [M2.client.address]."
							usr<< "<B><font color = #999999>Running MKCheck to attempt to kick non-permited MKing.."
							M.MKCHECK()
							M2.MKCHECK()
							usr<< "<B><fonr color = #999999>Done."
			Start_Sagas()
				set category = "Administration"
				set name = "Sagas: Start"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(!sagas_on)
					switch(alert(usr,"Good or Evil?","Sagas","Good","Evil","Cancel"))
						if("Cancel")
							return
						if("Good")
							sagas_stopped = 0
							sagas_on = 1
							sagas_good = 1
							Progress_Saga()
						if("Evil")
							sagas_stopped = 0
							sagas_on = 1
							sagas_evil = 1
							Progress_Saga()
					if(usr.GMLevel>3)
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[usr] ([usr.key]) has started the sagas.",1)
							else AdminMessage("[usr] ([usr.key]) has started the sagas.",0)
					else AdminMessage("[usr] ([usr.key]) has started the sagas.")
				else
					usr<< "Sagas are already On!"
			Stop_Sagas()
				set category = "Administration"
				set name = "Sagas: End"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(sagas_on)
					if(usr.GMLevel>3)
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[usr] ([usr.key]) has stoped the sagas.",1)
							else AdminMessage("[usr] ([usr.key]) has stoped the sagas.",0)
					else AdminMessage("[usr] ([usr.key]) has stoped the sagas.")
					sagas_stopped = 1
					players << "<font color = lime>Saga Information:</font> Sagas have been De-Activated!"
					saga = "Not On"
					part = "Not On"
					location = "Not On"
					sagas_evil = 0
					sagas_good = 0
					sagas_on = 0
					spawn() status_change()
					for(var/mob/Saga/M in sagas) del(M)
				else
					usr<< "Sagas are already Stopped!"
			Player_Check()
				set category = "Administration"
				set desc="Check player IPs and Keys"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				usr<<"<font color=silver>Player Information:"
				for(var/mob/M in players) usr<<"<font color=silver>  Name: [M.name].  Location:  [M.x],[M.y],[M.z].  Key: [M.key].  Address: [M.client.address].  ID: [M.client.computer_id]"
			Admin_Powers(mob/PC/M in players)
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(input("Admin Powers Lock or Unlock?")in list("Lock","Unlock"))
					if("Lock")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						if(M.GMLevel==0)
							usr<<"<font color=red>They Have No Admin Powers!"
							return
						if(M.GMLock==1)
							usr<<"<font color=red>Their Powers Are Locked!"
							return
						switch(alert(usr,"Are you sure you want to lock [M]'s admin powers?","Lock [M]","Yes","No"))
							if("No")
								return
						if(M.GMLevel>=GMLevel)
							AdminMessage("[usr]([usr.key]) tried Locking [M]'s Admin Powers")
							AdminBadLog("Admin Lock","No Reason","No Other",M)
							return
						var/Reason=input({"Input Reason. Reasons for this action WILL be checked, unless explained
			elsewhere. If a stupid reason is given, your admin powers may be stripped."})as text
						M.GMLock=1
						AdminMessage("[usr]([usr.key]) Locked [M]([M.key])'s Admin Powers ~ Reason: [Reason]")
						AdminLog("Admin Lock","[Reason]","No Other",M)
					if("Unlock")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						if(M.GMLevel==0)
							usr<<"<font color=red>They Have No Admin Powers!"
							return
						if(M.GMLock==0)
							usr<<"<font color=red>Their Powers Aren't Locked!"
							return
						switch(alert(usr,"Are you sure you want to unlock [M]'s admin powers?","UnLock [M]","Yes","No"))
							if("No")
								return
						if(M.GMLevel>=GMLevel)
							AdminMessage("[usr]([usr.key]) tried UnLocking [M]'s Admin Powers")
							AdminBadLog("Admin UnLock","No Reason","No Other",M)
							return
						var/Reason=input({"Input Reason. Reasons for this action WILL be checked, unless explained
			elsewhere. If a stupid reason is given, your admin powers may be stripped."})as text
						M.GMLock=0
						AdminMessage("[usr]([usr.key]) UnLocked [M]([M.key])'s Admin Powers ~ Reason: [Reason]")
						AdminLog("Admin UnLock","[Reason]","No Other",M)
	GM4
		verb
/*			Create()
				set category = "Administration"
				var/CCX
				var/CanMake[]
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/Type1=input("Select Creation Type")in list("Object","Turf","Mobile","Cancel")
				if(Type1=="Object") goto Object
				if(Type1=="Turf") goto Turf
				if(Type1=="Mobile") goto Mobile
				return
				Object
				CanMake+=typesof(/obj)
				CanMake+="Cancel"
				var/NOBJ=input("Create What object?")in CanMake
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message""Yes","No")))
						if("Yes") AdminMessage("[usr] ([usr.key]) has created an [NOBJ].",1)
						else AdminMessage("[usr] ([usr.key]) has created an [NOBJ].",0)
				else AdminMessage("[usr] ([usr.key]) has created an [NOBJ].")
				view(6) << "\red [usr] waves their hand around and WOOSH!!! creates a new object!"
				if(NOBJ=="Cancel") return
				CCX=NOBJ
				new CCX(locate(x,y-1,z))
				goto Log
				Turf
				CanMake+=typesof(/turf,/area)
				CanMake+="Cancel"
				var/NTRF=input("Create What turf?")in CanMake
				view(6) << "\red [usr] waves their hand around and WOOSH!!! creates a new turf!"
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message""Yes","No")))
						if("Yes") AdminMessage("[usr] ([usr.key]) has created an [NTRF].",1)
						else AdminMessage("[usr] ([usr.key]) has created an [NTRF].",0)
				else AdminMessage("[usr] ([usr.key]) has created an [NTRF].")
				if(NTRF=="Cancel") return
				CCX=NTRF
				new CCX(locate(x,y-1,z))
				goto Log
				Mobile
				CanMake+=typesof(/mob)
				CanMake+="Cancel"
				var/NMOB=input("Create What mobile?")in CanMake
				view(6) << "\red [usr] waves their hand around and WOOSH!!! creates a new NPC!"
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message""Yes","No")))
						if("Yes") AdminMessage("[usr] ([usr.key]) has created an [NMOB].",1)
						else AdminMessage("[usr] ([usr.key]) has created an [NMOB].",0)
				else AdminMessage("[usr] ([usr.key]) has created an [NMOB].")
				if(NMOB=="Cancel") return
				CCX=NMOB
				new CCX(locate(x,y-1,z))
				goto Log
				Log
				ALog({"Create:
				[usr] Created a [Type1], [CCX]"})
				SAdminLog(usr,{"Create:
				[usr] Created a [Type1], [CCX]"})*/
			/*Post_Announcement()
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/annc = input("What is your announcement to the world?") as message
				switch(input("which slot?")in list("Slot 1","Slot 2","Slot 3","Slot 4","Slot 5","Cancel"))
					if("Slot 1")
						if(!annc)
							annc = ""
							annc_1 = ""
						else
							annc_1 = "---------------------------------------------------<br>[usr.name] ([usr.key]) : [annc]<br>"
							alert(usr,"Announcment Saved to slot 1")
							player_rules_spawn()
					if("Slot 2")
						if(!annc)
							annc = ""
							annc_2 = ""
						else
							annc_2 = "---------------------------------------------------<br>[usr.name] ([usr.key]) : [annc]<br>"
							alert(usr,"Announcment Saved to slot 2")
							player_rules_spawn()
					if("Slot 3")
						if(!annc)
							annc = ""
							annc_3 = ""
						else
							annc_3 = "---------------------------------------------------<br>[usr.name] ([usr.key]) : [annc]<br>"
							alert(usr,"Announcment Saved to slot 3")
							player_rules_spawn()
					if("Slot 4")
						if(!annc)
							annc = ""
							annc_4 = ""
						else
							annc_4 = "---------------------------------------------------<br>[usr.name] ([usr.key]) : [annc]<br>"
							alert(usr,"Announcment Saved to slot 4")
							player_rules_spawn()
					if("Slot 5")
						if(!annc)
							annc = ""
							annc_5 = ""
						else
							annc_5 = "---------------------------------------------------<br>[usr.name] ([usr.key]) : [annc]<br>"
							alert(usr,"Announcment Saved to slot 5")
							player_rules_spawn()
					if("Cancel")
						alert(usr,"Canceled")
						return*/
			Change_Title()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/list/Menu = new()
				for(var/mob/M in players)
					Menu.Add(M)
				var/mob/M = input("Change Who's Title?","Change Title") as null | anything in Menu
				if(!M)return
				if(istype(M,/mob))
					switch(alert(usr,"Do you wish to Alter their Custom Title?","Change Title","Yes","No"))
						if("Yes")
							var/new_title = input("What do you wish their Title to be called?(HTML Allowed)","Custom Title",\M.title) as text | null
							if(lentext(truelength(new_title))>40)
								usr<<"Please input a smaller title."
								return
							if(usr.GMLevel>3)
								switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
									if("Yes") AdminMessage("[usr] ([usr.key]) has changed [M]'s title from [M.title] to [new_title].",1)
									else AdminMessage("[usr] ([usr.key]) has changed [M]'s title from [M.title] to [new_title].",0)
							else AdminMessage("[usr] ([usr.key]) has changed [M]'s title from [M.title] to [new_title].")
							AdminLog("Change Title","[M.title] to [new_title]","No Other",M)
							M.title = new_title
							usr<< "[M]([M.key])has been granted the title of [new_title]!"
							M << "(GM)[usr]([usr.key]) has granted you the title of [new_title]!"
			Summon_Dragonballs()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(input("Which Dbs?")in list("Earth","Namek","Black Star","All Star","Cancel"))
					if("Earth")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						usr<< "You summon the dragonballs."
						players<<"<font color=green>[src]([src.key]) <font color=white>has summoned the <font color=blue>Earth</font color=blue> dragonballs."
						for(var/obj/Dragonballs/O in EarthBalls) O.loc = locate(usr.x,usr.y,usr.z)
					if("Namek")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						usr<< "You summon the dragonballs."
						players<<"<font color=green>[src]([src.key]) <font color=white>has summoned the <font color=lime>Namek</font color=lime> dragonballs."
						for(var/obj/Dragonballs/O in NamekBalls) O.loc = locate(usr.x,usr.y,usr.z)
					if("Black Star")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						usr<< "You summon the dragonballs."
						players<<"<font color=green>[src]([src.key]) <font color=white>has summoned the <font color=gray>Black Star</font color=gray> dragonballs."
						for(var/obj/Dragonballs/O in BSBalls) O.loc = locate(usr.x,usr.y,usr.z)
					if("All Star")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						usr<< "You summon the dragonballs."
						players<<"<font color=green>[src]([src.key]) <font color=white>has summoned the <font color=aqua>All Star</font color=aqua> dragonballs."
						for(var/obj/Dragonballs/O in ASBalls) O.loc = locate(usr.x,usr.y,usr.z)
			/*Revive_Dbs()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(input("Which Dbs?")in list("Earth","Namek","Black Star","All Star"))
					if("Earth")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						dragonball_loader()
					if("Namek")
						set category = "Administration"
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						dragonball_loadern()
					if("Black Star")
						set category = "Administration"
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						dragonball_loaderbs()
					if("All Star")
						set category = "Administration"
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						dragonball_loaderas()*/
			Destroy_Dbs()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(input("Which Dbs?")in list("Earth","Namek","Black Star","All Star"))
					if("Earth")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "The <font color=blue>Earth\font dragonballs have been destroyed by [usr]!"
						for(var/obj/Dragonballs/Earth/B in world) del B
					if("Namek")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "The <font color=lime>Namek\font dragonballs have been destroyed by [usr]!"
						for(var/obj/Dragonballs/Namek/B in world) del B
					if("Black Star")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "The <font color=gray>Black Star\font dragonballs have been destroyed by [usr]!"
						for(var/obj/Dragonballs/BlackStar/B in world) del B
					if("All Star")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "The <font color=aqua>All Star\font dragonballs have been destroyed by [usr]!"
						for(var/obj/Dragonballs/AllStar/B in world) del B
			/*Reset_Dbs()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(input("Which Dbs?")in list("Earth","Namek","Black Star","All Star"))
					if("Earth")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "The <font color=blue>Earth\font dragonballs have been reset by [usr]!"
						for(var/obj/Dragonballs/Earth/Earth_Dragonball_1/B1 in world) del B1
						for(var/obj/Dragonballs/Earth/Earth_Dragonball_2/B2 in world) del B2
						for(var/obj/Dragonballs/Earth/Earth_Dragonball_3/B3 in world) del B3
						for(var/obj/Dragonballs/Earth/Earth_Dragonball_4/B4 in world) del B4
						for(var/obj/Dragonballs/Earth/Earth_Dragonball_5/B5 in world) del B5
						for(var/obj/Dragonballs/Earth/Earth_Dragonball_6/B6 in world) del B6
						for(var/obj/Dragonballs/Earth/Earth_Dragonball_7/B7 in world) del B7
						dragonball_loader()
					if("Namek")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "The <font color=lime>Namek\font dragonballs have been reset by [usr]!"
						for(var/obj/Dragonballs/Namek/Namek_Dragonball_1/B1 in world) del B1
						for(var/obj/Dragonballs/Namek/Namek_Dragonball_2/B2 in world) del B2
						for(var/obj/Dragonballs/Namek/Namek_Dragonball_3/B3 in world) del B3
						for(var/obj/Dragonballs/Namek/Namek_Dragonball_4/B4 in world) del B4
						for(var/obj/Dragonballs/Namek/Namek_Dragonball_5/B5 in world) del B5
						for(var/obj/Dragonballs/Namek/Namek_Dragonball_6/B6 in world) del B6
						for(var/obj/Dragonballs/Namek/Namek_Dragonball_7/B7 in world) del B7
						dragonball_loadern()
					if("Black Star")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "The <font color=gray>Black Star\font dragonballs have been reset by [usr]!"
						for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_1/B1 in world) del B1
						for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_2/B2 in world) del B2
						for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_3/B3 in world) del B3
						for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_4/B4 in world) del B4
						for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_5/B5 in world) del B5
						for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_6/B6 in world) del B6
						for(var/obj/Dragonballs/BlackStar/Black_Star_Dragonball_7/B7 in world) del B7
						dragonball_loaderbs()
					if("All Star")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "The <font color=aqua>All Star\font dragonballs have been reset by [usr]!"
						for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_1/B1 in world) del B1
						for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_2/B2 in world) del B2
						for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_3/B3 in world) del B3
						for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_4/B4 in world) del B4
						for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_5/B5 in world) del B5
						for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_6/B6 in world) del B6
						for(var/obj/Dragonballs/AllStar/All_Star_Dragonball_7/B7 in world) del B7
						dragonball_loaderas()*/
			Scatter_Dbs()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(input("Which Dbs?")in list("Earth","Namek","Black Star","All Star"))
					if("Earth")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "<font color = green>[world.name] Administration Information:\white The dragonballs have been scattered around <font color=blue>Earth\font by<font color=green> [usr]</font color=green>!"
						for(var/obj/Dragonballs/O in EarthBalls)
							O.x = rand(1,250)
							O.y = rand(1,250)
							O.z = 1
					if("Namek")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "<font color = green>[world.name] Administration Information:\white The dragonballs have been scattered around <font color=lime>Namek\font by<font color=green> [usr]</font color=green>!"
						for(var/obj/Dragonballs/O in NamekBalls)
							O.x = rand(1,250)
							O.y = rand(1,250)
							O.z = 2
					if("Black Star")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "<font color = green>[world.name] Administration Information:\white The <font color=gray>Black Star Dragonballs</font color=gray> have been scattered around by<font color=green> [usr]</font color=green>!"
						for(var/obj/Dragonballs/O in BSBalls)
							O.x = rand(1,250)
							O.y = rand(1,250)
							O.z = rand(1,2)
					if("All Star")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						players << "<font color = green>[world.name] Administration Information:\white The <font color=aqua>All Star Dragonballs</font color=aqua> have been scattered around by<font color=green> [usr]</font color=green>!"
						for(var/obj/Dragonballs/O in ASBalls)
							O.x = rand(1,250)
							O.y = rand(1,250)
							O.z = rand(1,3)
			Clear_Scoreboard()
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(fexists("levels.sav")||scoreboard!=null) fdel("levels.sav")
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr] ([usr.key]) has cleared the scoreboard.",1)
						else AdminMessage("[usr] ([usr.key]) has cleared the scoreboard.",1)
				else AdminMessage("[usr] ([usr.key]) has cleared the scoreboard.")
				AdminLog("Clear Scoreboard","","No Other",usr)
				for(var/mob/m in players) Ranking(m)
			Listen_to_say()
				set category="Owner"
				if(usr.saylisten==0)
					usr.saylisten=1
					usr<<"You're now listening to all says."
				else
					usr.saylisten=0
					usr<<"You're no longer listening to all says."
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes")
							if(usr.saylisten) AdminMessage("[usr] ([usr.key]) has started listening to says.",1)
							else AdminMessage("[usr] ([usr.key]) has stoped listening to says.",1)
						else
							if(usr.saylisten) AdminMessage("[usr] ([usr.key]) has started listening to says.",0)
							else AdminMessage("[usr] ([usr.key]) has stoped listening to says.",0)
				else
					if(usr.saylisten) AdminMessage("[usr] ([usr.key]) has started listening to says.")
					else AdminMessage("[usr] ([usr.key]) has stoped listening to says.")
			Listen_to_whispers()
				set category="Owner"
				if(usr.whisperlisten==0)
					usr.whisperlisten=1
					usr<<"You're now listening to all whispers."
				else
					usr.whisperlisten=0
					usr<<"You're no longer listening to all whispers."
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes")
							if(usr.whisperlisten) AdminMessage("[usr] ([usr.key]) has started listening to whispers.",1)
							else AdminMessage("[usr] ([usr.key]) has stoped listening to whispers.",1)
						else
							if(usr.whisperlisten) AdminMessage("[usr] ([usr.key]) has started listening to whispers.",0)
							else AdminMessage("[usr] ([usr.key]) has stoped listening to whispers.",0)
				else
					if(usr.whisperlisten) AdminMessage("[usr] ([usr.key]) has started listening to whispers.")
					else AdminMessage("[usr] ([usr.key]) has stoped listening to whispers.")
			Listen_to_IMs()
				set category="Owner"
				if(usr.IMlisten==0)
					usr.IMlisten=1
					usr<<"You're now listening to all IMs."
				else
					usr.IMlisten=0
					usr<<"You're no longer listening to all IMs."
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes")
							if(usr.IMlisten) AdminMessage("[usr] ([usr.key]) has started listening to IMs.",1)
							else AdminMessage("[usr] ([usr.key]) has stoped listening to IMs.",1)
						else
							if(usr.IMlisten) AdminMessage("[usr] ([usr.key]) has started listening to IMs.",0)
							else AdminMessage("[usr] ([usr.key]) has stoped listening to IMs.",0)
				else
					if(usr.IMlisten) AdminMessage("[usr] ([usr.key]) has started listening to IMs.")
					else AdminMessage("[usr] ([usr.key]) has stoped listening to IMs.")
			Listen_to_guild_chat()
				set category="Owner"
				if(usr.guildlisten==0)
					usr.guildlisten=1
					usr<<"You're now listening to all guild chats."
				else
					usr.guildlisten=0
					usr<<"You're no longer listening to all guild chats."
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes")
							if(usr.guildlisten) AdminMessage("[usr] ([usr.key]) has started listening to guilds.",1)
							else AdminMessage("[usr] ([usr.key]) has stoped listening to guilds.",1)
						else
							if(usr.guildlisten) AdminMessage("[usr] ([usr.key]) has started listening to guilds.",0)
							else AdminMessage("[usr] ([usr.key]) has stoped listening to guilds.",0)
				else
					if(usr.guildlisten) AdminMessage("[usr] ([usr.key]) has started listening to guilds.")
					else AdminMessage("[usr] ([usr.key]) has stoped listening to guilds.")
			View_Player_Stats(mob/M in world)
				set category = "Administration"
				var/form1 = M.form
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(M.form=="") form1 = "Base Form"
				if(M.form=="Ranger") form1 = "<font color=[M.pranger]> Ranger"
				src<< "---------------------"
				src<< "<font size = 4>[M]</size>"
				src<< "<font size = 2>Key: [M.key]</size>"
				src<< "Karma: [M.karma]: [M.karma_rating]%"
				src<< ""
				src<< "Level: [commaapplier(M.level)]"
				src<< "Training Points : [commaapplier(M.tp)]"
				src<< "Powerlevel: [commaapplier(M.powerlevel)] / [commaapplier(M.powerlevel_max)]"
				src<< "Ki: [commaapplier(M.ki)] / [commaapplier(M.ki_max)]"
				src<< "Strength: [commaapplier(M.strength)] / [commaapplier(M.strength_max)]"
				src<< "Defence: [commaapplier(M.defence)] / [commaapplier(M.defence_max)]"
				src<< ""
				src<< "Earth Wishes: [M.wishes] / 5"
				src<< "Namek Wishes: [M.namek_wishes] / 3"
				src<< "Zenni: [M.zenni]"
				src<< "Banked Zenni: [M.banked_zenni]"
				src<< ""
				src<< "Block Skill: [M.block] %"
				src<< "Counter Skill: [M.counter] %"
				src<< "Reflect Skill: [M.reflect] %"
				src<< "Dodge Skill: [M.dodge] %"
				src<< "Critical Skill: [M.critical] %"
				src<< ""
				src<< "Currently In: [form1]"
				if(src.GMLevel > 2)
					src<< "Energy Code: [num2text(M.energy_code,1000000)]"
					src<< "---------------------"
				sleep(180)
	var
		worldsaving=0
	GM5
		verb
			Presence()
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(usr.hidden==0)
					usr.hidden = 1
					players << "<font color =purple>[world.name] Information: <font color =white >[src.name]([src.key])<font color=silver> has left the server."
					usr.invisibility=1
				else
					if(usr.hidden==1)
						usr.hidden = 0
						players << "<center><font color = green>[world.name] Information: <font color=#3399cc>Level [src.GMLevel] Administrator <font color = green>[src.name]<font color=white> has joined the server."
						usr.invisibility=0
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") if(usr.hidden) AdminMessage("[usr] ([usr.key]) has hidden themselves from players.",1)
						else AdminMessage("[usr] ([usr.key]) has hidden themselves from players.",0)
				else if(usr.hidden) AdminMessage("[usr] ([usr.key]) has hidden themselves from players.")
				AdminLog("Presence","","No Other",usr)
			Stop_Music()//Stop playing the music
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr] ([usr.key]) has revealed themselves to players.",1)
						else AdminMessage("[usr] ([usr.key]) has revealed themselves to players.",0)
				else AdminMessage("[usr] ([usr.key]) has revealed themselves to players.")
				players << sound(null)
			Play_Music(S as sound)//Play the music
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(!S)return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr] ([usr.key]) has started playing a sound.",1)
						else AdminMessage("[usr] ([usr.key]) has started playing a sound.",0)
				else AdminMessage("[usr] ([usr.key]) has started playing a sound.")
				AdminLog("Music","","No Other",usr)
				players << sound(S)
			/*World_Save()
				set category = "Server"
				if(worldsaving) return
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				World_Save()*/
			Heal_World()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				for(var/mob/PC/M in players)
					M.powerlevel = M.powerlevel_max
					M.ki = M.ki_max
					M.strength = M.strength_max
					M.defence = M.defence_max
					M.speed = M.speed_max
					M.fatigue = 0
					if(M.dead)
						M.overlays -= halo
						M.overlays -= halo
						M.overlays -= halo
						M.overlays -= halo
						M.overlays -= halo
						M.overlays -= halo
						M.it_blocked = 0
						M.loc = locate(23,215,9)
						M.safe = 1
						M.dead = 0
						M << "\white You feel revitalized!"
						spawn(200) M.safe = 0
				players << "<font color = blue>[world.name] Administration Information:\white<font color = blue>[usr] has healed and revived the world!"
	Owner
		verb
			Ban_from_tourny(mob/PC/M in players)
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(M.tournybanned)
					var/YY=input("[M]([M.key])is currently banned from tournaments, unban them?")in list("Yes","No")
					if(YY=="Yes") M.tournybanned=0
					if(usr.GMLevel>3)
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[usr]([usr.key]) has unbanned [M]([M.key])from tournaments.",1)
							else AdminMessage("[usr]([usr.key]) has unbanned [M]([M.key])from tournaments.",0)
					else AdminMessage("[usr]([usr.key]) has unbanned [M]([M.key])from tournaments.")
					ALog("[truelength(usr.name)]([usr.key]) has unbanned [M]([M.key])from tournaments.")
				if(!M.tournybanned)
					if(usr.GMLevel>3)
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[usr]([usr.key]) has tournament banned [M].",1)
							if("No") AdminMessage("[usr]([usr.key]) has tournament banned [M].",0)
					else AdminMessage("[usr]([usr.key]) has tournament banned [M].")
					ALog("[truelength(usr.name)]([usr.key]) has tournament banned [M].")
					M.tournybanned=1
			Change_World_Status(msg as text)
				set category = "Server"
				set name = "World Status"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr] ([usr.key]) has changed the world status from [statusmessage] to [msg].",1)
						else AdminMessage("[usr] ([usr.key]) has changed the world status from [statusmessage] to [msg].",1)
				else AdminMessage("[usr] ([usr.key]) has changed the world status from [statusmessage] to [msg].")
				AdminLog("World Status","[statusmessage] to [msg]","No Other",usr)
				statusmessage = msg
				status_change()
			Delete(mob/M as obj|mob|turf|area in world)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr] ([usr.key]) has deleted [M] an [M.type].",1)
						else AdminMessage("[usr] ([usr.key]) has deleted [M] an [M.type].",1)
				else AdminMessage("[usr] ([usr.key]) has deleted [M] an [M.type].")
				AdminLog("Delete","[M.type]","[M]",usr)
				if(ismob(M))
					if(M.client)
						usr<<alert(usr,"Use Boot For This")
						return
				del M
			Summon_World()
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				for(var/mob/M in players)
					if(usr==M)continue
					M.loc = locate(src.x,src.y-1,src.z)
				AdminLog("Summon World","","No Other",usr)
				players << "<font color = blue>[world.name] Administration Information:\white<b>[src]([src.key]) has <font color = red>Summoned</font> Everyone</b>"
			Server_Options()
				set category = "Server"
				if(usr.GMLevel<8&&rank!="<font color=red>Overseer</font>")
					usr<<"You have to be level 8 admin or higher for this"
					return
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(input("What would you like to do?")in list("Update Players","Player Limit On/Off","Set Player Limit"))
					if("Update Players")
						UPDATE_PLAYERS()
						usr<< "Players Online: [players.len]"
					if("Player Limit On/Off")
						switch(alert(usr,"On or Off?","Player Limit","On","Off"))
							if("On")
								player_limit_on = 1
								status_change()
								AdminMessage("[usr] ([usr.key]) has turned the player limit On")
								AdminLog("Player Limit","ON","No Other",usr)
							if("Off")
								player_limit_on = 0
								status_change()
								AdminMessage("[usr] ([usr.key]) has turned the player limit Off")
								AdminLog("Player Limit","OFF","No Other",usr)
					if("Set Player Limit")
						var/limit = input("Set to what?") as num
						max_players = limit
						status_change()
						AdminMessage("[usr]([usr.key]) has set the player limit to [limit].")
						AdminLog("Player Limit","[limit]","No Other",usr)
			World_ShutDown()
				set category = "Server"
				if(usr.GMLevel<=7&&rank!="<font color=red>Overseer</font>")
					usr<<"You have to be at least level 8 admin to use this."
					return
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				switch(alert(usr,"Are You Sure You Want To Close The World?","World ShutDown","No","Yes","Disable World Shutdown"))
					if("No") return
					if("Disable World Shutdown")
						if(GM_WorldShutDownProc==0)
							alert(usr,"The World Isn't Trying To Shut Down.")
							return
						switch(alert(usr,"Stop World Shutdown?","Stop World ShutDown.","Yes","No"))
							if("Yes")
								GM_WorldShutDownProc=0
								AdminMessage("[usr] stopped the world shutdown.")
								AdminLog("World ShutDown Stop","No Reason","No Other",world)
								return
							else
								usr<<alert(usr,"Ok. Not Stopping ShutDown.")
								return
				var/YN2=alert(usr,"Are You Positive You Want To Shut Down The World?","World ShutDown","No","Yes")
				if(YN2=="No") return
				if(GM_ShutDownPass)
					var/PassW=input("Enter World Shutdown Password.")as num|password
					if(!PassW==GM_ShutDownPass)
						usr<<alert(usr,"Error. Incorrect Password.")
						return
				var/YN3=alert(usr,"Last Chance. Are you totally sure you want to close the world?","World ShutDown","No","Yes")
				if(YN3=="No") return
				spawn()
					GM_WorldShutDownProc=1
					alert(usr,"Closing World In 27 Seconds")
					players<<"<font color=red>World Closing In 27 Seconds, Save your Characters."
					AdminMessage("[usr]([usr.key]) has innitiated the world shutdown. To disable, press ~World ShutDown verb and select Disable World Shutdown.")
					AdminLog("World ShutDown","No Reason","No Other",usr)
					sleep(100)
					if(GM_WorldShutDownProc==1)
						players<<"<font color=red>World Closing In 17 Seconds."
					else
						players<<"<font color=red>World Close Disabled."
						return
					sleep(100)
					if(GM_WorldShutDownProc)
						players<<"<font color=red>World Closing In 7 Seconds."
					else
						players<<"<font color=red>World Close Disabled."
						return
					sleep(70)
					if(!GM_WorldShutDownProc)
						players<<"<font color=red>World Close Disabled."
						return
					players<<"<font color=red>Closing World."
					for(var/mob/PC/M in players) M.client.Save_1()
					spawn(2)
						//world.Export("byond://[world.address]:1286?ShutIt")
						del world
			Edit(mob/O as obj|mob|turf|area in world)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(ismob(O))
					if(O.GMLevel>=usr.GMLevel)
						if(!usr.GMLevel==7)
							alert(usr,"You can only Edit Admins of a rank lower than your own.")
							AdminBadLog("Edit","None","None",O)
							return
				var/Choices[0]
				for(var/V in O.vars) Choices+=V
				Choices-="key"
				Choices-="GMLevel"
				Choices-="ckey"
				Choices-="contents"
				Choices-="verbs"
				Choices-="overlays"
				Choices-="underlays"
				Choices-="vars"
				Choices-="group"
				Choices-="type"
				Choices-="parent_type"
				Choices-="client"
				Choices-="level"
				Choices-="powerlevel_max"
				Choices-="strength_max"
				Choices-="defence_max"
				Choices-="ki_max"
				Choices-="name"
				Choices-="form"
				Choices-="race"
				Choices-="tnl"
				Choices-="exp"
				Choices-="tp"
				Choices-="grav"
				var/variable = input("Which var?","Var") in Choices
				var/default
				var/typeof = O.vars[variable]
				var/dir
				if(isnull(typeof))
					usr<< "Unable to determine variable type."
				else if(isnum(typeof))
					usr<< "Variable appears to be <b>NUM</b>."
					default = "num"
					dir = 1
				else if(istext(typeof))
					usr<< "Variable appears to be <b>TEXT</b>."
					default = "text"
				else if(isloc(typeof))
					usr<< "Variable appears to be <b>REFERENCE</b>."
					default = "reference"
				else if(isicon(typeof))
					usr<< "Variable appears to be <b>ICON</b>."
					typeof = "\icon[typeof]"
					default = "icon"
				else if(istype(typeof,/atom) || istype(typeof,/datum))
					usr<< "Variable appears to be <b>TYPE</b>."
					default = "type"
				else if(istype(typeof,/list))
					usr<< "Variable appears to be <b>LIST</b>."
					default = "cancel"
				else if(istype(typeof,/client))
					usr<< "Variable appears to be <b>CLIENT</b>."
					default = "cancel"
				else
					usr<< "Variable appears to be <b>FILE</b>."
					default = "file"
				usr<< "Variable contains: [typeof]"
				if(dir)
					switch(typeof)
						if(1) dir = "NORTH"
						if(2) dir = "SOUTH"
						if(4) dir = "EAST"
						if(8) dir = "WEST"
						if(5) dir = "NORTHEAST"
						if(6) dir = "SOUTHEAST"
						if(9) dir = "NORTHWEST"
						if(10) dir = "SOUTHWEST"
						else dir = null
					if(dir) usr<< "If a direction, direction is: [dir]"
				var/class = input("What kind of variable?","Variable Type",default) in list("text",
					"num","type","reference","icon","file","restore to default","cancel")
				if(default=="cancel")default=null
				var/variabletype=default
				var/newvariabletype=class
				var/variablesetting=O.vars[variable]
				switch(class)
					if("cancel")
						return
					if("restore to default")
						O.vars[variable] = initial(O.vars[variable])
					if("text")
						O.vars[variable] = input("Enter new text:","Text",\
							O.vars[variable]) as text
					if("num")
						O.vars[variable] = input("Enter new number:","Num",\
							O.vars[variable]) as num
					if("type")
						O.vars[variable] = input("Enter type:","Type",O.vars[variable]) \
							in typesof(/obj,/mob,/area,/turf)
					if("reference")
						O.vars[variable] = input("Select reference:","Reference",\
							O.vars[variable]) as mob|obj|turf|area in world
					if("file")
						O.vars[variable] = input("Pick file:","File",O.vars[variable]) \
							as file
					if("icon")
						O.vars[variable] = input("Pick icon:","Icon",O.vars[variable]) \
							as icon
				var/newvariablesetting=O.vars[variable]
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes")
							if(ismob(O)&&O.key) AdminMessage("[usr] ([usr.key]) has edited [O]([O.key])'s [variable] from [variablesetting] as [variabletype] to [newvariablesetting] as [newvariabletype].",1)
							else AdminMessage("[usr] ([usr.key]) has edited [O]'s [variable] from [variablesetting] as [variabletype] to [newvariablesetting] as [newvariabletype].",1)
						else
							if(ismob(O)&&O.key) AdminMessage("[usr] ([usr.key]) has edited [O]([O.key])'s [variable] from [variablesetting] as [variabletype] to [newvariablesetting] as [newvariabletype].",0)
							else AdminMessage("[usr] ([usr.key]) has edited [O]'s [variable] from [variablesetting] as [variabletype] to [newvariablesetting] as [newvariabletype].",0)
				else
					if(ismob(O)&&O.key) AdminMessage("[usr] ([usr.key]) has edited [O]([O.key])'s [variable] from [variablesetting] as [variabletype] to [newvariablesetting] as [newvariabletype].")
					else AdminMessage("[usr] ([usr.key]) has edited [O]'s [variable] from [variablesetting] as [variabletype] to [newvariablesetting] as [newvariabletype].")
				AdminLog("Edit","Variable: [variable]","Typesof: [variablesetting] as [variabletype] to [newvariablesetting] as [newvariabletype]",O)
			World_Mute()
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/GoGo=alert(usr,"Are you sure you want to mute everyone?","World Mute","Yes","No")
				if(GoGo=="No")
					return
				for(var/mob/M in players)
					if(usr==M) continue
					if(M.GMLevel>=GMLevel)
						M<<"You were not muted because you're an admin equal to or above [usr]'s rank."
						continue
				World_Mute=usr.GMLevel
				AdminLog("World Mute","No Reason","No Other",usr)
				players<<"<font color = blue>[world.name] Administration Information:\white<font color=red>[usr]([usr.key]) has muted everyone!"
			World_UnMute()
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/GoGo=alert(usr,"Are you sure you want to unmute everyone?","World UnMute","Yes","No")
				if(GoGo=="No")
					return
				if(usr.GMLevel<World_Mute)return
				World_Mute=0
				AdminLog("World UnMute","No Reason","No Other",usr)
				players<<"<font color =white>[world.name] Administration Information:\white<font color=red>[usr]([usr.key]) has unmuted everyone!"
			Channel_Mute()
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error: <font color=green>Your Admin Powers Are Locked."
					return
				var/GoGo=alert(usr,"Are you sure you want to mute everyone?","World Mute","Yes","No")
				if(GoGo=="No")
					return
				for(var/mob/M in players)
					if(usr==M) continue
					if(M.GMLevel>=GMLevel)
						M<<"You were not muted because you're an admin equal to or above [usr]'s rank."
						continue
				Channel_Mute=usr.GMLevel
				AdminLog("World Mute","No Reason","No Other",usr)
				players<<"<font color=red>[usr]([usr.key]) has muted all chat channels!"
			Channel_UnMute()
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/GoGo=alert(usr,"Are you sure you want to unmute chat channels?","Channel UnMute","Yes","No")
				if(GoGo=="No")
					return
				for(var/mob/M in players)
					if(usr==M) continue
					if(usr.GMLevel<Channel_Mute || usr.GMLevel<World_Mute)return
				Channel_Mute = 0
				World_Mute = 0
				AdminLog("Channel UnMute","No Reason","No Other",usr)
				players<<"<font color=red>[usr]([usr.key]) has unmuted all chat channels!"
			MKallow(mob/M in players)
				set category = "Administration"
				set name = "Multikey Permissions"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(M.mkallow==1)
					usr<<"[M]([M.key])is no longer allowed to multikey."
					AdminLog("MKallow","Off","No Other",M)
					M.mkallow=0
				else
					if(M.mkallow==0)
						usr<<"[M]([M.key])is now allowed to multikey."
						AdminLog("MKallow","On","No Other",M)
						M.mkallow=1
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes")
							if(M.mkallow) AdminMessage("[usr] ([usr.key]) has allowed [M]([M.key])to multikey.",1)
							else AdminMessage("[usr] ([usr.key]) has denied [M]([M.key])from multikeying.",1)
						else
							if(M.mkallow) AdminMessage("[usr] ([usr.key]) has allowed [M]([M.key])to multikey.",0)
							else AdminMessage("[usr] ([usr.key]) has denied [M]([M.key])from multikeying.",0)
				else
					if(M.mkallow) AdminMessage("[usr] ([usr.key]) has allowed [M]([M.key])to multikey.")
					else AdminMessage("[usr] ([usr.key]) has denied [M]([M.key])from multikeying.")
			Give(mob/PC/M in players)
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(M==usr)
					usr<< "You can't give to yourself. CHEATER"
					return
				if(M.GMLevel < 8)
					usr<< "You can't give to GMs. CHEATER"
					players<<"<font color = blue>[world.name] Administration Information:\white [src] ([src.key]) has tried to give to [M]([M.key])."
				else
					switch(input("What would you like to give")in list("Rage","Training Points","Kills","Levels"))
						if("Training Points")
							var/amount = input("How many Training Points?") as num
							switch(alert(usr,"Are you sure?","Training Points","Yes","No"))
								if("No")
									return
							M.tp += amount
							usr<<"[M]([M.key]) has recieved [amount] training points."
							M<<"You have been rewarded [amount] training points."
							AdminMessage("[usr] ([usr.key]) has given [M]([M.key])([M.key]) [amount] training points")
							AdminLog("Training points","How Many: [amount]","Who: [M]",usr)
						if("Rage")
							var/amount = input("How much?") as num
							switch(alert(usr,"Are you sure?","Rage","Yes","No"))
								if("No")
									return
							M.rage += amount
							usr<<"[M]([M.key]) has received [amount] rage."
							M<<"You have been rewarded [amount] rage."
						if("Kills")
							var/amount = input("How many kills?") as num
							M.kills += amount
							usr<<"[M]([M.key]) has received [amount] kills."
							M<<"You have been rewarded [amount] kills."
						if("Levels")
							var/amount = input("How many levels?") as num
							if(amount > 200000)
								alert(usr,"You cannot put more than 200,000 levels!")
							else
								AdminMessage("[usr] ([usr.key]) has leveled [M]([M.key])([M.key]) [amount] times")
								AdminLog("Level UP","How Many levels: [amount]","Who: [M]",usr)
								M.Give_Levels(amount)
								usr<<"[M]([M.key]) has recieved [amount] levels."