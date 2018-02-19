mob/
	var
		fatigue_level = 0
	proc
		UA_Level_Up()
			if(src.unarmed == src.unarmed_max)
				src.unarmed_exp = 0
				return
			if(src.unarmed_exp >= src.unarmed_tnl)
				src.unarmed_exp = 0
				src.unarmed ++
				src.unarmed_tnl = 250
				src<< "<font color = blue>Unarmed Skill has increased to [src.unarmed]</font>"
		Ki_Level_Up()
			if(src.ki_skill == src.ki_skill_max)
				src.ki_exp = 0
				return
			if(src.ki_exp >= src.ki_tnl)
				src.ki_exp = 0
				src.ki_skill ++
				src.ki_tnl = 250
				src<< "<font color = blue>Ki Skill has increased to [src.ki_skill]</font>"
		Fatigue_Level_Up()
			if(src.fatigue_exp >= src.fatigue_tnl)
				src.fatigue_exp = 0
				src.fatigue_level ++
				src.fatigue_tnl = (src.fatigue_level * src.fatigue_level) * 5
				src<< "\white You feel your Endurance increase..."
				if(prob(src.level)) src.fatigue_max += round(src.level * 1.05)
				else src.fatigue_max += rand(1,3)