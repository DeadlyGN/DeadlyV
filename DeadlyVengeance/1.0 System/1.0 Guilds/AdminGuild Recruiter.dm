mob
	AI
		Admin_Guild_Recruiter
			name = "{NPC} Admin Guild Recruiter"
			icon = 'Guild Recruiter.dmi'
			verb
				Talk()
					set category = null
					set src in oview(1)
					if(!usr.in_guild)
						if(usr.GMLevel)
							switch(alert(usr,"Greetings [usr.name]! I see you currently do not belong to a Guild. Do you wish to become a member of the Game Moderators??(Warning: Admin only)","","Yes","No"))
								if("Yes")
									usr.in_guild = 1
									usr.guild_name = "Game Moderators"
									usr.guild_name_html = {"<FONT COLOR=WHITE>Game Moderators "}
									usr.guild_rank = "Recruit"
									usr.Give_Guild_Verbs()
									usr.verbs -= new/mob/PC/verb/Guild_Create()
									usr.verbs += typesof(/mob/Guild_Leader/verb)
									usr.verbs += typesof(/mob/Guild_Verbs/verb)
									usr<< "<font color = white>[src.name]:</font> Welcome to the Guild, [usr.name]!"
									for(var/client/C) if(C.mob)
										var/mob/X = C.mob
										if(X.guild_name == usr.guild_name) X << "<font color = #BB0EDA>Guild Information:</font> [usr] has joined the Guild!"
						else usr<< "<font color = white>[src.name]:</font> train alittle bit. (Level 25)"
					else
						if(usr.guild_name == "Game Moderators")
							switch(input("Greetings [usr.name]! What can I do for you today?","")in list("Seek Promotion"))
								if("Seek Promotion")
									if(usr.tp >= 750)
										if(usr.guild_rank != "Private" && usr.guild_rank == "Recruit")
											usr.guild_rank = "Private"
											usr.tp -= 750
											usr.tp = 1500
											if(usr.guild_rank == "Private")
												usr.contents += new/obj/Equipment/Buff_Items/EXP_Shard
												usr<<"Congratulations! You're now an (Private)."
										else
											if(usr.guild_rank != "Corporal" && usr.guild_rank == "Private")
												usr.guild_rank = "Corporal"
												usr.tp -= 1500
												usr.tp = 2500
												if(usr.guild_rank == "Corporal")
													usr.contents += new/obj/Equipment/Buff_Items/STR_Shard
													usr<<"Congratulations! You're now an (Corporal)."
											else
												if(usr.guild_rank != "Sergeant" && usr.guild_rank == "Corporal")
													usr.guild_rank = "Sergeant"
													usr.tp -= 2500
													usr.tp = 5000
													if(usr.guild_rank == "Sergeant")
														usr.contents += new/obj/Equipment/Buff_Items/DEF_Shard
														usr<<"Congratulations! You're now an (Sergeant)."
												else
													if(usr.guild_rank != "First Lieutenant" && usr.guild_rank == "Sergeant")
														usr.guild_rank = "First Lieutenant"
														usr.tp -= 5000
														usr.tp = 7500
													if(usr.guild_rank == "First Lieutenant")
														usr.contents += new/obj/Equipment/Buff_Items/PL_Shard
														usr<<"Congratulations! You're now an (First Lieutenant)."
									else usr<< "You're not Eligible for Promotion!"