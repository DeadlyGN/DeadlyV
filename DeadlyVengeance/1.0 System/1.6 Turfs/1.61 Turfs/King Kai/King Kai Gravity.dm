turf/Planet_Gravitys
	King_Kai
		Enter(mob/PC/M)
			if(ismob(M))
				if(M.powerlevel_max >= 15000)
					if(prob(10))
						M << "<b>You struggle a bit because of the gravity..."
						M.Gain_Exp(M.level/rand(60,1200))
					if(prob(7))
						M << "<b>You walk on this planet without a problem."
				if(M.powerlevel_max >= 5000 && M.powerlevel_max <= 15000)
					if(prob(15))
						M << "<B>You walk through the gravity of this planet without a problem."
					if(prob(5))
						M << "<b>You feel a little strained walking on this planet."
						M.Damage((M.level/rand(20,50000)))
					M.Gain_Exp(M.level/rand(120,1800))
					M.KO()
				if(M.powerlevel_max < 2500 && M.powerlevel_max >= 50)
					if(prob(7))
						M << "<B>You walk through the gravity of this planet without a problem."
					if(prob(10))
						M << "<b>You feel strained walking on this planet."
						M.Damage((M.level/rand(100,120000)))
					M.Gain_Exp(M.level/rand(160,2400))
					M.KO()
				if(M.powerlevel_max > 2500 && M.powerlevel_max <= 5000)
					if(prob(5))
						M << "<B>You walk on the planet, feeling strained.."
						M.Damage((M.level/rand(0,30000)))
					if(prob(5))
						M << "<b>You feel extremely strained walking on this planet."
						M.Damage((M.level/rand(150,220000)))
					M.Gain_Exp(M.level/rand(200,3000))
					M.KO()
			.=..()
			return .