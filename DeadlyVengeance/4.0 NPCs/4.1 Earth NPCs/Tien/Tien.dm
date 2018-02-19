mob/var/learn_kiai = 0
mob/AI/Tien
	icon = 'Tien.dmi'
	name = "{NPC} Tien"
	energy_code = 8876976
	verb/Talk()
		set category = null
		set src in oview(1)
		if(!usr.learn_kiai)
			usr<< "<font color = white>Tien:</font> Hello, [usr]. wanna learn how to knock someone back with your mind?"
			sleep(15)
			switch(alert(usr,"Do you wish to learn Kiai?","Learn Technique","Yes","No"))
				if("Yes")
					if(usr.level >= 20000 && usr.tp >= 5000)
						usr.learn_kiai = 1
						usr.tp -= 5000
						usr<< "<center><font color = white> .:: You learn Kiai ::.</font></center>"
						sleep(20)
						usr<< "<font color = white>Tien:</font> You can now use Kiai. Use it to push your Enemies back!"
						usr.verbs += new/mob/learn/verb/Kiai
					else usr<< "<font color = white>Tien:</font> You'ren't quiet ready for my teachings."
		else usr<< "<font color = white>Tien:</font> [usr.name], you've already learned my teachings?"