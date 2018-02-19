mob
	proc
		updateHealth()
			while(src.client)
				var/percent=round(src.powerlevel/src.powerlevel_max*100,10)
				if(percent>200) percent = 101
				else if(percent>100) percent=100
				if(percent<0) percent=0
				for(var/obj/HUD/hudMeters/o in src.client.screen) o.icon_state=num2text(percent)
				sleep(8)
		updateki()
			while(src.client)
				var/percent2=round(src.ki/src.ki_max*100,10)
				if(percent2>200) percent2 = 101
				else if(percent2>100) percent2=100
				if(percent2<0) percent2=0
				for(var/obj/HUD/kimeters/o in src.client.screen) o.icon_state=num2text(percent2)
				sleep(8)
		updateexp()
			while(src.client)
				var/percent3=round(/*src.exp/src.tnl*/src.fatigue/src.fatigue_max*100,10)
				if(percent3>100) percent3=100
				if(percent3<0) percent3=0
				for(var/obj/HUD/expmeters/o in src.client.screen) o.icon_state=num2text(percent3)
				sleep(8)
		updateIcon()
			while(src.client)
				for(var/obj/HUD/PlayerBase/o in src.client.screen){ if(o.icon!=src.icon){o.icon=src.icon/*var/icon/i=new(src.icon); o.icon=i;*/}; o.overlays=src.overlays; o.underlays=src.underlays; }
				sleep(68)
obj/HUD
	mouse_opacity = 0
	hudMeters
		health_01
			icon='meter_01.dmi'
			icon_state="0"
			layer = 100
			screen_loc="3,20"
		health_02
			icon='meter_02.dmi'
			icon_state="0"
			layer = 100
			screen_loc="4,20"
		health_03
			icon='meter_03.dmi'
			icon_state="0"
			layer = 100
			screen_loc="5,20"
	kimeters
		ki_01
			icon='Ki hud.dmi'
			icon_state="0"
			layer = 100
			screen_loc="3,20"
		ki_02
			icon='Ki hud2.dmi'
			icon_state="0"
			layer = 100
			screen_loc="4,20"
		ki_03
			icon='Ki hud3.dmi'
			icon_state="0"
			layer = 100
			screen_loc="5,20"
	expmeters
		exp_01
			icon='Exp1.dmi'
			icon_state="0"
			layer = 100
			screen_loc="2,20"
		exp_02
			icon='Exp2.dmi'
			icon_state="0"
			layer = 100
			screen_loc="3,20"
		exp_03
			icon='Exp3.dmi'
			icon_state="0"
			layer = 100
			screen_loc="4,20"
		exp_04
			icon='Exp4.dmi'
			icon_state="0"
			layer = 100
			screen_loc="5,20"
	PlayerBase
		layer = 100.5
		screen_loc="2:3,20:5"
	Bar1
		icon='Outside.dmi'
		icon_state="1"
		layer = 100
		screen_loc="2,20"
	Bar2
		icon='Outside.dmi'
		icon_state="2"
		layer = 100
		screen_loc="3,20"
	Bar3
		icon='Outside.dmi'
		icon_state="3"
		layer = 100
		screen_loc="4,20"
	Bar4
		icon='Outside.dmi'
		icon_state="4"
		layer = 100
		screen_loc="5,20"
	fade_in
		icon='Black.dmi'
		icon_state="in"
		layer=100
		screen_loc="1,1 to 15,15"
		New()
			..()
			sleep(10)
			del(src)
	fade_out
		icon='Black.dmi'
		icon_state="out"
		layer=100
		screen_loc="1,1 to 15,15"
		New()
			..()
			sleep(10)
			del(src)
	ArrowNorth
		icon='Arrows.dmi'
		icon_state="North"
		screen_loc="8,9"
	ArrowSouth
		icon='Arrows.dmi'
		icon_state="South"
		screen_loc="8,7"
	ArrowEast
		icon='Arrows.dmi'
		icon_state="East"
		screen_loc="9,8"
	ArrowWest
		icon='Arrows.dmi'
		icon_state="West"
		screen_loc="7,8"