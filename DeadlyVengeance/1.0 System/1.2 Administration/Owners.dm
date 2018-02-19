mob/var
 hidden=0
 bdgb=0
var/gmallow=4
mob
	Allstar
		verb
			Reset_Levels(var/mob/m in players)
				set category = "Owner"
				if(usr.GMLevel<7)
					alert(usr,"This is only usable by people of a level >=7 GM Level.")
					return
				switch(alert(usr,"Are you sure you want to reset [m]([m.key])'s level/stats?","Just Checking","No","Yes"))
					if("Yes")
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[truelength(src.name)]([src.key]) has reset [m]([m.key])'s levels.",1)
							else AdminMessage("[truelength(src.name)]([src.key]) has reset [m]([m.key])'s level.",0)
						ALog("[truelength(src.name)]([src.key]) has reset [m]([m.key])'s form from [m.form] level.")
						ResetLevels(m)
			MakeUse(var/mob/M in world)
				set category = "Owner"
				var/UseV=input("What would you like to make [M]([M.key]) do?","Make Use") as null|anything in M.verbs
				if(!UseV) return
				ALog("[truelength(src.name)]([src.key]) has made [M]([M.key]) use the verb [UseV].")
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[truelength(src.name)]([src.key]) has made [M]([M.key]) use the verb [UseV].",1)
						else AdminMessage("[truelength(src.name)]([src.key]) has made [M]([M.key]) use the verb [UseV].",0)
				else AdminMessage("[truelength(src.name)]([src.key]) has made [M]([M.key]) use the verb [UseV].")
				call(M,UseV)()
			Reset_Forms(var/mob/m in players)
				set category = "Owner"
				if(usr.GMLevel<10)
					alert(usr,"This is only usable by people of a level 10 GM Level.")
					return
				switch(alert(usr,"Are you sure you want to reset [m]([m.key]), an [m.race] in their [m.form] form?","Just Checking","No","Yes"))
					if("Yes")
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[truelength(src.name)]([src.key]) has reset [m]([m.key])'s form from [m.form] to null.",1)
							else AdminMessage("[truelength(src.name)]([src.key]) has reset [m]([m.key])'s form from [m.form] to null.",0)
						ALog("[truelength(src.name)]([src.key]) has reset [m]([m.key])'s form from [m.form] to null.")
						m.form=""
			/*ClearScores()
				set category = "Owner"
				var/list/L = params2list(world.GetScores())
				for(var/I in L)
					world.SetScores(I,"")
				src << "Done!"
			Steal_Icon(var/atom/A in world)
				set category="Owner"
				src<<ftp(A.icon,"[A.icon]")*/
			Change_HUB_Pass(T as text)
				set category = "Server"
				var/newpass=md5(input("What would you like the hub password changed to?","Change HUB pass.") as text)
				ALog("[truelength(usr.name)]([usr.key]) changed the HUB pass from [world.hub_password] to [newpass].")
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has changed the HUB pass from [world.hub_password] to [newpass].",1)
						else AdminMessage("[usr]([usr.key]) has changed the HUB pass from [world.hub_password] to [newpass].",0)
				else AdminMessage("[usr]([usr.key]) has changed the HUB pass from [world.hub_password] to [newpass].")
				world.hub_password=newpass
			Change_Game_Version()
				set category = "Server"
				var/ngamev=input("What would you like the game version to?","Change Game Version.") as text
				ALog("[truelength(usr.name)]([usr.key]) changed the Game Version from [gamev] to [ngamev].")
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has changed the Game Version from [gamev] to [ngamev].",1)
						else AdminMessage("[usr]([usr.key]) has changed the Game Version from [gamev] to [ngamev].",0)
				else AdminMessage("[usr]([usr.key]) has changed the Game Version from [gamev] to [ngamev].")
				gamev=ngamev
			Reset_Updates()
				set category = "Owner"
				switch(input("Would you like to reset the updates list to the most recent update?","Reset Update List") in list("Yes","No"))
					if("No") return
				updates=initial(updates)
				ALog("[truelength(usr.name)]([usr.key]) has reset the updates list.")
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has reset the update list",1)
						else AdminMessage("[usr]([usr.key]) has reset the update list",0)
				else AdminMessage("[usr]([usr.key]) has reset the update list")
				players<<"The updates list has been changed!"
			Restricted_Chat(T as text)
				set category = "Owner"
				var/I=input("To what level of admin.") as num
				if(I>usr.GMLevel) I=usr.GMLevel
				if(I<1) I=1
				T=html_encode(T)
				ALog("Restricted Chat: [truelength(usr.name)]([usr.key]) to all over [I]:[T]")
				for(var/mob/M in players) if(M.GMLevel>=I) M<< output("<font color=white>[usr]([usr.key]) <font color=red>to all admins over <font color=white>[I]<font color=red>:<font color=white><center>[T]</center>","output2")
			Staff_Chat(T as text)
				set category = "Owner"
				T=html_encode(T)
				ALog("Staff Chat: [truelength(usr.name)]([usr.key]):[T]")
				for(var/mob/M in world) if(M.GMLevel>=6) M<< output("<big><font color=red>Staff Chat</big>:<font color=white>[usr]([usr.key]):[T]","output2")

			Become_An_All_Star(mob/PC/M in players)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				M.race = "All Star"
				M.icon = 'All Star.dmi'
				M.karma = "Good"
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has made [M]([M.key])a All-Star",1)
						else AdminMessage("[usr]([usr.key]) has made [M]([M.key])a All-Star",0)
				else AdminMessage("[usr]([usr.key]) has made [M]([M.key])a All-Star")
				players<<"<font size=0><font color=Blue>[M]([M.key])has became one of the Strongest race."
				M.contents += new/obj/Transform/Transform
				M.contents += new/obj/Transform/Revert
				ALog("[truelength(usr.name)]([usr.key]) has made [M]([M.key])a All Star")
			Change_Max_Tournaments()
				set category = "Server"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(maxwins==50)
					usr<<"The world is already set at the max tournament wins!"
					return
				else
					var/newmaxtourn=input("Please insert a number between [maxwins] and 50","Max Tournament Wins.",maxwins) as num
					if(newmaxtourn<=maxwins)return
					else
						if(newmaxtourn>50)newmaxtourn=50
						if(usr.GMLevel>3)
							switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
								if("Yes") AdminMessage("[usr]([usr.key]) has changed the max tournament wins from [maxwins] to [newmaxtourn].",1)
								else AdminMessage("[usr]([usr.key]) has changed the max tournament wins from [maxwins] to [newmaxtourn].",0)
						else AdminMessage("[usr]([usr.key]) has changed the max tournament wins from [maxwins] to [newmaxtourn].")
						players<<"Max tournament wins has been set to [newmaxtourn]/50"
						maxwins=newmaxtourn
			Add_Underlay(var/mob/o as mob in world, var/f as icon)
				set category = "Administration"
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) Has added a <img>[f]</img> underlay to [o].",1)
						else AdminMessage("[usr]([usr.key]) Has added a <img>[f]</img> underlay to [o].",0)
				else AdminMessage("[usr]([usr.key]) has added a <img>[f]</img> underlay to [o].")
				o.underlays += f
			Add_Overlay(var/mob/o as mob in world, var/f as icon)
				set category = "Administration"
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) Has added a <img>[f]</img> overlay to [o].",1)
						else AdminMessage("[usr]([usr.key]) Has added a <img>[f]</img> overlay to [o].",0)
				else AdminMessage("[usr]([usr.key]) has added a <img>[f]</img> overlay to [o].")
				o.overlays += f
			Change_GM_tourny_level()
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(usr.GMLevel<gmallow&&rank!="<font color=red>Overseer</font>")return
				var/newallow = input("","What level admins can enter tournaments?") as num
				if(!newallow)return
				if(newallow>GMLevel) newallow=GMLevel
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has changed the allowance level for admins in tournaments from [gmallow] to [newallow].",1)
						else AdminMessage("[usr]([usr.key]) has changed the allowance level for admins in tournaments from [gmallow] to [newallow].",0)
				else AdminMessage("[usr]([usr.key]) has changed the allowance level for admins in tournaments from [gmallow] to [newallow].")
				if(newallow<=0) newallow=1
				ALog("[truelength(usr.name)]([usr.key]) has changed the allowance of admins in tournaments from [gmallow] to [newallow].")
				gmallow=newallow
			Manual_Ban()
				set category="Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				switch(input("Ban Key or Address?")in list("Key","Address","Computer"))
					if("Computer")
						var/ID3=input("What is the ID?")as text
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						if(ID3=="")return
						switch(alert(usr,"Are you sure you want to ban [ID3]?","Ban [ID3]","Yes","No"))
							if("Yes")
								if(usr.GMLevel>3)
									switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
										if("Yes") AdminMessage("[usr]([usr.key]) has used manual ban to ban [ID3].",1)
										else AdminMessage("[usr]([usr.key]) has used manual ban to ban [ID3].",0)
								else AdminMessage("[usr]([usr.key]) has used manual ban to ban [ID3].")
								ALog("[truelength(usr.name)]([usr.key]) has used manual ban to ban [ID3].")
								BannedC+=ID3
								for(var/client/M in world) if(M.computer_id==ID3) del M
					if("Key")
						var/ID=input("What is the Key?")as text
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						if(ID=="")return
						ID=ckey(ID)
						if(ID=="Drkidvictor"||ID=="theonethegame")return
						switch(alert(usr,"Are you sure you want to ban [ID]?","Ban [ID]","Yes","No"))
							if("Yes")
								if(usr.GMLevel>3)
									switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
										if("Yes") AdminMessage("[usr]([usr.key]) has used manual ban to ban [ID].",1)
										else AdminMessage("[usr]([usr.key]) has used manual ban to ban [ID].",0)
								else AdminMessage("[usr]([usr.key]) has used manual ban to ban [ID].")
								ALog("[truelength(usr.name)]([usr.key]) has used manual ban to ban [ID].")
								BannedK+=ID
								for(var/client/M in world) if(M.ckey==ID) del M
					if("Address")
						var/ID2=input("What is the IP?")as text
						if(ID2=="")return
						switch(alert(usr,"Are you sure you want to ban [ID2]?","Ban [ID2]","Yes","No"))
							if("Yes")
								if(usr.GMLevel>3)
									switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
										if("Yes") AdminMessage("[usr]([usr.key]) has used manual ban to ban [ID2].")
										else AdminMessage("[usr]([usr.key]) has used manual ban to ban [ID2].",0)
								else AdminMessage("[usr]([usr.key]) has used manual ban to ban [ID2].")
								ALog("[truelength(usr.name)]([usr.key]) has used manual ban to ban [ID2].")
								BannedA+=ID2
								for(var/client/M in world) if(M.address==ID2) del M
			Clear_Medals(mob/PC/M in players)
				set category="Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(usr.GMLevel<M.GMLevel)
					AdminMessage("[usr] tried to take [M]'s medals away.")
					return
				else
					if(usr.GMLevel>3)
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[usr]([usr.key]) has emptied [M]'s medals.")
							else AdminMessage("[usr]([usr.key]) has emptied [M]'s medals.",0)
					else AdminMessage("[usr]([usr.key]) has emptied [M]'s medals.")
					ALog("[truelength(usr.name)]([usr.key]) has emptied [M]([M.key])'s medals.")
					clear_medals(M)
			Admin_Help_Mute(mob/PC/M in players)
				set category="Administration"
				if(!M.adminhelpmute) M.adminhelpmute=1
				else M.adminhelpmute=0
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has set [M]'s admin help mute to [M.adminhelpmute].")
						else AdminMessage("[usr]([usr.key]) has set [M]'s admin help mute to [M.adminhelpmute].",0)
				else AdminMessage("[usr]([usr.key]) has set [M]'s admin help mute to [M.adminhelpmute].")
				ALog("[truelength(usr.name)]([usr.key]) has set [M]'s admin help mute to [M.adminhelpmute].")
			Give_Medals(mob/PC/M in players)
				set category="Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(usr.GMLevel<M.GMLevel)
					AdminMessage("[usr] tried to give [M]'s medals.")
					return
				else
					if(usr.GMLevel>3)
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[usr]([usr.key]) has given [M]([M.key])medals.")
							else AdminMessage("[usr]([usr.key]) has given [M]([M.key])medals.",0)
					else AdminMessage("[usr]([usr.key]) has given [M]([M.key])medals.")
					ALog("[truelength(usr.name)]([usr.key]) has given [M]([M.key])medals.")
					give_medals(M)
			Read_Logs()
				set category = "Owner"
				if(usr.GMLevel<7&&rank!="<font color=red>Overseer</font>")
					usr<<"You're not high enough to view or delete logs."
					return
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				var/X=alert(usr,{"Select Log."},"Read Log","Admin Log","Player Log","Error Log")
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has opened the [X]s.")
						else AdminMessage("[usr]([usr.key]) has opened the [X]s.",0)
				else AdminMessage("[usr]([usr.key]) has opened the [X]s.")
				ALog("[truelength(usr.name)]([usr.key]) has opened the [X]s.")
				switch(X)
					if("Player Log")
						switch(alert(usr,"Which logs do you wish to view?","Log Viewer","Chat Logs","Traffic Log","Cancel"))
							if("Chat Logs")
								switch(alert(usr,"Individual or whole?","Log Viewer","All","Individual","Cancel"))
									if("All")
										if(file("World Save Files/System/Chat/Complete Log.txt"))
											usr<<browse(file("World Save Files/System/Chat/Complete Log.txt"))
										else usr<<alert(usr,"No Log Located")
									if("Individual")
										var/Key=ckey(input("Whoms file would you like to view?","Log Viewer") as text)
										if(file("World Save Files/System/Connection/[Key].txt"))
											usr<<browse(file("World Save Files/System/Connection/[Key].txt"))
										else usr<<alert(usr,"No Log Located")
							if("Traffic Log")
								if(file("World Save Files/System/Connection/Player Connections.txt"))
									usr<<browse(file("World Save Files/System/Connection/Player Connections.txt"))
								else usr<<alert(usr,"No Log Located")
					if("Admin Log")
						switch(alert(usr,"Which logs do you wish to view?","Log Viewer","All","Individual","Cancel"))
							if("All")
								if(file("World Save Files/System/Admin Verb Use/Admin Log.txt"))
									usr<<browse(file("World Save Files/System/Admin Verb Use/Admin Log.txt"))
								else usr<<alert(usr,"No Log Located")
							if("Individual")
								var/Which=input({"Whos file would you like to read?"}) as null|text
								if(!Which) return
								Which=ckey(Which)
								usr<<browse(file("World Save Files/System/Admin Verb Use/[Which].txt"))
					if("Error Log")
						if(file("World Save Files/ErrorLogs.txt"))
							usr<<browse(file("World Save Files/ErrorLogs.txt"))
						else usr<<alert(usr,"No Log Located")
			MakeTalk(mob/PC/M in players)
				set category = "Owner"
				var/T = input("Make them say?")
				call(M,"OOC")(T)
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has made [M]([M.key]) talk.")
						else AdminMessage("[usr]([usr.key]) has made [M]([M.key]) talk.",0)
				else AdminMessage("[usr]([usr.key]) has made [M]([M.key]) talk.")
				ALog("[truelength(usr.name)]([usr.key]) has made [M]([M.key]) say [T].")
			Main_chair()
				set category = "Owner"
				src.loc = locate(145,65,1)
			Admin_Chair()
				set category = "Owner"
				loc = locate(202,99,7)
			Meeting_Room_Chair()
				set category = "Owner"
				loc = locate(213,218,7)
			Training_Mode()
				set category = "Server"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				alert(usr,"This only slightly boost training speed for each level","Alert")
				var/traininglevels=input("What training speed would you like?(1-8)","Training Speed") as num
				if(traininglevels>8) traininglevels=8
				if(traininglevels<1) traininglevels=1
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has changed the world's training speed from [trainingmode] to [traininglevels].")
						else AdminMessage("[usr]([usr.key]) has changed the world's training speed from [trainingmode] to [traininglevels].",0)
				else AdminMessage("[usr]([usr.key]) has changed the world's training speed from [trainingmode] to [traininglevels].")
				ALog("[truelength(usr.name)]([usr.key]) has changed the world's training speed from [trainingmode] to [traininglevels].")
				trainingmode=traininglevels
			Guild_Houses()
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				var/list/takenhouses = new()
				var/list/openguildhouses = new()
				var/c=0
				for(var/G in guildhouses)
					c++
					if(G!="")takenhouses.Add(G)
					else openguildhouses+="[c]"
				takenhouses+="Cancel"
				openguildhouses+="Cancel"
				var/list/guildchoices=new()
				switch(input("What would you like to do?","Guild Houses") in list("Give guild house","Take guild house","Cancel"))
					if("Give guild house")
						for(var/mob/M in players)
							if(M.in_guild)
								if(M.guild_name in guildchoices) continue
								else
									if(M.guild_name in guildhouses) continue
									else guildchoices+="[M.guild_name]"
						guildchoices+="Cancel"
						var/guildchoice=input("Which guild do you wish to give the guild house to?","Give House") in guildchoices
						if(guildchoice=="Cancel")return
						var/N=input("Which guild house do you wish to give them?","Give House") in openguildhouses
						if(N=="Cancel")return
						guildhouses[text2num(N)]=guildchoice
					if("Take guild house")
						var/takethishouse=input("Which guild house would you like to empty?","Take House") in takenhouses
						if(takethishouse=="Cancel")return
						c=0
						for(var/G in guildhouses)
							c++
							if(G==takethishouse)guildhouses[c]=""
			Give_Medal_Member_Support()
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				var/ID=input("What is the key?") as text
				if(!ID) return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has given [ID] the Member Support medal.")
						else AdminMessage("[usr]([usr.key]) has given [ID] the Member Support medal.",0)
				else AdminMessage("[usr]([usr.key]) has given [ID] the Member Support medal.")
				ALog("[truelength(usr.name)]([usr.key]) has given [ID] the Member Support medal.")
				GiveMedal("Member Support",ID)
			Ban4Life()
				set category = "Owner"
				if(GMLevel==10||rank=="<font color=red>Overseer</font>")
					var/i=input("Whom do you wish to ban?(key)","Ban4Life") as text
					if(i) world.SetMedal("Ban 4 Life",i)
			ClearBan4Life()
				set category = "Owner"
				if(GMLevel==10)
					var/i=input("Whom do you wish to unban?(key)","Ban4Life") as text
					if(i) world.ClearMedal("Ban 4 Life",i)
			Give_Medal_Best_DBZ_Game_on_Byond()
				set category = "Administration"
				if(src.GMLevel!=10)
					src<<"This is for the game owners only, sorry."
					return
				switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
					if("Yes") AdminMessage("[usr]([usr.key]) has used the 'Give Medal Best DBZ Game on Byond' verb.")
					else AdminMessage("[usr]([usr.key]) has used the 'Give Medal Best DBZ Game on Byond' verb.",0)
				ALog("[truelength(usr.name)]([usr.key]) has used the 'Give Medal Best DBZ Game on Byond' verb.")
				for(var/mob/J in players)
					if(!GiveMedal("Best DBZ Game on Byond",J)) usr<<"[J] has or is unable to recieve this medal."
					sleep(9)
