mob/var/
 enraged = 0
 gone_ssj = 0
 eats = 0
mob/learn/verb/Unleash_Rage()
	set category = "Techniques"
	if(src.monkey)
		src<< "Your body is under too much stress!"
		return
	if(src.kaioken)
		src<< "Your body is under too much stress!"
		return
	if(src.rage >= 10)
		if(src.enraged) src<< "You're still enraged!"
		else
			src.afk_time = 0
			src.enraged = 1
			src<< "You feel an Uncontrollable Rage release itself from your body!"
			src.Icon_State("enrage")
			sleep(25)
			var/bonus = src.powerlevel_max * src.rage
			src.powerlevel += bonus
			src.Icon_State("")
			sleep(300)
			src.enraged = 0
			src.rage = 0
			src.powerlevel = src.powerlevel_max
			src<< "You feel yourself become Calm again"
	else src<< "Your don't have enough Rage..."