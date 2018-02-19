mob
	proc
		WeightBonus()
			var/a=round((src.level/20)*(weightgi+weightcape+weightarmor+weightarm+weightleg+weightankle+weightwrist+weighthead))
			src.fatigue_exp += a
			src.Fatigue_Level_Up()
			src.fatigue+=round(a/200)
obj/Gym
	Weight
		icon = 'Gym.dmi'
		icon_state = "Weight"
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				var/str_gain = round(rand(usr.level,(usr.level * 2))/100)
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too tired to Lift Weights!"
					return
				if(usr.doing||src.lift) return
				else
					var/exp_bonus = 45000
					switch(trainingmode)
						if(2) exp_bonus += 6100
						if(3) exp_bonus += 7100
						if(4) exp_bonus += 8100
						if(5) exp_bonus += 9000
						if(6) exp_bonus += 12000
						if(7) exp_bonus += 18000
						if(8) exp_bonus += 28000
					switch(usr.mode)
						if(2) exp_bonus += 6100
						if(3) exp_bonus += 7100
						if(4) exp_bonus += 8100
						if(5) exp_bonus += 9000
						if(6) exp_bonus += 12000
						if(7) exp_bonus += 18000
						if(8) exp_bonus += 28000
					usr.exp+=exp_bonus
					if(usr.strength_max <= (usr.powerlevel_max * 3))
						src.lift = 1
						if(!usr)return
						usr.frozen = 1
						src.Icon_State("W-Lift")
						usr.Icon_State("lift")
						sleep(22)
						src.Icon_State("Weight")
						usr.Icon_State("")
						usr.Gain_Exp(rand(5,25) + usr.level/2)
						usr.frozen = 0
						if(prob(32))
							usr.strength_max += str_gain
							usr.strength += str_gain
							if(prob(10)) usr<< "\white You feel your Muscles bulge slightly..."
						usr.fatigue += round(rand(1,3)*(usr.level/52))
						if(usr.fatigue >= usr.fatigue_max) usr.fatigue = usr.fatigue_max
						sleep(11)
						src.lift = 0
					else usr<< "\white You have reached your maximum strength."
	Treadmill
		icon = 'Gym.dmi'
		icon_state = "Treadmill"
		layer = MOB_LAYER + 5
		var/run = 0
		verb
			Run_on_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too tired to use the Treadmill!"
					return
				if(usr.doing||src.run) return
				else
					src.run = 1
					spawn(51) src.run=0
					src.Icon_State("Treadmill On")
					usr.Gain_Exp(rand(20,75) + usr.level/2)
					usr.fatigue_exp += round(rand(20,75) + (usr.level*10))
					usr.Fatigue_Level_Up()
					usr.WeightBonus()
					usr.fatigue += round(rand(1,3)*(usr.level/80))
					if(usr.fatigue >= usr.fatigue_max) usr.fatigue = usr.fatigue_max
					usr.dir = EAST
					usr.Icon_State("run")
					usr.frozen = 1
					usr.doing ++
					sleep(50)
					src.Icon_State("Treadmill")
					usr.Icon_State("")
					usr.frozen = 0
					if(usr.doing) usr.doing --
	Training_Dummy
		icon = 'Gym.dmi'
		icon_state = "Dummy"
		density = 1
		layer = MOB_LAYER + 5
		var/hit = 0
		verb
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(1)
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too tired to use the Training Dummy!"
					return
				if(usr.doing) return
				usr.doing ++
				var/exp_bonus = 45000
				switch(trainingmode)
					if(2) exp_bonus += 6100
					if(3) exp_bonus += 7100
					if(4) exp_bonus += 8100
					if(5) exp_bonus += 9000
					if(6) exp_bonus += 12000
					if(7) exp_bonus += 18000
					if(8) exp_bonus += 28000
				switch(usr.mode)
					if(2) exp_bonus += 6100
					if(3) exp_bonus += 7100
					if(4) exp_bonus += 8100
					if(5) exp_bonus += 9000
					if(6) exp_bonus += 12000
					if(7) exp_bonus += 18000
					if(8) exp_bonus += 28000
				//usr.unarmed_exp += rand(1,14) + usr.level
				usr.Gain_Exp(round(usr.level/12 + exp_bonus),"Dummy")
				usr.fatigue += round(rand(1,4)*(usr.level/52))
				//spawn(5)usr.UA_Level_Up()
				usr.Flick("attack")
				spawn(5) if(usr.doing) usr.doing --
				if(usr.fatigue >= usr.fatigue_max) usr.fatigue = usr.fatigue_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(1)
				if(usr.ki <= 1000)
					usr<< "You're too tired to use the Training Dummy!"
					return
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too tired to use the Training Dummy!"
					return
				if(usr.doing) return
				var/exp_bonus = 45000
				switch(trainingmode)
					if(2) exp_bonus += 6100
					if(3) exp_bonus += 7100
					if(4) exp_bonus += 8100
					if(5) exp_bonus += 9000
					if(6) exp_bonus += 12000
					if(7) exp_bonus += 18000
					if(8) exp_bonus += 28000
				switch(usr.mode)
					if(2) exp_bonus += 6100
					if(3) exp_bonus += 7100
					if(4) exp_bonus += 8100
					if(5) exp_bonus += 9000
					if(6) exp_bonus += 12000
					if(7) exp_bonus += 18000
					if(8) exp_bonus += 28000
				usr.doing ++
				//usr.ki_exp += rand(1,14) + usr.level
				usr.Gain_Exp(round(usr.level/12 + exp_bonus),"Dummy")
				usr.ki -= rand(1,50) + usr.level*2
				usr.fatigue += round(rand(0,3)*(usr.level/52))
				var/kicost=usr.ki/rand(10,100)
				//spawn(5)usr.Ki_Level_Up()
				missile('Ki Attack.dmi', usr, src)
				usr.ki-=kicost
				if(usr.ki<0)usr.ki=0
				spawn(5)if(usr.doing) usr.doing --
				if(usr.fatigue >= usr.fatigue_max) usr.fatigue = usr.fatigue_max
	Counter_Machine
		icon = 'Counter Machine.dmi'
		icon_state = ""
		density = 1
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			Hit_the_Machine()
				set category = "Training"
				set src in oview(1)
				var/str_gain = round(rand(usr.level,(usr.level * 2))/100)
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too tired to Hit this!"
					return
				if(usr.doing||src.lift) return
				else
					if(usr.defence_max <= (usr.powerlevel_max * 3))
						src.lift = 1
						if(!usr)return
						usr.frozen = 1
						flick("Hit",src)
						sleep(22)
						var/exp_bonus = 45000
						switch(trainingmode)
							if(2) exp_bonus += 6100
							if(3) exp_bonus += 7100
							if(4) exp_bonus += 8100
							if(5) exp_bonus += 9000
							if(6) exp_bonus += 12000
							if(7) exp_bonus += 18000
							if(8) exp_bonus += 28000
						switch(usr.mode)
							if(2) exp_bonus += 6100
							if(3) exp_bonus += 7100
							if(4) exp_bonus += 8100
							if(5) exp_bonus += 9000
							if(6) exp_bonus += 12000
							if(7) exp_bonus += 18000
							if(8) exp_bonus += 28000
						usr.Gain_Exp(rand(5,25) + (usr.level/2) + exp_bonus)
						usr.frozen = 0
						if(prob(32))
							usr.defence_max += str_gain
							usr.defence += str_gain
							flick("Counter",src)
							if(prob(10)) usr<< "\white your defense rises as the machine counters your attack..."
						usr.fatigue += round(rand(1,3)*(usr.level/52))
						if(usr.fatigue >= usr.fatigue_max) usr.fatigue = usr.fatigue_max
						sleep(11)
						src.lift = 0
					else
						usr<< "\white You have reached your maximum defense."
