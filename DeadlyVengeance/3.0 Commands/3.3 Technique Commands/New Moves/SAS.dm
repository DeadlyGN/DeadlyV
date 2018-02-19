obj/Star/icon = 'Stars.dmi'
mob/learn/Namek
	verb
		Shooting_All_Star(mob/M in oview(7))
			set category = "Techniques"
			if(M.tourny||Contenders.Find(M)||Contenders.Find(src))
				src<<"A force prevents you from attacking [M]"
				return
			if(M.safe||M.dead)
				src<<"[M] is currently safe!"
				return
			for(var/area/house/S in view(4,M))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6,M))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/King_Kai/D in view(6,M))
				src<< "They're in a Safe Zone!"
				return
			if(!M.pk)
				src<<"[M] is NOT a combatent"
				return
			if(!src.pk)
				src<<"You're not a combatent"
				return
			if(src.monkey) return
			var/ki_damage = round((10000000 * src.level) + src.ki_max * 1.14+(10000000 * src.level))
			var/ki_cost = src.ki_max
			if(src.ki >= ki_cost)
				if(!src.doing)
					src.ki_lock = 1
					spawn(10) src.ki_lock = 0
					if(!src.doing) src.doing ++
					src.ki -= ki_cost
					view(6) << "<font color = white>[src]:</font> FOOL HOW DARE YOU ATTACK ME NOW YOU DIE!!!"
					sleep(30)
					view(6) << "<font color = white>[src]:</font> SHOOTING..."
					sleep(15)
					view(6) << "<font color = white>[src]:</font> ALL STAR!!!"
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					if(!M||M.safe||M.dead||M.tourny||Contenders.Find(M)||Contenders.Find(src))
						src.doing=0
						src.frozen=0
						return
					for(var/turf/T in view(src,8))
						var/chance = roll(1,8)
						if(chance == 6) missile(new/obj/Star, T, M)
					M.Damage(ki_damage)
					M.BigKiDeathCheck(src)
			src.afk_time = 0
mob/var
 Godly_charge = 'DodonRayCharge.dmi'
 Godly_lock = 0
mob/learn
	verb
		Godly_Blast(mob/PC/M in oview(7))
			set name = "Godly Blast"
			set category = "Techniques"
			src.afk_time = 0
			var/ki_cost = round(src.ki_max * 0.8)
			if(src.doing||!M.pk||src.safe||src.dead||src.monkey) return
			if(M.tourny||Contenders.Find(M)||Contenders.Find(src))
				src<<"A force prevents you from attacking [M]"
				return
			if(M.safe||M.dead)
				src<<"[M] is currently safe!"
				return
			for(var/area/house/S in view(4,M))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6,M))
				src<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/King_Kai/D in view(6,M))
				src<< "They're in a Safe Zone!"
				return
			if(!M.pk)
				src<<"[M] is NOT a combatent"
				return
			if(!src.pk)
				src<<"You're not a combatent"
				return
			if(src.ki >= ki_cost)
				if(!src.doing)
					src.ki_lock = 1
					M.overlays += Godly_Blast
					spawn(70) src.ki_lock = 0
					if(src.doing)return
					if(!src.doing) src.doing ++
					M.frozen = 0
					src.ki -= ki_cost
					src.overlays += Godly_charge
					view(7) << "<font color = red>[src]:</font> Feel my wrath [M]!!!!"
					sleep(27)
					src.overlays -= Godly_charge
					spawn(5) if(src.doing) src.doing --
					M.overlays -= Godly_Blast
					spawn(5) src.frozen = 0
					spawn(150) src.Godly_lock = 0
					if(!M||M.safe||M.dead||M.tourny||Contenders.Find(M)||Contenders.Find(src))
						src.doing=0
						src.frozen=0
						return
					M.Damage(src.powerlevel/1.5)
					M.ki -= src.ki/1.5
					M.fatigue = 0
					M.BigKiDeathCheck(src)
obj/tech/Godly_Blast
	icon = 'FREEZE.dmi'
mob/learn/AllStar
	verb
		ASK()
			set name = "All Star Kame"
			set category = "Techniques"
			if(src.tourny||src in Contenders||Contenders.Find(src))
				src<<"You cannot use this inside a tournament."
				return
			if(!src.pk)
				src<<"You're not a combatent"
				return
			if(src.doing||src.safe||src.dead||src.monkey) return
			spawn(2) ASK_Shoot()
			src.afk_time = 0
