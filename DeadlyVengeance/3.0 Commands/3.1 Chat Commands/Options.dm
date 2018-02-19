mob/var
 tab_vitals = 1
 tab_skills = 1
 tab_quests = 1
 tab_inventory = 1
 ooc_on = 1
 gooc_on = 1
 auction_on = 1
 arena_accepting = 1
 acceptingFR = 1
mob/PC
	verb
		Options()
			set category = "Channels"
			switch(input(src,"What Options would you like to Configure?","Options") in list ("Show / Hide Tabs","Toggle Auto Finish For Attacks","Toggle Censor","Toggle Whispers","Toggle Friend Request","Toggle Guild Invites","Toggle OOC","Toggle Guild Chat","Toggle Arena","Toggle IM","Cancel"))
				if("Toggle IM")
					src.IM_on=!src.IM_on
					if(src.IM_on) src<<"<i>IMs</i> turned <font color=red>OFF</font color=red>."
					else src<<"<i>IMs</i> turned <font color=green>ON</font color=green>."
				if("Toggle Censor")
					src.censorme = !src.censorme
					if(src.censorme) src<<"<i>Censor</i> options turned <font color=green>ON</font color=green>."
					else src<<"<i>Censor</i> options turned <font color=red>OFF</font color=red>."
				if("Toggle Auto Finish For Attacks")
					src.auto_finish = !src.auto_finish
					if(src.auto_finish) src<<"<i>Auto Finish</i> option turned <font color=green>ON</font color=green>."
					else src<<"<i>Auto Finish</i> option turned <font color=red>OFF</font color=red>."
				if("Show / Hide Tabs")
					switch(input(src,"What Tabs?","Options") in list ("Friends","Guild Members","Vitals","Players","Statistics","Quests","Inventory","Saga"))
						if("Vitals")
							src.tab_vitals = !src.tab_vitals
						if("Statistics")
							src.tab_skills = !src.tab_skills
						if("Players")
							src.show_players_tab = !src.show_players_tab
						if("Saga")
							src.tab_saga = !src.tab_saga
						if("Quests")
							src.tab_quests = !src.tab_quests
						if("Inventory")
							src.tab_inventory = !src.tab_inventory
						if("Guild Members")
							src.show_guild_tab = !src.show_guild_tab
						if("Friends")
							src.show_friends_tab = !src.show_friends_tab
				if("Toggle Guild Chat")
					src.gooc_on = !src.gooc_on
					if(src.gooc_on)
						src<< "You turn your Guild Chats \green ON"
						for(var/mob/C in players) if(C.guild_name == src.guild_name) C << "[src] has turned their Guild Chats \green ON"
					else
						src<< "You turn your Guild Chats \red OFF"
						for(var/mob/C in players) if(C.guild_name == src.guild_name) C << "[src] has turned their Guild Chats \red OFF"
				if("Toggle Whispers")
					src.whispers_off = !src.whispers_off
					if(src.whispers_off)
						src<< "You turn your Whispers \red OFF"
						players << "[src] has turned their Whispers \red OFF"
					else
						src<< "You turn your Whispers \green ON"
						players << "[src] has turned their Whispers \green ON"
				if("Toggle OOC")
					src.ooc_on = !src.ooc_on
					if(src.ooc_on)
						src<< "You turn your OOC \green ON"
						players << "[src] has turned their OOC \green ON"
					else
						src<< "You turn your OOC \red OFF"
						players << "[src] has turned their OOC \red OFF"
				if("Toggle Arena")
					src.arena_accepting = !src.arena_accepting
					if(src.arena_accepting) src<< "You're now accepting arena challenges"
					else src<< "You're no longer accepting arena challenges"
				if("Toggle Guild Invites")
					src.acceptingGI = !src.acceptingGI
					if(src.acceptingGI) src<<"You're no longer accepting guild invites."
					else src<<"You're now accepting guild invites."
				if("Toggle Friend Request")
					src.acceptingFR = !src.acceptingFR
					if(src.acceptingFR) src<<"You're now accepting friend request."
					else src<<"You're no longer accepting friend request."
mob/PC
	verb
		Help_Book()
			set category = "Channels"
			switch(input("What would you like to check?","Options") in list("Trans Reqs","Macros","Ranking Level","FAQ","Cancel"))
				if("Trans Reqs") spawn(2) src.Racereqs()
				if("Ranking Level") spawn(2) src.Rank_File()
				if("FAQ") spawn(2) src.Questions()
				if("Macros") src<<Macros