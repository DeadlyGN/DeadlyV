mob/var
	//save_file_1 = 0
	//save_file_2 = 0
	//save_file_3 = 0
	GM
	randomL
	rand
	//gender
var/list
	Name = new()
	HTML_TAGS = list ("<",">")
	NUM_TAGS = list ("1","2","3","4","5","6","7","8","9","0")
	NPC_TAGS = list ("{NPC}","{Holiday}","{Saga}")
	BAD_HTML_TAGS = list ("<br>","<font size","<big>","\n","<EM","<SPAN","<Strong","<size")
	BAD_WORDS = list ("fuck","shit","bitch","fag","bastard","gay","ghey","dick","homo","pussy","asshole","ass hole","phag","cock")
	BAD_LINK = list ("byond:","/games","games/")
	SYM_TAGS = list ("!","@","#","$","%","^","&","*","(",")","-","_","+","=","(",")","{","}",";",":","'","<",">",",",".","?","/","[","]")
	CODE_BAN_KEYS = list("RedFangx14","Vegeta_Sari","Angel_heat","Angelic-Pyro")
	CODE_BAN_IPS = list()
	CODE_BAN_CIDS = list()
var
	BAD_LINK1 = "b"
	BAD_LINK2 = "y"
	BAD_LINK3 = "o"
	BAD_LINK4 = "n"
	BAD_LINK5 = "d"
	BAD_LINK6 = "."
	BAD_LINK7 = "/"
	LineBreak = {"
"}
proc
	Check_For_Indivisual(T as text,var/L)
		if(findtext(T,L)) return TRUE
	Check_For_Bad_Links2(T as text)
		var/L=findtext(T,BAD_LINK1)
		if(!L) return
		var/U=findtext(T,BAD_LINK2,L)
		if(!U) return
		var/Y=findtext(T,BAD_LINK3,U)
		if(!Y) return
		var/F=findtext(T,BAD_LINK4,Y)
		if(!F) return
		var/D=findtext(T,BAD_LINK5,F)
		if(!D) return
		var/J=findtext(T,BAD_LINK6,D)
		if(!J) return
		var/G=findtext(T,BAD_LINK7,J)
		if(L&&U&&Y&&F&&D&&J&&G) return TRUE
	Check_For_Text(T as text,var/list/L)
		for(var/V in L) if(findtext(T,V)) return TRUE
	Check_For_Bad_Links3(T as text)
		T=ckey(T)
		if(findtext(T,"byond:")||findtext(T,"byond.com/games")) return TRUE
	Check_For_Size(T as text)
		if(findtext(T,"<font")&&findtext(T,"size")) return TRUE
mob/proc
	NotifyOfSave()
		switch(input("Would you like to be notified for when your character gets saved?","Notification") in list("Yes","No"))
			if("Yes") src.notifysave=1
			else src.notifysave=0
mob/Guest
	Login()
		winset(src,"OpeningWindow","is-visible=true")
		winset(src,"mainwindow","is-visible=false")

		//if(src.client.key == "Guest-") del(src.client)
		//.=..()
		if(src.key in CODE_BAN_KEYS||src.client.address in CODE_BAN_IPS||src.client.computer_id in CODE_BAN_CIDS)
			src.AUTO_BAN_2()
			return
		if(src.client.address in BannedA||src.ckey in BannedK||BannedK.Find(src.ckey)||BannedA.Find(src.ckey)) del src
		/*if(world.GetMedal("Ban 4 Life",src))something here got broken, gg rip
			if(src.key=="Theonethegame"||src.key=="Drkidvictor") world.ClearMedal("Ban 4 Life",src)
			else
				world.SetConfig("keyban",ckey(src.key),"")
				world.SetConfig("ipban",src.client.address,"")
				src.AUTO_BAN_2()
				return*/
		src.MKCHECK()
		spawn()
			while(src&&src.client)
				src.client.eye=src
				//src.client.screen.Add(new/obj/HUD/fade_in())
				if(players.len>=3)
					if(tournament&&matchstarted) src.client.eye=pick(Contenders)
					else if(arena_battle_on) src.client.eye=pick(arena_contenders)
				if(src.client.eye==src)
					switch(pick("Turf","Mob"))
						if("Mob")
							var/list/pickfrom=new()
							pickfrom.Add(Monsters-typesof(/mob/Monster/Tuffle_Infected/))
							if(sagas.len&&prob(5)) pickfrom.Add(sagas)
							if(players.len) pickfrom.Add(players)
							src.client.eye=pick(pick(pickfrom))
						if("Turf")
							var/list/l=available_locs1|available_locs2|available_locs3
							if(world.GetMedal("GTer",src)) l.Add(available_locs5)
							var/turf/t=pick(l)
							src.client.eye=t
				src.client.perspective = 255
				//src<<"client.eye set to [client.eye]"
				var/loop=1
				var/dir=pick(/*NORTH,SOUTH,EAST,WEST,*/NORTHWEST,NORTHEAST,SOUTHWEST,SOUTHEAST)
				var/t = client.eye
				while(loop<=10)
					t=get_step(t,dir)
					src.client.eye=t
					src.client.perspective = 255
					sleep(5)
					loop++
				//src.client.screen.Add(new/obj/HUD/fade_out())
				sleep(10)
		src<< browse("<br>[PlayerRules]")
		spawn() status_change()
		if(!fexists("Player Saves/[ckey]/Options.sav")) src.Tutorial()
		//if(src.client.key=="Guest-") del(src.client)
		src.loc = locate(88,40,7)
//while(1)
mob
	verb
		NewChar()
			set hidden=1
			winset(src,"SlotWindow1","is-visible=true")
			winset(src,"OpeningWindow", "is-visible=false")
//			switch(alert("Which Slot do you wish to Select?","","Slot 1","Slot 2","Slot 3"))
mob
	verb
		Slot1()
			set hidden=1
			var/del_name = ""
			if(fexists("Player Saves/[src.ckey]/Save File 1.sav"))
				switch(alert("You already have a Character on Slot 1. Overwrite it?","","Yes","No"))
					if("Yes")
						var/savefile/Load = new("Player Saves/[src.client.ckey]/Save File 1.sav")
						Load["Name"] >> del_name
						var/savefile/N = new("World Save Files/Player Names.sav")
						Name.Remove(ckey(del_name))
						N["Name"] << Name
						fdel("Player Saves/[src.client.ckey]/Save File 1.sav")
						src.save_filec=1
						winset(src,"RaceWindow", "is-visible=true")
						winset(src, "SlotWindow1","is-visible=false")
					else
						winset(src,"OpeningWindow", "is-visible=true")
						winset(src, "SlotWindow1","is-visible=false")
						return
			else
				winset(src,"RaceWindow", "is-visible=true")
				winset(src, "SlotWindow1","is-visible=false")
				src.save_filec=1

mob
	verb
		DemonP()
			set hidden = 1
			alert("Are you sure you would like to be a Demon?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Demon"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		GDemonP()
			set hidden = 1
			alert("Are you sure you would like to be a Good-Demon?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Good Demon"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		NamekP()
			set hidden = 1
			alert("Are you sure you would like to be a Namekian?(Perm transes)","","Yes","No")
			if("Yes")
				src.race="Namek"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		SaiyanP()
			set hidden = 1
			alert("Are you sure you would like to be a Saiyan?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Saiyan"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		DarkAngelP()
			set hidden = 1
			alert("Are you sure you would like to be a Dark-Angel?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Dark Angel"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		MajinP()
			set hidden = 1
			alert("Are you sure you would like to be a Majin?(Perm transes)","","Yes","No")
			if("Yes")
				src.race="Majin"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		BardockP()
			set hidden = 1
			alert("Are you sure you would like to be a Bardock?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Bardock"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		ChanglingP()
			set hidden = 1
			alert("Are you sure you would like to be a Changling?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Changling"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		EvilSaiyanP()
			set hidden = 1
			alert("Are you sure you would like to be a Evil-Saiyan?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Evil Saiyan"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		TuffleP()
			set hidden = 1
			alert("Are you sure you would like to be a Tuffle?(Perm transes)","","Yes","No")
			if("Yes")
				src.race="Tuffle"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		BioDroidP()
			set hidden = 1
			alert("Are you sure you would like to be a Bio-Android?(Perm transes)","","Yes","No")
			if("Yes")
				src.race="Bio Android"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		AndroidP()
			set hidden = 1
			alert("Are you sure you would like to be a Android?(Perm transes)","","Yes","No")
			if("Yes")
				src.race="Android"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		HalfSaiyanP()
			set hidden = 1
			alert("Are you sure you would like to be a Half-Saiyan?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Half Saiyan"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		HumanP()
			set hidden = 1
			alert("Are you sure you would like to be a Human?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Human"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		DragonP()
			set hidden = 1
			alert("Are you sure you would like to be a Dragon?(Perm transes)","","Yes","No")
			if("Yes")
				src.race="Dragon"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		LegendP()
			set hidden = 1
			alert("Are you sure you would like to be a Legendary Saiyan?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Legend"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				return
		UubP()
			set hidden = 1
			alert("Are you sure you would like to be an Uub?(Perm transes)","","Yes","No")
			if("Yes")
				src.race="Uub"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				continue
		KaiP()
			set hidden = 1
			alert("Are you sure you would like to be a Kai?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Kai"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				continue
		SaibaP()
			set hidden = 1
			alert("Are you sure you would like to be a Saibaman?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Saibaman"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				continue
		XicorP()
			set hidden = 1
			alert("Are you sure you would like to be a Xicor?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Xicor"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				continue
		JirenP()
			set hidden = 1
			alert("Are you sure you would like to be a Xicor?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Xicor"
				src.Create()
			else
				if("No")
				alert("Please select a race")
				continue
		ZenP()
			set hidden = 1
			alert("Are you sure you would like to be a Xicor?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Xicor"
				src.Create()
			else
				if("No")
					alert("Please select a race")
					continue
		KonatsP()
			set hidden = 1
			alert("Are you sure you would like to be a Xicor?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Konats"
				src.Create()
			else
				if("No")
					alert("Please select a race")
					continue
		AllStarP()
			set hidden = 1
			alert("Are you sure you would like to be a Xicor?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Xicor"
				src.Create()
			else
				if("No")
					alert("Please select a race")
					continue
		FelineP()
			set hidden = 1
			alert("Are you sure you would like to be a Xicor?(Non-Perm transes)","","Yes","No")
			if("Yes")
				src.race="Xicor"
				src.Create()
			else
				if("No")
					alert("Please select a race")
					continue
		GoBack1()
			set hidden=1
			winset(src,"OpeningWindow","is-visible=true")
			winset(src,"SlotWindow1","is-visible=false")
		GoBack2()
			set hidden=1
			winset(src,"OpeningWindow","is-visible=true")
			winset(src,"SlotWindow2","is-visible=false")
		GoBack3()
			set hidden=1
			winset(src,"OpeningWindow","is-visible=true")
			winset(src,"SlotWindow3","is-visible=false")




mob
	verb
		Slot2()
			set hidden=1
			var/del_name = ""
			if(fexists("Player Saves/[src.client.ckey]/Save File 2.sav"))
				switch(alert("You already have a Character on Slot 2. Overwrite it?","","Yes","No"))
					if("Yes")
						var/savefile/Load = new("Player Saves/[src.client.ckey]/Save File 2.sav")
						Load["Name"] >> del_name
						var/savefile/N = new("World Save Files/Player Names.sav")
						Name.Remove(ckey(del_name))
						N["Name"] << Name
						fdel("Player Saves/[src.client.ckey]/Save File 2.sav")
						src.save_filec=2
						winset(src,"RaceWindow", "is-visible=true")
						winset(src, "SlotWindow1","is-visible=false")
						return
					else
						winset(src,"OpeningWindow", "is-visible=true")
						winset(src, "SlotWindow1","is-visible=false")
			else
				winset(src,"RaceWindow", "is-visible=true")
				winset(src, "SlotWindow1","is-visible=false")
				src.save_filec=2
mob
	verb
		Slot3()
			set hidden=1
			var/del_name = ""
			if(fexists("Player Saves/[src.client.ckey]/Save File 3.sav"))
				switch(alert("You already have a Character on Slot 3. Overwrite it?","","Yes","No"))
					if("Yes")
						var/savefile/Load = new("Player Saves/[src.client.ckey]/Save File 3.sav")
						Load["Name"] >> del_name
						var/savefile/N = new("World Save Files/Player Names.sav")
						Name.Remove(ckey(del_name))
						N["Name"] << Name
						fdel("Player Saves/[src.client.ckey]/Save File 3.sav")
						src.save_filec=3
						winset(src,"RaceWindow", "is-visible=true")
						winset(src, "SlotWindow1","is-visible=false")
					else
						winset(src,"OpeningWindow", "is-visible=true")
						winset(src, "SlotWindow1","is-visible=false")
						return
			else
				winset(src,"RaceWindow", "is-visible=true")
				winset(src, "SlotWindow1","is-visible=false")
				src.save_filec=3



mob
	verb
		LoadChar()
			set hidden=1
			winset(src,"SlotWindow2", "is-visible=true")
			winset(src,"OpeningWindow", "is-visible=false")
//	switch(alert("Which Slot do you wish to Select?","","Slot 1","Slot 2","Slot 3"))

mob
	verb
		Slot4()
			set hidden=1
			if(fexists("Player Saves/[src.client.ckey]/Save File 1.sav"))
				src.save_filec=1
				src.client.Load_1()
			else
				alert("No Saved File Found!")
				sleep(5)
				winset(src,"OpeningWindow", "is-visible=true")
				winset(src,"SlotWindow2", "is-visible=false")
				return
mob
	verb
		Slot5()
			set hidden=1
			if(fexists("Player Saves/[src.client.ckey]/Save File 2.sav"))
				src.save_filec=2
				src.client.Load_1()
			else
				alert("No Saved File Found!")
				sleep(5)
				winset(src,"OpeningWindow", "is-visible=true")
				winset(src,"SlotWindow2", "is-visible=false")
				return
mob
	verb
		Slot6()
			set hidden=1
			if(fexists("Player Saves/[src.client.ckey]/Save File 3.sav"))
				src.save_filec=3
				src.client.Load_1()
			else
				alert("No Saved File Found!")
				sleep(5)
				winset(src,"OpeningWindow", "is-visible=true")
				winset(src,"SlotWindow2", "is-visible=false")
				return



mob
	verb
		DeleteChar()
			set hidden=1
			winset(src,"SlotWindow3", "is-visible=true")
			winset(src,"OpeningWindow", "is-visible=false")
//			switch(alert("Which Slot do you wish to Delete?","","Slot 1","Slot 2","Slot 3"))

	proc
		Create()
			var/mob/mobcreation = new /mob/PC()
			var/newname = null
			var/config = "065-090&097-122&095&032"
			alert(src,"Welcome to [world.name] v[gamev]")
			while(1)
				var/myname = null
				while(!asciifilter(myname,config)||!myname)myname = propername(input("Pick Character Name","Name",src.key) as text)
				if(ckey(myname) in Name)
					alert(usr,"This name is already in use. Try again please,")
					continue
				if(lentext(myname) > 12)
					alert(usr,"Your name can not exceed 12 characters.")
					continue
				if(isnull(myname) | myname=="" | !myname)
					alert(usr,"Your name may not be blank.")
					continue
				if(Check_For_Text(myname,HTML_TAGS) == TRUE)
					alert(usr,"Your name may not have tagilitys of html in it.")
					continue
				if(Check_For_Text(myname,NUM_TAGS) == TRUE)
					alert(usr,"Your name may not have numbers in it.")
					continue
				if(Check_For_Text(myname,SYM_TAGS) == TRUE)
					alert(usr,"Your name may not have symbols in it.")
					continue
				if(Check_For_Text(myname,BAD_WORDS) == TRUE)
					alert(usr,"Your name may not have bad words in it.")
					continue
				if((myname=="All Star"&&src.key!="Theonethegame")||(myname=="Sketh"&&src.key!="Drkidvictor")||(myname=="Arch"&&src.key!="Archfiend Master"))
					alert(usr,"Only [myname] can hold this name!")
					continue
				newname=myname
				break
			while(1)
//				var/race = input(src,"What were you born as?","Choose a Birth Race") in list ("Jester (Members Only)","Bio-Android","Dark Neo","Hybrid","Changling","Slayer","Xicor","Vampire(Members Only)",/*"",*/"Half Saiyan","Bardock","Human","Majin","Namek","Saiyan","Evil Saiyan (Members Only)","Pikkon","All Star (Members Only)","Tuffle","Android","Demon","Dragon","Bojack","Kai","Saibaman","Good Demon","Makenshi","Legend","Nightmire Dragon","Bio Warrior","Dark Angel","Cooler","Uub","Konats","Burter",)
				switch(src.race)
					if("Jester (Members Only)")
						if(src.client.IsByondMember()||world.GetMedal("Jester Unlock",src))
							mobcreation.race = "Jester"
							mobcreation.icon = 'Jester.dmi'
							mobcreation.powerlevel = 20000
							mobcreation.powerlevel_max = 20000
							mobcreation.strength = 15000
							mobcreation.strength_max = 15000
							mobcreation.Karma()
							mobcreation.contents += new/obj/Transform/Transform
							mobcreation.contents += new/obj/Transform/Revert
						else
							src<<"You're not a Byond Member"
							continue
					if("Hybrid")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.race = "Hybrid"
						mobcreation.icon = 'Dude from1.dmi'
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.defence = 100
						mobcreation.defence_max = 100
						mobcreation.karma = "Evil"
					if("Burter")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.race = "Burter"
						mobcreation.icon = 'Burter (Trikon).dmi'
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.defence = 100
						mobcreation.defence_max = 100
						mobcreation.karma = "Evil"
					if("Vampire(Members Only)")
						if(src.client.IsByondMember()||world.GetMedal("Vampire Unlock",src))
							mobcreation.contents += new/obj/Transform/Transform
							mobcreation.contents += new/obj/Transform/Revert
							mobcreation.race = "Vampire"
							mobcreation.icon = 'Alucard.dmi'
							mobcreation.powerlevel = 1500
							mobcreation.powerlevel_max = 1500
							mobcreation.strength = 100
							mobcreation.strength_max = 100
							mobcreation.defence = 100
							mobcreation.defence_max = 100
							mobcreation.karma = "Evil"
							mobcreation.contents += new/obj/Techniques/Vamp/Bite
						else
							src<<"You're not a Byond Member"
							continue
					if("Cooler")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.race = "Cooler"
						mobcreation.icon = 'Cooler.dmi'
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.defence = 100
						mobcreation.defence_max = 100
						mobcreation.Karma()
					if("Pikkon")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.race = "Pikkon"
						mobcreation.icon = 'Pikkon Form 1.dmi'
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.defence = 100
						mobcreation.defence_max = 100
						mobcreation.karma = "Good"
						mobcreation.karma_rating = 7
					if("Xicor")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.race = "Xicor"
						mobcreation.icon = 'Xicor.dmi'
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.defence = 100
						mobcreation.defence_max = 100
						mobcreation.Karma()
					if("Dark Angel")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.race = "Dark Angel"
						mobcreation.icon = 'dark angel.dmi'
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.defence = 100
						mobcreation.defence_max = 100
						mobcreation.Karma()
					if("Uub")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.race = "Uub"
						mobcreation.icon = 'Uub.dmi'
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.defence = 100
						mobcreation.defence_max = 100
						mobcreation.Karma()
					if("Konats")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.icon = 'Konats.dmi'
						mobcreation.race = "Konats"
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.defence = 100
						mobcreation.defence_max = 100
						mobcreation.Karma()
					if("Bio Warrior")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.icon = 'Bio Warrior 1.dmi'
						mobcreation.race = "Bio Warrior"
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.defence = 100
						mobcreation.defence_max = 100
						mobcreation.Karma()
					if("Namek")
						mobcreation.race = "Namek"
						mobcreation.icon = 'Namek - Normal.dmi'
						mobcreation.ki = 1500
						mobcreation.ki_max = 1500
						mobcreation.defence = 150
						mobcreation.defence_max = 150
						mobcreation.contents += new/obj/Techniques/Regenerate
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.Karma()
					if("Slayer")
						mobcreation.race = "Slayer"
						mobcreation.icon = 'Slayer.dmi'
						mobcreation.ki = 1500
						mobcreation.ki_max = 1500
						mobcreation.defence = 150
						mobcreation.defence_max = 150
						mobcreation.contents += new/obj/Techniques/Regenerate
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.Karma()
					if("Majin")
						mobcreation.race = "Majin"
						mobcreation.icon = 'Majin - Form 1.dmi'
						mobcreation.karma = "Evil"
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 150
						mobcreation.strength_max = 150
						mobcreation.contents += new/obj/Techniques/Majin/Regenerate
						mobcreation.contents += new/obj/Techniques/Majin/Fat_Wrap
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.contents += new/obj/Techniques/Bio_Android/Absorb
					if("Demon")
						mobcreation.race = "Demon"
						mobcreation.chromosome = "Evil"
						mobcreation.icon = 'Demon - Form 1.dmi'
						mobcreation.karma = "Evil"
						mobcreation.karma_rating = 25
						mobcreation.powerlevel = 2500
						mobcreation.powerlevel_max = 2500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.verbs += new/mob/learn/verb/Demon_Ki_Blast
					if("Good Demon")
						mobcreation.race = "Demon"
						mobcreation.chromosome = "Good"
						mobcreation.icon = 'Good Demon.dmi'
						mobcreation.karma = "Good"
						mobcreation.karma_rating = 25
						mobcreation.powerlevel = 2500
						mobcreation.powerlevel_max = 2500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.learn_goodkiblast=1
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.verbs += new/mob/learn/verb/Demon_Ki_Blast
					if("Dark Neo")
						mobcreation.race = "Dark Neo"
						mobcreation.icon = 'Neo.dmi'
						mobcreation.karma = "Evil"
						mobcreation.karma_rating = 25
						mobcreation.powerlevel = 2500
						mobcreation.powerlevel_max = 2500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
					if("Bardock")
						mobcreation.race = "Bardock"
						mobcreation.icon = 'Bardock.dmi'
						mobcreation.karma = "Good"
						mobcreation.karma_rating = 25
						mobcreation.powerlevel = 2500
						mobcreation.powerlevel_max = 2500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
					if("Changling")
						mobcreation.race = "Changling"
						mobcreation.icon = 'Changling - Form 1.dmi'
						mobcreation.karma = "Evil"
						mobcreation.powerlevel = 2500
						mobcreation.powerlevel_max = 2500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
					if("Saiyan")
						mobcreation.chromosome = pick("Honour","Pride", 20;"Legend")
						mobcreation.race = "Saiyan"
						mobcreation.powerlevel = 2000
						mobcreation.powerlevel_max = 2000
						mobcreation.strength = 150
						mobcreation.strength_max = 150
						mobcreation.overlays += tail
						mobcreation.has_tail = 1
						mobcreation.Skin()
						mobcreation.Hair()
						if(mobcreation.hair!="Nappa"&&mobcreation.hair) mobcreation.Hair_Color2()
						mobcreation.Karma()
					if("Evil Saiyan (Members Only)")
						if(src.client.IsByondMember()||world.GetMedal("Evil Saiyan Unlock",src))
							mobcreation.race = "Evil Saiyan"
							mobcreation.icon = 'Evil Sayain 1.dmi'
							mobcreation.karma = "Evil"
							mobcreation.powerlevel = 2000
							mobcreation.powerlevel_max = 2000
							mobcreation.strength = 150
							mobcreation.strength_max = 150
							mobcreation.contents += new/obj/Transform/Transform
							mobcreation.contents += new/obj/Transform/Revert
						else
							src<<"You're not a Byond Member"
							continue
					if("All Star (Members Only)")
						if(src.client.IsByondMember()||world.GetMedal("All Star Unlock",src))
							mobcreation.race = "All Star"
							mobcreation.icon = 'All Star.dmi'
							mobcreation.karma = "Evil"
							mobcreation.powerlevel = 20000
							mobcreation.powerlevel_max = 20000
							mobcreation.strength = 15000
							mobcreation.strength_max = 15000
							mobcreation.Karma()
							mobcreation.contents += new/obj/Transform/Transform
							mobcreation.contents += new/obj/Transform/Revert
						else
							src<<"You're not a Byond Member"
							continue
					if("Nightmire Dragon")
						mobcreation.race = "Nightmire Dragon"
						mobcreation.icon = 'Nightmire 1.dmi'
						mobcreation.karma = "Evil"
						mobcreation.powerlevel = 3000
						mobcreation.powerlevel_max = 3000
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
					if("Tuffle")
						mobcreation.race = "Tuffle"
						mobcreation.icon = 'Bebi - Form 1.dmi'
						mobcreation.karma = "Evil"
						mobcreation.powerlevel = 3000
						mobcreation.powerlevel_max = 3000
						mobcreation.upkeep = 5
						mobcreation.contents += new/obj/Techniques/Tuffle/Absorb
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
					if("Bio-Android")
						mobcreation.race = "Bio-Android"
						mobcreation.icon = 'Bio Android - Form 1.dmi'
						mobcreation.karma = "Evil"
						mobcreation.powerlevel = 1750
						mobcreation.powerlevel_max = 1750
						mobcreation.upkeep = 5
						mobcreation.contents += new/obj/Techniques/Bio_Android/Absorb
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Techniques/Regenerate
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.verbs += new/mob/learn/verb/Distructo_Disk
					if("Android")
						mobcreation.race = "Android"
						mobcreation.karma = "Evil"
						mobcreation.powerlevel = 2500
						mobcreation.powerlevel_max = 2500
						mobcreation.verbs += new/mob/learn/verb/Ki_Absorb
						mobcreation.verbs += new/mob/learn/verb/Scan
						mobcreation.learn_absorb = 1
						mobcreation.learn_scan = 1
						mobcreation.Skin()
						mobcreation.Hair()
						if(mobcreation.hair!="Nappa"&&mobcreation.hair) mobcreation.Hair_Color2()
					if("Half Saiyan")
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.race = "Half Saiyan"
						mobcreation.powerlevel = 1500
						mobcreation.powerlevel_max = 1500
						mobcreation.strength = 100
						mobcreation.strength_max = 100
						mobcreation.defence = 100
						mobcreation.defence_max = 100
						mobcreation.Skin()
						mobcreation.Hair()
						if(mobcreation.hair!="Nappa"&&mobcreation.hair) mobcreation.Hair_Color2()
						mobcreation.Karma()
					if("Human")
						mobcreation.race = "Human"
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.verbs += new/mob/learn/verb/Distructo_Disk
						mobcreation.ki = 750
						mobcreation.ki_max = 750
						mobcreation.strength = 150
						mobcreation.strength_max = 150
						mobcreation.defence = 150
						mobcreation.defence_max = 150
						mobcreation.Skin()
						mobcreation.Hair()
						if(mobcreation.hair!="Nappa"&&mobcreation.hair) mobcreation.Hair_Color2()
						mobcreation.Karma()
					if("Dragon")
						mobcreation.karma = "Evil"
						mobcreation.race = "Dragon"
						mobcreation.icon = 'Dragon.dmi'
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.ki = 750
						mobcreation.ki_max = 750
						mobcreation.strength = 150
						mobcreation.strength_max = 150
						mobcreation.defence = 150
						mobcreation.defence_max = 150
					if("Bojack")
						mobcreation.race = "Bojack"
						mobcreation.icon = 'Bojack.dmi'
						mobcreation.karma = "Evil"
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.ki = 750
						mobcreation.ki_max = 750
						mobcreation.strength = 150
						mobcreation.strength_max = 150
						mobcreation.defence = 150
						mobcreation.defence_max = 150
						mobcreation.Hair()
						if(mobcreation.hair!="Nappa"&&mobcreation.hair) mobcreation.Hair_Color2()
					if("Makenshi")
						mobcreation.race = "Makenshi"
						mobcreation.icon = 'Makenshi Normal Form.dmi'
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.ki = 750
						mobcreation.ki_max = 750
						mobcreation.strength = 150
						mobcreation.strength_max = 150
						mobcreation.defence = 150
						mobcreation.defence_max = 150
						mobcreation.Karma()
					if("Legend")
						mobcreation.race = "Legend"
						mobcreation.icon = 'LSSJ.dmi'
						mobcreation.karma = "Evil"
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.ki = 750
						mobcreation.ki_max = 750
						mobcreation.strength = 150
						mobcreation.strength_max = 150
						mobcreation.defence = 150
						mobcreation.defence_max = 150
						mobcreation.karma = "Evil"
					if("Saibaman")
						mobcreation.race = "Saibaman"
						mobcreation.icon = 'Saibaman - Form 1.dmi'
						mobcreation.karma = "Evil"
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.ki = 750
						mobcreation.ki_max = 750
						mobcreation.strength = 150
						mobcreation.strength_max = 150
						mobcreation.defence = 150
						mobcreation.defence_max = 150
						mobcreation.karma = "Evil"
					if("Kai")
						mobcreation.race = "Kai"
						mobcreation.icon = 'Kai - Normal.dmi'
						mobcreation.karma = "Good"
						mobcreation.contents += new/obj/Transform/Transform
						mobcreation.contents += new/obj/Transform/Revert
						mobcreation.ki = 750
						mobcreation.ki_max = 750
						mobcreation.strength = 150
						mobcreation.strength_max = 150
						mobcreation.defence = 150
						mobcreation.defence_max = 150
						mobcreation.Hair()
						if(mobcreation.hair!="Nappa"&&mobcreation.hair) mobcreation.Hair_Color2()
				break
			winset(src,"mainwindow", "is-visible=true")
			winset(src,"RaceWindow", "is-visible=false")
			mobcreation.energy_code = rand(0000001,9999999)
			mobcreation.it_blocked = 1
			mobcreation.loc = locate(23,215,9)
			mobcreation.NotifyOfSave()
			mobcreation.name = newname
			mobcreation.version=1
			/*if(src.save_file_1)
				mobcreation.save_file_1 = 1
			if(src.save_file_2)
				mobcreation.save_file_2 = 1
			if(src.save_file_3)
				mobcreation.save_file_3 = 1*/
			mobcreation.save_filec = save_filec
			if(fexists("World Save Files/Player Names.sav")) fdel("World Save Files/Player Names.sav")
			var/savefile/N = new("World Save Files/Player Names.sav")
			Name.Add(ckey(mobcreation.name))
			N["Name"] << Name
			players << "<font color=blue>[world.name] Information: <font color = white>Everyone welcome our newest Player:<font color=silver> [mobcreation.name]<font color=white> the<font color=red> [mobcreation.race]!"
			src.Updates()
			src.client.mob = mobcreation
			spawn(3) src.client.mob.overlays += src.client.mob.coloredhair
			del(src)