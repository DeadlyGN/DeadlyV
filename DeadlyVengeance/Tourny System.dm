mob
	var
		tmp/tourny	= 0
		tmp/tourndelay	= 0
var
	tournament_entry = 0
	tournament = 0
	matchstarted = 0
	maxwins=10
mob/Tournament
	verb
		Enter_Tournament()
			set category = "Tournament"
			set name = "Enter Tournament"
			if(usr.tourndelay||usr.jailed) return
			else usr.tourndelay++
			spawn(usr.tourndelay*5) usr.tourndelay=0
			if(usr.tourny)
				usr<<"<font color=white><b><u>You're already in the tournament!</font></b></u>"
				return
			for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<<"You cannot enter with a dragonball!"
					return
			if(usr.tournywin>=maxwins)
				usr<<"You have already won the maximum amount of tournaments."
				return
			if(usr.GMLevel>gmallow)
				usr<<"<Font color=red><u><b>Error: <font color=green>Admins cannot join tournaments!"
				return
			if(usr.dead)
				usr<<"<font color=white><b><u>You're dead, revive first."
				return
			if(!usr.pk)
				usr<<"You're not a combatent, please level up before competing."
				return
			if(usr.arenab){ spawn(){ alert(usr,"You cannot compete while in a arena battle!")}; return }
			if(usr.tournybanned)
				usr<<"You're currently banned from tournaments!"
			else
				usr.loc=locate(120,23,1)
				usr.tourny=1
				usr.safe=0
				usr.grav = 0
				players<<"<center><font color=white><b><u><font color=aqua>[usr]</font color=aqua> has joined the tournament!</b></u></font color=white>"
		Leave_Tournament()
			set category = "Tournament"
			set name = "Leave Tournament"
			if(usr.jailed)return
			if(!usr.tourny) usr<<"<font color=white><b><u>You're not in the tournament!</font></b></u>"
			else
				usr.loc=locate(23,215,9)
				usr.tourny=0
				usr.previous_loc=null
				usr.safe=1
				players<<"<center><font color=white><b><u><font color=maroon>[usr]</font color=maroon> has left the tournament!</b></u></font color=white>"
mob/Auto_Tournament
	verb
		Enter_Auto_Tournament()
			set category = "Tournament"
			set name = "Enter Tournament"
			if(usr.tourndelay||usr.jailed) return
			else usr.tourndelay++
			spawn(usr.tourndelay*5) usr.tourndelay=0
			if(usr.tourny)
				usr<<"<font color=white><b><u>You're already in the tournament!</font></b></u>"
				return
			for(var/obj/O in usr.contents)
				if(istype(O,/obj/Dragonballs))
					usr<<"You cannot enter with a dragonball!"
					return
			if(usr.GMLevel>gmallow)
				usr<<"<Font color=red><u><b>Error: <font color=green>Admins cannot join tournaments!"
				return
			if(usr.tournywin>=maxwins)
				usr<<"You have already won the maximum amount of tournaments."
				return
			if(usr.dead)
				usr<<"<font color=white><b><u>You're dead, revive first."
				return
			if(usr.arenab){ spawn(){ alert(usr,"You cannot compete while in a arena battle!")}; return }
			if(!usr.pk)
				usr<<"You're not a combatent, please level up before competing."
				return
			if(usr.tournybanned) usr<<"You're currently banned from tournaments!"
			else
				usr.z=8
				usr.loc=locate(rand(193,202),rand(27,31),8)
				usr.tourny=1
				usr.safe=1
				usr.buku=0
				usr.grav = 0
				usr.density=1
				if(usr.icon_state=="flight") usr.Icon_State("")
				Contenders.Add(usr)
				players<<"<center><font color=white><b><u><font color=aqua>[usr]</font color=aqua> has joined the tournament!</b></u></font color=white>"
		Leave_Auto_Tournament()
			set category = "Tournament"
			set name = "Leave Tournament"
			if(usr.jailed)return
			if(!usr.tourny)
				usr<<"<font color=white><b><u>You're not in the tournament!</font></b></u>"
			else
				usr.loc=locate(23,215,9)
				usr.tourny=0
				usr.safe=1
				Contenders.Remove(usr)
				Contenders -= usr
				players<<"<center><font color=white><b><u><font color=maroon>[usr]</font color=maroon> has left the tournament!</b></u></font color=white>"
		Watch_Tournament()
			set category = "Channels"
			if(FFA_Tournament)
				var/list/HJ = list("Arena","Cancel")
				for(var/mob/L in Contenders)
					HJ += L
				var/selection = input("What would you like to view?") in HJ
				if(selection == "Cancel")
					usr.watchingtourny=1
					client.eye = usr
					return
				if(selection == "Arena")
					usr.watchingtourny=1
					client.eye = locate(125,125,9)
					usr<< "<b>You're now watching the tournament arena."
					client.perspective = 255
				else
					client.eye = selection
					usr<< "<b>You're now watching [selection]."
					usr.watchingtourny=1
					client.perspective = 255
			else
				var/list/HG = list(participent1,participent2,"Arena","Cancel")
				var/selection = input("What would you like to view?") in HG
				if(selection == "Cancel")
					usr.watchingtourny=0
					client.eye = usr
					return
				if(selection == participent1)
					usr.watchingtourny=1
					client.eye = participent1
					usr<< "<b>You're now watching [participent1]"
					client.perspective = 255
				if(selection == participent2)
					usr.watchingtourny=1
					client.eye = participent2
					usr<< "<b>You're now watching [participent2]"
					client.perspective = 255
				if(selection == "Arena")
					usr.watchingtourny=1
					client.eye = locate(197,48,8)
					usr<< "<b>You're now watching the tournament arena."
					client.perspective = 255
