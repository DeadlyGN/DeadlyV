mob/
	var/tmp
		afkdelay=0
	var/MembIcon=null
	PC
		verb
			Check_Tutorial()
				set category = "Channels"
				src.Tutorial()
			File_Transfer(F as file, M as mob)
				set name = "Send File"
				set category = "Channels"
				M << ftp(F)
			Fix_Me()
				set category = "Channels"
				var/list/options = list("Dead on Earth","Can't See","Can't Attack/Train","Can't Fly","Arena Bugged","Cancel")
				switch(input("What would you like fixed?","Fix")in options)
					if("Cancel")
						return
					if("Can't See")
						src.sight &= ~BLIND
						src.client.eye = src
						src.client.show_map=0
						sleep(1)
						src.client.show_map=1
						src.sight = 0
						if(src.x<=0||src.y<=0||src.z<=0||src.x>250||src.y>250||src.z>6)
							src.loc=locate(23,215,9)
							src.see_invisible = 0
						if(!src.GMLevel) src<< browse("<br>[PlayerRules]")
						else src<< browse("<br>[AdminRules]")
					if("Dead on Earth")
						if(src.dead) src.loc=locate(44,25,8)
					if("Can't Attack/Train")
						for(var/area/house/S in view(4))
							src<< "You're in a Safe Zone!"
							return
						for(var/turf/Planet_Gravitys/Supreme_Kai/A in view(6))
							src<< "You're in a Safe Zone!"
							return
						for(var/turf/Planet_Gravitys/King_Kai/D in view(6))
							src<< "You're in a Safe Zone!"
							return
						if(src.dead)
							src<<"You're currently dead."
							return
						if(src.android_dead)
							src<< "Your circuits are currently going through repairs."
							return
						sleep(13)
						var/status=src.dead
						src.Basic_Death_vars()
						src.dead=status
						src.attack_lock=0
						src.doing=0
						src.frozen=0
						src.dualtrain=0
						src.dual_training=0
						src.selftraining=0
						src.boxing=0
						src.buku=0
						src.density=1
						src.ki_lock=0
						src.Icon_State("")
					if("Can't Fly")
						if(src.dead)
							src<<"You're currently dead!"
							return
						if(src.grav)
							src<<"You're currently grav training!"
							return
						sleep(13)
						src.buku_lock=0
						src.buku = 0
						src.density = 1
						if(src.doing) src.doing --
						src.Icon_State("")
					if("Arena Bugged")
						if(arena_battle_on)
							if(src.arenab)
								if(src.opponent)
									var/exist=0
									var/mob/N
									for(var/mob/M in players)
										if("[M]"==src.opponent)
											exist=1
											N=M
									if(exist)
										src.loc = locate(118,18,1)
										N.loc = locate(123,17,1)
										N.safe=0
										N.dead=0
										src.dead=0
										src.safe=0
									else
										src.arenab=0
										N.arenab=0
										arena_battle_on=0
							else
								src<<"You're not in a arena challenge!"
								return
				GiveMedal("Fix Me!",src)
				src<<"Fixed!"
			AFK()
				set category="Channels"
				if(src.afkdelay)return
				src.afkdelay+=1
				if(src.afk==0)
					src.overlays += 'afk.dmi'
					players << "<font color = blue>[src] is now AFK"
					src.afk=1
					src.afk_time ++
					src.ki_lock=1
					src.it_blocked=1
					GiveMedal("Skrew You Guys Im Goin AFK",src)
				else
					if(src.afk==1)
						src.overlays -= 'afk.dmi'
						src.overlays -= 'afk.dmi'
						players << "<font color = red>[src] is no longer AFK"
						src.afk=0
						src.afk_time=0
						src.ki_lock=0
						src.it_blocked=0
						GiveMedal("Ok...I'm back",src)
				sleep(src.afkdelay*20)
				src.afkdelay=0

	Member
		verb
			Emoticons()
				set category = "Channels"
				var/s = input(src,"What Emoticon would you like to use?","Emoticons") as null|anything in typesof(/smiley/)-/smiley/
				if(s)
					var/smiley/Smile = new s()
					call(src,"OOC")({"[pick(Smile.smileys)]"})
			Toggle_IT_Block()
				set category = "Member"
				if(src.it_blocked)
					src<<"You can now be IT'd to."
					src.it_blocked=0
				else
					src<<"You can no longer be IT'd to."
					src.it_blocked=1
			Medal_Plox()
				set category = "Member"
				GiveMedal("Wow For Real?",src)
			Change_Icon()
				set category = "Member"
				var/icon/Change_Icon = input (src, "Icon","Icon") as icon
				if(!Change_Icon){ alert(src, "Sorry, an error has occured and we weren't able to process your icon.","Error"); return; }
				var/statename = input (src, "What do you want your icon state to be?","Icon State") as text
				src.Icon_State(statename)
				src.icon = Change_Icon
				src.skin = Change_Icon
				var/icon/i= new(src.icon)
				i=i.ResizeWithAspect(32,32)
				src.icon=i
				src.MembIcon=i
			Change_Iconstate(I as null|anything in icon_states(src.icon)-"blank")
				set category = "Member"
				src.Icon_State(I)
				src<< "<b>Your iconstate is now [I]!</b>"
			Flick_icon(I as null|anything in icon_states(src.icon))
				set category = "Member"
				set name = "Flick Icon State"
				flick("[I]",src)
			ShowEmote()
				set category = "Member"
				switch(input("What emoticon would you like to display?") as null|anything in list("ALERT!","Curious","Laugh","Sing","Grin","Wink","Tongue","Joy","Anger","Sad","In Love","None"))
					if("ALERT!")
						src.BubbleExclaim()
					if("Curious")
						src.BubbleQuery()
					if("Laugh")
						src.BubbleLaugh()
					if("Sing")
						src.BubbleSing()
					if("Grin")
						src.BubbleGrin()
					if("Wink")
						src.BubbleWink()
					if("Tongue")
						src.BubbleTongue()
					if("Joy")
						src.BubbleHappy()
					if("Anger")
						src.BubbleAngry()
					if("Sad")
						src.BubbleFrown()
					if("In Love")
						src.BubbleLove()