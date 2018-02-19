mob/AI/Dende
	icon = 'Dende.dmi'
	name = "{NPC} Dende"
	it_blocked = 1
	energy_code = 6574567
	verb/Talk()
		set category = null
		set src in oview(1)
		if(usr.powerlevel <= usr.powerlevel_max)
			usr<< "<font color = white>Dende:</font> Oh [usr.name], you look hurt!"
			sleep(15)
			usr<< "<font color = #0066FF>Dende puts their hands over you for a moment and you begin feel much better!"
			sleep(25)
			usr.powerlevel = usr.powerlevel_max
			usr.fatigue = 0
			usr<< "<font color = white>Dende:</font> Now don't get hurt like that again [usr.name]!"
			return
		else
			usr<< "<font color = white>Dende:</font> Sorry [usr.name], I am currently busy..."
			return