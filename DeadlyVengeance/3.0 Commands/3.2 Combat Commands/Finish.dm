mob/var
 tmp/finish_delay = 0
 saga_finished = 0
mob/PC/verb/Finish(mob/M in get_step(usr,usr.dir))
	set category = "Combat"
	var/exp_bonus = M.tnl
	if(!M) return
	if(M.safe||M.dead)
		src<< "A force stops you from attacking [M]!"
		return
	if(src.finish_delay)
		src<< "You must wait a moment before trying to Finish Someone!"
		return
	if(M.KO)
		if(istype(M,/mob/PC))
			M.exp = 0
			src.Gain_Exp(exp_bonus,"Combat")
			src<< "\white Exp + [exp_bonus]"
		M.DeathCheck(src)
	else
		src<< "They're not knocked out yet!"
	src.finish_delay = 1
	spawn(2) src.finish_delay = 0
	src.afk_time = 0