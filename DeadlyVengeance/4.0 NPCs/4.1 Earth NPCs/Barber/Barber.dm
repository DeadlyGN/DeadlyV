mob/AI/
	Barber
		name = "{NPC} Barber"
		icon = 'Barber.dmi'
		verb/Talk()
			set src in oview(1)
			set category = null
			if(usr.race=="Jester"||usr.race=="Pikkon"||usr.race == "Changling"||usr.race == "Majin"||usr.race == "Namek"||usr.race == "Tuffle"||usr.race == "Bio-Android"||usr.race == "Demon"||usr.race == "Good Demon"||usr.race == "Chaos Demon"||usr.race == "Cooler"||usr.race == "Kai"||usr.race == "Dark Neo"||usr.race == "Bardock"||usr.race == "Evil Saiyan"||usr.race == "All Star"||usr.race == "Saibaman"||usr.race == "Legend"||usr.race == "Nightmare Dragon"||usr.race == "Bio Warrior"||usr.race == "Dark Angel"||usr.race == "Konats"||usr.race == "Uub"||usr.race=="Xicor"||usr.race=="Vampire")
				spawn() alert(usr,"Barber: I'm sorry, there is simply nothing I can do for you.")
				return
			var/hair = input("Barber: What would you like to do?","Hair Cut") in list ("Haircut","Dye Hair","Cancel")
			switch(hair)
				if("Haircut")
					usr.overlays -= usr.goku_hair
					usr.overlays -= usr.vegeta_hair
					usr.overlays -= usr.gohan_teen_hair
					usr.overlays -= usr.gohan_adult_hair
					usr.overlays -= usr.trunks_long_hair
					usr.overlays -= usr.future_gohan_hair
					usr.overlays -= usr.goku_hair_ssj
					usr.overlays -= usr.raditz_hair
					usr.overlays -= usr.raditz_hair_ssj
					usr.overlays -= usr.vegeta_hair_ssj
					usr.overlays -= usr.gohan_teen_hair_ssj
					usr.overlays -= usr.gohan_adult_hair_ssj
					usr.overlays -= usr.trunks_long_hair_ssj
					usr.overlays -= usr.future_gohan_hair_ssj
					usr.overlays -= usr.goku_hair_assj
					usr.overlays -= usr.vegeta_hair_assj
					usr.overlays -= usr.gohan_teen_hair_assj
					usr.overlays -= usr.gohan_adult_hair_assj
					usr.overlays -= usr.trunks_long_hair_assj
					usr.overlays -= usr.future_gohan_hair_assj
					usr.overlays -= usr.goku_hair_ussj
					usr.overlays -= usr.vegeta_hair_ussj
					usr.overlays -= usr.gohan_teen_hair_ussj
					usr.overlays -= usr.gohan_adult_hair_ussj
					usr.overlays -= usr.trunks_long_hair_ussj
					usr.overlays -= usr.future_gohan_hair_ussj
					usr.overlays -= usr.hair_droid
					usr.overlays -= usr.coloredhair
					goku_hair = null
					gohan_adult_hair = null
					gohan_teen_hair = null
					vegeta_hair = null
					trunks_long_hair = null
					future_gohan_hair = null
					usr.Hair_Decide()
				if("Dye Hair")
					usr.Hair_Color()
mob/proc/Hair_Decide()
	var/hair = input("Pick your hair style.","Hair Styles") in list ("Goku","Vegeta","Adult Gohan","Teen Gohan","Future Gohan","Trunks Long","Raditz","Hercule","Bald")
	switch(hair)
		if("Goku")
			var/icon/D = new('Hair - Goku.dmi')
			src.goku_hair = D
			src.hair = "Goku"
			src.coloredhair = D
			src.overlays += src.goku_hair
		if("Raditz")
			var/icon/D = new('Hair - Raditz.dmi')
			src.raditz_hair = D
			src.hair = "Raditz"
			src.coloredhair = D
			src.overlays += src.raditz_hair
		if("Vegeta")
			var/icon/D = new('Hair - Vegeta.dmi')
			src.vegeta_hair = D
			src.hair = "Vegeta"
			src.coloredhair = D
			src.overlays += src.vegeta_hair
		if("Adult Gohan")
			var/icon/D = new('Hair - Adult Gohan.dmi')
			src.gohan_adult_hair = D
			src.hair = "Adult Gohan"
			src.coloredhair = D
			src.overlays += src.gohan_adult_hair
		if("Teen Gohan")
			var/icon/D = new('Hair - Teen Gohan.dmi')
			src.gohan_teen_hair = D
			src.hair = "Teen Gohan"
			src.coloredhair = D
			src.overlays += src.gohan_teen_hair
		if("Future Gohan")
			var/icon/D = new('Hair - Future Gohan.dmi')
			src.future_gohan_hair = D
			src.hair = "Future Gohan"
			src.coloredhair = D
			src.overlays += src.future_gohan_hair
		if("Trunks Long")
			var/icon/D = new('Hair - Trunks Long.dmi')
			src.trunks_long_hair = D
			src.hair = "Trunks Long"
			src.coloredhair = D
			src.overlays += src.trunks_long_hair
		if("Hercule")
			var/icon/D = new('Hair - Hercule.dmi')
			src.hercule_hair = D
			src.hair = "Hercule"
			src.coloredhair = D
			src.overlays += src.hercule_hair
		if("Nappa")
			src.hair = null