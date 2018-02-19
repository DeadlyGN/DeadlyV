mob/PC/verb/Facebook()
	set category = "Channels"
	src<<"If nothing pops up, click <a href=https://www.facebook.com/DBZDarkApocalypse>here</a>."
	src<<link("https://www.facebook.com/DBZDarkApocalypse")
	if(GiveMedal("Facebook Visiter",src)) src.banked_zenni+=500000