mob/var/
	beans = 1
	tmp/bean_delay = 0
mob/AI/Korin
	icon = 'Korin.dmi'
	name = "{NPC} Korin"
	it_blocked = 1
	energy_code = 5564321
	verb/Talk()
		set category = null
		set src in oview(1)
		usr<< "<font color = white>Korin:</white> Hey [usr.name]."
		if(usr.korin_quest1_finish)
			if(usr.korin_quest2_finish<=2)
				if(!usr.korin_quest2_start)
					switch(input("Korin: How may I help you, [usr]?","Korin") in list("Buy Senzus(35,000z)","I want a Senzu Bag","Nevermind"))
						if("I want a Senzu Bag")
							usr.contents+=new/obj/Quests/Korin/Gather_Leather
							usr.korin_quest2_start=1
							usr<<"<font color=white>Korin:</white> Alrighty then, if you really want a Senzu Bag, gather and return with 15 Saiba Skins and 10,000z."
							return
				else
					switch(input("Korin: How may I help you, [usr]?","Korin") in list("Buy Senzus(35,000z)","Turn in Saiba Skins","Nevermind"))
						if("Turn in Saiba Skins")
							for(var/obj/Equipment/Consumable/Saiba_Skin/S in usr.contents){ usr.korin_quest_skins++; del S; usr.inven_min--; }
							if(usr.korin_quest_skins>=15&&usr.zenni>=10000&&usr.inven_min<usr.inven_max)
								usr.korin_quest2_finish++
								usr.korin_quest2_start=0
								usr.zenni-=10000
								var/obj/Equipment/Senzu_Bag/S=new
								S.Move(usr)
								usr.inven_min++
								while(usr.korin_quest_skins>=15&&usr.inven_min<usr.inven_max)
									var/obj/Equipment/Consumable/Senzu/S2=new
									S2.Move(usr)
									usr.inven_min++
									usr.korin_quest_skins--
								usr.korin_quest_skins=0
								for(var/obj/Quests/Korin/Gather_Leather/Q) del(Q)
								usr<<"<font color=white>Korin:</white> Congratulations on gathering the supplies needed, I've already rewarded you an senzu bag! Check it out."
								return
							usr<<"<font color=white>Korin:</white> You've currently turned in [usr.korin_quest_skins] Saiba Skins, you still need [15-usr.korin_quest_skins] more!\n\
						 <i>If you're having trouble finishing this quest, make sure you have 10,000z and a free inventory space</i>."
							return
			usr<< "<font color = white>Korin:</white> Would you like to buy some senzu beans for 35,000z??"
			var/n=input("Buy Senzus?","Korin") as num
			while(n>0)
				if(usr.inven_min < usr.inven_max)
					if(usr.zenni >= 35000)
						usr.zenni -= 35000
						var/obj/Equipment/Consumable/Senzu/S=new
						S.Move(usr)
						usr.inven_min ++
					else
						usr<< "<font color = white>Korin:</white> You don't have enough money for anymore!."
						break
				else
					usr<< "<font color = white>Korin:</white> Your inventory is full!"
					break
				n--
			usr<<"<font color=white>Korin:</white> Thank you! Come back when you need more!"
		else
			if(usr.korin_quest1_start)
				for(var/obj/Equipment/Consumable/Saiba_Skin/S in usr.contents){ usr.korin_quest_skins++; del S; usr.inven_min--; }
				if(usr.korin_quest_skins>=5)
					usr.korin_quest1_finish++
					usr.korin_quest1_start=0
					while(usr.korin_quest_skins>=5&&usr.inven_min<usr.inven_max)
						var/obj/Equipment/Consumable/Senzu/S=new
						S.Move(usr)
						usr.inven_min++
						usr.korin_quest_skins--
					usr.korin_quest_skins=0
					for(var/obj/Quests/Korin/Gather_Fertilizer/Q) del(Q)
					usr<<"<font color=white>Korin:</white> Ahhh... Thank you, I was worried I wouldn't be able to grow any more senzus for a minute there!"
					return
				usr<<"<font color=white>Korin:</white> You've currently turned in [usr.korin_quest_skins] Saiba Skins, you still need [5-usr.korin_quest_skins] more!"
			else
				switch(input("So, you're looking for Senzus, huh?\n I don't have any right now,\
				 if you could help me grow some, I'd be happy to sell them to you.","Korin") in list("Sure","Not right now"))
					if("Sure")
						usr.contents += new/obj/Quests/Korin/Gather_Fertilizer
						usr.korin_quest1_start=1
						usr<<"<font color=white>Korin:</white> Great! I'll need five Saiba Skins.\n You'll have to kill a few Saibamen to get them, but that shouldn't be a problem for you!"
					if("Not right now") usr<<"<font color=white>Korin:</white> Well, I guess I'll find someone else to do it."
	verb/Ask_For_Bean()
		set category = null
		set src in oview(1)
		if(usr.bean_delay) return
		if(usr.korin_quest2_finish)
			if(usr.beans > 0 && usr.inven_min < usr.inven_max)
				usr.bean_delay = 1
				usr<< "<font color = white>Korin:</white> Whats that? A bean? Yeah... yeah sure..."
				sleep(25)
				usr<< "<font color = #0066FF>Korin puts a Senzu Bean in your hand."
				sleep(25)
				usr<< "<font color = white>Korin:</white> Take it, consider it a gift."
				var/obj/Equipment/Consumable/Senzu/S=new
				S.Move(usr)
				usr.inven_min ++
				usr.beans --
				spawn(250) usr.bean_delay = 0
				spawn(3000)
					if(!usr) return
					usr.beans = 1
		else usr<<"<font color=white>Korin:</white> I'm sorry, [usr]. I can't afford to spare any free beans."