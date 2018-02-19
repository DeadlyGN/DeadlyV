mob
	var
		obj/auras/aura = 'Aura.dmi'
		aura_on = 0
		raura
		gaura
		baura
		auratech = 0
obj
	auras
		basic
			icon = 'Aura.dmi'
			layer = 20
		ssj_aura
			icon = 'SSJ Aura.dmi'
			layer = 20
		kaio_aura
			icon = 'AuraKaioken.dmi'
			layer = 20
		sh2_aura
			icon = 'SH2 Aura.dmi'
			layer = 20
		good_aura
			icon = 'GoodAura.dmi'
			layer = 20
		evil_aura
			icon = 'EvilAura.dmi'
			layer = 20
var
	aura = 'Aura.dmi'
	ssj_aura = 'SSJ Aura.dmi'
	kaio_aura = 'AuraKaioken.dmi'
	sh2_aura = 'SH2 Aura.dmi'
	good_aura = 'GoodAura.dmi'
	evil_aura = 'EvilAura.dmi'
mob/learn
	verb
		Aura()
			set category = "Techniques"
			if(src.aura_on||src.monkey)
				src.overlays -= src.aura
				src.overlays -= sh2_aura
				src.overlays -= ssj_aura
				src.overlays -= kaio_aura
				src.overlays -= good_aura
				src.overlays -= evil_aura
				src.overlays -= good_aura
				src.overlays -= evil_aura
				src.aura_on = 0
				return
			else if(!src.monkey)
				src.aura = /obj/auras/basic/
				if(src.kaioken)
					src.aura=/obj/auras/kaio_aura
				else if(src.race==("Saiyan"||"Half Saiyan"))
					if(src.form!="")src.aura=/obj/auras/ssj_aura
				else if(src.race == "Human")
					if(src.form=="Super Human") src.aura=/obj/auras/sh2_aura
				else if(src.race == "Tuffle")
					if(src.form==("Infected Form 2"||"Hidden Form")) src.aura=/obj/auras/ssj_aura
				else if(src.karma=="Good") src.aura=/obj/auras/good_aura
				else if(src.karma=="Evil") src.aura=/obj/auras/evil_aura
				src.overlays += src.aura
				src.aura_on = 1
			src.afk_time = 0