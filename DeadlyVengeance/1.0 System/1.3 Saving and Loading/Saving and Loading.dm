client
	proc
		Load_1()
			winset(src,"mainwindow","is-visible=true")
			winset(src,"SlotWindow2","is-visible=false")
			var/savefile/load
			load = new ("Player Saves/[mob.ckey]/Save File [mob.save_filec].sav")
			load["mob"] >> mob
			load["x"] >> mob.x
			load["y"] >> mob.y
			load["z"] >> mob.z
		Save_1()
			if(!src||!mob) return
			Ranking(mob)
			if(fexists("Player Saves/[mob.ckey]/Options.sav")) fdel("Player Saves/[mob.ckey]/Options.sav")
			var/savefile/csave
			var/GML=mob.GMLevel
			if(key==world.host) mob.GMLevel=0
			csave = new ("Player Saves/[mob.ckey]/Options.sav","-1")
			csave["Tutorial"] << mob.Tutorial
			csave["Jailed"] << mob.jailed
			csave["Jail Time"] << mob.jail_time
			csave["Muted"] << mob.muted
			csave["Mute Time"] << mob.mute_time
			if(key!=world.host) csave["GMLevel"] << mob.GMLevel
			csave["AM"] << mob.AdnM
			csave["GMLock"] << mob.GMLock
			csave["AHM"] << mob.adminhelpmute
			csave["MK"] << mob.mkallow
			csave["Storage"] << mob.personal_storage
			csave["HasStorage"] << mob.has_storage
			if(fexists("Player Saves/[mob.ckey]/Save File [mob.save_filec].sav")) fdel("Player Saves/[mob.ckey]/Save File [mob.save_filec].sav")
			var/savefile/save
			save = new ("Player Saves/[mob.ckey]/Save File [mob.save_filec].sav","-1")
			save["Name"] << mob.name
			save["mob"] << mob
			save["x"] << mob.x
			save["y"] << mob.y
			save["z"] << mob.z
			mob:SetScores()
			mob.GMLevel=GML
			if(mob.notifysave&&mob.afk_time<5) src<<"<font color=red>Game Saved."
mob
	proc
		Auto_Save()
			set background = 1
			while(src&&src.client)
				src.client.Save_1()
				src.afk_time ++
				src.safe=0
				for(var/area/house/S in view(0)) src.safe=1
				sleep(900)