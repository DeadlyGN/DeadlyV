mob/var/tmp/not_following = 0
mob
	Monster
		Cell_Jr
			icon = 'Cell Jr.dmi'
			powerlevel = 0
			powerlevel_max = 1
			ki = 0
			ki_max = 1
			speed = 1
			strength = 0
			defence = 0
			critical = 0
			karma = "Evil"
			race = "Bio Android"
			zenni = 40
			New()
				..()
				Pets.Add(src)
			Del()
				Pets.Remove(src)
				..()
			Wander()
				while(!src.not_following)
					/*if(src.owner.attacker)
						if(src.owner.attacker in get_step(src,get_dir(src,src.owner.attacker))){ Attack2(src.owner.attacker); if(src.buku){call(src,"Land")()};}
						else
							if(!step_to(src,src.owner.attacker,1)||src.owner.attacker.buku){call(src,"Flight")()}
							if(!get_dist(src,src.owner.attacker)<=1&&dir<5) Ki_Blast_Shoot()
					else*/
					if(owner in get_step(src,get_dir(src,owner))){ if(src.buku){call(src,"Land")()};}
					else if(!step_to(src,owner,1)||owner.buku){call(src,"Flight")()}
					sleep(speed)
				return FALSE
			verb/Toggle_Following()
				set category = null
				set src in view(1)
				if(src.owner==usr)
					if(src.not_following)
						usr<< "This Cell Jr is now following you."
						src.not_following = 0
						spawn() src.Wander()
					else
						usr<< "This Cell Jr is no longer following you"
						src.not_following = 1