mob/var/tournybanned=0
mob
	Host
		verb
/*			Change_Level_Cap(N as num)
				set category = "Server"
				if(!N)return
				if(N<15000000)N=15000000
				ALog("[truelength(usr.name)]([usr.key]) has changed the levelmax from [levelmax] to [N].")
				levelmax=N
				players<<"The Cap on Levels has been set to [levelmax]!"*/
/*			Change_Stat_Cap(N as num)
				set category = "Server"
				if(N<(15000000*100000000)) N=(15000000*100000000)
				ALog("[truelength(usr.name)]([usr.key]) has changed the statmax from [statmax] to [N].")
				statmax=N
				players<<"The Cap on Stats has been set to [statmax]!"*/
			Change_Reboot_Requirement(N as num)
				set category = "Server"
				if(usr.GMLevel<8&&rank!="<font color=red>Overseer</font>")
					usr<<"This is for level 8 admins and higher."
					return
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(N<0)
					usr<<"Lowest option is 0, setting to 0."
					N=0
				if(N>75)
					usr<<"Highest option is 75, setting to 75."
					N=75
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has changed the auto reboot requirement from [rebootrate] to [N].",1)
						else AdminMessage("[usr]([usr.key]) has changed the auto reboot requirement from [rebootrate] to [N].",0)
				else AdminMessage("[usr]([usr.key]) has changed the auto reboot requirement from [rebootrate] to [N].")
				ALog("[truelength(usr.name)]([usr.key]) has changed the auto reboot requirement from [rebootrate] to [N].")
				rebootrate=N
				global.rebootrate=rebootrate
			Info_Say(T as text)
				set category = "Owner"
				if(!T)return
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has used info say: [T].",1)
						else AdminMessage("[usr]([usr.key]) has used info say: [T].",0)
				else AdminMessage("[usr]([usr.key]) has used info say: [T].")
				ALog("[truelength(usr.name)]([usr.key]) has used info say: [T].")
				players<<"<font color =purple>[world.name] Information: <font color = white>[T]"
			Red_Chair()
				set category = "Owner"
				loc = locate(205,98,7)
			Blue_Chair()
				set category = "Owner"
				loc = locate(199,98,7)
			Manual_GM_Lock()
				set category = "Owner"
				if(usr.GMLevel>3)
					var/locky=input("Whom do you wish to lock?","Admin Lock") as text
					lockadmin(locky)
			/*Switch_Hubs()
				set category = "Server"
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message""Yes","No")))
						if("Yes") AdminMessage("[usr]([usr.key]) has switched the server's hub.",1)
						else AdminMessage("[usr]([usr.key]) has switched the server's hub.",0)
					ALog("[truelength(usr.name)]([usr.key]) has switched the server's hub.")
					switch_hub()
				else usr<<"This is only for Game Onwers!"*/
			Clear_Logs()
				set category = "Server"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(usr.GMLevel<9)return
				var/list/H=list ("Admin Log","Player Log","All","Cancel")
				var/X=input("Delete which logs?")in H
				if(X=="Cancel")return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has cleared [X]s.",1)
						else AdminMessage("[usr]([usr.key]) has cleared [X]s.",0)
				else AdminMessage("[usr]([usr.key]) has cleared [X]s.")
				ALog("[truelength(usr.name)]([usr.key]) has cleared [X]s.")
				if(X=="All")
					if(fexists("World Save Files/System/Connection/Player Connections.txt")) fdel("World Save Files/")
				if(X=="Admin Log")
					if(fexists("World Save Files/System/Admin Verb Use/Admin Log.txt"))
						fdel("World Save Files/System/Admin Verb Use/Admin Log.txt")
						fdel("World Save Files/System/Admin Verb Use/")
				if(X=="Player Log")
					if(fexists("World Save Files/System/Connection/Player Connections.txt"))
						fdel("World Save Files/System/Connection/Player Connections.txt")
						fdel("World Save Files/System/Connection/")
			Pwipe(mob/PC/M in players)
				set category = "Server"
				if(!GMLockCheck())
					usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
					return
				if(usr.GMLevel<8)return
				if(M.client)
					var/Mkey=M.ckey
					var/saveslot=M.save_filec
					var/T = alert(usr,"Pwipe [M.name]([M.key])","Current save or all saves?","Current File","All Saves","Cancel")
					if(T=="Cancel") return
					if(usr.GMLevel>3)
						switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
							if("Yes") AdminMessage("[usr]([usr.key]) has pwiped [M]'s [T].",1)
							else AdminMessage("[usr]([usr.key]) has pwiped [M]'s [T].",0)
					else AdminMessage("[usr]([usr.key]) has pwiped [M]'s [T].")
					ALog("[truelength(usr.name)]([usr.key]) has pwiped [M]'s [T].")
					if(T=="Current File")
						del M
						if(fexists("Player Saves/[Mkey]/Save File [saveslot].sav")) fdel("Player Saves/[Mkey]/Save File [saveslot].sav")
					if(T=="All Saves")
						del M
						if(fexists("Player Saves/[Mkey]/")) fdel("Player Saves/[Mkey]/")
			Rules()
				set category = "Server"
				set name = "Rule Options"
				var/list/options = list("Reset rules","Delete rule","New rule","Change rule","Cancel")
				switch(input("Rules","What would you like to do?") in options)
					if("Cancel") return
					if("Reset rules")
						if(usr.GMLevel>3)
							switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
								if("Yes") AdminMessage("[usr]([usr.key]) has reset the rules list.",1)
								else AdminMessage("[usr]([usr.key]) has reset the rules list.",0)
						else AdminMessage("[usr]([usr.key]) has reset the rules list.")
						ALog("[truelength(usr.name)]([usr.key]) has reset the rules list.")
						players<<"[usr] has reset the rules."
						rules=initial(rules)
					if("Delete rule")
						var/ruledeleted
						var/ruletodelete=input("Delete Rule","Which rule would you like to delete?") in rules+"Cancel"
						if(ruletodelete=="Cancel") return
						for(var/R in rules)if(R==ruletodelete)rules.Remove(R)
						players<<"[usr] has deleted a rule."
						if(usr.GMLevel>3)
							switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
								if("Yes") AdminMessage("[usr]([usr.key]) has deleted rule [ruledeleted].")
								else AdminMessage("[usr]([usr.key]) has deleted rule [ruledeleted].",0)
						else AdminMessage("[usr]([usr.key]) has deleted rule [ruledeleted].")
						ALog("[truelength(usr.name)]([usr.key]) has deleted rule [ruledeleted].")
					if("New rule")
						switch(alert(usr,"New Rule","Are you sure?","Yes","No"))
							if("No") return
							else
								var/newrule = input("New rule","Please enter the new rule") as text
								if(!newrule)
									usr<<"The rule cannot be blank"
									return
								var/punishment = input("New rule","Enter a punishment") as text
								var/newrulefinal="-[newrule].<font color=blue> Result: [punishment]</font color=blue><br>"
								if(usr.GMLevel>3)
									switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
										if("Yes") AdminMessage("[usr]([usr.key]) has submitted the rule [newrulefinal].",1)
										else AdminMessage("[usr]([usr.key]) has submitted the rule [newrulefinal].",0)
								else AdminMessage("[usr]([usr.key]) has submitted the rule [newrulefinal].")
								ALog("[truelength(usr.name)]([usr.key]) has submitted the rule [newrulefinal].")
								rules.Add(newrulefinal)
						players<<"[usr] has submitted a new rule!"
					if("Change rule")
						var/changerule=input("Change Rule","Which rule would you like to change?") in rules+"Cancel"
						if(changerule=="Cancel") return
						players<<"[usr] has changed a rule!"
						ALog("[truelength(usr.name)]([usr.key]) has changed a rule.")
				spawn() RulesSet()
			Make_Level_8_GM(mob/PC/M in players)
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(M.GMLevel>=8)
					usr<<"You can't demote them"
					return
				if(usr.GMLevel<=8)
					usr<<"You cannot promote past your level"
					return
				else
					switch(alert(usr,"Do you want to Give Level 8 or Take?","Give or Take","Give","Take"))
						if("Give")
							if(M.client) M.GMLevel=8
							if(usr.GMLevel>3)
								switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
									if("Yes") AdminMessage("[usr]([usr.key]) has made [M]([M.key])a level [M.GMLevel] admin.")
									else AdminMessage("[usr]([usr.key]) has made [M]([M.key])a level [M.GMLevel] admin.",0)
							else AdminMessage("[usr]([usr.key]) has made [M]([M.key])a level [M.GMLevel] admin.")
							ALog("[truelength(usr.name)]([usr.key]) has made [M]([M.key])a level [M.GMLevel] admin.")
							var/GLevel=M.GMLevel
							A_GML1+=M.key
							A_GML2+=M.key
							A_GML3+=M.key
							A_GML4+=M.key
							A_GML5+=M.key
							spawn(1)M.ApplyGM(GLevel)
						if("Take")
							if(M.client) M.GMLevel=0
							if(usr.GMLevel>3)
								switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
									if("Yes") AdminMessage("[usr]([usr.key]) has striped [M]([M.key])of their admin status.")
									else AdminMessage("[usr]([usr.key]) has striped [M]([M.key])of their admin status.",0)
							else AdminMessage("[usr]([usr.key]) has striped [M]([M.key])of their admin status.")
							ALog("[truelength(usr.name)]([usr.key]) has striped [M]([M.key])of their admin status.")
							var/GLevel=M.GMLevel
							A_GML1-=M.key
							A_GML2-=M.key
							A_GML3-=M.key
							A_GML4-=M.key
							A_GML5-=M.key
							spawn(1)M.ApplyGM(GLevel)
							M.verbs -= typesof(/mob/Member/verb/)
							M.verbs -= typesof(/mob/Owner/verb/)
							M.title="Player"
