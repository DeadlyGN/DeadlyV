mob/learn
	verb
		Dragon_Scan()
			set category = "Techniques"
			for(var/obj/Dragonballs/B in EarthBalls)
				if(B.x==0||B.y==0||B.z==0) src<<"<font color = red>[B.name]: </font> [B.loc]"
				else src << "<font color = red>[B.name]: </font> [B.x], [B.y], [B.z]"
		Black_Star_Scan()
			set category = "Techniques"
			for(var/obj/Dragonballs/B in BSBalls)
				if(B.x==0||B.y==0||B.z==0) src<<"<font color = gray>[B.name]: </font> [B.loc]"
				else src << "<font color = gray>[B.name]: </font> [B.x], [B.y], [B.z]"
		All_Star_Scan()
			set category = "Techniques"
			for(var/obj/Dragonballs/B in ASBalls)
				if(B.x==0||B.y==0||B.z==0) src<<"<font color = aqua>[B.name]: </font> [B.loc]"
				else src << "<font color = aqua>[B.name]: </font> [B.x], [B.y], [B.z]"
		Namekian_Scan()
			set category = "Techniques"
			for(var/obj/Dragonballs/B in NamekBalls)
				if(B.x==0||B.y==0||B.z==0) src<<"<font color = lime>[B.name]: </font> [B.loc]"
				else src << "<font color = lime>[B.name]: </font> [B.x], [B.y], [B.z]"