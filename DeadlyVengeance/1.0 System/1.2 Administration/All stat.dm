proc
	ResetLevels(mob/m)
		m.Force_Revert()
		m.form=""
		m.pabsorbs=0
		m.wishes=0
		m.namek_wishes=0
		m.bs_wishes=0
		m.as_wishes=0
		m.absorb_kill=0
		m.infect_kill=0
		m.eats=0
		m.tournywin=0
		m.powerlevel_max=100
		m.ki_max=100
		m.strength_max=100
		m.defence_max=100
		m.Power_Redefine()
		m.speed_max=5
		m.critical_max=0
		m.dodge_max=0
		m.reflect_max=0
		m.block_max=0
		m.counter_max=0
		m.prizecollect=0
		m.unarmed_max=0
		m.ki_skill_max=0
		m.tp=0
		m.majined=0
		m.arms_implant=0
		m.legs_implant=0
		m.head_implant=0
		m.chest_implant=0
		m.unlock=0
		m.tapions_unlock=0
		m.level=0
		for(var/a in m.whatLevels) if(m.whatLevels[a]) m.Give_Levels(m.whatLevels[a])
mob
	Cool
		verb
			Give_Moves(mob/PC/M in players)
				set category = "Administration"
				M.verbs += typesof(/mob/learn/verb/)
				M.verbs += new/mob/learn/Demon/verb/Stone_Spit
				M.verbs += new/mob/learn/Demon/verb/Mouth_Blast
				M.verbs += new/mob/learn/Changling/verb/Changling_Distructo_Disk
				M.verbs += new/mob/learn/Saiyan/verb/X10_Kamehameha
				M.verbs += new/mob/learn/Saiyan/verb/Fake_Moon
				M.verbs += new/mob/learn/Majin/verb/Candy_Ray
				M.verbs += new/mob/learn/Namek/verb/Hellzone_Grenade
				M.verbs += new/mob/learn/Namek/verb/Light_Grenade
			Promote_Admin(mob/PC/M in players)
				set category = "Owner"
				if(!GMLockCheck())
					usr<<"<font color=red>Error: <font color=green>Your Admin Powers Are Locked."
					return
				if(M.GMLock==1)
					usr<<"<font color=red>Their Powers Are Locked!"
					return
				switch(alert(usr,"Are you sure you want to grant [M] admin powers?","Grant Admin To [M]","Yes","No"))
					if("No")
						return
				var/GLevel=input("What level of admin do you want to give [M]?")as num
				var/GRank
				if(GLevel<=0||GLevel>=8)
					usr<<alert(usr,"Enter a valid number between 1 and 7!")
					return
				switch(GLevel)
					if(1) GRank="Trial Enforcer"
					if(2) GRank="Minor Enforcer"
					if(3) GRank="Enforcer"
					if(4) GRank="Major Enforcer"
					if(5) GRank="Head Enforcer"
					if(6) GRank="Low Staff"
					if(7) GRank="Minor Staff"
				switch(alert(usr,{"Is This Correct?
	Target: [M] ([M.key])
	Selected Rank: [GLevel], [GRank]"},"Promoting Admin","Yes","No"))
					if("No")
						alert(usr,"Canceled.")
						return
				if(GLevel>=usr.GMLevel)
					alert(usr,"You can only Promote Admins of a rank lower than your own.")
					AdminBadLog("Promote Admin","Number Level: [GLevel]","Rank: [GRank]",M)
					return
				if(GLevel<=M.GMLevel)
					usr<<"They're already above or equal to that rank."
					return
				switch(M.GMLevel)
					if(1) A_GML1-=M.key
					if(2) A_GML2-=M.key
					if(3) A_GML3-=M.key
					if(4) A_GML4-=M.key
					if(5) A_GML5-=M.key
				AdminLog("Promote Admin","Number Level: [GLevel]","Rank: [GRank]",M)
				AdminMessage("[usr] ([usr.key]) has made [M] ([M.key]) a [GRank]. [M] old level: [M.GMLevel]")
				alert(M,"[usr] made you an admin. Rank: [GRank]")
				if(M.client) M.GMLevel=GLevel
				switch(GLevel)
					if(1) A_GML1+=M.key
					if(2) A_GML2+=M.key
					if(3) A_GML3+=M.key
					if(4) A_GML4+=M.key
					if(5) A_GML5+=M.key
				spawn(1)M.ApplyGM(GLevel)
				spawn(1)M.PrefixCheck()
			Demote_Admin(mob/PC/M in players)
				set category = "Owner"
				switch(input("Which one would you like to do?")in list("Demote Admin","Cancel"))
					if("Demote Admin")
						if(M.GMLevel >= usr.GMLevel)
							AdminMessage("[usr] ([usr.key]) has tried to demote [M] ([M.key])")
							usr<< "You can only demote admins in a lower rank than you"
							return
						switch(alert(usr,"Do you wish to take away all of [M]'s Admin rights?","Demote to player","Yes","No"))
							if("Yes")
								AdminMessage("[usr] ([usr.key]) has Taken away all of [M]'s ([M.key]) Admin rights")
								AdminLog("Demote Admin","[usr] ([usr.key]) has Taken away all of [M]'s ([M.key]) Admin rights",M)
								if(M.client) M.GMLevel = 0
								M.PrefixCheck()
								M.RemoveGM()
								M.title = "<font color=white>Player"
								M.client.Save_1()
								A_GML1 -= M.key
								A_GML2 -= M.key
								A_GML3 -= M.key
								A_GML4 -= M.key
								A_GML5 -= M.key