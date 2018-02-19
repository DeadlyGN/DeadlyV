mob/PC/var/list/GuildChestContents=new()
obj
	Guild_Chest
		icon='Chest.dmi'
		density = 1
		var/capacity = 0
		var/personal_capacity = 0
		var/guildhousenum = 0
		Cross(mob/PC/M)
			src.Open(M)
			return
		New()
			..()
			src.Load()
		Del()
			src.Save()
			..()
		proc/Save()
			if(fexists("World Save Files/Guild Chest/[guildhousenum].sav")) fdel("World Save Files/Guild Chest/[guildhousenum].sav")
			var/savefile/csave
			csave = new ("World Save Files/Guild Chest/[guildhousenum].sav","-1")
			csave["Storage"] << src.contents
			csave["G-Capacity"] << src.capacity
			csave["P-Capacity"] << src.personal_capacity
		proc/Load()
			if(fexists("World Save Files/Guild Chest/[guildhousenum].sav"))
				var/savefile/load
				load = new ("World Save Files/Guild Chest/[guildhousenum].sav")
				load["Storage"] >> src.contents
				load["G-Capacity"] >> src.capacity
				load["P-Capacity"] >> src.personal_capacity
		verb/Open_Chest()
			set category = "Guild Chest"
			set src in view(2)
			src.Open(usr)
		proc/Open(mob/PC/M)
			if(!ismob(M)) del M
			var/list/depositable=new()
			for(var/obj/o in M.contents) if(istype(o,/obj/Equipment/)&&!o.equiped) depositable+=o
			var/list/option=list("Deposit", "Withdraw")
			if(M.guild_leader&&src.capacity<50) option+="Upgrade"
			switch(input(M,"What would you like to do with this chest?","Guild Chest")as null|anything in option)
				if("Deposit")
					switch(input(M,"Deposit to general storage or personal storage?", "Guild Chest")as null|anything in list("General","Personal"))
						if("General")
							if(src.capacity<=src.contents.len){alert(M, "General Storage is currently [src.contents.len]/[src.capacity], \
							 please upgrade the general storage capacity or withdraw something first.","\
							Guild Chest - General Deposit"); return;}
							var/obj/o=input(M,"General Storage is at [src.contents.len]/[src.capacity] open slots.\n\
							What item would you like to deposit?", "Guild Chest - General Deposit")as null|anything in depositable
							if(o){;
								switch(input(M,"Are you sure you'd like to deposit [o]?", "Guild Chest - General Deposit")in list("Yes", "No"))
									if("No") return
								if(o.equiped)
									alert(M,"This item has been equiped, please unequip it before proceeding.","Guild Chest - General Deposit"); return
								src.contents+=o;
								M.contents-=o;
								for(var/mob/n in players) if(n.guild_name==M.guild_name) n<<"<font color=red>Guild Information:<font color=grey> \
								<font color=[M.namecolor]>[M]</font color=[M.namecolor]>(<font color=yellow>[M.guild_rank]</font color=yellow>) has just deposited \
								 <font color=blue><IMG CLASS=\"icon\" SRC=\"\ref[o.icon]\">[o]</font color=blue> into the guild storage. \
								  <font color=green>[src.capacity-src.contents.len]<font color=grey>/<font color=green>[src.capacity]<font color=grey> slots left.";
								alert(M,"[o] has been deposited into the General Storage for the [src]!", "Guild Chest - General Deposit");}
							else alert(M,"It appears you do not have that item!")
						if("Personal")
							if(src.personal_capacity<=M.GuildChestContents.len){alert(M, "Personal Storage is currently [src.personal_capacity-M.GuildChestContents.len]/[src.personal_capacity], \
							 please upgrade the personal storage capacity or withdraw something first.","\
							Guild Chest - Personal Deposit"); return;}
							var/obj/o=input(M,"Personal Storage is at [src.personal_capacity-M.GuildChestContents.len]/[src.personal_capacity] open slots.\n\
							What item would you like to deposit?", "Guild Chest - Personal Deposit")as null|anything in depositable
							if(o&&o in M.contents){;
								switch(input(M,"Are you sure you'd like to deposit [o]?", "Guild Chest - Personal Deposit")in list("Yes", "No"))
									if("No") return
								if(o.equiped)
									alert(M,"This item has been equiped, please unequip it before proceeding.","Guild Chest - Personal Deposit"); return
								M.GuildChestContents+=o;
								M.contents-=o;
								alert(M,"[o] has been deposited into your Personal Storage in the [src]!", "Guild Chest - Personal Deposit");}
							else alert(M,"It appears you do not have that item!")
				if("Withdraw")
					switch(input(M,"Withdraw from general storage or personal storage?", "Guild Chest")as null|anything in list("General","Personal"))
						if("General")
							if(!src.contents.len){alert(M, "You don't have anything in your general storage!", "Guild Chest - Personal Withdraw"); return;}
							if(M.inven_max<=M.inven_min){alert(M, "Your backpack is full! Please make space before withdrawing anything.","\
							Guild Chest - General Withdraw"); return;}
							var/obj/o=input(M,"What item would you like to withdraw?", "Guild Chest - General Withdraw")as null|anything in src.contents
							if(o){;
								switch(input(M,"Are you sure you'd like to withdraw [o]?", "Guild Chest - General Withdraw")in list("Yes", "No"));
									if("No") return;
								M.contents+=o;
								src.contents-=o;
								for(var/mob/n in players) if(n.guild_name==M.guild_name) n<<"<font color=red>Guild Information: <font color=grey>\
								<font color=[M.namecolor]>[M]</font color=[M.namecolor]>(<font color=yellow>[M.guild_rank]</font color=yellow>) has just withdrawn\
								 <font color=blue><IMG CLASS=\"icon\" SRC=\"\ref[o.icon]\">[o]</font color=blue> from the guild storage. \
								  <font color=green>[src.capacity-src.contents.len]<font color=grey>/<font color=green>[src.capacity]<font color=grey> slots now open.";
								alert(M,"[o] has been withdrawn from the General Storage out of the [src]!", "Guild Chest - General Withdraw");}
						if("Personal")
							if(!M.GuildChestContents.len){alert(M, "You don't have anything in your personal storage!", "Guild Chest - Personal Withdraw"); return;}
							if(M.inven_max<=M.inven_min){alert(M, "Your backpack is full! Please make space before withdrawing anything.","\
							Guild Chest - Personal Withdraw"); return;}
							var/obj/o=input(M,"What item would you like to withdraw?", "Guild Chest - Personal Withdraw")as null|anything in M.GuildChestContents
							if(o){;
								switch(input(M,"Are you sure you'd like to withdraw [o]?", "Guild Chest - Personal Withdraw")in list("Yes", "No"));
									if("No") return;
								M.contents+=o;
								M.GuildChestContents-=o;
								alert(M,"[o] has been withdrawn from your Personal Storage from the [src]!", "Guild Chest - Personal Withdraw");}
				if("Upgrade")
					switch(input("What would you like to upgrade?", "Guild Chest Upgrades")as null|anything in list("General Storage", "Personal Storage"))
						if("General Storage")
							if(M.guildp>=5)
								switch(input("You currently have [src.capacity] General Storage slots\n\
								This upgrade will cost 5 guild war points, are you sure you want to use them?","General Storage Upgrade")in list("+2 Storage(-5gp)","Nevermind"))
									if("+2 Storage(-5gp)")
										var/n=input(M, "How many upgrades would you like to purchase?","General Storage Upgrade")as num
										if(n*5>M.guildp) n=round(M.guildp/5)
										M.guildp-=(n*5)
										src.capacity+=(n*2)
										alert(M, "General Storage upgraded by [n*2], you can now hold [src.capacity] items in general storage!","General Storage Upgrade")
							else alert(M,"You need at least 5 guild war points to purchase this upgrade!", "General Storage Upgrade")
						if("Personal Storage")
							if(M.guildp>=5)
								switch(input("You currently have [src.personal_capacity] Personal Storage slots\n\
								This upgrade will cost 5 guild war points, are you sure you want to use them?","Personal Storage Upgrade")in list("+2 Storage(-5gp)","Nevermind"))
									if("+2 Storage(-5gp)")
										var/n=input(M, "How many upgrades would you like to purchase?","Personal Storage Upgrade")as num
										if(n*5>M.guildp) n=round(M.guildp/5)
										M.guildp-=(n*5)
										src.personal_capacity+=(n*2)
										alert(M, "General Storage upgraded by [n*2], you can now hold [src.personal_capacity] items in personal storage!","Personal Storage Upgrade")
							else alert(M,"You need at least 5 guild war points to purchase this upgrade!", "Personal Storage Upgrade")

