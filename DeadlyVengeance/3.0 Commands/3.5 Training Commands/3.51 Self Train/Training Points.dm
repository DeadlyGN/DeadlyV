mob
	proc
		Train()
			set category = "Training"
			switch(input("Train What?")in list("Power Level","Ki","Strength","Defense","Nothing"))
				if("Power Level")
					src.PL_TRAIN()
				if("Strength")
					src.STR_TRAIN()
				if("Defense")
					src.DEF_TRAIN()
				if("Ki")
					src.KI_TRAIN()
/mob/proc/PL_TRAIN()
//	if(src.powerlevel_max>=statmax)
//		alert(usr,"You cannot raise your powerlevel any further!");return
	var/train_x = 5
	var/train_pl = input("How many points do you want to put into your Power Level?","1 Point = Power Level Max +[train_x]",) as num
	switch(input("You will spend [train_pl] training points to gain [train_pl*train_x] Powerlevel.\n Is this OK?","Train Powerlevel") as null|anything in list("Yes","No"))
		if("Yes")
			if(src.tp<train_pl) train_pl=tp
			if(train_pl < 1) return
			tp -= train_pl
			train_pl *= train_x
			src.powerlevel_max += train_pl
			src<< "<font color = white>Yamcha:</font> Great you've gained [train_pl] Power! Keep training!"
			if(istext(src.powerlevel_max)) src.powerlevel_max=text2num(src.powerlevel_max)
//-----
/mob/proc/KI_TRAIN()
//	if(src.ki_max>=statmax)
//		alert(usr,"You cannot raise your ki any further!");return
	var/train_x = 5
	var/train_ki = input("How many points do you want to put into Ki?","1 Point = Ki Level Max +[train_x]",) as num
	switch(input("You will spend [train_ki] training points to gain [train_ki*train_x] Ki.\n Is this OK?","Train Ki") as null|anything in list("Yes","No"))
		if("Yes")
			if(src.tp<train_ki) train_ki=tp
			if(train_ki < 1) return
			tp -= train_ki
			train_ki *= train_x
			src.ki_max += train_ki
			src<< "<font color = white>Yamcha:</font> Great you've gained [train_ki] Ki! Keep training!"
			if(istext(src.ki_max)) src.ki_max=text2num(src.ki_max)
//-----
/mob/proc/DEF_TRAIN()
//	if(src.defence_max>=statmax)
//		alert(usr,"You cannot raise your defence any further!");return
	var/train_x = 5
	var/train_defence = input("How many points do you want to put into Defense?","1 Point = Defense Level Max +[train_x]",) as num
	switch(input("You will spend [train_defence] training points to gain [train_defence*train_x] Defense.\n Is this OK?","Train defense") as null|anything in list("Yes","No"))
		if("Yes")
			if(src.tp<train_defence) train_defence=tp
			if(train_defence < 1) return
			tp -= train_defence
			train_defence *= train_x
			src.defence += train_defence
			src.defence_max += train_defence
			src<< "<font color = white>Yamcha:</font> Great you've gained [train_defence] Defense! Keep training!"
			if(istext(src.defence_max)) src.defence_max=text2num(src.defence_max)
//-----
/mob/proc/STR_TRAIN()
/*	if(src.strength_max>=statmax)
		alert(usr,"You cannot raise your strength any further!");return*/
	var/train_x = 5
	var/train_strength = input("How many points do you want to put into Strength?","1 Point = Strength Level Max +[train_x]",) as num
	switch(input("You will spend [train_strength] training points to gain [train_strength*train_x] Strength.\n Is this OK?","Train Strength") as null|anything in list("Yes","No"))
		if("Yes")
			if(src.tp<train_strength) train_strength=tp
			if(train_strength < 1) return
			tp -= train_strength
			train_strength *= train_x
			src.strength += train_strength
			src.strength_max += train_strength
			src<< "<font color = white>Yamcha:</font> Great you've gained [train_strength] Strength! Keep training!"
			if(istext(src.strength_max)) src.strength_max=text2num(src.strength_max)