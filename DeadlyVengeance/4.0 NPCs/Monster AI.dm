var/NPCMulti=10000
proc/create(var/Typ as text,var/turf/Trf as turf)
	spawn(280)
		var/Typ2=text2path(Typ)
		new Typ2(Trf)
mob/Monster
	var/tmp/mob/PC/P
	var/tmp/turf/spawnin
	var/tmp/special=/mob/
	pk=1
	//auto_kill=1
	New()
		spawnin=locate(x,y,z)
		if(NPCMulti)
			Level_Up(NPCMulti*10)
			Power_Redefine()
		src.CreateName()
		Monsters+=src
		spawn() Wander()
		..()
	Del()
		if(spawnin)
			var/MType=type
			var/turf/NLoc=spawnin
			create("[MType]",NLoc)
			NPCMulti++
		Monsters-=src
		..()
	Bump(mob/M)
		if(istype(M,/mob/PC)) Attack2(M)
		return ..()
	proc
		Wander()
			.=..()
			while(src&&src.pk)
				var{Found = FALSE; powering_up = 0;}
				for(P in oview(7))
					if(!P.pk)continue
					//if((istypemulti(P,/mob/Monster/,/mob/PC/))&&(P.maker||P.owner||P.client)&&P.pk)
					if(level>=11250 && powerlevel < powerlevel_max * 0.1 && powering_up < 3)
						powering_up ++
						step_away(src,P)
						src.powering = 1
						if(!src.doing) src.doing ++
						src.Icon_State("enrage")
						src.overlays += src.aura
						src.Powering_PL()
						break
					else
						if(!attacker||attacker == P)
							if(P in get_step(src,get_dir(src,P))){ Attack2(P); if(src.buku){call(src,"Land")()};}
							else
								if(!step_to(src,P,1)||P.buku){call(src,"Flight")()}
								if(!get_dist(src,P)<=1&&dir<5) Ki_Blast_Shoot()
							Found = TRUE
							break
					/*step_towards(src,P)
					if(P in oview(1))continue
					else src.Ki_Blast_Shoot()
					Found = TRUE
					break*/
				if(Found != TRUE){ sleep(18); if(src.loc!=src.spawnin){if(!step_to(src,spawnin)){call(src,"Flight")()}}else{ call(src,"Land")() }; }
				sleep(round(speed,0.1))
		Attack2(mob/M)
			dir=get_dir(src,M)
			var/text = ""
			text = "\red [src] [pick("punches","kicks")] you in the [pick("face","chest","side","stomach")]"
			if(!M||src.attack_lock||src.cooldown||M.safe||M.dead||M.KO||(M == src && src == M)) return
			var/attack_power = round(src.strength + (src.powerlevel/6))
			var/defence_power = M.defence
			var/damage = attack_power - defence_power
			if(damage < 1) damage = 1
			if(M.type == /mob/PC)
				if(!src.cooldown)
					src.Flick("attack")
					if(prob(M.dodge)) M.Flick("IT")
					else
						if(prob(M.block)) damage = round(damage/4)
						else
							if(prob(usr.critical))
								M << "[text]"
								damage = round(damage*2.5)
							else M << "[text]"
					M.attacker(src)
					M.Damage(damage)
					M.DeathCheck(src)
					src.cooldown = 1
					spawn(src.speed * 2) src.cooldown = 0