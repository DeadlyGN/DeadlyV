mob/var/
 ch_distructo_disk = 'Distructo Disk Charge2.dmi'
 disk_lock = 0
mob/learn/Changling
	verb
		Changling_Distructo_Disk(mob/M in oview(7))
			set name = "Kienzan Disk"
			set category = "Techniques"
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)
				src<< "You're already doing something!"
				return
			if(!M||M.safe||M.dead||M.tourny)
				src<< "A force stops you from attacking [M]"
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
			if(src.disk_lock)
				src<< "You're recovering from your last blast..."
				return
			if(!M.pk)
				usr<< "[M] Must be a combatant to engage in combat with players!"
				return
			if(!src.pk)
				usr<< "You're not a Combatant!"
				return
			for(var/area/house/S in view(4,M))
				usr<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6,M))
				usr<< "They're in a Safe Zone!"
				return
			for(var/turf/Planet_Gravitys/King_Kai/D in view(6,M))
				usr<< "They're in a Safe Zone!"
				return
			src.afk_time = 0
			var/ki_damage = round(((usr.ki_skill / usr.ki_skill_max) * usr.level) + usr.powerlevel_max * 0.15)
			var/ki_cost = round(src.ki_max * 0.72)
			if(src.ki >= ki_cost)
				if(!src.doing)
					src.ki_lock = 1
					spawn(70) src.ki_lock = 0
					if(!src.doing) src.doing ++
					src.ki -= ki_cost
					src.overlays += ch_distructo_disk
					view(6) << "<font color = white>[src]:</font> Kienzan..."
					sleep(16)
					view(6) << "<font color = white>[src]:</font> DISK..."
					sleep(15)
					view(6) << "<font color = white>[src]:</font> HA!!!"
					src.overlays -= ch_distructo_disk
					spawn(5) if(src.doing) src.doing --
					spawn(5) src.frozen = 0
					missile(new/obj/CH_Distructo_Disk, usr, M)
					spawn(150) src.disk_lock = 0
					if(!M||M.safe||M.dead||M.tourny)
						src.doing=0
						src.frozen=0
						return
					if(prob(4))
						M.Damage(M.powerlevel)
						M << "\red [usr.name]'s Kienzan Disk slices through your Chest!"
					else
						M.Damage(round(ki_damage))
						M << "\red [usr.name]'s Kienzan Disk slices into you"
					M.SmallKiDeathCheck(src)
					if(src.doing) src.doing --
					src.frozen = 0
					if(M.has_tail)if(prob(35))
						M << "\red [src.name]'s Kienzan Disk has sliced your tail off!"
						M.overlays -= M.tail
						M.has_tail=0
						M.tail_cut++
						if(M.monkey) M.oozaru_break()
						spawn(2000) M.apply_tail()
obj/CH_Distructo_Disk
	icon = 'Distructo Disk2.dmi'