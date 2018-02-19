mob/AI/
	Supreme_Kai
		name = "{NPC} Supreme Kai"
		icon = 'Supreme Kai.dmi'
		energy_code = 3317954
		verb/Talk()
			set src in oview(1)
			set category = null
			var/talk = input("King Kai: What do you need, [usr.name]?","") in list ("I want to go to King Kai's","Never Mind")
			switch(talk)
				if("I want to go to King Kai's")
					usr<< "<font color = white>Supreme Kai:</white> Very well"
					usr.loc = locate(105,92,8)