obj/Guild
	Guild_Weight
		icon = 'Gym.dmi'
		icon_state = "Weight"
		layer = MOB_LAYER + 5
		var
			lift = 0
		verb
			Lift()
				set category = "Training"
				set src in oview(0)
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too tired to Lift Weights!"
					return
				if(usr.doing||src.lift) return
				else
					if(usr.strength_max <= (usr.powerlevel_max * 3))
						var/exp_bonus = 45000
						switch(trainingmode)
							if(2) exp_bonus += 6100
							if(3) exp_bonus += 7100
							if(4) exp_bonus += 8100
							if(5) exp_bonus += 9000
							if(6) exp_bonus += 12000
							if(7) exp_bonus += 18000
							if(8) exp_bonus += 28000
						switch(usr.mode)
							if(2) exp_bonus += 6100
							if(3) exp_bonus += 7100
							if(4) exp_bonus += 8100
							if(5) exp_bonus += 9000
							if(6) exp_bonus += 12000
							if(7) exp_bonus += 18000
							if(8) exp_bonus += 28000
						usr.Gain_Exp(exp_bonus)
						src.lift = 1
						if(!usr)return
						usr.frozen = 1
						src.Icon_State("W-Lift")
						sleep(22)
						if(!usr)return
						src.Icon_State("Weight")
						usr.Gain_Exp(rand(2,10) + usr.level/2)
						usr.frozen = 0
						if(prob(32))
							var/str_gain = rand(usr.level,(usr.level * 3))
							usr.strength_max += str_gain
							usr.strength += str_gain
							if(prob(10)) usr<< "\white You feel your Muscles bulge slightly..."
						usr.fatigue += round(rand(1,3)*(usr.level/52))
						if(usr.fatigue >= usr.fatigue_max) usr.fatigue = usr.fatigue_max
						sleep(11)
						src.lift = 0
					else
						usr<< "\white You have reached your maximum strength."
	Guild_Treadmill
		icon = 'Gym.dmi'
		icon_state = "Treadmill"
		layer = MOB_LAYER + 5
		var
			run = 0
		verb
			Run_on_Treadmill()
				set category = "Training"
				set src in oview(0)
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too tired to use the Treadmill!"
					return
				if(usr.doing) return
				else
					src.run = 1
					src.Icon_State("Treadmill On")
					usr.fatigue_exp += round(rand(20,75) + (usr.level*10))
					usr.Gain_Exp(rand(4,14) + usr.level/2)
					usr.Fatigue_Level_Up()
					usr.WeightBonus()
					usr.fatigue += round(rand(1,3)*(usr.level/80))
					if(usr.fatigue >= usr.fatigue_max) usr.fatigue = usr.fatigue_max
					usr.dir = EAST
					if(!usr)return
					usr.Icon_State("run")
					usr.frozen = 1
					usr.doing ++
					sleep(50)
					src.Icon_State("Treadmill")
					src.run = 0
					if(!usr)return
					usr.Icon_State("")
					usr.frozen = 0
					if(usr.doing) usr.doing --
	Guild_Training_Dummy
		icon = 'Gym.dmi'
		icon_state = "Dummy"
		density = 1
		layer = MOB_LAYER + 5
		var
			hit = 0
		verb
			Hit_the_Dummy()
				set category = "Training"
				set src in oview(1)
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too tired to use the Training Dummy!"
					return
				if(usr.doing) return
				var/exp_bonus = 45000
				switch(trainingmode)
					if(2) exp_bonus += 6100
					if(3) exp_bonus += 7100
					if(4) exp_bonus += 8100
					if(5) exp_bonus += 9000
					if(6) exp_bonus += 12000
					if(7) exp_bonus += 18000
					if(8) exp_bonus += 28000
				switch(usr.mode)
					if(2) exp_bonus += 6100
					if(3) exp_bonus += 7100
					if(4) exp_bonus += 8100
					if(5) exp_bonus += 9000
					if(6) exp_bonus += 12000
					if(7) exp_bonus += 18000
					if(8) exp_bonus += 28000
				usr.doing ++
				//usr.unarmed_exp += rand(10,20) * usr.level
				usr.Gain_Exp(usr.level/12 + exp_bonus,"Dummy")
				usr.fatigue += round(rand(1,3)*(usr.level/52))
				//spawn(5)usr.UA_Level_Up()
				usr.Flick("attack")
				spawn(5)if(usr.doing) usr.doing --
				if(usr.fatigue >= usr.fatigue_max) usr.fatigue = usr.fatigue_max
			Shoot_the_Dummy()
				set category = "Training"
				set src in oview(1)
				if(usr.ki <= 0)
					usr<< "You're too tired to use the Training Dummy!"
					return
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too tired to use the Training Dummy!"
					return
				if(usr.doing) return
				usr.doing ++
				var/exp_bonus = 45000
				switch(trainingmode)
					if(2) exp_bonus += 6100
					if(3) exp_bonus += 7100
					if(4) exp_bonus += 8100
					if(5) exp_bonus += 9000
					if(6) exp_bonus += 12000
					if(7) exp_bonus += 18000
					if(8) exp_bonus += 28000
				switch(usr.mode)
					if(2) exp_bonus += 6100
					if(3) exp_bonus += 7100
					if(4) exp_bonus += 8100
					if(5) exp_bonus += 9000
					if(6) exp_bonus += 12000
					if(7) exp_bonus += 18000
					if(8) exp_bonus += 28000
				//usr.ki_exp += rand(10,20) * usr.level
				usr.Gain_Exp(usr.level/12 + exp_bonus,"Dummy")
				usr.ki -= rand(10,50) + usr.level
				usr.fatigue += round(rand(0,3)*(usr.level/52))
				var/kicost=usr.ki/rand(10,100)
				//spawn(5)usr.Ki_Level_Up()
				missile('Ki Attack.dmi', usr, src)
				usr.ki-=kicost
				if(usr.ki<0)usr.ki=0
				spawn(5)if(usr.doing) usr.doing --
				if(usr.fatigue >= usr.fatigue_max) usr.fatigue = usr.fatigue_max
	Guild_Counter_Machine
		icon = 'Counter Machine.dmi'
		icon_state = ""
		density = 1
		var
			lift = 0
		verb
			Hit_the_Machine()
				set category = "Training"
				set src in oview(1)
				if(usr.fatigue >= usr.fatigue_max)
					usr<< "You're too tired to Hit this!"
					return
				if(usr.doing||src.lift) return
				else
					if(usr.defence_max <= (usr.powerlevel_max * 3))
						src.lift = 1
						if(!usr)return
						usr.frozen = 1
						flick("Hit",src)
						sleep(22)
						usr.frozen = 0
						var/exp_bonus = 45000
						switch(trainingmode)
							if(2) exp_bonus += 6100
							if(3) exp_bonus += 7100
							if(4) exp_bonus += 8100
							if(5) exp_bonus += 9000
							if(6) exp_bonus += 12000
							if(7) exp_bonus += 18000
							if(8) exp_bonus += 28000
						switch(usr.mode)
							if(2) exp_bonus += 6100
							if(3) exp_bonus += 7100
							if(4) exp_bonus += 8100
							if(5) exp_bonus += 9000
							if(6) exp_bonus += 12000
							if(7) exp_bonus += 18000
							if(8) exp_bonus += 28000
						usr.Gain_Exp(rand(5,25) + (usr.level/2) + exp_bonus)
						if(prob(32))
							var/str_gain = round(rand(usr.level,(usr.level * 3))/100)
							usr.defence_max += str_gain
							usr.defence += str_gain
							flick("Counter",src)
							if(prob(10)) usr<< "\white your defense rises as the machine counters your attack..."
						usr.fatigue += round(rand(1,3)*(usr.level/52))
						if(usr.fatigue >= usr.fatigue_max) usr.fatigue = usr.fatigue_max
						sleep(11)
						src.lift = 0
					else usr<< "\white You have reached your maximum defense."