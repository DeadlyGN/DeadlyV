mob/proc/Transformation_Strain()
	set background = 1
	if(src.form=="")return
	var/drain = src.ki_max * (src.upkeep / 100)
	if(src.race == "Saiyan" || src.race == "Half Saiyan")
		if(src.ascended_ssj) drain = 0
		if(src.form=="Ultra Super Saiyan")
			drain = src.ki_max * (src.upkeep / 100)
		if(src.form==("Super Saiyan 2"||"Super Saiyan 2 (Ascended)"))
			drain = src.ki_max * (src.upkeep / 100)
		if(src.form==("Super Saiyan 3"||"Mystic"))drain *= 2
		if(src.form=="Super Saiyan 4") drain *= 3
	if(src.ki > 0)
		src.ki -= round(drain)
		if(src.ki <= (src.ki_max * 0.05))
			src<< "You start to feel low on Ki"
		spawn(50) src.Transformation_Strain()
	else
		src.ki = 0
		src<< "The strain of your Transformation overcomes you"
		src.Force_Revert()
		if(src.rest) src.rest = 0
		if(src.buku)spawn(17)
			src.Icon_State("flight")
			src.buku = 1
			src.density = 0
			if(!src.doing) src.doing ++
		src.trans_delay = 1
		spawn(350) src.trans_delay = 0