var
	participent1 = null
	participent2 = null
////////////////////////////////////////////////////////
//////////////////Auto Tourny System////////////////////
////////////////////////Sketh///////////////////////////
//////////////////Done From Scratch/////////////////////
////////////////////////////////////////////////////////
/////////////////////////P.S.///////////////////////////
/////////////////////Like a boss.///////////////////////
////////////////////////////////////////////////////////
var/
	auto_tournament = 1
	list/Contenders = new()
	matches=0
	currentmatch=0
	FFA_Tournament = 0
mob
	var
		prizecollect=0
		tmp/
			watchingtourny=0
			prizepoppedup=0
			matcheswon=0
	proc
		Match_Prize()
			if(!src) return
			Give_Levels(matcheswon*1500)
		Check_Prize()
			if(!src) return
			src.prizepoppedup=1
			if(src.tournywin>src.prizecollect)
				var/list/prizez=list("Powerlevel", "Ki", "Strength", "Defence", "Training Points", "Karma", "Random")
				if(src.tournywin/10==round(src.tournywin/10))
					if(!world.GetMedal("All Star Unlock",src)) prizez+="All Star Unlock"
					if(!world.GetMedal("Vampire Unlock",src)) prizez+="Vampire Unlock"
					if(!world.GetMedal("Evil Saiyan Unlock",src)) prizez+="Evil Saiyan Unlock"
					if(!world.GetMedal("Jester Unlock",src)) prizez+="Jester Unlock"
				if(tournywin/5==round(tournywin/5)) prizez+="All Star Radar"
				switch(input(src,"What do you want your prize to be?") in prizez)
					if("All Star Radar")
						if(src.tournywin>src.prizecollect){ new /obj/Equipment/Consumable/All_Star_Dragon_Radar(src); src.prizecollect+=1; }
					if("All Star Unlock")
						if(src.tournywin>src.prizecollect&&GiveMedal("All Star Unlock",src)){ src.prizecollect+=1; return;}
					if("Evil Saiyan Unlock")
						if(src.tournywin>src.prizecollect&&GiveMedal("Evil Saiyan Unlock",src)){ src.prizecollect+=1; return;}
					if("Vampire Unlock")
						if(src.tournywin>src.prizecollect&&GiveMedal("Vampire Unlock",src)){ src.prizecollect+=1; return;}
					if("Jester Unlock")
						if(src.tournywin>src.prizecollect&&GiveMedal("Jester Unlock",src)){ src.prizecollect+=1; return;}
					if("Powerlevel")
						if(src.tournywin>src.prizecollect)
							src<<"You have gained [round(src.powerlevel_max/7)] powerlevel."
							src.powerlevel_max += (round(src.powerlevel_max/7))
						src.prizecollect+=1
					if("Ki")
						if(src.tournywin>src.prizecollect)
							src<<"You have gained [round(src.ki_max/7)] ki."
							src.ki_max += (round(src.ki_max/7))
						src.prizecollect+=1
					if("Strength")
						if(src.tournywin>src.prizecollect)
							src<<"You have gained [round(src.strength_max/7)] strength."
							src.strength_max += (round(src.strength_max/7))
						src.prizecollect+=1
					if("Defence")
						if(src.tournywin>src.prizecollect)
							src<<"You have gained [round(src.defence_max/7)] defence."
							src.defence_max += (round(src.defence_max/7))
						src.prizecollect+=1
					if("Training Points")
						if(src.tournywin>src.prizecollect)
							if(src.tp/3.5>=100000)
								src<<"You have gained [round(src.tp/3.5)] training points."
								src.tp += (round(src.tp/3.5))
							else
								src<<"You have gained 100000 training points."
								src.tp += 100000
						src.prizecollect+=1
					if("Karma")
						var/select_karma=input (src,"Which karma?") in list ("Good","Evil")
						if(src.tournywin>src.prizecollect)
							var/karmab=10
							if(karma!=select_karma)
								if(karma_rating<karmab)
									karmab-=karma_rating
									karma_rating=karmab
									karma = select_karma
								else karma_rating-=karmab
							else karma_rating += karmab
							src<<"You have gained [karmab] [select_karma] karma."
						src.prizecollect+=1
					if("Random")
						switch(rand(1,6))
							if(1)
								if(src.tournywin>src.prizecollect)
									src<<"You have gained [round(src.powerlevel_max/5)] powerlevel."
									src.powerlevel_max += (round(src.powerlevel_max/5))
							if(2)
								if(src.tournywin>src.prizecollect)
									src<<"You have gained [round(src.ki_max/5)] ki."
									src.ki_max += src.ki_max/5
							if(3)
								if(src.tournywin>src.prizecollect)
									src<<"You have gained [round(src.strength_max/5)] strength."
									src.strength_max += (round(src.strength_max/5))
							if(4)
								if(src.tournywin>src.prizecollect)
									src<<"You have gained [round(src.defence_max/5)] defence."
									src.defence_max += (round(defence_max/5))
							if(5)
								if(src.tournywin>src.prizecollect)
									if(src.tp/3>=1000000)
										src<<"You have gained [round(src.tp/3)] training points."
										src.tp += (round(src.tp/3))
									else
										src<<"You have gained 1000000 training points."
										src.tp += 1000000
							if(6)
								if(src.tournywin>src.prizecollect)
									var/random_karma=pick("Good","Evil")
									var/karmab=15
									if(src.tournywin>src.prizecollect)
										if(karma!=random_karma)
											if(karma_rating<karmab)
												karmab-=karma_rating
												karma_rating=karmab
												karma = random_karma
											else karma_rating-=karmab
										else karma_rating += karmab
									src<<"You have gained [karmab] of [random_karma] karma."
						src.prizecollect+=1
		TeamPrize(n as num)
			if(!n) n=1
			if(n==1) src<<"Congratulations on winning a team battle event! For being the winning team's sole survivor, you'll recieve the team prize!"
			else src<<"Congratulations on winning a team battle event! For being one of the winning team survivors, you'll recieve part of the team prize!"
			Give_Levels(round(15000/n))
