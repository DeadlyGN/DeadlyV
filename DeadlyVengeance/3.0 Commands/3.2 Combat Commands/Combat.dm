mob/var/tmp/
	safe = 0
	attacking
	beingattacked
mob
	proc
		Damage(N as num)
			if(!src.pk||src.dead||src.safe) return
			for(var/area/house/S in view(0,src)) if(istype(S,/area/house/)) return
			src.powerlevel -= max(1,min(round(N),src.powerlevel))
			src.beingattacked++
			spawn(100) if(src.beingattacked) src.beingattacked--
		attacker(mob/m as mob)
			src.attacker=m
			spawn(100) if(m&&src.attacker==m) src.attacker=null
mob/PC
	verb
		Attack(mob/M in get_step(src,src.dir))
			set category = "Combat"
			if(!M || src.doing || src.KO || src.cooldown || src.attack_lock || M.safe) return
			src.afk_time = 0
			if(M.dead)
				src<< "[M] is dead..."
				return
			if(!M.pk)
				src<< "They're not a combatant!"
				return
			if(!src.pk)
				src<< "You're not a combatant!"
				return
			if(src.safe||src.dead)
				src<< "You're currently safe and cannot attack!"
				return
			if(M.KO)
				if(src.auto_finish) call(src,"Finish")(M)
				else src<< "They're already knocked out. Finish them!"
				return
			if(src.wrapped)
				if(prob(40))
					src<< "<font color=fuchsia>Your arm gets stuck in the goo!"
					return
			for(var/obj/Equipment/weapon/Weighted_Swords/O1 in contents)
				if(O1.equiped) fatigue_max+=round(src.level/5)*weightsword
			for(var/obj/Equipment/weapon/AdvancedWeighted_Swords/O2 in contents)
				if(O2.equiped) fatigue_max+=round(src.level/5)*weightsword
			var/attack_power = src.strength + (src.unarmed*20) + (src.ki_max/4) + (src.strength_max*2)
			var/defence_power = M.defence + (M.unarmed*20) + (M.ki_max/2) + (M.defence_max*2)
			var/damage = 0
			var/combat_exp_bonus=10
			if(M.level/2<=src.level&&M.level>=src.level) combat_exp_bonus += M.level - src.level
			else combat_exp_bonus += 15
			var/armor_damage = (500 + src.level/3)
			if(combat_exp_bonus <= 0) combat_exp_bonus += 0
			var/text = ""
			text = "\red [src] [pick("punches","kicks")] you in the [pick("face","chest","side","stomach")]"
			if(!M) return
			if(M.type == /mob/PC)
				for(var/area/house/S in view(1,M))
					src<< "They're in a safe zone!"
					return
				if(M.safe)
					src<< "A force stops you from attacking [M]!"
					return
				if(M.dead && M.race != "Majin")
					src<< "You cannot attack [M] because they are dead!"
					return
				for(var/mob/Monster/Cell_Jr/C in Pets)
					if(C.owner == src)
						C.attacking = M
						walk_towards(C,M)
				for(var/mob/Monster/Split_form/A in Pets)
					if(A.maker == src)
						A.attacking = M
						walk_towards(A,M)
				if(prob(M.dodge/3))
					src.Flick("attack")
					M.Flick("IT")
					M << "\green You manage to dodge [src]'s attack"
					src<< "\green [M] manages to dodge your attack"
					src.cooldown = 1
					spawn(src.speed * 2) src.cooldown = 0
					return
				else
					if(prob(M.block/2))
						src.Flick("attack")
						M << "\green You manage to block some of [src]'s attack"
						src<< "\green [M] manages to block some of your attack"
						defence_power*=2.5
					else
						if(prob(M.counter/5))
							M.Flick("attack")
							M << "\green You manage to counter [src]'s attack"
							src<< "\green [M] manages to counter your attack and attacks back"
							src.Damage(attack_power/10+M.strength/4)
							spawn() src.KO()
							M.unarmed_exp += rand(5,20)
							spawn() M.UA_Level_Up()
							spawn() M.Gain_Exp(combat_exp_bonus,"Combat")
							src.cooldown = 1
							spawn(src.speed * 2) src.cooldown = 0
						else
							if(prob(src.critical/3))
								src.Flick("attack")
								M << "[text], which sends you flying back"
								src<< "\red You hit [M] with a critical hit, sending them flying back"
								var/FallDir = get_dir(src,M)
								src.dir = FallDir
								step(M,FallDir)
								switch(FallDir)
									if(NORTH)M.dir = SOUTH
									if(NORTHWEST)M.dir = SOUTHEAST
									if(WEST)M.dir = EAST
									if(SOUTHWEST)M.dir = NORTHEAST
									if(SOUTH)M.dir = NORTH
									if(SOUTHEAST)M.dir = NORTHWEST
									if(EAST)M.dir = WEST
									if(NORTHEAST)M.dir = SOUTHWEST
								M.frozen = 1
								M.doing ++
								spawn(10)
									M.frozen = 0
									if(M.doing) M.doing --
								if(M.saiyan_eq)
									if(prob(65))
										for(var/obj/Equipment/Chest/Saiyan_Battle_Armor/R in M.contents)
											R.condition -= armor_damage
											if(R.condition <= 0)
												M << "\red Your armor has been destroyed!"
												M.chest = "EMPTY"
												M.saiyan_eq =0
												M.overlays -= saiyan_armor
												del(R)
										M << "\white Your armor takes some of the damage!"
										attack_power *= 1.5
										if(M.level>=50000) attack_power -= round(5000000 + M.defence_max/2)
										else attack_power -= round(50000 + M.defence_max/2)
								else
									if(M.hench_eq)
										if(prob(65))
											for(var/obj/Equipment/Chest/Hench_Battle_Armor/V in M.contents)
												V.condition -= armor_damage
												if(V.condition <= 0)
													M << "\red Your armor has been destroyed!"
													M.chest = "EMPTY"
													M.hench_eq =0
													del(V)
											M << "\white Your armor takes some of the damage!"
											attack_power*=1.4
											if(M.level>=50000) attack_power -= round(2000000 + M.defence_max/2)
											else attack_power -= round(20000 + M.defence_max/2)
									else attack_power*=2.5
							else
								src.Flick("attack")
								M << "[text]"
								src<< "\red You hit [M]"
								if(M.saiyan_eq)
									if(prob(65))
										for(var/obj/Equipment/Chest/Saiyan_Battle_Armor/R in M.contents)
											R.condition -= armor_damage
											if(R.condition <= 0)
												M << "\red Your armor has been destroyed!"
												M.chest = "EMPTY"
												M.saiyan_eq =0
												M.overlays -= saiyan_armor
										M << "\white Your armor takes some of the damage!"
										attack_power*=0.5
										if(M.level>=50000) damage -= round(5000000 + M.defence_max/2)
										else damage -= round(50000 + M.defence_max/2)
								else
									if(M.hench_eq)
										if(prob(65))
											for(var/obj/Equipment/Chest/Hench_Battle_Armor/V in M.contents)
												V.condition -= armor_damage
												if(V.condition <= 0)
													M << "\red Your armor has been destroyed!"
													M.chest = "EMPTY"
													M.hench_eq =0
													M.overlays -= hench_armor
													del(V)
											M << "\white Your armor takes some of the damage!"
											attack_power*=0.4
											if(M.level>=50000) attack_power -= round(2000000 + M.defence_max/2)
											else attack_power -= round(20000 + M.defence_max/2)
			else
				if(prob(M.dodge/3))
					src.Flick("attack")
					M.Flick("IT")
					M.attacker(src)
					src<< "\green [M] manages to dodge your attack"
					spawn() src.Gain_Exp(combat_exp_bonus,"Combat")
					src.cooldown = 1
					spawn(src.speed * 2) src.cooldown = 0
					return
				else
					if(prob(M.block/2))
						src.Flick("attack")
						src<< "\green [M] manage to block some of your attack"
						attack_power/=4
					else
						if(prob(M.counter/6))
							M.Flick("attack")
							src<< "\green [M] manages to counter your attack and attacks back"
							src.Damage(round(damage/2+M.strength/2))
							spawn() src.KO()
							src.cooldown = 1
							spawn(src.speed * 2) src.cooldown = 0
							return
						else
							if(prob(src.critical/3))
								src.Flick("attack")
								M << "[text]"
								src<< "\red You hit [M] with a critical hit"
								damage*=1.5
							else
								src.Flick("attack")
								M << "[text]"
								src<< "\red You hit [M]"
			damage=max(attack_power-defence_power,1)
			M.attacker(src)
			M.Damage(damage)
			src.unarmed_exp += 12
			spawn() src.UA_Level_Up()
			spawn() src.Gain_Exp(combat_exp_bonus,"Combat")
			src.cooldown = 1
			spawn(src.speed * 2) src.cooldown = 0
			M.KO(src)