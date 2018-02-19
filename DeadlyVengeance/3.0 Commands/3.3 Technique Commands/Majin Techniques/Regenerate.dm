mob/var/tmp
	regen_dead = 0
	regenerating = 0
obj/Techniques/Majin/Regenerate
	verb/Regenerate()
		set category = "Techniques"
		if(usr.dead)
			usr<< "Your body was completely destroyed. You cannot regenerate it!"
			return
		if(usr.regenerating) return
		if(usr.regen_dead)
			spawn() usr.Majin_Regenerate()
			usr.overlays -= halo
		else usr<< "You're not dead, there is no reason to regenerate!"
		usr.afk_time = 0
mob/proc/Majin_Regenerate()
	var/healing = src.powerlevel_max/9
	src.frozen = 1
	if(!src.doing) src.doing ++
	src.regenerating = 1
	src.Icon_State("regenerate")
	spawn(rand(60,300)) if(src.regenerating)
		src<< "<font size = -1><B>You were unable to fully regenerate!"
		src.regenerating = 0
	while(src.regenerating)
		src.powerlevel += healing
		if(src.powerlevel >= src.powerlevel_max)
			src<< "<font size = -1><B>You feel totally regenerated!"
			src.powerlevel = src.powerlevel_max
			src.regenerating = 0
		sleep(20)
	if(src.doing) src.doing --
	src.frozen = 0
	src.Icon_State("")
	src.buku = 0
	src.regen_dead = 0
	src.kaioken = 0
	src.it_lock = 0
	src.ki_lock = 0
	src.buku_lock = 0
	src.attack_lock = 0