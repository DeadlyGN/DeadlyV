mob/PC/verb/Trade(mob/PC/M in get_step(usr,usr.dir))
	set category = "Channels"
	var/items = list()
	var/items_2 = list()
	for(var/obj/Equipment/O in src.contents) items += O
	for(var/obj/Equipment/O2 in M.contents) items_2 += O2
	if(M.trading)
		src<< "[M] is busy trading!"
		return
	if(src.trading)
		src<< "You're busy trading!"
		return
	M.trading = 1
	src.trading = 1
	switch(alert(M,"[src] wants to Trade with you! Do you want to trade with [src]?","Secure Trade","Yes","No"))
		if("Yes")
			var/obj/item = input("Please select the item you wish to Trade") in items
			if(!item)
				src<< "You have no items to trade!"
				M.trading = 0
				src.trading = 0
				return
			if(item.item_owner != null)
				src<< "That item is bio-linked and cannot be traded!"
				M.trading = 0
				src.trading = 0
				return
			if(item.equiped)
				src<< "You must unequip the item first!"
				M.trading = 0
				src.trading = 0
				return
			switch(alert(M,"[src] wishes to trade: [item]. Do you accept?","Secure Trade","Yes","No"))
				if("Yes")
					var/obj/item_2 = input("Please select the item you wish to Trade") in items_2
					if(!item_2)
						M << "You have no items to Trade!"
						M.trading = 0
						src.trading = 0
						return
					if(item_2.item_owner != null)
						M << "That item is bio-linked and cannot be traded!"
						M.trading = 0
						src.trading = 0
						return
					if(item_2.equiped)
						M << "You must unequip the item first!"
						M.trading = 0
						src.trading = 0
						return
					switch(alert(usr,"[M] wishes to trade: [item_2] for your [item]. Do you accept?","Secure Trade","Yes","No"))
						if("Yes")
							src.contents -= item
							M.contents -= item_2
							src.contents += item_2
							M.contents += item
							M.trading = 0
							src.trading = 0
							src<< "Secure trade complete!"
							M << "Secure trade complete!"
						else
							M.trading = 0
							src.trading = 0
							M << "Trade has been Cancelled"
							src<< "Trade has been Cancelled"
				else
					M.trading = 0
					src.trading = 0
					M << "Trade has been Cancelled"
					src<< "Trade has been Cancelled"
		else
			M.trading = 0
			src.trading = 0
			M << "Trade has been Cancelled"
			src<< "Trade has been Cancelled"