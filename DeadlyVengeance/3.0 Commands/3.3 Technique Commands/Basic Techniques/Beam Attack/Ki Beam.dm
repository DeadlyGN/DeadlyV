//YOUR BASIC KI BEAM ATTACK


mob/learn
	verb/Ki_Beam()
		set category = "Techniques"
		var/ki_cost = round(src.ki_max * 0.23)
		if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
			src<< "You're already doing something!"
			return
		if(src.wrapped)
			src<< "Your ki has been contained in the goo!"
			return
		if(src.ki_lock)
			src<< "Cannot use this Technique at this time"
			return
		if(src.safe||src.dead)
			src<< "You're currently safe and cannot attack."
			return
		if(!src.pk)
			src<< "You're not a Combatant!"
			return
		for(var/area/house/S in view(4))
			src<< "They're in a Safe Zone!"
			return
		for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6))
			src<< "They're in a Safe Zone!"
			return
		for(var/turf/Planet_Gravitys/King_Kai/D in view(6))
			src<< "They're in a Safe Zone!"
			return
		if(prob(30))view(6) << "<font color=white>[src.name]: </font>Ha!"
		spawn() Beam()
		src.afk_time = 0
		src.ki -= ki_cost
	proc
		Beam()
			var/obj/Head = new/obj/Beams/Head()
			if(usr.dir == NORTH)
				Head.loc = locate(usr.x,usr.y+1,usr.z)
			if(usr.dir == SOUTH)
				Head.loc = locate(usr.x,usr.y-1,usr.z)
			if(usr.dir == WEST)
				Head.loc = locate(usr.x-1,usr.y,usr.z)
			if(usr.dir == EAST)
				Head.loc = locate(usr.x+1,usr.y,usr.z)
			Head.total = 10
			Head.dir = usr.dir
			Head.owner = usr






obj
	var
		mob/owner = null
		total = 0
		moved = 0
		list/Beam = list()
	Beams
		icon = 'Beam.dmi'
		density = 1
		Head
			icon_state = "head"
			New()
				spawn(1)
					Start()
					Check()
				..()
			proc
				Start()
					walk(src,usr.dir,1)
				Check()
					while(src)
						var/turf/T = get_step(src,src.dir)
						if(!T)
							owner.doing = 0
							owner.icon_state = ""
							owner.frozen = 0
							if(src)
								for(var/obj/O in src.Beam)
									del(O)
								del(src)
						sleep(1)
			Bump(atom/M)
				var/beam_damage = round(((owner.ki_skill / owner.ki_skill_max) * owner.level) + owner.powerlevel_max * 0.32)
//				if(istype(src, /mob/others/Dummy))
//					oview(8) << "<b>[src.owner]'s beam hits [M] for [beam_damage] damage!"
				if(isturf(M))
					owner.doing = 0
					owner.icon_state = ""
					owner.frozen = 0
					for(var/obj/O in src.Beam)
						del(O)
					del(src)
				else if(ismob(M))
					var/mob/Target = M
					var/absorb_max = round(Target.powerlevel_max)
					var/ki_absorbed = round(Target.ki_shield_strength - beam_damage)
					if(!Target.dead && !Target.safe && !Target.pk)
						if(prob(Target.reflect))
							owner.powerlevel -= round(beam_damage*2)
							owner<< "\red [Target.name] deflects your ki blast right back a you!"
							Target << "\green You deflect [owner.name]'s ki blast right back at them!"
							owner.BigKiDeathCheck()
							return
						else
							if(Target.ki_shield)
								if(ki_absorbed >=1)
									owner<< "<font color = #00C3ED>[Target]'s ki shield absorbed the attack's damage!"
									Target << "<font color = #00C3ED>Your ki shield absorbed [owner]'s attack!"
									beam_damage = round(ki_absorbed)
									Target.ki_shield_strength -= round(beam_damage)
								else
									if(Target.absorbing)
										if(absorb_max > beam_damage)
											Target << "\red [owner]'s attack hits you, but you managed to absorb the energy!"
											src<<"\red Your ki blast was absorbed by [Target]!"
											Target.gooda+=1
											Target.UTBA()
											Target.ki += beam_damage; if(Target.ki>Target.ki_max*1300){ Target.KiExplosion() }
											return
										else Target << "\red You tried to absorb [owner]'s ki blast, but it was too strong!"
						view(src.owner) << "[src.owner]'s beam hits [Target] for [beam_damage] damage!"
						Target.powerlevel -= beam_damage
						Target.BigKiDeathCheck()
						owner.doing = 0
						src.owner.icon_state = ""
						owner.frozen = 0
						for(var/obj/O in src.Beam)
							del(O)
						del(src)
					else
						if(!ismob(M) && !isturf(M) && !isobj(M) && !isarea(M))
							owner.doing = 0
							owner.icon_state = ""
							owner.frozen = 0
							for(var/obj/O in src.Beam)
								del(O)
							del(src)


		Body
			icon_state = "body"
			density = 1
	Move()
		if(istype(src,/obj/Beams/Head))
			var/obj/Body = new/obj/Beams/Body(src.loc)
			Body.owner = src
			src.Beam.Add(Body)
			Body.dir = src.dir
			moved++
			if(moved == total)
				owner.doing = 0
				owner.icon_state = ""
				owner.frozen = 0
				if(src)
					for(var/obj/O in src.Beam)
						del(O)
					del(src)
		..()

