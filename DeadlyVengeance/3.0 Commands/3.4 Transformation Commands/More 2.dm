






mob/proc/Evil_Revert()
	if(src.KO)
		src <<"No cheating"
		return
	if(src.form_1)

		src.frozen = 1
		src.icon_state = "enrage"

		sleep(10)

		src.form_1 = 0
		src.form_2 = 0
		src.form_3 = 0
		src.form_4 = 0
		src.form_5 = 0
		src.form_6 = 0
		src.form_7 = 0

		src.overlays -= small_blue_elec
		src.overlays -= big_blue_elec

		src.overlays -= small_red_elec
		src.overlays -= big_red_elec

		src.overlays -= small_purple_elec
		src.overlays -= big_purple_elec

		src.overlays -= mystic_elec

		src.icon = 'Evil Sayain 1.dmi'
		src.Power_Redefine()
		src.Skin_Apply()

		oview() << "[src.name] has reverted from his Transformed state."
		src.icon_state = ""
		src.frozen = 0
		src.doing = 0

		return
	else
		return




mob/proc/Evil_Trans()
	var/trans_time = 27

	if(src.upkeep == 5)
		trans_time = 5

	if(src.doing)
		return
	if(src.KO)
		return
	else
		if(!src.form_1)
			if(src.powerlevel_max >= 85000)
				src.safe = 1
				src.doing = 1
				src.icon_state = "SS"
				src.frozen = 1
				sleep(trans_time)

				src.powerlevel = src.powerlevel_max
				src.ki = src.ki_max
				src.strength = src.strength_max
				src.defence = src.defence_max
				src.critical = src.critical_max
				src.dodge = src.dodge_max
				src.reflect = src.reflect_max
				src.block = src.block_max

				src.powerlevel *= 13
				src.ki *= 10
				src.strength *= 9
				src.defence *= 8

				src.block += 2
				src.dodge += 2
				src.critical += 5
				src.reflect += 5
				src.counter += 2

				src.speed = 3.8

				view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain!"
				src.icon_state = ""
				src.icon = 'Evil Sayain 2.dmi'
				new/obj/techs/Overlays/Crater_Small(src.loc)

				src.form_1 = 1
				src.frozen = 0
				src.doing = 0
				src.safe = 0
				src.FORM1_EXP()
