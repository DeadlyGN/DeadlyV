proc
	GiveMedal(var/MedalName as text, var/mob/C as mob)
		if(C.client.key == "Guest-")
			spawn() alert(C,"You have justed earned the medal [MedalName];/nIf you were logged into a BYOND key, you would be able to claim this medal./nGoto http://www.byond.com/\
			 and sign up/sign in to be able to unlock this and other medals!","Medal Unlock Error")
			return FALSE
		if(!world.GetMedal(MedalName,C)&&world.SetMedal(MedalName,C))
			C<<"<font color=white><center>  )))) You've earned the <font color=\
			[pick("yellow","blue","red","green","lime","aqua","#FFC0CB","#FFA500","fuchsia","teal")]>[MedalName]<font color=white> medal!! Congratulations! ((((  "
			players<<"<font color=[pick("yellow","blue","purple")]>[world.name] Medal Information:<font color=white> <font color=[C.namecolor]>[C]</font color=[C.namecolor]> \
			has just earned the <font color=\
			[pick("yellow","blue","red","green","lime","aqua","#FFC0CB","#FFA500","fuchsia","teal")]>[MedalName]<font color=white> medal!!"
			return TRUE
		return FALSE