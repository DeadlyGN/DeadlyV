mob/proc
	MedalCHECK()
		if(src.checkingmedals)return
		src.checkingmedals=0
		if(world.GetMedal("Complete Chaos",src)) src<<".:<font color=green>You have earned the Complete Chaos medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Complete Chaos </font color=red>:."
		sleep(1)
		if(world.GetMedal("All Star Player",src)) src<<".:<font color=green>You have earned the All Star Player medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal All Star Player </font color=red>:."
		sleep(1)
		if(world.GetMedal("Loose Killer",src)) src<<".:<font color=green>You have earned the Loose Killer medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Loose Killer </font color=red>:."
		sleep(1)
		if(world.GetMedal("Fighter",src)) src<<".:<font color=green>You have earned the Fighter medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Fighter </font color=red>:."
		sleep(1)
		if(world.GetMedal("Anger Management",src)) src<<".:<font color=green>You have earned the Anger Management medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Anger Management </font color=red>:."
		sleep(1)
		if(world.GetMedal("Goku's Style",src)) src<<".:<font color=green>You have earned the Goku's Style medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Goku's Style </font color=red>:."
		sleep(1)
		if(world.GetMedal("Wow For Real?",src)) src<<".:<font color=green>You have earned the Wow For Real? medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Wow For Real? </font color=red>:."
		sleep(1)
		if(world.GetMedal("Z-Fighter",src)) src<<".:<font color=green>You have earned the Z-Fighter medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Z-Fighter </font color=red>:."
		sleep(1)
		if(world.GetMedal("Z-Killer",src)) src<<".:<font color=green>You have earned the Z-Killer medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Z-Killer </font color=red>:."
		sleep(1)
		if(world.GetMedal("Shenron Grants",src)) src<<".:<font color=green>You have earned the Shenron Grants medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Shenron Grants </font color=red>:."
		sleep(1)
		if(world.GetMedal("Porunga Grants",src)) src<<".:<font color=green>You have earned the Porunga Grants medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Porunga Grants </font color=red>:."
		sleep(1)
		if(world.GetMedal("Omega Shenron's Nightmire",src)) src<<".:<font color=green>You have earned the Omega Shenron's Nightmire medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Omega Shenron's Nightmire </font color=red>:."
		sleep(1)
		if(world.GetMedal("Nothing But Time",src)) src<<".:<font color=green>You have earned the Nothing But Time medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Nothing But Time </font color=red>:."
		sleep(1)
		if(world.GetMedal("Web Seeker",src)) src<<".:<font color=green>You have earned the Web Seeker medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Web Seeker </font color=red>:."
		sleep(1)
		if(world.GetMedal("Best DBZ Game on Byond",src)) src<<".:<font color=green>You have earned the Best DBZ Game on Byond medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Best DBZ Game on Byond </font color=red>:."
		sleep(1)
		if(world.GetMedal("Gotta use the Original",src)) src<<".:<font color=green>You have earned the Gotta use the Original medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Gotta use the Original </font color=red>:."
		sleep(1)
		if(world.GetMedal("Good is the Way to Go",src)) src<<".:<font color=green>You have earned the Good is the Way to Go medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Good is the Way to Go </font color=red>:."
		sleep(1)
		if(world.GetMedal("Evil is the Life",src)) src<<".:<font color=green>You have earned the Evil is the Life medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Evil is the Life </font color=red>:."
		sleep(1)
		if(world.GetMedal("Untouchable",src)) src<<".:<font color=green>You have earned the Untouchable medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Untouchable </font color=red>:."
		sleep(1)
		if(world.GetMedal("Members Support",src)) src<<".:<font color=green>You have earned the Members Support medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Members Support </font color=red>:."
		sleep(1)
		if(world.GetMedal("Members Pwns",src)) src<<".:<font color=green>You have earned the Members Pwns medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Members Pwns </font color=red>:."
		sleep(1)
		if(world.GetMedal("Rookie",src)) src<<".:<font color=green>You have earned the Rookie medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Rookie </font color=red>:."
		sleep(1)
		if(world.GetMedal("Novice",src)) src<<".:<font color=green>You have earned the Novice medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Novice </font color=red>:."
		sleep(1)
		if(world.GetMedal("Expert",src)) src<<".:<font color=green>You have earned the Expert medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Expert </font color=red>:."
		sleep(1)
		if(world.GetMedal("Champion",src)) src<<".:<font color=green>You have earned the Champion medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Champion </font color=red>:."
		sleep(1)
		if(world.GetMedal("Elder",src))src<<".:<font color=green>You have earned the Elder medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Elder </font color=red>:."
		sleep(1)
		if(world.GetMedal("Sage",src)) src<<".:<font color=green>You have earned the Sage medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Sage </font color=red>:."
		sleep(1)
		if(world.GetMedal("Guru",src)) src<<".:<font color=green>You have earned the Guru medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Guru </font color=red>:."
		sleep(1)
		if(world.GetMedal("Master",src)) src<<".:<font color=green>You have earned the Master medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Master </font color=red>:."
		sleep(1)
		if(world.GetMedal("Deity",src)) src<<".:<font color=green>You have earned the Deity medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Deity </font color=red>:."
		sleep(1)
		if(world.GetMedal("Grandmaster",src)) src<<".:<font color=green>You have earned the Grandmaster medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Grandmaster </font color=red>:."
		sleep(1)
		if(world.GetMedal("King of Kings",src)) src<<".:<font color=green>You have earned the King of Kings medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal King of Kings </font color=red>:."
		sleep(1)
		if(world.GetMedal("Mr/Miss Popular",src)) src<<".:<font color=green>You have earned the Mr/Miss Popular medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Mr/Miss Popular </font color=red>:."
		sleep(1)
		if(world.GetMedal("Quest Master",src)) src<<".:<font color=green>You have earned the Quest Master medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Quest Master </font color=red>:."
		sleep(1)
		if(world.GetMedal("Skrew You Guys Im Goin AFK",src)) src<<".:<font color=green>You have earned the Skrew You Guys Im Goin AFK medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Skrew You Guys Im Goin AFK </font color=red>:."
		sleep(1)
		if(world.GetMedal("Ok...I'm back",src)) src<<".:<font color=green>You have earned the Ok...I'm back medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Ok...I'm back </font color=red>:."
		sleep(1)
		if(world.GetMedal("Your Friendly Neighborhood Time Traveler",src)) src<<".:<font color=green>You have earned the Your Friendly Neighborhood Time Traveler medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Your Friendly Neighborhood Time Traveler </font color=red>:."
		sleep(1)
		if(world.GetMedal("Merry Christmas!",src)) src<<".:<font color=green>You have earned the Merry Christmas! medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Merry Christmas! </font color=red>:."
		sleep(1)
		if(world.GetMedal("Happy Halloween!",src)) src<<".:<font color=green>You have earned the Happy Halloween! medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Happy Halloween! </font color=red>:."
		sleep(1)
		if(world.GetMedal("Rejected",src)) src<<".:<font color=green>You have earned the Rejected medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Rejected </font color=red>:."
		sleep(1)
		if(world.GetMedal("World Champion",src)) src<<".:<font color=green>You have earned the World Champion medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal World Champion </font color=red>:."
		sleep(1)
		if(world.GetMedal("Hello Stranger",src)) src<<".:<font color=green>You have earned the Hello Stranger medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Hello Stranger </font color=red>:."
		sleep(1)
		if(world.GetMedal("Fix Me!",src)) src<<".:<font color=green>You have earned the Fix Me! medal already</font color=green>:."
		else src<<".:<font color=red>You're missing the medal Fix Me!</font color=red>:."
		src.checkingmedals=0
