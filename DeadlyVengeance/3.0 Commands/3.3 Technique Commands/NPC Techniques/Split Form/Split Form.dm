mob/var/moving = 0
obj/Click()
	usr.afk_time = 0
	for(var/mob/Monster/S in Pets)
		if(S.maker == usr)
			if(S&&S.frozen)
				S.frozen = 0
				walk_towards(S,src)
				S.moving = 1
				spawn(11)
					S.frozen = 1
					S.moving = 0
			else walk_towards(S,src)
turf/Click()
	usr.afk_time = 0
	for(var/mob/Monster/S in Pets)
		if(S.maker == usr)
			if(S&&S.frozen)
				S.frozen = 0
				walk_towards(S,src)
				S.moving = 1
				spawn(11)
					S.frozen = 1
					S.moving = 0
			else walk_towards(S,src)
mob/Click()
	usr.afk_time = 0
	for(var/mob/Monster/S in Pets)
		if(S.maker == usr)
			if(S.frozen)
				if(S) S.frozen = 0
				walk_towards(S,src)
				if(S) S.moving = 1
				sleep(11)
				if(S) S.frozen = 1
				if(S) S.moving = 0
			else walk_towards(S,src)
mob
	Monster
		Split_form
			powerlevel = 0
			powerlevel_max = 1
			ki = 0
			ki_max = 1
			speed = 1
			strength = 0
			defence = 0
			critical = 0
			karma = ""
			race = ""
			level = 0
			zenni = 15
			frozen = 1
			New()
				..()
				Pets.Add(src)
			Del()
				Pets.Remove(src)
				..()
			Wander()
				while(!src.not_following)
					/*if(src.maker.attacker)
						if(src.maker.attacker in get_step(src,get_dir(src,src.maker.attacker))){ Attack2(src.maker.attacker); if(src.buku){call(src,"Land")()};}
						else
							if(!step_to(src,src.maker.attacker,1)||src.maker.attacker.buku){call(src,"Flight")()}
							if(!get_dist(src,src.maker.attacker)<=1&&dir<5) Ki_Blast_Shoot()
					else*/
					if(maker in get_step(src,get_dir(src,maker))){ if(src.buku){call(src,"Land")()};}
					else if(!step_to(src,maker,1)||maker.buku){call(src,"Flight")()}
					sleep(speed)
				return FALSE
			verb/Command_Split(mob/M in oview(1))
				set category = "Techniques"
				set src in oview(1)
				if(istype(M,/mob/PC)) Attack2(M)