proc
	resettournymembers()
		set background=1
		var/list/newcontender = new()
		for(var/mob/M in Contenders)
			if(M.z==8&&M.x<203&&M.x>192&&M.y<32&&M.y>26)
				if(M.dead)
					M.dead=0
					M.loc=locate(23,215,9)
				else
					newcontender.Add(M)
					M.tourny=1
			else M.tourny=0
		Contenders=null
		Contenders=newcontender
	stopwatchingtourny()
		set background=1
		for(var/mob/M in players)
			if(M.watchingtourny)
				M.verbs -= /mob/Auto_Tournament/verb/Watch_Tournament
				M.watchingtourny=0
				if(M.fused) for(var/mob/N in players)
					if(N.name!=M.fusedw) continue
					M.client.eye = N
				else M.client.eye = M
	Check_Contestents(mob/A,mob/B)
		participent1 = A
		participent2 = B
		for(var/mob/G in players)
			G.verbs -= /mob/Auto_Tournament/verb/Watch_Tournament
			G.verbs += /mob/Auto_Tournament/verb/Watch_Tournament
		matchstarted ++
		if(matchstarted>1)
			matchstarted--
			return
		matches ++
		currentmatch = 1
		if(A){ A.doing=0; A.buku=0; A.ki_lock=0; }
		if(B){ B.doing=0; B.buku=0; B.ki_lock=0; }
		var/loops=0
		while(A&&B)
			if(loops*18>=3600)
				players<<"Match has broken time-limit, match canceled."
				if(A&&B)
					if(A.powerlevel<B.powerlevel)
						players<<"[A] has been eliminated."
						A.loc=locate(23,215,9)
						B.loc=locate(rand(193,202),rand(27,31),8)
						B.z=8
						B.safe=1
					if(B.powerlevel<A.powerlevel)
						players<<"[B] has been eliminated."
						B.loc=locate(23,215,9)
						A.loc=locate(rand(193,202),rand(27,31),8)
						A.z=8
						A.safe=1
					if(A.powerlevel==B.powerlevel)
						A.loc=locate(rand(193,202),rand(27,31),8)
						B.loc=locate(rand(193,202),rand(27,31),8)
						A.z=8
						B.z=8
						A.safe=1
						B.safe=1
				break
			loops++
			if(manualoverridematch)
				manualoverridematch = 0
				manualoverridematchdone = 1
				sleep(18)
				matchstarted=0
				return
			if(auto_tournament_override)
				auto_tournament_overrided=1
				auto_tournament_override=0
				sleep(18)
				matchstarted=0
				return
			A.safe=0
			B.safe=0
			if(!participent1||!participent2)
				if(currentmatch)
					matchstarted=0
					spawn() Tourny_System()
				return
			if(A.dead)
				Contenders.Remove(A)
				Contenders -= A
				if(B) B.loc=locate(rand(193,202),rand(27,31),8)
				if(B) B.safe=1
				if(A) A.tourny=0
				matchstarted=0
				participent1 = null
				participent2 = null
				B.matcheswon++
				B.Match_Prize()
				players<<"[A] has fallen! [B] is the winner!"
				break
			if(B.dead)
				Contenders.Remove(B)
				Contenders -= B
				if(A) A.safe=1
				if(B) B.tourny=0
				participent1 = null
				participent2 = null
				matchstarted=0
				if(A) A.loc=locate(rand(193,202),rand(27,31),8)
				A.matcheswon++
				A.Match_Prize()
				players<<"[B] has fallen! [A] is the winner!"
				break
			if(A.z!=8||A.x<184||A.x>210||A.y<40||A.y>56)
				if(B)
					B.loc=locate(rand(193,202),rand(27,31),8)
					B.safe=1
					B.z=8
				participent1 = null
				participent2 = null
				matchstarted=0
				Contenders.Remove(A)
				Contenders -= A
				if(A) A.tourny=0
				B.matcheswon++
				B.Match_Prize()
				players<<"[A] has left! [B] is the winner!"
				break
			if(B.z!=8||B.x<184||B.x>210||B.y<40||B.y>56)
				if(A)
					A.loc=locate(rand(193,202),rand(27,31),8)
					A.safe=1
					A.z=8
				Contenders.Remove(B)
				participent1 = null
				participent2 = null
				matchstarted=0
				Contenders -= B
				if(B) B.tourny=0
				A.matcheswon++
				A.Match_Prize()
				players<<"[B] has left! [A] is the winner!"
				break
			B.safe=0
			A.safe=0
			sleep(18)
		if(!A && !B) players<<"Both players have left."
		if(!A)
			if(B)
				B.loc=locate(rand(193,202),rand(27,31),8)
				B.safe=1
				B.z=8
			B.matcheswon++
			B.Match_Prize()
			players<<"A player has left! [B] is the winner!"
		if(!B)
			if(A)
				A.loc=locate(rand(193,202),rand(27,31),8)
				A.safe=1
				A.z=8
			A.matcheswon++
			A.Match_Prize()
			players<<"A player has left! [A] is the winner!"
		A=null
		B=null
		spawn() Tourny_System()
	Tourny_System()
		matchstarted = 0
		currentmatch = 0
		participent1 = null
		participent2 = null
		stopwatchingtourny()
		if(auto_tournament_override)
			auto_tournament_overrided=1
			auto_tournament_override=0
			return
		if(currentmatch) return
		if(Contenders.len==1)
			var/mob/PC/W=pick(Contenders)
			W.tournywin+=1
			spawn() W.Check_Prize()
			W.loc=locate(23,215,9)
			W.tourny=0
			W.safe=1
			var/hasmedal=world.GetMedal("World Champion",W)
			if(!hasmedal)
				if(GiveMedal("World Champion",W))
					spawn(10) players<<"<font color=red>[world.name] Medal Information: <font color=white>[W]([W:key]) has won their first tournament and earned the medal 'World Champion'."
			Contenders.Remove(W)
			for(var/mob/E in players){spawn(){ E.tourny=0; E.matcheswon=0; }}
			matches=0
			if(auto_tournament) players<<"<center><font color=blue>The Tournament has ended! [W] is your champion! Tournament entry will re-open in <font color=green>(45 minutes)</font color=green>."
			else players<<"<center><font color=red>The Tournament has ended! [W] is your champion! The Auto-Tournament has been closed until further notice."
			Contenders=new()
			spawn() EndTournaments()
			return
		else
			resettournymembers()
			if(Contenders.len == 2)
				var/mob/A=pick(Contenders)
				var/mob/B=pick(Contenders)
				while(!A||!B||A==B)
					A=pick(Contenders)
					B=pick(Contenders)
				players<<"<font color=teal><center>The final match in the tournament is... [A] vs [B]!!!"
				sleep(11)
				if(!A && !B)
					players<<"Both players have left."
					participent1 = null
					participent2 = null
					Tourny_System()
					return
				if(!A)
					if(B)
						B.loc=locate(rand(193,202),rand(27,31),8)
						B.safe=1
						B.z=8
					participent1 = null
					participent2 = null
					players<<"A player has left! [B] is the winner!"
					Tourny_System()
					return
				if(!B)
					if(A)
						A.loc=locate(rand(193,202),rand(27,31),8)
						A.safe=1
						A.z=8
					players<<"A player has left! [A] is the winner!"
					participent1 = null
					participent2 = null
					Tourny_System()
					return
				A<<"You have <font color=blue>(20)</font color=blue> seconds."
				B<<"You have <font color=blue>(20)</font color=blue> seconds."
				sleep(200)
				if(!A && !B)
					players<<"Both players have left."
					participent1 = null
					participent2 = null
					Tourny_System()
					return
				if(!A)
					if(B)
						B.loc=locate(rand(193,202),rand(27,31),8)
						B.safe=1
						B.z=8
					participent1 = null
					participent2 = null
					players<<"A player has left! [B] is the winner!"
					Tourny_System()
					return
				if(!B)
					if(A)
						A.loc=locate(rand(193,202),rand(27,31),8)
						A.safe=1
						A.z=8
					players<<"A player has left! [A] is the winner!"
					participent1 = null
					participent2 = null
					Tourny_System()
					return
				if(A) {A.loc = locate(201,48,8); A.z=8; A.safe=0;}
				if(B) {B.loc = locate(193,48,8); B.z=8; B.safe=0;}
				players<<"FIGHT!"
				participent1 = A
				participent2 = B
				Check_Contestents(A,B)
			else
				if(Contenders.len > 2)
					var/mob/A=pick(Contenders)
					var/mob/B=pick(Contenders)
					while(!A||!B||A==B)
						A=pick(Contenders)
						B=pick(Contenders)
					if(matches==0)
						players<<"The first round of the Tournament is about to begin"
						sleep(16)
						if(!A && !B)
							players<<"Both players have left."
							participent1 = null
							participent2 = null
							Tourny_System()
							return
						if(!A)
							if(B)
								B.loc=locate(rand(193,202),rand(27,31),8)
								B.safe=1
								B.z=8
							participent1 = null
							participent2 = null
							players<<"A player has left! [B] is the winner!"
							Tourny_System()
							return
						if(!B)
							if(A)
								A.loc=locate(rand(193,202),rand(27,31),8)
								A.safe=1
								A.z=8
							players<<"A player has left! [A] is the winner!"
							participent1 = null
							participent2 = null
							Tourny_System()
							return
						players<<"<center><font color=aqua>The Tournament's first match is... [A] vs [B]!!!"
						A<<"You have <font color=blue>(20)</font color=blue> seconds."
						B<<"You have <font color=blue>(20)</font color=blue> seconds."
						sleep(200)
						if(!A && !B)
							players<<"Both players have left."
							participent1 = null
							participent2 = null
							Tourny_System()
							return
						if(!A)
							if(B)
								B.loc=locate(rand(193,202),rand(27,31),8)
								B.safe=1
								B.z=8
							participent1 = null
							participent2 = null
							players<<"A player has left! [B] is the winner!"
							Tourny_System()
							return
						if(!B)
							if(A)
								A.loc=locate(rand(193,202),rand(27,31),8)
								A.safe=1
								A.z=8
							players<<"A player has left! [A] is the winner!"
							participent1 = null
							participent2 = null
							Tourny_System()
							return
						if(A) {A.loc = locate(201,48,8); A.z=8; A.safe=0;}
						if(B) {B.loc = locate(193,48,8); B.z=8; B.safe=0;}
						players<<"FIGHT!"
						participent1 = A
						participent2 = B
						Check_Contestents(A,B)
					else
						players<<"<center><font color=blue>The Tournament's next match is... [A] vs [B]!!!"
						A<<"You have <font color=blue>(20)</font color=blue> seconds."
						B<<"You have <font color=blue>(20)</font color=blue> seconds."
						sleep(200)
						if(!A && !B)
							players<<"Both players have left."
							participent1 = null
							participent2 = null
							Tourny_System()
							return
						if(!A)
							if(B)
								B.loc=locate(rand(193,202),rand(27,31),8)
								B.safe=1
								B.z=8
							participent1 = null
							participent2 = null
							players<<"A player has left! [B] is the winner!"
							Tourny_System()
							return
						if(!B)
							if(A)
								A.loc=locate(rand(193,202),rand(27,31),8)
								A.safe=1
								A.z=8
							players<<"A player has left! [A] is the winner!"
							participent1 = null
							participent2 = null
							Tourny_System()
							return
						if(A) {A.loc = locate(201,48,8); A.z=8; A.safe=0;}
						if(B) {B.loc = locate(193,48,8); B.z=8; B.safe=0;}
						players<<"FIGHT!"
						participent1 = A
						participent2 = B
						Check_Contestents(A,B)
		if(!Contenders.len)
			players<<"The are no more participents in the automatic tournament, tournament Canceld."
			players<<"<center><font color=blue>The Tournament has ended! Tournament entry will re-open in <font color=green>(45 minutes)</font color=green>."
			spawn() EndTournaments()
	Start_Auto_Tournament()
		set background=1
		if(tournament==1) return
		if(auto_tournament==1)
			for(var/mob/A in players) A.tourny=0
			players << "<center><font size=3><font color=blue><b><center>The Auto Tournament is about to begin! Please join via the Tournament tab."
			tournament = 1
			tournament_entry = 1
			for(var/mob/M in players)
				M.verbs += /mob/Auto_Tournament/verb/Enter_Auto_Tournament
				M.verbs += /mob/Auto_Tournament/verb/Leave_Auto_Tournament
			sleep(1200)
			if(auto_tournament_override) return
			tournament_entry = 0
			resettournymembers()
			for(var/mob/L in players)
				L.verbs -= /mob/Auto_Tournament/verb/Enter_Auto_Tournament
				L.verbs -= /mob/Auto_Tournament/verb/Leave_Auto_Tournament
			if(Contenders.len < 2)
				players<<"<center><font color=maroon>The Auto Tournament does not have enough contestents! Tournament entry will re-open in <font color=red>(45 minutes)</font color=red>."
				for(var/mob/S in Contenders)
					S.tourny=null
					S.loc = locate(23,215,9)
				spawn() EndTournaments()
			else
				players<<"<center><font size=2><font color=olive><b>The Auto Tournament entry has ended."
				players<<"To watch matches, goto the channels tab once the match begins."
				Tourny_Decide()
	Start_Auto_Tournament_System()
		auto_tournament++
		auto_tournament_overrided=0
		auto_tournament_override=0
		manualoverridematch=0
		manualoverridematchdone=0
		if(tournytimer) tournytimer=0
		spawn() Start_Auto_Tournament()
	Tourny_Decide()
		set background=1
		if(Contenders.len==2) Tourny_System()
		else
			if(Contenders.len==3) FFA_System()
			else
				if(Contenders.len>=4&&NumCheck(Contenders.len)&&prob(50)) TeamBattleStart()
				else
					if(Contenders.len/2==round(Contenders.len/2,1)&&prob(75)) Tourny_System()
					else FFA_System()
	FFA_System()
		set background = 1
		players<<"<center><font color=yellow>Free For All time!!!!"
		stopwatchingtourny()
		if(auto_tournament_override)
			auto_tournament_overrided=1
			auto_tournament_override=0
			return
		currentmatch=1
		FFA_Tournament=1
		for(var/mob/M in Contenders)
			M<<"You have fourty-five seconds."
		sleep(450)
		players<<"Fight!"
		for(var/mob/N in Contenders) if(N)
			spawn(){ N.loc=locate(rand(112,138),rand(113,137),9);N.z=9;N.safe=0;}
		spawn(4) FFA_Battle()
	FFA_Battle()
		set background=1
		for(var/mob/N in Contenders)
			N.doing=0
			N.safe=0
			N.buku=0
			N.ki_lock=0
		for(var/mob/G in players)
			G.verbs -= /mob/Auto_Tournament/verb/Watch_Tournament
			G.verbs += /mob/Auto_Tournament/verb/Watch_Tournament
		while(Contenders.len>1)
			for(var/mob/M in Contenders)
				if(M)
					if(M.dead)
						players<<"[M] has been eliminated!"
						Contenders.Remove(M)
						Contenders-=M
						continue
					if(M.z!=9)
						players<<"[M] has left!"
						Contenders.Remove(M)
						Contenders-=M
						continue
			if(Contenders)
				var/list/newcontenderslist=list()
				for(var/mob/A in Contenders) if(A) if(A.z==9&&!A.dead) newcontenderslist.Add(A)
				Contenders=null
				Contenders=new()
				Contenders=newcontenderslist
			sleep(13)
		FFA_Tournament=0
		FFA_Finish()
	FFA_Timer()
		set background=1
		if(FFA_Tournament)
			spawn(4500)
				if(FFA_Tournament)
					var/N=FFA_Tournament_Reset()
					if(!N) return
					else
						var/highestpl=0
						var/mob/lastchecked
						for(var/mob/M in Contenders) if(M.powerlevel>highestpl)
							highestpl=M.powerlevel
							lastchecked=M
							M.loc = locate(23,215,9)
						players<<"Tournament time limit broken! The default winner is [lastchecked]!"
						Contenders = null
						Contenders = new()
						Contenders.Add(lastchecked)
						FFA_Tournament=0
						tournament=0
						currentmatch=0
						spawn() FFA_Finish()
	FFA_Tournament_Reset()
		set background=1
		var/list/newcontender = new()
		for(var/mob/M in Contenders)
			if(M.z==9)
				if(M.dead) M.loc=locate(55,6,8)
				else newcontender.Add(M)
			else M.tourny=0
		Contenders=null
		Contenders=new()
		sleep(18)
		Contenders=newcontender
		return Contenders.len
	FFA_Finish()
		set background=1
		currentmatch=0
		if(Contenders.len)
			var/mob/W=pick(Contenders)
			if(W)
				W.matcheswon++
				W.Match_Prize()
				W.tournywin++
				W.matcheswon=0
				spawn() W.Check_Prize(W)
				W.loc = locate(23,215,9)
				W.tourny=0
				W.safe=1
				GiveMedal("World Champion",W)
			players<<"<center><font color=blue>The Tournament has ended! [W] is your champion! Tournament entry will re-open in <font color=green>(45 minutes)</font color=green>."
		else players<<"<center><font color=blue>The Tournament has ended, no contestants are left! Tournament entry will re-open in <font color=green>(45 minutes)</font color=green>."
		spawn() EndTournaments()
	EndTournaments()
		Contenders = null
		Contenders = new()
		tournament = 0
		FFA_Tournament = 0
		currentmatch = 0
		tournytimer = 45
		matchstarted = 0
		participent1 = null
		participent2 = null
		spawn() stopwatchingtourny()
	PullTeamMembers()
		var{list{a=new();b=new();c=new();l=new();};mob{strongest;weakest;};j=0;html=""}
		if(Contenders.len%3==round(Contenders.len%3)) j=1
		while(Contenders.len)
			if(j){ if(b.len>c.len){ l=c }; else{ if(a.len>b.len){ l=b }; else{ l=a };};}; else{ if(a.len>b.len){ l=b }; else{ l=a }}
			for(var/n in 1 to Contenders.len)
				var/mob/m=Contenders[n]
				n++
				if(!strongest||m.AveragePower()>=strongest.AveragePower()) strongest=m
				if(!weakest||m.AveragePower()<=weakest.AveragePower()) weakest=m
			Contenders.Remove(strongest); Contenders-=strongest; Contenders.Remove(weakest); Contenders-=weakest
			l.Add(strongest,weakest)
			strongest=null
			weakest=null
		html+="Your team is as follows:"
		for(var/mob/m in a) html+="\n[getFlatIcon(m)] [m], Level [m.level]."
		a<<html
		html="Your team is as follows:"
		for(var/mob/m in b) html+="\n[getFlatIcon(m)] [m], Level [m.level]."
		b<<html
		html="Your team is as follows:"
		for(var/mob/m in c) html+="\n[getFlatIcon(m)] [m], Level [m.level]."
		c<<html
		if(j) TeamBattle(a,b,c)
		else TeamBattle(a,b)
	TeamBattleStart()
		players<<"Looks like we'll be having a team battle!"
		Contenders<<"You have <font color=blue>(45)</font color> seconds!"
		spawn(45) PullTeamMembers()
	TeamBattle()
		if(!args) return
		for(var/list/l in args) for(var/mob/m in l){ m.loc=locate(rand(112,138),rand(113,137),9); m.z=9;}
		var/n=args.len
		while(n>1)
			for(var/list/l in args)
				if(l.len)
					for(var/mob/m in l)
						if(!m) {l=resetContenders(l); break;}
						else {if(m.dead||m.z!=9){players<<"[m] has been eliminated!";l.Remove(m);l-=m;}; m.safe=0 }
				else{ args-=l; del l; n --; }
			sleep(18)
		if(!args){ players<<"No teams remain!";return; }
		else{ var/t="Due to surviving the team tournament, the following will recieve a prize: "; for(var/list/l in args){ for(var/mob/m in l){ spawn(){m.TeamPrize(l.len); m.loc=locate(23,215,9);} t=t+"{[m]}"}} players<<t}
		spawn() EndTournaments()
	resetContenders(list/l)
		var/list/newl=new()
		for(var/mob/m in l) if(m&&!m.dead&&m.z==9) newl.Add(m)
		return newl
