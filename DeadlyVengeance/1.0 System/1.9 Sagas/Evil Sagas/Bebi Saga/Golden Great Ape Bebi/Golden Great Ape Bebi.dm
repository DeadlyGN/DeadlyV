mob
	Saga
		Gold_Great_Ape
			name = "{Saga} Gold Ape Bebi"
			desc = "Bebi, whom has infected Vegeta; has transformed into the Great Gold Ape."
			icon = 'Golden Ape.dmi'
			powerlevel = 5000000000
			powerlevel_max = 5000000000
			ki = 600000000
			ki_max = 600000000
			speed = 4
			strength = 400000000
			defence = 200000000
			critical = 20
			karma = "Evil"
			race = "Tuffle/Saiyan"
			level = 150
			zenni = 500
			pk = 1
			exp = 7500
			tnl = 7500
			New()
				.=..()
				src.overlays = null
				src.overlays += new /obj/Overlays/Golden_top/Ape_Head
				src.overlays += new /obj/Overlays/Golden_bottom/Ape_Body
				return .