mob/proc/ASK_Shoot()
	if(!src.doing)
		if(src.doing||src.buku||src in Contenders||Contenders.Find(src))return
		src.doing ++
		src.ki_lock = 1
		var/ASKcharge = new/obj/tech/ASKcharge
		src.overlays += ASKcharge
		view(6) << "<font color = white>[src]:</font> All Star..."
		sleep(16)
		view(6) << "<font color = white>[src]:</font> Kamehame-"
		sleep(16)
		view(6) << "<font color = white>[src]:</font> HA!!!"
		spawn(5) if(src.doing>0) src.doing --
		spawn(5) src.frozen = 0
		src.frozen = 0
		src.ki_lock = 0
		src.overlays -= ASKcharge
		var/obj{H = new/obj/tech/ASK(src); W = new/obj/tech/ASK(src); R = new/obj/tech/ASK(src); U = new/obj/tech/ASK(src); Y = new/obj/tech/ASK(src); E = new/obj/tech/ASK(src); B = new/obj/tech/ASK(src); G = new/obj/tech/ASK(src);}
		H.dir = NORTH
		W.dir = SOUTH
		R.dir = EAST
		U.dir = WEST
		Y.dir = NORTHEAST
		E.dir = NORTHWEST
		B.dir = SOUTHEAST
		G.dir = SOUTHWEST
		..()
obj/tech/
	ASK
		icon = 'ASK.dmi'
		density = 1
		New(mob/O)
			..()
			src.ki_damage = max(1,round((480000 * O.level) + O.ki_max * 3))
			src.loc=O.loc
			src.Oowner=O
			walk(src,dir)
		Del()
			Explode(new /Effect/BasicBoom(src.loc,1,3))
			/*for(var/mob/m in ExplodeDamage(src.loc,5,round(src.ki_damage/5)))
				if(src.Oowner!=m) m.BigKiDeathCheck(src.Oowner)*/
			..()
		Bump(atom/A)
			if(ismob(A))
				var/mob/M = A
				if(M == src.Oowner)
					del src
					return
				var/mob/O = src.Oowner
				if(!M.pk||M.safe||M.dead) del src
				for(var/area/house/S in view(0,M)) del src
				if(src.ki_damage>=M.powerlevel)
					view(O,8) << "<b><font color = red>[O] killed [M] with their All Star Kame with [src.ki_damage] damage!"
				else view(O,8) << "<b><font color = red>[O] hit [M] with their All Star Kame for [src.ki_damage] damage!"
				M.Damage(ki_damage)
				spawn() M.SmallKiDeathCheck(O)
				del src
			//if(istype(A,/obj/tech/)||(isobj(A)&&A:density)) del src
			del src
			return ..()
		Move(atom/A)
			.=..()
			/*var/turf/T=locate(NewLoc)
			var/obj/O=locate(NewLoc)
			if(((T&&T.density)||(O&&O.density))&&!istypemulti(T,/turf/Island_Edge/,/turf/Namek_Island_Edge/))
				del(src)
			for(var/mob/M as mob in T)
				if(M == src.Oowner) del src
				var/mob/Oz = src.Oowner
				if(!M.pk||M.safe||M.dead) del src
				for(var/area/house/S in view(0,M)) del src
				if(src.ki_damage>=M.powerlevel)
					view(Oz,8) << "<b><font color = red>[Oz] killed [M] with their All Star Kame with [src.ki_damage] damage!"
				else view(Oz,8) << "<b><font color = red>[Oz] hit [M] with their All Star Kame for [src.ki_damage] damage!"
				M.Damage(src.ki_damage)
				M.SmallKiDeathCheck(Oz)
				del src
			if(O&&O!=src&&(istype(O,/obj/tech/)||(isobj(O)&&O.density))) del src*/
			var/O2 = new/obj/trail/ASKtrail(src.loc)
			O2:icon_state = "trail"
			O2:dir = src.dir
			return ..()
obj/trail/ASKtrail
	icon = 'ASK.dmi'
obj/var/mob/{Oowner}
obj/tech/ASKcharge
	icon = 'ASK.dmi'
	icon_state = "charge"
	layer = 10
obj/tech/ArkBlast
	icon='Arkfeild.dmi'
	icon_state="ark7"
	layer=80
mob/learn/
	verb/ArkBlast()
		set category = "Techniques"
		if(src.tourny) {src<<"You cannot use this in a tournament!"; return}
		if(src.ki<=1000) return
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(src.safe||src.dead)
			src<< "You're currently safe and cannot attack."
			return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.ki_lock)
			src<< "Cannot use this Technique at this time"
			return
		if(src.geno_lock)
			src<< "You're recovering from your last blast..."
			return
		if(!src.pk)
			src<< "You're not a Combatant!"
			return
		if(src.monkey)
			src<<"You cannot use this whilist in oozaru."
			return
		var/list/l=new()
		for(var/mob/M in view())
			if(istype(M,/mob/AI/)||!M.pk||M.dead||M.safe||src==M) continue
			l.Add(M)
		var/dam=(src.ki)
		if(l.len) dam=round(dam/l.len)
		for(var/mob/M in l)
			if(!src.ki) continue
			spawn()
				missile(/obj/tech/ArkBlast/,src,M)
				M.Damage(dam)
				M.BigKiDeathCheck(src)
				src.ki-=dam
			sleep(1)
		l=null