mob/learn
	verb
		Energy_Field()
			set category = "Techniques"
			if(src.absorbing)
				src<< "You stop your Energy Field."
				src.absorbing = 0
				src.frozen = 0
				if(src.doing) src.doing --
			else
				if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)return
				src<< "Your Energy Field is ready for attacks"
				src.absorbing = 1
				src.frozen = 1
				if(!src.doing) src.doing ++
				src.Icon_State("absorb")
			src.afk_time = 0
		Legend_Shield()
			set category = "Techniques"
			if(src.absorbing)
				src<< "You stop your Shield."
				src.absorbing = 0
				src.frozen = 0
				if(src.doing) src.doing --
			else
				if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate)return
				src<< "Your Legend Shield is ready for attacks"
				src.absorbing = 1
				src.frozen = 1
				if(!src.doing) src.doing ++
				src.Icon_State("absorb")
			src.afk_time = 0