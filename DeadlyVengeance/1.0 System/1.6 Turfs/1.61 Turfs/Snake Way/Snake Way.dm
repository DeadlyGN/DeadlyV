turf/Other/KingKai_Jump
	verb
		Jump()
			set src in oview(7)
			set category = null
			if(prob(87))
				usr<< "You managed to jump to King Kai's Planet safely"
				usr.loc = locate(105,92,8)
			else
				usr<< "You just miss King Kai's Planet and fall down to HFIL"
				usr.loc = locate(40,224,8)
turf/SnakeWay
	icon = 'Snake Way.dmi'
	Clouds
		name = "Clouds"
		density = 1
		icon_state = "clouds"
		Enter(mob/m)
			if(!m)return
			m<< "You fall down through the clouds to HFIL"
			m.loc = locate(40,224,8)
			return
	Heaven_Clouds
		name = "Clouds2"
		density = 1
		icon_state = "clouds2"
		Enter(mob/m)
			if(!m)return
			m<< "You fall down through the clouds to HFIL"
			m.loc = locate(40,224,8)
			return
	Hell_Clouds
		name = "Clouds3"
		density = 1
		icon_state = "clouds3"
	Planet
		name = ""
		density = 1
		icon_state = "planet"
	SnakeWay2
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 2"
	SnakeWay4
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 4"
	SnakeWay5
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 5"
	SnakeWay6
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 6"
	SnakeWay8
		name = "Snake Way"
		density = 0
		icon_state = "snakeway 8"
turf/Pictures
	Intro1
		name ="Pic1"
		icon='IntroWindow.png'
		density=1
	Intro2
		name="Pic2"
		icon='IntroWindow2.png'
		density=1