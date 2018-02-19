mob/var/KO = 0
mob/proc
	KO(mob/m)
		if(src.powerlevel <= 0)
			view(src) << "[src.name] has been knocked out!"
			src.KO = 1
			if(src.powerlevel<0) src.powerlevel=0
			src.frozen = 1
			src.ki_lock = 1
			src.buku = 0
			density = 1
			icon_state = ""
			src.sight |= BLIND
			if(m.auto_finish) call(m,"Finish")(src)
			spawn(60)
				if(src.KO&&!src.dead)
					src.KO = 0
					src.frozen = 0
					src.ki_lock = 0
					src.sight &= ~BLIND
					src<< "You wake up!"
	Tired_KO()
		if(src.fatigue >= src.fatigue_max)
			powerlevel=max(round(powerlevel/2),0)
			view(src) << "[src.name] has been knocked out!"
			src.KO = 1
			src.frozen = 1
			src.buku = 0
			density = 1
			icon_state = ""
			src.ki_lock = 1
			src.sight |= BLIND
			spawn(70)
				src.fatigue = src.fatigue_max
				src.KO = 0
				src.ki_lock = 0
				src.frozen = 0
				src.sight &= ~BLIND
				src<< "You wake up!"
	Saga_Decision(M as text)
		if(!src.client) return
		spawn()
			for(var/mob/PC/O in players) spawn() if(O.tab_saga) O << "<font color = lime>Saga Information:</font> [M] has been defeated by [src.name], what fate does [src.name] choose for [M]?"
			switch(input(src,"What is your decision?")in list("1.You may keep your life, but I will be here to protect this planet and my friends.","2.That's it? Never come back here again weakling!","3.You deserve this fate. You're a disgrace to all warriors. Die!"))
				if("1.You may keep your life, but I will be here to protect this planet and my friends.")
					if(src.karma == "Evil") src.karma_rating --
					else src.karma_rating ++
					src<< "<i>You feel as if a celestial force has blessed you</i>"
					if(src.karma_rating < 0)
						if(src.karma == "Good")
							src<< "<I>You feel an Evil inside of you begin to awaken..."
							src.karma = "Evil"
							/*GiveMedal("Turning a new leaf",src)*/
						else
							src<< "<I>You feel the Good inside of you begin to awaken..."
							src.karma = "Good"
							/*GiveMedal("Turning a new leaf",src)*/
						src.karma_rating = 0
					for(var/mob/PC/O in players) spawn() if(O.tab_saga) O << "<font color = lime>Saga Information:</font> [src.name] has chosen the path of caring and defeats [M] with a quick finish!"
				if("2.That's it? Never come back here again weakling!")
					for(var/mob/PC/O in players) spawn() if(O.tab_saga) O << "<font color = lime>Saga Information:</font> [src.name] has chosen a neutral path and defeats [M]!"
				if("3.You deserve this fate. You're a disgrace to all warriors. Die!")
					if(src.karma == "Evil") src.karma_rating ++
					else src.karma_rating --
					src<< "<i>You feel more hatred overcome you</i>"
					if(src.karma_rating < 0)
						if(src.karma == "Good")
							src<< "<I>You feel an Evil inside of you begin to awaken..."
							src.karma = "Evil"
							/*GiveMedal("Turning a new leaf",src)*/
						else
							src<< "<I>You feel the Good inside of you begin to awaken..."
							src.karma = "Good"
							/*GiveMedal("Turning a new leaf",src)*/
						src.karma_rating = 0
					for(var/mob/PC/O in players) spawn() if(O.tab_saga) O << "<font color = lime>Saga Information:</font> [src.name] has chosen the path of hatred and defeats [M] with a slow and painful death!"