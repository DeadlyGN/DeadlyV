mob/var/
 level_tp = 0
 level_chance = 0
mob/var/list/whatLevels=list("Self"=0,"Dual"=0,"MedPad"=0,"Combat"=0,"Dummy"=0,"Dragonballs"=0,"Normal"=1)
mob
	proc
		Gain_Kills(N as num)
			if(src:CanGainKill())
				src.kills += N
				return TRUE
			else
				src<<"You're unable to gain exp until you move to another area.\
				\nPlease move <blue>[15-get_dist(src,src:last_kill_area)]</blue> \
				steps <red>[switchdir(get_dir(src:last_kill_area,src))]</red>."
			return FALSE
		Gain_Exp(N as num, T as text)
			if(src:CanGainXP())
				src.exp+=round(N)
				src.Check_Exp(T)
				return TRUE
			else
				src<<"You're unable to gain exp until you move to another area.\
				\nPlease move <blue>[10-get_dist(src,src:last_xp_area)]</blue> \
				steps <red>[switchdir(get_dir(src:last_xp_area,src))]</red>."
			return FALSE
		Check_Exp(T as text)//T - type of training
			if(exp<tnl) return
			else
				if(exp>=tnl*600) exp=tnl*500
				if(exp<0) exp=0
				var/lvls=0
				while(exp>=tnl)
					lvls++
					exp-=tnl
				for(var/turf/Gravity/Floor_HBTC/t in view(0,src)) lvls*=2
				if(lvls) Level_Up(lvls, T)
		Level_Up(N as num, T as text) //level N amount of times, T is the type of training used
			if(!N||N==0||N=="") return
			if(!T) T="Normal"
			var/statgain=((10*N)+(round(src.grav/10000)*N))
			switch(T)
				if("Self") src.tp+=N
				if("Dual") src.tp+=(2*N)
				if("MedPad")
					switch(rand(1,4))
						if(4) src.powerlevel_max+=(3*N)
						if(3) src.ki_max+=(3*N)
						if(2) src.strength_max+=(3*N)
						if(1) src.defence_max+=(3*N)
				if("Combat") src.zenni+=(15*N)
				if("Dummy") statgain-=3
			src.whatLevels[T]+=N
			src.level+=N
			src.tp+=N
			if(src.key) src.zenni+=(3*N)
			src.powerlevel+=statgain
			src.ki+=statgain
			src.strength+=statgain
			src.defence+=statgain
			src.powerlevel_max+=statgain
			src.ki_max+=statgain
			src.strength_max+=statgain
			src.defence_max+=statgain
			src.unarmed_max+=(5*N)
			src.ki_skill_max +=(5*N)
/*			if(src.level>levelmax) src.level=levelmax
			if(src.powerlevel_max>statmax) src.powerlevel_max=statmax
			if(src.ki_max>statmax) src.ki_max=statmax
			if(src.strength_max>statmax) src.strength_max=statmax
			if(src.defence_max>statmax) src.defence_max=statmax*/
			if(src.client&&src.key) spawn()
				src.Skill_Gain()
				src.Exp_Check()
				src.Train_SSJ()
		Give_Levels(N as num, T as text)
			if(!N) return
			src.Level_Up(N,T)
			src<<"<i><font color=white>You've leveled up [N] times!<center>***You're now level [src.level]***</center>"
		Train_SSJ()
			if(!src.gone_ssj && chromosome=="Legend")
				src.contents += new/obj/Transform/Transform
				src.contents += new/obj/Transform/Revert
				src.gone_ssj = 1
				src.Icon_State("enrage")
				view(6) << "\white <I>[src.name] feels an uncontrollable power burning in them as they realise their destiny, as a legend amongst Saiyans."
				sleep(25)
				view(6) << "\white <I>The ground around [src.name] begins to shake and crumble"
				sleep(25)
				view(6) << "\white [src.name]: I am the ultimate Saiyan! From birth, THIS has been my destiny!!"
				src.powerlevel_max *= 1.8
				src.Icon_State("")
				src.Saiyan_Trans()
				Explode(new /Effect/BasicBoom(src.loc,1,3))
			else
				if(!src.gone_ssj && src.level >= 50)
					if(src.race == "Half Saiyan")
						if(src.powerlevel_max >= 7500)
							src.gone_ssj = 1
							src.Icon_State("enrage")
							view(6) << "\white <I>[src.name] feels an uncontrollable rage burning in them as they remember those Saiyan's who have Surpassed them"
							sleep(25)
							view(6) << "\white <I>[src.name] clentchs their fists, as tears well in their eyes. Veins protrude from their hands and forehead as the ground rumbles"
							sleep(25)
							view(6) << "\white [src.name]: I AM THE STRONGEST OF THE SAIYAN'S! NO ONE SHALL SURPASS ME!!"
							src.Icon_State("")
							src.contents += new/obj/Transform/Transform
							src.contents += new/obj/Transform/Revert
							src.Half_Saiyan_Trans()
							Explode(new /Effect/BasicBoom(src.loc,1,3))
					else
						if(src.race == "Saiyan")
							if(src.powerlevel_max >= 8500)
								src.gone_ssj = 1
								src.Icon_State("enrage")
								view(6) << "\white <I>[src.name] feels an uncontrollable rage burning in them as they remember those Saiyan's who have Surpassed them"
								sleep(25)
								view(6) << "\white <I>[src.name] clentchs their fists, as tears well in their eyes. Veins protrude from their hands and forehead as the ground rumbles"
								sleep(25)
								view(6) << "\white [src.name]: I AM THE STRONGEST OF THE SAIYANS! NONE SHALL SURPASS ME!!"
								src.Icon_State("")
								src.contents += new/obj/Transform/Transform
								src.contents += new/obj/Transform/Revert
								src.Saiyan_Trans()
								Explode(new /Effect/BasicBoom(src.loc,1,3))