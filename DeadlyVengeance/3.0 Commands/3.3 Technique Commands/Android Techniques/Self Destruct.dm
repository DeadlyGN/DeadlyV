mob/var/tmp/going_boom = 0
mob/learn
	verb
		Self_Destruct()
			set category = "Techniques"
			var/damage = (src.powerlevel+src.ki) * 100
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
			for(var/obj/O in src.contents)
				if(istype(O,/obj/Dragonballs))
					src<<"You cannot self destruct with a dragonball!"
					return
			if(src.powerlevel_max < 100)
				src<< "Your body isn't strong enough to sustain anymore damage!"
				return
			if(src.safe||src.dead)
				src<< "You're currently safe and cannot attack."
				return
			if(!src.pk)
				src<< "You're not a Combatant!"
				return
			if(src.tourny)
				src<<"Not in a tournament!"
				return
			for(var/area/house/S in view(4,src))
				src<< "You're in a Safe Zone!"
				return
			if(src.race == "Android") damage = (src.powerlevel+src.ki) * 250
			switch(alert(usr,{"Do you wish to use your Self Destruct Technique?
NOTE: Using this will Damage your Circuitry (Maximum Powerlevel Down by 0.8%)"},"Self Destruct","Yes","No"))
				if("Yes")
					if(!src.going_boom&&!src.dead&&!src.safe)
						src.going_boom = 1
						if(istype(src,/mob/PC/))
							view(8) << "<font color = white>[src.name]:</font> Self Destruct Activated in: 5..."
							sleep(4)
							view(8) << "<font color = white>[src.name]:</font> Self Destruct Activated in: 4..."
							sleep(4)
							view(8) << "<font color = white>[src.name]:</font> Self Destruct Activated in: 3..."
							sleep(4)
							view(8) << "<font color = white>[src.name]:</font> Self Destruct Activated in: 2..."
							sleep(4)
							view(8) << "<font color = white>[src.name]:</font> Self Destruct Activated in: 1..."
						else
							view(8) << "<font color=green>[src.name]:</font> Boom! Buahahaha!"
							sleep(5)
						src.going_boom = 0
						for(var/area/house/S in view(2,src))
							if(S in oview(7))
								src<< "You're in a Safe Zone!"
								return
						Explode(new /Effect/BasicBoom(src.loc,1,5))
						for(var/mob/m in ExplodeDamage(src.loc,6,damage)) if(src!=m) m.SmallKiDeathCheck(src)
						src.SELFDESTRUCTDEATH()
mob/proc
	SELFDESTRUCTDEATH()
		..()
mob/Monster
	SELFDESTRUCTDEATH()
		spawn(2) del(src)
mob/PC
	SELFDESTRUCTDEATH()
		players << "<FONT color = red>Battle Information:<FONT color = White> [src] has blown themselves up!"
		src.Follower_Check()
		src.Drop_dbs()
		src.Basic_Death_vars()
		src.dead=0
		src.loc = locate(162,7,8)
		src.powerlevel = 50
		src.powerlevel_max -= (src.powerlevel_max * 0.008)
		src.sight &= ~BLIND
		src.deaths += 1
		src<< "You feel minor damage to your circuitry"
		src.android_dead = 1
		spawn(300) src.android_dead = 1
		..()