mob
	AI
		Broker
			name = "{NPC} Broker"
			icon = 'npcs.dmi'
			icon_state = "Toma"
			powerlevel = 100
			energy_code = 9384736
			verb
				Talk()
					set category = null
					set src in oview(2)
					usr<< "<font color=white>Broker: </font>What can I do for you today [usr]?"
					switch(input("Broker: How can I help you?") in list("Sell Item","Cancel"))
						if("Sell Item") usr.Sell()
mob/proc/Sell()
	var/list/Menu = new()
	for(var/obj/Equipment/M in src.contents)
		if(!M.equiped&&!istype(M,/obj/Equipment/Buff_Items/)) Menu+=M
	if(!Menu){ src<<"You have nothing to sell!"; return;}
	var/obj/Equipment/O = input(src,"Sell which Item?","{NPC} Broker") as null | anything in Menu
	if(O)
		src.zenni += O.value
		src<< "<font color=white>Broker: </font>Thank you, [src]!"
		del O
	else
		src<< "<font color=white>Broker: </font>Let me know if there is anything else I can do for you."