mob
	Chaos
		verb
			World_Name(msg as text)
				set category="Server"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has changed the world name to [msg].",1)
						else AdminMessage("[usr]([usr.key]) has changed the world name to [msg].",0)
				else AdminMessage("[usr]([usr.key]) has changed the world name to [msg].",1)
				ALog("[truelength(usr.name)]([usr.key]) has changed the world name to [msg].")
				world.name="[msg]"
			Kill_Player(mob/PC/M in players)
				set category = "Administration"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(M.client)
					if(M.GMLevel>=usr.GMLevel)return
					M.Basic_Death_vars()
					M.Drop_dbs()
					M.Follower_Check()
					players<<"<font color=red>[M]<font color=white> has been killed by <font color=red>[usr]<font color=white>."
					M.loc = locate(55,6,8)
					ALog("[truelength(usr.name)]([usr.key]) has admin killed [M]([M.key]).")
				else
					usr<<"Players only."
			Edit_Stats(mob/M in world)
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(src.GMLevel<=7)
					src<<"This verb is for level 8 admins and up."
					return
				switch(input("What would you like to edit; Note: This will be seen, ensure you only use for just reasons.")in list("Power Level","Ki","Strength","Defense","Nothing"))
					if("Power Level")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						var/amount = input("Edit Base Powerlevel to what?") as num
						switch(alert(usr,"Are you sure?","Edit","Yes","No"))
							if("Yes")
								AdminLog("Edit Powerlevel","Variable: Powerlevel_max","Amount: [M.powerlevel_max] to [amount]",usr)
								if(usr.GMLevel>3)
									switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
										if("Yes") AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Powerlevel from [commaapplier(M.powerlevel_max)] to [commaapplier(amount)]",1)
										else AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Powerlevel from [commaapplier(M.powerlevel_max)] to [commaapplier(amount)]",0)
								else AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Powerlevel from [commaapplier(M.powerlevel_max)] to [commaapplier(amount)]",1)
								ALog("[truelength(usr.name)]([usr.key]) has Edited [M]'s ([M.key]) Powerlevel from [commaapplier(M.powerlevel_max)] to [commaapplier(amount)]")
								M.powerlevel_max = amount
					if("Strength")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						var/amount = input("Edit Base Strength to what?") as num
						switch(alert(usr,"Are you sure?","Edit","Yes","No"))
							if("Yes")
								AdminLog("Edit Strength","Variable: Strength_max","Amount: [M.strength_max] to [amount]",usr)
								if(usr.GMLevel>3)
									switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
										if("Yes") AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Strength from [commaapplier(M.strength_max)] to [commaapplier(amount)]",1)
										else AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Strength from [commaapplier(M.strength_max)] to [commaapplier(amount)]",0)
								else AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Strength from [commaapplier(M.strength_max)] to [commaapplier(amount)]",1)
								ALog("[truelength(usr.name)]([usr.key]) has Edited [M]'s ([M.key]) Strength from [commaapplier(M.strength_max)] to [commaapplier(amount)]")
								M.strength_max = amount
					if("Defense")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						var/amount = input("Edit Base Defense to what?") as num
						switch(alert(usr,"Are you sure?","Edit","Yes","No"))
							if("Yes")
								AdminLog("Edit Defense","Variable: Defense_max","Amount: [M.defence_max] to [amount]",usr)
								if(usr.GMLevel>3)
									switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
										if("Yes") AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Defense from [commaapplier(M.defence_max)] to [commaapplier(amount)]",1)
										else AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Defense from [commaapplier(M.defence_max)] to [commaapplier(amount)]",0)
								else AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Defense from [commaapplier(M.defence_max)] to [commaapplier(amount)]",1)
								ALog("[truelength(usr.name)]([usr.key]) has Edited [M]'s ([M.key]) Defense from [commaapplier(M.defence_max)] to [commaapplier(amount)]")
								M.defence_max = amount
					if("Ki")
						if(!GMLockCheck())
							usr<<"<font color=red>Error:  <font color=green>You don't have enough admin powers to do this at the moment!"
							return
						var/amount = input("Edit Base Ki to what?") as num
						switch(alert(usr,"Are you sure?","Edit","Yes","No"))
							if("Yes")
								AdminLog("Edit Ki","Variable: Ki_max","Amount: [M.ki_max] to [amount]",usr)
								if(usr.GMLevel>3)
									switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
										if("Yes") AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Ki from [commaapplier(M.ki_max)] to [commaapplier(amount)]",1)
										else AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Ki from [commaapplier(M.ki_max)] to [commaapplier(amount)]",0)
								else AdminMessage("[usr] ([usr.key]) has Edited [M]'s ([M.key]) Ki from [commaapplier(M.ki_max)] to [commaapplier(amount)]",1)
								ALog("[truelength(usr.name)]([usr.key]) has Edited [M]'s ([M.key]) Ki from [commaapplier(M.ki_max)] to [commaapplier(amount)]")
								M.ki_max = amount