mob
	Auto_Tourny
		verb
			Start_Auto_Tourn()
				set category = "Server"
				set name = "Tournament: Start Auto System"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(tournament)
					usr<<"There is already a tournament active."
					return
				if(auto_tournament)
					usr<<"The Auto Tournament system is currently active."
					return
				Start_Auto_Tournament_System()
			Stop_Auto_Tournament_System()
				set category = "Server"
				set name = "Tournament: Stop Auto System"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(auto_tournament==0) usr<<"The Auto Tournament system is currently offline."
				else
					auto_tournament=0
					if(tournament==1) usr<<"The auto tournament system will shut down after the current tournament."
					else players<<"[usr] has ended the auto tournament system"
			Manual_override()
				set category = "Server"
				set name = "Tournament: Override"
				if(!GMLockCheck())
					usr<<"<font color=red>Your Admin Powers Are Locked."
					return
				if(usr.GMLevel<8)
					usr<<"This is for level 8 admins and up!"
					return
				var/list/options = list("Reset Match","Reset Tournament","End Tournament","Cancel")
				switch(input("What would you like to do?") in options)
					if("Cancel") return
					if("Reset Match")
						if(tournament)
							matches--
							var/mob/M1 = participent1
							currentmatch = 0
							var/mob/M2 = participent2
							M1.loc=locate(rand(193,202),rand(27,31),8)
							M2.loc=locate(rand(193,202),rand(27,31),8)
							manualoverridematch = 1
							stopwatchingtourny()
							while(!manualoverridematchdone)
								sleep(20)
							if(manualoverridematchdone)
								players<<"[usr] has reset the tournament match."
								manualoverridematchdone = 0
								spawn() Tourny_System()
						else usr<<"There is no current tournament."
					if("End Tournament")
						if(auto_tournament||tournament)
							auto_tournament=0
							auto_tournament_override=1
							players<<"[usr] has stopped the tournament."
							stopwatchingtourny()
							auto_tournament=0
							tournament=0
							currentmatch=0
							tournament_entry=0
							matches=0
							tournytimer=0
							for(var/mob/M in players)
								if(M.tourny||Contenders.Find(M)||Contenders.Find(src)&&M.z==8) M.loc = locate(23,215,9)
								M.verbs -= /mob/Auto_Tournament/verb/Enter_Auto_Tournament
								M.verbs -= /mob/Auto_Tournament/verb/Leave_Auto_Tournament
								M.tourny=0
							resettournymembers()
							sleep(50)
							auto_tournament_overrided=0
						else usr<<"There is currently no tournament."
					if("Reset Tournament")
						if(auto_tournament)
							auto_tournament=0
							auto_tournament_override=1
							stopwatchingtourny()
							var/looped=0
							while(!auto_tournament_overrided&&looped<8)
								looped++
								sleep(20)
							if(auto_tournament_overrided||looped>=8)
								players<<"[usr] has reset the auto tournament."
								for(var/mob/K in players)
									if(K.tourny)
										K.tourny=0
										K.loc=locate(23,215,9)
								resettournymembers()
								tournament=0
								spawn() Start_Auto_Tournament_System()
						else usr<<"There is currently no auto tournament going on."
var
	manualoverridematch = 0
	manualoverridematchdone = 0
	auto_tournament_override = 0
	auto_tournament_overrided = 0