//				src.Transformation_Strain()
				return
		else
			if(!src.form_2)
				if(src.powerlevel_max >= 2500000)
					src.safe = 1
					src.doing = 1
					src.icon_state = "SS"
					src.frozen = 1
					sleep(trans_time)

					src.powerlevel = src.powerlevel_max
					src.ki = src.ki_max
					src.critical = src.critical_max
					src.dodge = src.dodge_max
					src.strength = src.strength_max
					src.defence = src.defence_max
					src.reflect = src.reflect_max
					src.block = src.block_max

					src.powerlevel = src.powerlevel_max
					src.powerlevel *= 18
					src.ki *= 15
					src.strength *= 14
					src.defence *= 13

					src.block += 4
					src.dodge += 4
					src.critical += 7
					src.reflect += 7
					src.counter += 4

					src.speed = 3

					view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 2!"
					src.icon_state = ""
					src.icon = 'Evil Sayain 3.dmi'
					new/obj/techs/Overlays/Crater_Small(src.loc)

					src.form_2 = 1
					src.frozen = 0
					src.doing = 0
					src.safe = 0
					return
			else
				if(!src.form_3)
					if(src.powerlevel_max >= 5000000)
						src.safe = 1
						src.doing = 1
						src.icon_state = "SS"
						src.frozen = 1
						sleep(trans_time)

						src.powerlevel = src.powerlevel_max
						src.ki = src.ki_max
						src.critical = src.critical_max
						src.dodge = src.dodge_max
						src.strength = src.strength_max
						src.defence = src.defence_max
						src.reflect = src.reflect_max
						src.block = src.block_max

						src.powerlevel = src.powerlevel_max
						src.powerlevel *= 23
						src.ki *= 20
						src.strength *= 19
						src.defence *= 18

						src.block += 6
						src.dodge += 6
						src.critical += 8
						src.reflect += 8
						src.counter += 6

						src.speed = 2.5

						src.overlays += small_purple_elec

						view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 3!"
						src.icon_state = ""
						src.icon = 'Evil Sayain 4.dmi'
						new/obj/techs/Overlays/Crater_Small(src.loc)
						src.form_3 = 1
						src.frozen = 0
						src.doing = 0
						src.safe = 0
						return
				else
					if(!src.form_4)
						if(src.powerlevel_max >= 17500000)
							src.safe = 1
							src.doing = 1
							src.icon_state = "SS"
							src.frozen = 1
							sleep(trans_time)

							src.powerlevel = src.powerlevel_max
							src.ki = src.ki_max
							src.critical = src.critical_max
							src.dodge = src.dodge_max
							src.strength = src.strength_max
							src.defence = src.defence_max
							src.reflect = src.reflect_max
							src.block = src.block_max

							src.powerlevel *= 28
							src.ki *= 25
							src.strength *= 24
							src.defence *= 23

							src.block += 10
							src.dodge += 10
							src.critical += 12
							src.reflect += 12
							src.counter += 10

							src.speed = 1.8

							src.overlays -= small_purple_elec
							src.overlays += big_purple_elec

							view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 4!"
							src.icon_state = ""
							src.icon = 'Evil Sayain 5.dmi'
							new/obj/techs/Overlays/Crater_Center(src.loc)
							src.form_4 = 1
							src.frozen = 0
							src.doing = 0
							src.safe = 0
							return
					else
						if(!src.form_5)
							if(src.powerlevel_max >= 50000000)
								src.safe = 1
								src.doing = 1
								src.icon_state = "SS"
								src.frozen = 1
								sleep(trans_time)

								src.powerlevel = src.powerlevel_max
								src.ki = src.ki_max
								src.critical = src.critical_max
								src.dodge = src.dodge_max
								src.strength = src.strength_max
								src.defence = src.defence_max
								src.reflect = src.reflect_max
								src.block = src.block_max

								src.powerlevel *= 330
								src.ki *= 300
								src.strength *= 290
								src.defence *= 280

								src.block += 9
								src.dodge += 9
								src.critical += 11
								src.reflect += 11
								src.counter += 9

								src.speed = 1.8


								view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 5!"
								src.icon_state = ""
								src.icon = 'Evil Sayain 6.dmi'
								new/obj/techs/Overlays/Crater_Center(src.loc)
								src.form_5 = 1
								src.frozen = 0
								src.doing = 0
								src.safe = 0

								src.overlays += big_purple_elec
								return
						else
							if(!src.form_6)
								if(src.powerlevel_max >= 100000000)
									src.safe = 1
									src.doing = 1
									src.icon_state = "SS"
									src.frozen = 1
									sleep(trans_time)

									src.powerlevel = src.powerlevel_max
									src.ki = src.ki_max
									src.critical = src.critical_max
									src.dodge = src.dodge_max
									src.strength = src.strength_max
									src.defence = src.defence_max
									src.reflect = src.reflect_max
									src.block = src.block_max

									src.powerlevel *=845
									src.ki *= 562
									src.strength *= 450
									src.defence *= 1600

									src.block += 90
									src.dodge += 90
									src.critical += 110
									src.reflect += 110
									src.counter += 90

									src.speed = 1


									view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 6!"
									src.icon_state = ""
									src.icon = 'Evil Sayain 7.dmi'
									new/obj/techs/Overlays/Crater_Center(src.loc)
									src.form_6 = 1
									src.frozen = 0
									src.doing = 0
									src.safe = 0

									src.overlays += big_purple_elec
									return
							else
								if(!src.form_7)
									if(src.powerlevel_max >= 100000000)
										src.safe = 1
										src.doing = 1
										src.icon_state = "SS"
										src.frozen = 1
										sleep(trans_time)

										src.powerlevel = src.powerlevel_max
										src.ki = src.ki_max
										src.critical = src.critical_max
										src.dodge = src.dodge_max
										src.strength = src.strength_max
										src.defence = src.defence_max
										src.reflect = src.reflect_max
										src.block = src.block_max

										src.powerlevel *=845
										src.ki *= 562
										src.strength *= 450
										src.defence *= 1600

										src.block += 95
										src.dodge += 94
										src.critical += 1121
										src.reflect += 111
										src.counter += 99

										src.speed = 1


										view(6) << "<font color = blue>[src.name]'s power surges as they Transform to Super Evil Sayain 7!"
										src.icon_state = ""
										src.icon = 'Evil Sayain 8.dmi'
										new/obj/techs/Overlays/Crater_Center(src.loc)
										src.form_7 = 1
										src.frozen = 0
										src.doing = 0
										src.safe = 0

										src.overlays += big_purple_elec
										return