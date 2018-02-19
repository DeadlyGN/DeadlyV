mob
	var/tmp/GravStrain=0
	proc
		Gravity_Strain()
			if(src.GravStrain) return
			src.GravStrain=1
			while(src.grav != 0)
				var/success = rand(1,6)
				var/expgain=grav
				expgain*=9.8
				if(prob(5)) src.fatigue += round(rand(2,3)*(src.grav/5))
				if(success == 1 || success == 2  || success == 5)
					src<< "You feel the gravity pull down on you."
					src.Damage(src.grav * (rand(1000,25000)))
				if(success == 3)
					src<< "You feel yourself getting use to the gravity."
					src.Damage(src.grav * (rand(200,7000)))
				if(success == 4 || success == 6)
					src<< "You feel the full force of the gravity"
					src.Damage(src.grav * (rand(2000,50000)))
				src.beingattacked=0
				if(src.powerlevel <= 0)
					src.GRAVITYDeath()
					src.grav = 0
				if(src.powerlevel >= 1)
					src.Gain_Exp(expgain)
				sleep(40)
			src.GravStrain=0