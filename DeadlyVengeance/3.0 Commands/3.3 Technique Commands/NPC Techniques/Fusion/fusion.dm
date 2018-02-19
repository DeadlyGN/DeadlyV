mob
	var
		fused = 0
		follow
		oldname = ""
		oldchrom = ""
		oldmax = 1
		oldki = 1
		oldstr = 1
		olddef = 1
		oldicon
		oldlevel = 1
		oldexp = 1
		tmp/turf/oldloc
		tmp/fusing = 0
		tmp/fusedw = ""
mob/learn
	verb
		Fuse(mob/M in oview(1))
			set category = "Techniques"
			set name = "Fusion Dance"
			if(src.monkey||M.monkey)
				src<<"You cannot use this whilist in oozaru."
				return
			if(src.powerlevel_max > 150000 && M.powerlevel_max > 150000 && M.fused == 0 && src.fused == 0 && src.powerlevel == M.powerlevel && src.race == M.race)
				switch(alert(M,"[src] wants to perform the Fusion Dance with you!  Do you want to perform the Fusion Dance with [src]?  It lasts until the one of you clicks un-fuse and since [src] is starting the dance, they will control the fusion! Fuse?","Attempted Fusion","Yes","No"))
					if("Yes")
						if(!src.fusing&&!src.tourny||!M.fusing&&!M.tourny||!src.fused||!M.fused)
							src.fusing = 1
							M.fusing = 1
							src.fusion()
							M.fusion()
							var/lead = copytext(src.name,1,5)
							var/load = copytext(M.name,6)
							var/icon/combinedicon=src.icon+M.icon
							src.powerlevel_max += M.powerlevel_max
							src.ki_max += M.ki_max
							src.strength_max += M.strength_max
							src.defence_max += M.defence_max
							view(6) <<'fusion.wav'
							view(6) << "<font face = arial><tt>---===Fuuuu.......SION!...... HA!!!===---"
							M.client.show_verb_panel = 0
							M.icon = ""
							M.powerlevel_max =1
							M.ki_max = 1
							M.strength = 1
							M.defence = 1
							M.name = "[load][lead]"
							src.name = "[lead][load]"
							M.follow = src
							M.loc=locate(0,0,0)
							M.client.eye = src
							M.client.perspective = 255
							spawn()M.overlays.Cut()
							M.fused = 1
							src.fused = 1
							M.fusedw = "[src.name]"
							src.fusedw = "[M.name]"
							src.icon=combinedicon
							if(src.race=="Demon"&&M.race=="Demon")
								if(src.chromosome!=M.chromosome&&(M.chromosome&&src.chromosome)!="Chaos")
									src.chromosome="Chaos"
								else if((src.chromosome||M.chromosome)=="Chaos")
									if(src.chromosome=="Chaos")
										src.chromosome=M.chromosome
									if(M.chromosome=="Chaos")
										M.chromosome=src.chromosome
							sleep(50)
							view(6) << "[M.oldname] and [src.oldname] fuse to make [lead][load]!!!"
							src.verbs += /mob/learn/verb/End_Fusion
							M.verbs += /mob/learn/verb/End_Fusion
							spawn(3000)
								src.fuse_break()
								M.fuse_break()
					if("No")
						src<< "[M] doesn't want to fuse!"
						..()
			else
				src<< "You can't do this something isn't right... Are your strong enough? Is your powerlevel alined? Are you sure you're the same species?"
mob/learn
	verb
		End_Fusion()
			set category = "Techniques"
			src.ForceEndFusion()
mob/proc
	ForceEndFusion()
		if(!src.fused) return
		for(var/mob/M in players)
			if(M.name!=src.fusedw) continue
			M.fuse_break()
			if(M.loc==locate(0,0,0)) M.loc=locate(src.x+1,src.y,src.z)
			else src.loc=locate(M.x-1,M.y,M.z)
		src.fuse_break()
	fusion()
		oldname = name
		oldchrom = chromosome
		oldmax = powerlevel_max
		oldki = ki_max
		oldstr = strength_max
		olddef = defence_max
		oldicon = icon
		oldlevel = level
		oldexp = tnl
		fused = 1
		client.Save_1()
	fuse_break()
		name = oldname
		chromosome = oldchrom
		if(oldmax) powerlevel_max = oldmax
		if(oldki) ki_max = oldki
		client.eye=src
		if(oldstr) strength_max = oldstr
		if(olddef) defence_max = olddef
		icon = oldicon
		level = oldlevel
		tnl = oldexp
		powerlevel = powerlevel_max
		ki = ki_max
		strength = strength_max
		defence = defence_max
		speed = speed_max
		fused = 0
		fusing = 0
		follow = ""
		fusedw = ""
		frozen = 0
		buku_lock = 0
		client.show_verb_panel = 1
		overlays -= goku_hair_ssj
		overlays -= vegeta_hair_ssj
		overlays -= trunks_long_hair_ssj
		overlays -= hair_ssj3
		overlays -= hair_ssj4
		if(src.has_tail) overlays += tail
		Hair_Apply()
		Skin_Apply()
		src<< "Your fusion has come undone!!"
		view(6) << 'brake.wav'
		client.Save_1()
		//updateHealth()
		//updateki()
		//updateexp()
		verbs -= new/mob/learn/verb/End_Fusion