proc/clear_medals(mob/M)
	world.ClearMedal("All Star Player",M)
	world.ClearMedal("Fighter",M)
	world.ClearMedal("Complete Chaos",M)
	world.ClearMedal("Loose Killer",M)
	world.ClearMedal("Anger Management",M)
	world.ClearMedal("Goku's Style",M)
	world.ClearMedal("Z-Fighter",M)
	world.ClearMedal("Z-Killer",M)
	world.ClearMedal("Shenron Grants",M)
	world.ClearMedal("Porunga Grants",M)
	world.ClearMedal("Omega Shenron's Nightmire",M)
	world.ClearMedal("Nothing But Time",M)
	world.ClearMedal("Web Seeker",M)
	world.ClearMedal("Best DBZ Game on Byond",M)
	world.ClearMedal("Gotta use the Original",M)
	world.ClearMedal("Good is the Way to Go",M)
	world.ClearMedal("Evil is the Life",M)
	world.ClearMedal("Untouchable",M)
	world.ClearMedal("Members Support",M)
	world.ClearMedal("Version 5",M)
	world.ClearMedal("Members Pwns",M)
	world.ClearMedal("Rookie",M)
	world.ClearMedal("Novice",M)
	world.ClearMedal("Champion",M)
	world.ClearMedal("Expert",M)
	world.ClearMedal("Elder",M)
	world.ClearMedal("Sage",M)
	world.ClearMedal("Guru",M)
	world.ClearMedal("Master",M)
	world.ClearMedal("Deity",M)
	world.ClearMedal("Grandmaster",M)
	world.ClearMedal("Wow For Real?",M)
	world.ClearMedal("King of Kings",M)
	world.ClearMedal("Forum Checker",M)
	world.ClearMedal("Mr/Miss Popular",M)
	world.ClearMedal("Quest Master",M)
	M<<"Medals reset!"
proc/give_medals(mob/M)
	GiveMedal("All Star Player",M)
	GiveMedal("Fighter",M)
	GiveMedal("Complete Chaos",M)
	GiveMedal("Loose Killer",M)
	GiveMedal("Anger Management",M)
	GiveMedal("Goku's Style",M)
	GiveMedal("Z-Fighter",M)
	GiveMedal("Z-Killer",M)
	GiveMedal("Shenron Grants",M)
	GiveMedal("Porunga Grants",M)
	GiveMedal("Omega Shenron's Nightmire",M)
	GiveMedal("Nothing But Time",M)
	GiveMedal("Web Seeker",M)
	GiveMedal("Best DBZ Game on Byond",M)
	GiveMedal("Gotta use the Original",M)
	GiveMedal("Good is the Way to Go",M)
	GiveMedal("Evil is the Life",M)
	GiveMedal("Untouchable",M)
	GiveMedal("Members Support",M)
	GiveMedal("Version 5",M)
	GiveMedal("Members Pwns",M)
	GiveMedal("Rookie",M)
	GiveMedal("Novice",M)
	GiveMedal("Champion",M)
	GiveMedal("Expert",M)
	GiveMedal("Elder",M)
	GiveMedal("Sage",M)
	GiveMedal("Guru",M)
	GiveMedal("Master",M)
	GiveMedal("Deity ",M)
	GiveMedal("Grandmaster",M)
	GiveMedal("Wow For Real?",M)
	GiveMedal("King of Kings",M)
	GiveMedal("Forum Checker",M)
	GiveMedal("Mr/Miss Popular",M)
	GiveMedal("Quest Master",M)
	M<<"All medals given!"