mob/learn
	verb
		Psycho_Barrier()
			set category = "Techniques"
			if(src.absorbing)
				src<< "You stop Your Barrier."
				src.absorbing = 0
				src.frozen = 0
			if(src.doing) src.doing --
			else
				if(src.doing||src.dual_training||src.selftraining||src.boxing||src.meditation||src.meditate) return
				src<< "Your Psycho Barrier is ready for attacks"
				src.absorbing = 1
				src.frozen = 1
				if(!src.doing) src.doing ++
				src.Icon_State("absorb")
				src.afk_time = 0