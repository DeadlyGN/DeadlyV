mob/var/clones2=0
mob/AI/Popo
	icon = 'popo.dmi'
	name = "{NPC} Mr.Popo"
	layer = 8
	it_blocked=1
	energy_code = 6574567
	verb/Talk()
		set category = null
		set src in oview(1)
		if(usr.clones2)return
		usr<<'Popo.wav'
		if(usr.powerlevel <= usr.powerlevel_max/2)
			usr<< "<font color = #0066FF>Popo:  much better!"
			sleep(25)
			usr.powerlevel = usr.powerlevel_max
			if(usr.ki <= usr.ki_max)
				usr.ki=usr.ki_max
			usr.fatigue = 0
			usr<< "<font color = white>Popo:</font> Now don't get hurt like that again [usr.name]!"
			return
		switch(alert(usr,"How may I be of assistence?","Popo","Spar Battle","Nothing"))
			if("Spar Battle")
				usr<<"<font color=white>Popo: </font>Bitch, I ain't goin no where."
				usr<<'PopoB.wav'
				var/mob/Monster/Clone_Simulator_NPC/N = new
				N.maker = usr
				usr.clones2=1
				N.loc = locate(usr.x,usr.y-1,usr.z)
				N.icon = usr.icon
				N.level = usr.level
				N.powerlevel = usr.powerlevel
				N.ki = usr.ki
				N.strength = usr.strength
				N.defence = usr.defence
				N.name = "[usr.name]'s Clone"
				N.spawnin = null
			if("Nothing")
				usr<<"<font color=white>Popo: </font>Don't be wastin' my time."