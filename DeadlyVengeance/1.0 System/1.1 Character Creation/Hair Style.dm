mob/
	var
		hair_red=0
		hair_green=0
		hair_blue=0
		pick_color=null
		hair_color
		dark=0
		coloredhair
	proc
		Hair()
			var/hair = input("Pick your hair style.","Hair Styles") in list ("Goku","Vegeta","Adult Gohan","Teen Gohan","Future Gohan","Trunks Long","Raditz","Hercule","Bald")
			switch(hair)
				if("Goku")
					var/icon/D = new('Hair - Goku.dmi')
					src.goku_hair = D
					src.hair = "Goku"
					src.overlays += src.goku_hair
				if("Raditz")
					var/icon/D = new('Hair - Raditz.dmi')
					src.raditz_hair = D
					src.hair = "Raditz"
					src.overlays += src.raditz_hair
				if("Vegeta")
					var/icon/D = new('Hair - Vegeta.dmi')
					src.vegeta_hair = D
					src.hair = "Vegeta"
					src.overlays += src.vegeta_hair
				if("Adult Gohan")
					var/icon/D = new('Hair - Adult Gohan.dmi')
					src.gohan_adult_hair = D
					src.hair = "Adult Gohan"
					src.overlays += src.gohan_adult_hair
				if("Teen Gohan")
					var/icon/D = new('Hair - Teen Gohan.dmi')
					src.gohan_teen_hair = D
					src.hair = "Teen Gohan"
					src.overlays += src.gohan_teen_hair
				if("Future Gohan")
					var/icon/D = new('Hair - Future Gohan.dmi')
					src.future_gohan_hair = D
					src.hair = "Future Gohan"
					src.overlays += src.future_gohan_hair
				if("Trunks Long")
					var/icon/D = new('Hair - Trunks Long.dmi')
					src.trunks_long_hair = D
					src.hair = "Trunks Long"
					src.overlays += src.trunks_long_hair
				if("Hercule")
					var/icon/D = new('Hair - Hercule.dmi')
					src.hercule_hair = D
					src.hair = "Hercule"
					src.overlays += src.hercule_hair
				if("Nappa")
					src.hair = null
					return
		Hair_Color()
			switch(input("What color do you want your hair?") in list("Custom","Red","Blue","Green","Yellow","White","Black"))
				if("Red")
					haircolor(200,30,30)
				if("Yellow")
					haircolor(200,200,30)
				if("Blue")
					haircolor(20,60,180)
				if("Green")
					haircolor(30,200,30)
				if("Black")
					haircolor(0,0,0)
				if("White")
					haircolor(200,200,200)
				if("Custom")
					pick_color=input(src) as color
					overlay(pick_color)
		Hair_Color2()
			switch(input("What color do you want your hair?") in list("Red","Blue","Green","Yellow","White","Black"))
				if("Red")
					haircolor(200,30,30)
				if("Yellow")
					haircolor(200,200,30)
				if("Blue")
					haircolor(20,60,180)
				if("Green")
					haircolor(30,200,30)
				if("Black")
					haircolor(0,0,0)
				if("White")
					haircolor(200,200,200)
		haircolor(var/h1,var/h2,var/h3)
			hair_red=h1
			hair_green=h2
			hair_blue=h3
			pick_color=rgb(hair_red,hair_green,hair_blue)
			overlay(pick_color)
		overlay(var/haircl)
			if(!haircl) haircl=pick_color
			var/L[0]
			var/h1i
			var/pixel_yoff=0
			hair_color=null
			while(!h1i)
				switch(hair)
					if("Nappa") break
					if("Goku")h1i='Hair - Goku.dmi'
					if("Vegeta")h1i='Hair - Vegeta.dmi'
					if("Adult Gohan")h1i='Hair - Adult Gohan.dmi'
					if("Teen Gohan")h1i='Hair - Teen Gohan.dmi'
					if("Future Gohan")h1i='Hair - Future Gohan.dmi'
					if("Trunks Long")h1i='Hair - Trunks Long.dmi'
					if("Raditz")h1i='Hair - Raditz.dmi'
					if("Hercule")h1i='Hair - Hercule.dmi'
				if(h1i)
					h1i+=(haircl)
					var/image/h1=image(h1i,pixel_y=pixel_yoff)
					L+=h1
					hair_color=L
			if(src)
				src.overlays-=h1i
				src.overlays-=L
				src.overlays-=src.coloredhair
				src.coloredhair=hair_color
				src.overlays+=coloredhair
		Karma()
			switch(input("Karma: ???","Character Creation",text) in list ("Good","Evil",))
				if("Good")
					src.karma = "Good"
					src.karma_rating = 5
				if("Evil")
					src.karma = "Evil"
					src.karma_rating = 5
		Skin()
			switch(input("Tint of your Skin: ???", "Customization", text) in list ("White","Tan","Dark"))
				if("White")
					src.icon = 'Male - White.dmi'
					src.skin = "white"
				if("Tan")
					src.icon = 'Male - Tan.dmi'
					src.skin = "tan"
				if("Dark")
					src.icon = 'Male - Dark.dmi'
					src.skin = "dark"
					src.dark = 1