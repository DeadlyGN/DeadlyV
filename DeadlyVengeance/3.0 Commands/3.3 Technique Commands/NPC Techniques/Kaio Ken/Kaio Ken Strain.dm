mob/proc/Kaio_Strain()
	var/kaio_strain
	if(src.powerlevel >= 10000000) kaio_strain = rand(0,1)
	if(src.powerlevel <= 10000000) kaio_strain = rand(1,2)
	if(src.powerlevel <= 4500000) kaio_strain = rand(2,4)
	if(src.powerlevel <= 1000000) kaio_strain = rand(3,5)
	if(src.fatigue > src.fatigue_max) src.fatigue = src.fatigue_max
	while(src.kaioken)
		src.fatigue += kaio_strain * src.level
		if(src.fatigue >= src.fatigue_max)
			view(6) << "<font size = -1><B><font color = red>[src]'s collapses from the strain of Kaioken!"
			src.kaioken = 0
			src.sight |= BLIND
			src.underlays -= kaio_aura
			if(src.powerlevel>src.powerlevel_max) src.powerlevel=src.powerlevel_max
			if(src.strength>src.strength_max) src.strength=src.strength_max
			sleep(100)
			src.sight &= ~BLIND
		sleep(35)
	src.kaioken = 0
	spawn() src.Power_Redefine()