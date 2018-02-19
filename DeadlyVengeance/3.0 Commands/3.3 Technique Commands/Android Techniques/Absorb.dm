mob/var/absorbing = 0
mob/learn
	verb
		Ki_Absorb()
			set category = "Techniques"
			if(src.buku) return
			if(src.absorbing)
				src<< "You stop Absorbing Ki"
				src.absorbing = 0
				src.frozen = 0
				if(src.doing) src.doing --
			else
				if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
				src<< "You prepare to start Absorbing Ki"
				src.absorbing = 1
				src.frozen = 1
				if(!src.doing) src.doing ++
				src.Icon_State("absorb")
				src.afk_time = 0
		Morph()
			set category = "Combat"
			if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
			if(src.form=="Ranger")
				src.icon=src.oldicon
				src.oldicon=null
				src.form=""
				src.Power_Redefine()
				src<<"You demorph."
			else
				if(src.form==""&&!src.kaioken&&!src.monkey)
					if(src.pranger)
						src.oldicon=src.icon
						src<<"[src]: It's morphing time!"
						var/rangericon = "[src.pranger] Ranger.dmi"
						src.icon=rangericon
						src.Icon_State("")
						src.powerlevel*=1200
						src.ki*=1200
						src.strength*=1200
						src.defence*=1200
						src.speed = 0.5
						src.form="Ranger"
						src.Morph2()
					else src<<"You're not a Ranger!"
				else src<<"Please revert first."
mob/proc/Morph2()
	if(src.pranger=="Green")
		src.icon='Green Ranger.dmi'
	if(src.pranger=="Red")
		src.icon='Red Ranger.dmi'
	if(src.pranger=="Yellow")
		src.icon='Yellow Ranger.dmi'
	if(src.pranger=="Pink")
		src.icon='Pink Ranger.dmi'
	if(src.pranger=="Blue")
		src.icon='Blue Ranger.dmi'
	if(src.pranger=="Black")
		src.icon='Black Ranger.dmi'
	if(src.pranger=="White")
		src.icon='White Ranger.dmi'
	if(src.pranger=="Purple")
		src.icon='Purple Ranger.dmi'
	if(src.pranger=="Gold")
		src.icon='Gold Ranger.dmi'