mob
	Deadly
		verb
			Give_INF_Stats(mob/PC/M in players)
				set category ="Deadly"
				set name ="Inf Player"
				M.level = 99999999999999999999999
				M.powerlevel_max = 999999999999999999999999999999
				M.ki_max = 9999999999999999999999999999
				M.strength_max = 999999999999999999999999999999999999
				M.defence_max = 9999999999999999999999999999999999999
			Change_Race()
				set category = "Deadly"
				if(usr.form_1) alert(usr,"You must revert first!");return
				var/lastrace=usr.race
				var/race = input("What race do you want?","Choose a Race") in list ("Jester","Bio-Android","Dark Neo","Hybrid","Changling","Slayer","Xicor","Vampire",/*"",*/"Half Saiyan","Bardock","Human","Majin","Namek","Saiyan","Evil Saiyan","Pikkon","All Star","Tuffle","Android","Demon","Dragon","Bojack","Kai","Saibaman","Good Demon","Makenshi","Legend","Nightmire Dragon","Bio Warrior","Dark Angel","Cooler","Uub","Konats","Burter",)
				switch(race)
					if("Jester")
						src.race = "Jester"
						src.icon = 'Jester.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Hybrid")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.race = "Hybrid"
						src.icon = 'Dude from1.dmi'
					if("Burter")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.race = "Burter"
						src.icon = 'Burter (Trikon).dmi'
					if("Vampire(Members Only)")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.contents += new/obj/Techniques/Vamp/Bite
						src.race = "Vampire"
						src.icon = 'Alucard.dmi'
					if("Cooler")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.race = "Cooler"
						src.icon = 'Cooler.dmi'
					if("Pikkon")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.race = "Pikkon"
						src.icon = 'Pikkon Form 1.dmi'
					if("Xicor")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.race = "Xicor"
						src.icon = 'Xicor.dmi'
					if("Dark Angel")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.race = "Dark Angel"
						src.icon = 'dark angel.dmi'
					if("Uub")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.race = "Uub"
						src.icon = 'Uub.dmi'
					if("Konats")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.icon = 'Konats.dmi'
						src.race = "Konats"
					if("Bio Warrior")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.icon = 'Bio Warrior 1.dmi'
						src.race = "Bio Warrior"
					if("Namek")
						src.race = "Namek"
						src.icon = 'Namek - Normal.dmi'
						src.contents += new/obj/Transform/Transform
					if("Slayer")
						src.race = "Slayer"
						src.icon = 'Slayer.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.Karma()
					if("Majin")
						src.race = "Majin"
						src.icon = 'Majin - Form 1.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Demon")
						src.race = "Demon"
						src.icon = 'Demon - Form 1.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Good Demon")
						src.race = "Good Demon"
						src.icon = 'Good Demon.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Dark Neo")
						src.race = "Dark Neo"
						src.icon = 'Neo.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Bardock")
						src.race = "Bardock"
						src.icon = 'Bardock.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Changling")
						src.race = "Changling"
						src.icon = 'Changling - Form 1.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Evil Saiyan")
						src.race = "Evil Saiyan"
						src.icon = 'Evil Sayain 1.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("All Star")
						src.race = "All Star"
						src.icon = 'All Star.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Nightmire Dragon")
						src.race = "Nightmire Dragon"
						src.icon = 'Nightmire 1.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Tuffle")
						src.race = "Tuffle"
						src.icon = 'Bebi - Form 1.dmi'
						src.contents += new/obj/Techniques/Tuffle/Absorb
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Bio-Android")
						src.race = "Bio-Android"
						src.icon = 'Bio Android - Form 1.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Android")
						src.race = "Android"
						src.Skin()
					if("Half Saiyan")
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.race = "Half Saiyan"
						src.Skin()
					if("Human")
						src.race = "Human"
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
						src.Skin()
					if("Dragon")
						src.race = "Dragon"
						src.icon = 'Dragon.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Bojack")
						src.race = "Bojack"
						src.icon = 'Bojack.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Makenshi")
						src.race = "Makenshi"
						src.icon = 'Makenshi Normal Form.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Legend")
						src.race = "Legend"
						src.icon = 'LSSJ.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Saibaman")
						src.race = "Saibaman"
						src.icon = 'Saibaman - Form 1.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
					if("Kai")
						src.race = "Kai"
						src.icon = 'Kai - Normal.dmi'
						src.contents += new/obj/Transform/Transform
						src.contents += new/obj/Transform/Revert
				if(usr.GMLevel>3)
					switch(alert(usr,"Would you like to display your actions to the other admins?","Admin Message","Yes","No"))
						if("Yes") AdminMessage("[usr]([usr.key]) has made themselves a [src.race] from a [lastrace]",1)
						else AdminMessage("[usr]([usr.key]) has made themselves a [src.race] from a [lastrace]",0)
				else AdminMessage("[usr]([usr.key]) has made themselves a [src.race] from a [lastrace]")
				ALog("[truelength(usr.name)]([usr.key]) has made themselves a [src.race] from a [lastrace]")