turf
	Passages
		Enter(mob/PC/M)
			if(isobj(M)) del(M)
			else ..()
		Exit_Hall
			density = 1
			Enter(mob/PC/M)
				M.loc = locate(128,145,1)
				M.density = 1
				M.it_blocked = 0
				M.it_lock = 0
		First_Guild_Hall
			Enter_Hall
				density = 1
				Enter(mob/PC/M)
					if(M.in_guild)
						if(M.guild_name==guildhouses[1])
							for(var/obj/O in M.contents)
								if(istype(O,/obj/Dragonballs))
									M<<"You cannot enter with a dragonball!"
									return
							if(M.fused)
								M<<"You cannot enter whilst fused"
								return
							M.loc = locate(154,233,7)
							M.density = 1
							M.it_blocked = 1
							M.it_lock = 1
						else
							if(guildhouses[1]) M<<"You're not in the [guildhouses[1]]"
							else
								M<<"This guild house is currently empty"
								if(M.guild_name!="None"&&M.guild_leader)
									var/i=0
									for(var/mob/N in players) if(N.guild_name==M.guild_name&&M.guild_name==N.guild_name) i++
									if(i>=4&&M.guildp>=15)
										var/a=input("This guild house is currently empty, would you like to claim it?","Guild House") in list("Yes","No")
										if(a=="Yes")
											if(M.guildp>=15)
												guildhouses[1]=M.guild_name
												M.guildp-=15
												M.loc = locate(154,233,7)
									else M<<"You need four guild members online and 15 guild war points to claim this house."
					else M<<"You must be in a Guild to enter the Guild Hall"
			Enter_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/First_Guild_Hall/Exit_Gravity)
					M.density = 1
			Exit_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/First_Guild_Hall/Enter_Gravity)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/First_Guild_Hall/Exit_Gravity_Gen_II)
					M.density = 1
			Exit_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/First_Guild_Hall/Enter_Gravity_Gen_II)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/First_Guild_Hall/Exit_Gym)
					M.density = 1
			Exit_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/First_Guild_Hall/Enter_Gym)
					M.density = 1
			Enter_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/First_Guild_Hall/Exit_Meeting_Hall)
					M.density = 1
			Exit_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/First_Guild_Hall/Enter_Meeting_Hall)
					M.density = 1
			Enter_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/First_Guild_Hall/Exit_Meditation_Hall)
					M.density = 1
			Exit_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/First_Guild_Hall/Enter_Meditation_Hall)
					M.density = 1
		Second_Guild_Hall
			Enter_Hall
				density = 1
				Enter(mob/PC/M)
					if(M.in_guild)
						if(M.guild_name==guildhouses[2])//put here the name of the guild
							for(var/obj/O in M.contents)
								if(istype(O,/obj/Dragonballs))
									M<<"You cannot enter with a dragonball!"
									return
							if(M.fused)
								M<<"You cannot enter whilst fused"
								return
							M.loc = locate(154,209,7)
							M.density = 1
							M.it_blocked = 1
							M.it_lock = 1
						else
							if(guildhouses[2]) M<<"You're not in the [guildhouses[2]]"
							else
								M<<"This guild house is currently empty"
								if(M.guild_name!="None"&&M.guild_leader)
									var/i=0
									for(var/mob/N in players) if(N.guild_name==M.guild_name&&M.guild_name==N.guild_name) i++
									if(i>=4&&M.guildp>=15)
										var/a=input("This guild house is currently empty, would you like to claim it?","Guild House") in list("Yes","No")
										if(a=="Yes")
											if(M.guildp>=15)
												guildhouses[2]=M.guild_name
												M.guildp-=15
												M.loc = locate(154,209,7)
									else M<<"You need four guild members online and 15 guild war points to claim this house."
					else M<<"You must be in a Guild to enter the Guild Hall"
			Enter_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Second_Guild_Hall/Exit_Gravity)
					M.density = 1
			Exit_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Second_Guild_Hall/Enter_Gravity)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Second_Guild_Hall/Exit_Gravity_Gen_II)
					M.density = 1
			Exit_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Second_Guild_Hall/Enter_Gravity_Gen_II)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Second_Guild_Hall/Exit_Gym)
					M.density = 1
			Exit_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Second_Guild_Hall/Enter_Gym)
					M.density = 1
			Enter_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Second_Guild_Hall/Exit_Meeting_Hall)
					M.density = 1
			Exit_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Second_Guild_Hall/Enter_Meeting_Hall)
					M.density = 1
			Enter_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Second_Guild_Hall/Exit_Meditation_Hall)
					M.density = 1
			Exit_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Second_Guild_Hall/Enter_Meditation_Hall)
					M.density = 1
		Third_Guild_Hall
			Enter_Hall
				density = 1
				Enter(mob/PC/M)
					if(M.in_guild)
						if(M.guild_name==guildhouses[3])//put here the name of the guild
							for(var/obj/O in M.contents)
								if(istype(O,/obj/Dragonballs))
									M<<"You cannot enter with a dragonball!"
									return
							if(M.fused)
								M<<"You cannot enter whilst fused"
								return
							M.loc = locate(154,180,7)
							M.density = 1
							M.it_blocked = 1
							M.it_lock = 1
						else
							if(guildhouses[3]) M<<"You're not in the [guildhouses[3]]"
							else
								M<<"This guild house is currently empty"
								if(M.guild_name!="None"&&M.guild_leader)
									var/i=0
									for(var/mob/N in players) if(N.guild_name==M.guild_name&&M.guild_name==N.guild_name) i++
									if(i>=4&&M.guildp>=15)
										var/a=input("This guild house is currently empty, would you like to claim it?","Guild House") in list("Yes","No")
										if(a=="Yes")
											if(M.guildp>=15)
												guildhouses[3]=M.guild_name
												M.guildp-=15
												M.loc = locate(154,180,7)
									else M<<"You need four guild members online and 15 guild war points to claim this house."
					else M<<"You must be in a Guild to enter the Guild Hall"
			Enter_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Third_Guild_Hall/Exit_Gravity)
					M.density = 1
			Exit_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Third_Guild_Hall/Enter_Gravity)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Third_Guild_Hall/Exit_Gravity_Gen_II)
					M.density = 1
			Exit_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Third_Guild_Hall/Enter_Gravity_Gen_II)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Third_Guild_Hall/Exit_Gym)
					M.density = 1
			Exit_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Third_Guild_Hall/Enter_Gym)
					M.density = 1
			Enter_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Third_Guild_Hall/Exit_Meeting_Hall)
					M.density = 1
			Exit_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Third_Guild_Hall/Enter_Meeting_Hall)
					M.density = 1
			Enter_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Third_Guild_Hall/Exit_Meditation_Hall)
					M.density = 1
			Exit_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Third_Guild_Hall/Enter_Meditation_Hall)
					M.density = 1
		Forth_Guild_Hall
			Enter_Hall
				density = 1
				Enter(mob/PC/M)
					if(M.in_guild)
						if(M.guild_name==guildhouses[4])//put here the name of the guild
							for(var/obj/O in M.contents)
								if(istype(O,/obj/Dragonballs))
									M<<"You cannot enter with a dragonball!"
									return
							if(M.fused)
								M<<"You cannot enter whilst fused"
								return
							M.loc = locate(154,154,7)
							M.density = 1
							M.it_blocked = 1
							M.it_lock = 1
						else
							if(guildhouses[4]) M<<"You're not in the [guildhouses[4]]"
							else
								M<<"This guild house is currently empty"
								if(M.guild_name!="None"&&M.guild_leader)
									var/i=0
									for(var/mob/N in players) if(N.guild_name==M.guild_name&&M.guild_name==N.guild_name) i++
									if(i>=4&&M.guildp>=15)
										var/a=input("This guild house is currently empty, would you like to claim it?","Guild House") in list("Yes","No")
										if(a=="Yes")
											if(M.guildp>=1)
												guildhouses[4]=M.guild_name
												M.guildp-=1
												M.loc = locate(154,154,7)
									else M<<"You need four guild members online and 1 guild war point to claim this house."
					else M<<"You must be in a Guild to enter the Guild Hall"
			Enter_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Forth_Guild_Hall/Exit_Gravity)
					M.density = 1
			Exit_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Forth_Guild_Hall/Enter_Gravity)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Forth_Guild_Hall/Exit_Gravity_Gen_II)
					M.density = 1
			Exit_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Forth_Guild_Hall/Enter_Gravity_Gen_II)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Forth_Guild_Hall/Exit_Gym)
					M.density = 1
			Exit_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Forth_Guild_Hall/Enter_Gym)
					M.density = 1
			Enter_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Forth_Guild_Hall/Exit_Meeting_Hall)
					M.density = 1
			Exit_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Forth_Guild_Hall/Enter_Meeting_Hall)
					M.density = 1
			Enter_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Forth_Guild_Hall/Exit_Meditation_Hall)
					M.density = 1
			Exit_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Forth_Guild_Hall/Enter_Meditation_Hall)
					M.density = 1
		Fifth_Guild_Hall
			Enter_Hall
				density = 1
				Enter(mob/PC/M)
					if(!ismob(M)||!M.client)return
					if(M.in_guild)
						if(M.guild_name==guildhouses[5])
							for(var/obj/O in M.contents)
								if(istype(O,/obj/Dragonballs))
									M<<"You cannot enter with a dragonball!"
									return
							if(M.fused)
								M<<"You cannot enter whilst fused"
								return
							M.loc = locate(154,128,7)
							M.density = 1
							M.it_blocked = 1
							M.it_lock = 1
						else
							if(guildhouses[5]) M<<"You're not in the [guildhouses[5]]"
							else
								M<<"This guild house is currently empty"
								if(M.guild_name!="None"&&M.guild_leader)
									var/i=0
									for(var/mob/N in players) if(N.guild_name==M.guild_name&&M.guild_name==N.guild_name) i++
									if(i>=4&&M.guildp>=15)
										var/a=input("This guild house is currently empty, would you like to claim it?","Guild House") in list("Yes","No")
										if(a=="Yes")
											if(M.guildp>=15)
												guildhouses[5]=M.guild_name
												M.guildp-=15
												M.loc = locate(154,128,7)
									else M<<"You need four guild members online and 15 guild war points to claim this house."
					else M<<"You must be in a Guild to enter the Guild Hall"
			Enter_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Fifth_Guild_Hall/Exit_Gravity)
					M.density = 1
			Exit_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Fifth_Guild_Hall/Enter_Gravity)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Fifth_Guild_Hall/Exit_Gravity_Gen_II)
					M.density = 1
			Exit_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Fifth_Guild_Hall/Enter_Gravity_Gen_II)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Fifth_Guild_Hall/Exit_Gym)
					M.density = 1
			Exit_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Fifth_Guild_Hall/Enter_Gym)
					M.density = 1
			Enter_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Fifth_Guild_Hall/Exit_Meeting_Hall)
					M.density = 1
			Exit_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Fifth_Guild_Hall/Enter_Meeting_Hall)
					M.density = 1
			Enter_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Fifth_Guild_Hall/Exit_Meditation_Hall)
					M.density = 1
			Exit_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Fifth_Guild_Hall/Enter_Meditation_Hall)
					M.density = 1
		Sixth_Guild_Hall
			Enter_Hall
				density = 1
				Enter(mob/PC/M)
					if(M.in_guild)
						if(M.guild_name==guildhouses[6])
							for(var/obj/O in M.contents)
								if(istype(O,/obj/Dragonballs))
									M<<"You cannot enter with a dragonball!"
									return
							if(M.fused)
								M<<"You cannot enter whilst fused"
								return
							M.loc = locate(154,102,7)
							M.density = 1
							M.it_blocked = 1
							M.it_lock = 1
						else
							if(guildhouses[6]) M<<"You're not in the [guildhouses[6]]"
							else
								M<<"This guild house is currently empty"
								if(M.guild_name!="None"&&M.guild_leader)
									var/i=0
									for(var/mob/N in players) if(N.guild_name==M.guild_name&&M.guild_name==N.guild_name) i++
									if(i>=4&&M.guildp>=15)
										var/a=input("This guild house is currently empty, would you like to claim it?","Guild House") in list("Yes","No")
										if(a=="Yes")
											if(M.guildp>=15)
												guildhouses[6]=M.guild_name
												M.guildp-=15
												M.loc = locate(154,102,7)
									else M<<"You need four guild members online and 15 guild war points to claim this house."
					else M<<"You must be in a Guild to enter the Guild Hall"
			Enter_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Sixth_Guild_Hall/Exit_Gravity)
					M.density = 1
			Exit_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Sixth_Guild_Hall/Enter_Gravity)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Sixth_Guild_Hall/Exit_Gravity_Gen_II)
					M.density = 1
			Exit_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Sixth_Guild_Hall/Enter_Gravity_Gen_II)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Sixth_Guild_Hall/Exit_Gym)
					M.density = 1
			Exit_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Sixth_Guild_Hall/Enter_Gym)
					M.density = 1
			Enter_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Sixth_Guild_Hall/Exit_Meeting_Hall)
					M.density = 1
			Exit_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Sixth_Guild_Hall/Enter_Meeting_Hall)
					M.density = 1
			Enter_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Sixth_Guild_Hall/Exit_Meditation_Hall)
					M.density = 1
			Exit_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Sixth_Guild_Hall/Enter_Meditation_Hall)
					M.density = 1
		Seventh_Guild_Hall
			Enter_Hall
				density = 1
				Enter(mob/PC/M)
					if(M.in_guild)
						if(M.guild_name==guildhouses[7])//put here the name of the guild
							for(var/obj/O in M.contents)
								if(istype(O,/obj/Dragonballs))
									M<<"You cannot enter with a dragonball!"
									return
							if(M.fused)
								M<<"You cannot enter whilst fused"
								return
							M.loc = locate(154,77,7)
							M.density = 1
							M.it_blocked = 1
							M.it_lock = 1
						else
							if(guildhouses[7]) M<<"You're not in the [guildhouses[7]]"
							else
								M<<"This guild house is currently empty"
								if(M.guild_name!="None"&&M.guild_leader)
									var/i=0
									for(var/mob/N in players) if(N.guild_name==M.guild_name&&M.guild_name==N.guild_name) i++
									if(i>=4&&M.guildp>=15)
										var/a=input("This guild house is currently empty, would you like to claim it?","Guild House") in list("Yes","No")
										if(a=="Yes")
											if(M.guildp>=15)
												guildhouses[7]=M.guild_name
												M.guildp-=15
												M.loc = locate(154,77,7)
									else M<<"You need four guild members online and 15 guild war points to claim this house."
					else M<<"You must be in a Guild to enter the Guild Hall"
			Enter_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Seventh_Guild_Hall/Exit_Gravity)
					M.density = 1
			Exit_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Seventh_Guild_Hall/Enter_Gravity)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Seventh_Guild_Hall/Exit_Gravity_Gen_II)
					M.density = 1
			Exit_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Seventh_Guild_Hall/Enter_Gravity_Gen_II)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Seventh_Guild_Hall/Exit_Gym)
					M.density = 1
			Exit_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Seventh_Guild_Hall/Enter_Gym)
					M.density = 1
			Enter_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Seventh_Guild_Hall/Exit_Meeting_Hall)
					M.density = 1
			Exit_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Seventh_Guild_Hall/Enter_Meeting_Hall)
					M.density = 1
			Enter_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Seventh_Guild_Hall/Exit_Meditation_Hall)
					M.density = 1
			Exit_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Seventh_Guild_Hall/Enter_Meditation_Hall)
					M.density = 1
		Eighth_Guild_Hall
			Enter_Hall
				density = 1
				Enter(mob/PC/M)
					if(M.in_guild)
						if(M.guild_name==guildhouses[8])//put here the name of the guild
							for(var/obj/O in M.contents)
								if(istype(O,/obj/Dragonballs))
									M<<"You cannot enter with a dragonball!"
									return
							if(M.fused)
								M<<"You cannot enter whilst fused"
								return
							M.loc = locate(154,48,7)
							M.density = 1
							M.it_blocked = 1
							M.it_lock = 1
						else
							if(guildhouses[8]) M<<"You're not in the [guildhouses[8]]"
							else
								M<<"This guild house is currently empty"
								if(M.guild_name!="None"&&M.guild_leader)
									var/i=0
									for(var/mob/N in players) if(N.guild_name==M.guild_name&&M.guild_name==N.guild_name) i++
									if(i>=4&&M.guildp>=15)
										var/a=input("This guild house is currently empty, would you like to claim it?","Guild House") in list("Yes","No")
										if(a=="Yes")
											if(M.guildp>=15)
												guildhouses[8]=M.guild_name
												M.guildp-=15
												M.loc = locate(154,48,7)
									else M<<"You need four guild members online and 15 guild war points to claim this house."
					else M<<"You must be in a Guild to enter the Guild Hall"
			Enter_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Eighth_Guild_Hall/Exit_Gravity)
					M.density = 1
			Exit_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Eighth_Guild_Hall/Enter_Gravity)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Eighth_Guild_Hall/Exit_Gravity_Gen_II)
					M.density = 1
			Exit_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Eighth_Guild_Hall/Enter_Gravity_Gen_II)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Eighth_Guild_Hall/Exit_Gym)
					M.density = 1
			Exit_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Eighth_Guild_Hall/Enter_Gym)
					M.density = 1
			Enter_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Eighth_Guild_Hall/Exit_Meeting_Hall)
					M.density = 1
			Exit_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Eighth_Guild_Hall/Enter_Meeting_Hall)
					M.density = 1
			Enter_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Eighth_Guild_Hall/Exit_Meditation_Hall)
					M.density = 1
			Exit_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Eighth_Guild_Hall/Enter_Meditation_Hall)
					M.density = 1
		Ninth_Guild_Hall
			Enter_Hall
				density = 1
				Enter(mob/PC/M)
					if(M.in_guild)
						if(M.guild_name==guildhouses[9])
							for(var/obj/O in M.contents)
								if(istype(O,/obj/Dragonballs))
									M<<"You cannot enter with a dragonball!"
									return
							if(M.fused)
								M<<"You cannot enter whilst fused"
								return
							M.loc = locate(154,22,7)
							M.density = 1
							M.it_blocked = 1
							M.it_lock = 1
						else
							if(guildhouses[9]) M<<"You're not in the [guildhouses[9]]"
							else
								M<<"This guild house is currently empty"
								if(M.guild_name!="None"&&M.guild_leader)
									var/i=0
									for(var/mob/N in players) if(N.guild_name==M.guild_name&&M.guild_name==N.guild_name) i++
									if(i>=4&&M.guildp>=15)
										var/a=input("This guild house is currently empty, would you like to claim it?","Guild House") in list("Yes","No")
										if(a=="Yes")
											if(M.guildp>=15)
												guildhouses[9]=M.guild_name
												M.guildp-=15
												M.loc = locate(154,22,7)
									else M<<"You need four guild members online and 15 guild war points to claim this house."
					else M<<"You must be in a Guild to enter the Guild Hall"
			Enter_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Ninth_Guild_Hall/Exit_Gravity)
					M.density = 1
			Exit_Gravity
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Ninth_Guild_Hall/Enter_Gravity)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Ninth_Guild_Hall/Exit_Gravity_Gen_II)
					M.density = 1
			Exit_Gravity_Gen_II
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Ninth_Guild_Hall/Enter_Gravity_Gen_II)
					M.density = 1
					M.grav = 0
					M.grav_on = 0
					M.grav_delay = 0
			Enter_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Ninth_Guild_Hall/Exit_Gym)
					M.density = 1
			Exit_Gym
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Ninth_Guild_Hall/Enter_Gym)
					M.density = 1
			Enter_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Ninth_Guild_Hall/Exit_Meeting_Hall)
					M.density = 1
			Exit_Meeting_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Ninth_Guild_Hall/Enter_Meeting_Hall)
					M.density = 1
			Enter_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Ninth_Guild_Hall/Exit_Meditation_Hall)
					M.density = 1
			Exit_Meditation_Hall
				density = 1
				Enter(mob/PC/M)
					M.loc = locate(/turf/Passages/Ninth_Guild_Hall/Enter_Meditation_Hall)
					M.density = 1