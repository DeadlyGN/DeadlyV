mob/var
	member_mess = 0
	learn_DB = 0
	learn_fuse = 0
	learn_celljr = 0
mob/proc
	MKCHECK()
		for(var/mob/PC/M in players)
			if(M!=src && M.client.computer_id == src.client.computer_id)
				if(!M.mkallow && !src.mkallow)
					M<<"Ask an admin before multikeying."
					src<<"You Cannot Multikey here."
					del src
	NameCHECK()
		for(var/mob/N in players)
			if(!N.name)
				N.name="[N.key]"
				AdminMessage("<font color=red>Found Nameless. Renamed to key. Key: [N.key]")
			if(N.name==src.name||N.name=="PC") if(!N.key) del(N)
	CHECK()
		spawn() MKCHECK()
		if(src.tournywin>src.prizecollect) spawn() src.Check_Prize(src)
		if(src.z==9) src.loc=locate(23,215,9)
		if(src.android_dead) spawn(150) src.android_dead = 0
		src.overlays -= fat_wrap
		src.overlays -= cosmic_donut
		src.overlays -= stone_spit
		src.overlays -= small_death_ball
		src.overlays -= big_death_ball
		src.overlays -= kamehameha_charge
		src.overlays -= cosmic_donut_charge
		src.overlays -= finalf_charge
		src.overlays -= masenko_charge
		src.overlays -= x10_kame_charge
		src.overlays -= skamehameha_charge
		src.overlays -= 'afk.dmi'
		src.overlays -= 'afk.dmi'
		if(src.client)
			if(!src.whispers_off) src<< output("You're currently <font color=blue>Accepting</font color=blue> whispers.","output2")
			else src<< output("You're currently <font color=red>Rejecting</font color=red> whispers.","output2")
		src.afk=0
		src.selftraining=0
		src.oocdelay=0
		if(src.majined)
			src.overlays -= majin_sign
			src.overlays -= majin_sign
			src.overlays += majin_sign
		if(src.mysticing >= 1 && src.mysticing <=5)
			switch(alert(usr,"It seems you logged out while mystic training","Mystic Continuation","Continue Training","Stop Training"))
				if("Continue Training")
					src.mystic_cont()
				else
					src.frozen = 0
					src.safe = 0
					if(src.doing) src.doing --
					src.mysticing = 0
					src.critical_max += rand(5,18)
					src.dodge_max += rand(5,18)
					src.reflect_max += rand(5,18)
					src.block_max += rand(5,18)
					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.reflect = src.reflect_max
					src.block = src.block_max
					src.mysticing = 0
					src.overlays += mystic_elec
					src<< "<font color = white>Elder Kai:</font> Your training is now complete!"
		if(tournament && tournament_entry)
			if(auto_tournament)
				src.verbs += /mob/Auto_Tournament/verb/Enter_Auto_Tournament
				src.verbs += /mob/Auto_Tournament/verb/Leave_Auto_Tournament
			else
				src.verbs += /mob/Tournament/verb/Enter_Tournament
				src.verbs += /mob/Tournament/verb/Leave_Tournament
			src<<"<font color=aqua>Tournament entry is still open, to join goto your tournament tab."
		if(currentmatch)
			src<<"<font color=aqua>There is a tournament match currently underway, to watch this match please goto the channels tab."
			src.verbs += /mob/Auto_Tournament/verb/Watch_Tournament
		if(!src.member_mess)
			if(client.IsByondMember())
				src<< "<font color = green>[src]: for being an totally awesome byond member, you recieve several techs from the start of the game as well as access, while a member,\
				 to creating unlockable races before earning them and your own tab of stuff to play with!."
			else src<<"<font color=green>[src]: For special member rewards, <a href=\'http://www.byond.com/members/?command=membership_info'>become a BYOND Member</a>!"
		src<< "<font size=2><font color=yellow>Welcome to [world.name], for help/guides and information on the game visit the \
		 <a href=http://newdawnforums.freeforums.org/>forums</a>, or try going in your 'Channels' tab for the 'Help' verb.</font></font>"
		src<< "<font color=red>Hope you enjoy your stay.</font>"
		src.member_mess = 1
		if(statusmessage) src<< "<font color=green>There is a special message for all players: <font color=red>[statusmessage]."
		spawn()
			src.Give_Verbs()
			if(src.donut_locked) spawn(200) src.donut_locked = 0
			if(src.tail_cut in 1 to 3 && !src.has_tail) spawn(20000) src.apply_tail()
		if(src.version!="[gamev]")
			if(!src.version&&src.level>1)
				spawn() alert(src,"Your save doesn't appear to be from this game. Gonna reset you now.")
				for(var/a in src.vars)
					src.vars[a]=initial(src.vars[a])
			if(src.version=="6.15")
				src.unarmed=initial(src.unarmed)
				src.unarmed_max=initial(src.unarmed_max)
				alert(src,"Due to an bug with attack and unarmed skill, I have removed unarmed leveling from dummy training and re-wrote the formula for attacks.\n\
				Because of this, I have reset your unarmed skills.")
			if(text2num(src.version)<6.2&&src.level>1)
				src.pabsorbs=0
				src.wishes=0
				src.namek_wishes=0
				src.bs_wishes=0
				src.as_wishes=0
				src.tournywin=0
				src.absorb_kill=0
				src.infect_kill=0
				src.eats=0
				src.prizecollect=0
				src.powerlevel_max=100
				src.ki_max=100
				src.strength_max=100
				src.defence_max=100
				src.speed_max=5
				src.critical_max=0
				src.dodge_max=0
				src.reflect_max=0
				src.block_max=0
				src.counter_max=0
				src.Force_Revert()
				src.Power_Redefine()
				src.form=""
				src.unarmed_max=0
				src.ki_skill_max=0
				src.tp=0
				src.zenni=0
				src.banked_zenni=0
				var/plevel=src.level
				src.level=0
				src.Give_Levels(plevel,"Combat")
				alert(src,"Due to changes in zenni and stat gain, your level has been reset.\n For being a returning player, you recieve combat levels, giving you more zenni per level.\
				\n Tournament wins and things of the like have been retained.","Character Reset")
			if(src.tp<0)
				src.pabsorbs=0
				src.wishes=0
				src.namek_wishes=0
				src.bs_wishes=0
				src.as_wishes=0
				src.tournywin=0
				src.absorb_kill=0
				src.infect_kill=0
				src.eats=0
				src.prizecollect=0
				src.powerlevel_max=100
				src.ki_max=100
				src.strength_max=100
				src.defence_max=100
				src.speed_max=5
				src.critical_max=0
				src.dodge_max=0
				src.reflect_max=0
				src.block_max=0
				src.counter_max=0
				src.Force_Revert()
				src.Power_Redefine()
				src.form=""
				src.unarmed_max=0
				src.ki_skill_max=0
				src.tp=0
				src.zenni=0
				src.banked_zenni=0
				var/plevel=src.level
				src.level=0
				src.Give_Levels(plevel)
				alert(usr,"You have negetive tps, found to be in abuse of a bug\
				\nYour level and stats have been reset.")
			if(text2num(src.version)<=6.25)
				switch(src.race)
					if("Demon")
						src.chromosome="Evil"
					if("Good Demon")
						src.race="Demon"
						src.chromosome="Good"
					if("Chaos Demon")
						src.race="Demon"
						src.chromosome="Chaos"
				src.whatLevels["Normal"]=src.level
				if(src.form_1||src.form)
					src.form="Revert"
					src.Force_Revert()
					src.form_1=0
					src.form=""
					if(src.race in list("Android","Bio-Android","Majin","Uub","Tuffle","Namek","Bio Warrior"))
						ResetLevels(src)
						alert(usr,"Due to a change in the way transformations work, your levels have been reset, since you're a perm race.")
			if(text2num(src.version)<6.275)
				if(src.race=="Uub")
					ResetLevels(src)
					alert(usr,"Due to a exploit, allowing infinite trans boosts with Uubs, your levels/stats have been reset.")
			if(text2num(src.version)<6.8)
				if(src.race=="Chaos")
					spawn()alert(usr,"Due to a error when becoming a Chaos Demon through the dark teacher, \nyour race was changed to 'Chaos', making you unable to transform.\
					 I have fixed this for you. You're welcome.","Chaos Demon")
					src.race="Demon"
					src.chromosome="Chaos"
			src.version="[gamev]"
			src.Updates()
		src.LoadChatBars()
		src.density=1
		if(isnull(src.personal_storage)) src.personal_storage=new()
		if(isnull(src.has_storage)) src.has_storage=0
		if(src.GMLevel > 0) spawn()
			if(ckey(src.key) in Locked_Admin) src.GMLock=1
			else src.GMLock=0
			src<< browse("<br>[AdminRules]")
			src.ApplyGM()
			src.verbs += typesof(/mob/Member/verb/)
			switch(alert(usr,"Do you wish to Announce your arrival to the World?","Welcome to [world.name]","Yes","No"))
				if("Yes")
					players << "<center><font color = green>[world.name] Information: <font color=#3399cc>Level [src.GMLevel] Administrator <font color = green>[src.name]<font color=white> has joined the server."
		else players << "<font color = purple>[world.name] Information: <font color = white>[src.name] <font color=red>has joined the server."
		src.density=1
		spawn() if(src.Tutorial=="Getting Started") src.Tutorial()
		src<<Macros
		if(src.enraged)
			spawn(300)
				src.enraged = 0
				src.powerlevel = src.powerlevel_max
		if(src.trans_delay)
			spawn(350)
				src.trans_delay = 0
		if(src.KO)
			src.powerlevel = round(src.powerlevel_max / 50)
			src.KO = 0
			src.frozen = 0
			src<< "You wake up!"
		if(src.muted)
			if(src.mute_time) src<< "You have been <font color = red>Muted</font> for Mute Avoiding. Unmute in: [(src.mute_time/10)] seconds"
			spawn(5) src.MUTE_TIMER()
		if(src.jailed)
			if(src.jail_time) src<< "You have been <font color = red>Jailed</font> for Jail Avoiding. Unjail in: [src.jail_time] minutes"
			spawn(5) src.JAIL_TIMER()
		for(var/obj/Equipment/Buff_Items/O in src.contents) spawn(5) O.BUFF_COOLDOWN()
		if(src.buff_time > 0) spawn(5) src.BUFF_TIMER()
		if(src.kaioken) spawn(5) src.Kaio_Strain()
		if(src.in_guild) spawn(5) src.Give_Guild_Verbs()
		if(src.chest_implant) src.overlays += src.chest_icon
		if(src.head_implant) src.overlays += src.head_icon
		if(src.legs_implant) src.overlays += src.legs_icon
		if(src.arms_implant) src.overlays += src.arms_icon
		for(var/area/house/S in src.loc) if(istype(S,/area/house/)) src.safe=1
		if(src.going_to) spawn(40) src.Finish_Going()
		spawn(23) src.Auto_Save()
		spawn() src.Time()