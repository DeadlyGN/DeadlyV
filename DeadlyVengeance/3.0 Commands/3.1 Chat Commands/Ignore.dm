mob/var/list
	Ignored[0]
	friends[0]
mob/PC
	verb
		Ignore(mob/M in players)
			set category = "Channels"
			if(M == src && src == M) return
			var/X = alert(usr,"Do you want to ignore all messages from [M]?","Ignore [M]","Yes","No")
			if(X == "Yes")
				if(Ignored.Find(M.key))
					src<< "You have already ignored [M]."
					return
				if(M.GMLevel>=1)
					src<<"You cannot ignore admins."
					return
				if(src.GMLevel>=1)
					src<<"You cannot ignore anyone, do your job."
					return
				if(friends.Find(M.key))
					src<<"[M] has been removed from your friends list."
					src.friends -= M.key
				src.Ignored += M.key
				src<< "You're now ignoring [M]."
				if(!M.Ignored.Find(src.key)) M << "[src] has added you to their ignore list."
			src.afk_time = 0
		Unignore()
			set category="Channels"
			var/varPeople = list()
			for(var/K as anything in src.Ignored) varPeople += K
			var/varTo = input("Who would you like to un-ignore?","Unignore") in varPeople + list("Cancel")
			if(varTo == "Cancel") return
			var/X = alert(usr,"Do you want to un-ignore [varTo]?","Unignore [varTo]","Yes","No")
			if(X == "Yes")
				src.Ignored -= varTo
				usr<< "You're no longer ignoring [varTo]."
				for(var/mob/M in players) if(M.key==varTo) M << "[src] has removed you from their ignore list."
			src.afk_time = 0
		Friend(mob/M in players)
			set category = "Channels"
			if(M == src && src == M) return
			if(!M.acceptingFR)
				alert(usr,"[M] isn't accepting friend request at this time.")
				return
			var/X = alert(usr,"Do you want to friend [M]?","Friend [M]","Yes","No")
			if(X == "Yes")
				if(Ignored.Find(M.key))
					src<< "You're currently ignoring [M]."
					return
				if(M.Ignored.Find(src.key))
					src<<"You're currently being ignored by [M]."
					return
				if(friends.Find(M.key))
					src<< "You have already friended [M]."
					return
				switch(alert(M,"[src]([src.key]) wishes to be your friend, Accept?","Friend Request","Yes","No"))
					if("No") return
				if(!src.friends.len)
					src.show_friends_tab=1
				if(!M.friends.len)
					M.show_friends_tab=1
				src.friends += M.key
				M.friends += src.key
				src<< "You're now friends with [M]."
			src.afk_time = 0
		UnFriend()
			set category="Channels"
			var/varPeople = list()
			for(var/k as anything in src.friends) varPeople += k
			var/varTo = input("Who would you like to un-friend?","UnFriend") in varPeople + list("Cancel")
			if(varTo == "Cancel") return
			var/X = alert(usr,"Do you want to unfriend [varTo]?","Unfriend [varTo]","Yes","No")
			if(X == "Yes")
				src.friends -= varTo
				src<< "You're no longer friends with [varTo]."
				for(var/mob/M in players) if(M.key==varTo)
					M << "[src] has removed you from their friends list."
					M.friends -= src.key
			src.afk_time = 0