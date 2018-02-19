mob
	var
		has_storage = 0
		banked_zenni = 0
		list/personal_storage=new()
mob
	AI
		Banker
			name = "{NPC} Banker"
			icon = 'Banker.dmi'
			energy_code = 5432211
			verb
				Talk()
					set src in oview(2)
					var/NotDone=TRUE
					var/LastChoice="Deposit"
					while(NotDone)
						var/Input=input("Hello, [usr.name]. Can I help you with anything today?","Bank Account",LastChoice)in list("Deposit","Transfer Funds","Withdrawl","Storage","Done")
						switch(Input)
							if("Deposit")
								var/deposit = input("How much do you wish to Deposit?")as num
								if(deposit > usr.zenni) deposit = usr.zenni
								switch(input("Banker: We'll take [round(deposit-deposit/17)]z and deposit [max(1,round(deposit-deposit/17))] into your account.\n Is this acceptable?","Banker")in list("Yes","No"))
									if("Yes")
										if(deposit >= 1)
											usr.zenni -= deposit
											deposit = max(1,round(deposit-deposit/17))
											usr.banked_zenni += deposit
											usr<< "<font color = white>Banker:</font> [deposit]z has been successfully transfered into your account!"
							if("Withdrawl")
								if(!usr.banked_zenni)
									alert(usr,"You don't have an active account currently, please deposit something into your account!","Bank Account")
									return
								var/withdrawl = input("How much do you wish to Withdraw?")as num
								if(withdrawl > usr.banked_zenni) withdrawl = usr.banked_zenni
								if(withdrawl >= 1)
									usr.banked_zenni -= withdrawl
									usr.zenni += withdrawl
									usr<< "<font color = white>Banker:</font> [withdrawl]z has been successfully withdrawn from your account!"
							if("Transfer Funds")
								var/transfer = input("How much do you wish to Transfer?")as num
								if(transfer >= 1)
									var/mob/varTo = input("Who would you like to Transfer [transfer]z to?","Transfer Funds")in players + list("Cancel")
									if(transfer > usr.banked_zenni)
										var/required_z=transfer-usr.banked_zenni
										if(usr.zenni>=required_z)
											var/Deposit=input("You don't have [transfer]z funds in your account, would you like to deposit [required_z]z?","Transfer Funds: [varTo]") in list("Yes","No")
											if(Deposit=="Yes")
												usr.zenni-=required_z
												usr.banked_zenni+=required_z
										transfer=usr.banked_zenni
									if(varTo != "Cancel" && varTo != "[usr]")
										usr.banked_zenni -= transfer
										varTo.banked_zenni += transfer
										usr<< "<font color = white>Banker:</font> [transfer]z has been successfully transferred to [varTo]'s Account"
										varTo << "<font color = white>Banker:</font> [transfer]z has been successfully transferred to your account from [usr]"
							if("Storage")
								var/list/Menu=new()
								var/list/Deposits=new()
								if(usr.personal_storage.len)
									Menu+="Withdraw"
									Menu+="Transfer"
								if(usr.has_storage)
									Menu+="Deposit"
									Menu+="Upgrade"
								else Menu+="Open Account"
								Menu+="Cancel"
								for(var/obj/Equipment/o in usr.contents) if(!o.equiped) Deposits+=o
								switch(input("Banker: Hello, [usr]. How can I help you today?\n[usr.personal_storage.len]/[usr.has_storage] slots.","Banker: Storage")as null|anything in Menu)
									if("Open Account")
										switch(input("Banker: OK, it cost 500,000z to open a storage account with us, would you like the account?","Banker: Storage")in list("Yes","No"))
											if("Yes")
												if(usr.zenni>=500000)
													usr.zenni-=500000
													usr.has_storage=3
												else
													if(usr.banked_zenni>=500000)
														usr.banked_zenni-=500000
														usr.has_storage=3
													else
														if(usr.banked_zenni+usr.zenni>=500000)
															usr.banked_zenni-=500000-usr.zenni
															usr.zenni-=500000-usr.zenni
															usr.has_storage=3
												if(usr.has_storage) alert(usr,"Banker: Your process has been completed, thank you for your buisness. \nPlease enjoy your new account.","Banker:Storage")
												else alert(usr,"Banker: Your process couldn't be completed, you seem to lack the funds to open an account.\
													\nPlease return once you have raised the funds","Banker:Storage")
									if("Withdraw")
										if(!usr.personal_storage.len){alert(usr,"Banker: You don't seem to have any more items in your storage account!", "Banker: Storage"); return;}
										if(usr.inven_max<=usr.inven_min){alert(usr,"Banker: Your backpack is full! Please make space before withdrawing anything.","\
										Banker: Storage"); return;}
										var/obj/o=input("Banker: What item would you like to withdraw?", "Banker: Storage")as null|anything in usr.personal_storage
										if(o){;
											switch(input("Banker: Are you sure you'd like to withdraw [o]?", "Banker: Storage")in list("Yes", "No"));
												if("No") return;
											usr.contents+=o;
											usr.personal_storage-=o;
											alert(usr,"Banker: [o] has been withdrawn from your storage account!", "Banker: Storage");}
									if("Deposit")
										if(usr.personal_storage.len>=usr.has_storage){alert(usr,"Banker: You don't seem to have any more room on your account!", "Banker: Storage"); return;}
										var/obj/o=input("Banker: What item would you like to deposit into your account?", "Banker: Storage")as null|anything in Deposits
										if(o){;
											switch(input("Banker: Are you sure you'd like to deposit [o]?", "Banker: Storage")in list("Yes", "No"));
												if("No") return;
											usr.personal_storage+=o;
											usr.contents-=o;
											alert(usr,"Banker: [o] has been deposited into your storage account!", "Banker: Storage");}
									if("Upgrade")
										switch(input("Banker: OK, it cost 350,000z to upgrade your storage account with us, would you like the extra slot?","Banker: Storage")in list("Yes","No"))
											if("Yes")
												var/Bought=input("Banker: How many extra slots would you like?\n350,000z each slot.","Banker: Storage")as num
												while(usr.zenni+usr.banked_zenni<350000*Bought) Bought--
												if(usr.zenni>=350000*Bought)
													usr.zenni-=350000*Bought
												else
													if(usr.banked_zenni>=350000*Bought)
														usr.banked_zenni-=350000*Bought
													else
														if(usr.banked_zenni+usr.zenni>=350000*Bought)
															usr.banked_zenni-=(350000*Bought)-usr.zenni
															usr.zenni-=(350000*Bought)-usr.zenni
												if(Bought)
													usr.has_storage+=Bought
													alert(usr,"Banker: Your process has been completed, you've purchased [Bought] slots. \
													Thank you for your buisness. \nPlease enjoy your new space.","Banker: Storage")
												else alert(usr,"Banker: Your process couldn't be completed, you seem to lack the funds to upgrade your account.\
													\nPlease return once you have raised the funds","Banker: Storage")
									if("Transfer")
										var/transfer = input("What would you like to send?")as null|anything in usr.personal_storage
										if(transfer)
											var/mob/varTo = input("Who would you like to Transfer [transfer] to?","Transfer Stored Item")as null|anything in players
											if(varTo != "Cancel" && varTo != "[usr]")
												usr.personal_storage -= transfer
												varTo.personal_storage += transfer
												usr<< "<font color = white>Banker:</font> [transfer] has been successfully transferred to [varTo]'s name, they can pick it up at any time."
												varTo << "<font color = white>Banker:</font> [transfer] has been successfully transferred to your name by [usr], feel free to pick it up when you like."
							if("Done")
								usr<< "<font color = white>Banker:</font> Come again; whenever you have buisness to offer!"
								NotDone=FALSE
						LastChoice=Input