mob
	proc
		SH_Hair_Apply()
			switch(hair)
				if("Hercule")
					overlays -= hercule_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays += hercule_hair_sh
				if("Goku")
					overlays -= goku_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays += goku_hair_sh
				if("Adult Gohan")
					overlays -= gohan_adult_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays += gohan_adult_hair_sh
				if("Teen Gohan")
					overlays -= gohan_teen_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays += gohan_teen_hair_sh
				if("Future Gohan")
					overlays -= future_gohan_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays += future_gohan_hair_sh
				if("Vegeta")
					overlays -= vegeta_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays += vegeta_hair_sh
				if("Trunks Long")
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= trunks_long_hair
					overlays += trunks_long_hair_sh
		SH2_Hair_Apply()
			switch(hair)
				if("Hercule")
					overlays -= hercule_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= hercule_hair_sh
					overlays += hercule_hair_sh2
				if("Goku")
					overlays -= goku_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= goku_hair_sh
					overlays += goku_hair_sh2
				if("Adult Gohan")
					overlays -= gohan_adult_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= gohan_adult_hair_sh
					overlays += gohan_adult_hair_sh2
				if("Teen Gohan")
					overlays -= gohan_teen_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= gohan_teen_hair_sh
					overlays += gohan_teen_hair_sh2
				if("Future Gohan")
					overlays -= future_gohan_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= future_gohan_hair_sh
					overlays += future_gohan_hair_sh2
				if("Vegeta")
					overlays -= vegeta_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= vegeta_hair_sh
					overlays += vegeta_hair_sh2
				if("Trunks Long")
					overlays -= trunks_long_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= trunks_long_hair_sh
					overlays += trunks_long_hair_sh2
				if("Raditz")
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= raditz_hair
					overlays += raditz_hair_sh2
		SSJ_Hair_Apply()
			switch(hair)
				if("Hercule")
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= hercule_hair
					overlays += hercule_hair_ssj
				if("Goku")
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= goku_hair
					overlays += goku_hair_ssj
				if("Adult Gohan")
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= gohan_adult_hair
					overlays += gohan_adult_hair_ssj
				if("Teen Gohan")
					overlays -= hair_color
					overlays -= coloredhair
					overlays -= gohan_teen_hair
					overlays += gohan_teen_hair_ssj
				if("Future Gohan")
					overlays -= future_gohan_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays += future_gohan_hair_ssj
				if("Vegeta")
					overlays -= vegeta_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays += vegeta_hair_ssj
				if("Trunks Long")
					overlays -= trunks_long_hair
					overlays -= hair_color
					overlays -= coloredhair
					overlays += trunks_long_hair_ssj
				if("Raditz")
					overlays -= hair_color
					overlays -= raditz_hair
					overlays -= coloredhair
					overlays += raditz_hair_ssj
		USSJ_Hair_Apply()
			switch(hair)
				if("Goku")
					overlays -= goku_hair_assj
					overlays += goku_hair_ussj
				if("Adult Gohan")
					overlays -= gohan_adult_hair_assj
					overlays += gohan_adult_hair_ussj
				if("Teen Gohan")
					overlays -= gohan_teen_hair_assj
					overlays += gohan_teen_hair_ussj
				if("Future Gohan")
					overlays -= future_gohan_hair_assj
					overlays += future_gohan_hair_ussj
				if("Vegeta")
					overlays -= vegeta_hair_assj
					overlays += vegeta_hair_ussj
				if("Trunks Long")
					overlays -= trunks_long_hair_assj
					overlays += trunks_long_hair_ussj
				if("Hercule")
					overlays -= hercule_hair_assj
					overlays += hercule_hair_ussj
		ASSJ_Hair_Apply()
			overlays -= coloredhair
			switch(hair)
				if("Goku")
					overlays += goku_hair_assj
					overlays -= goku_hair_ussj
				if("Adult Gohan")
					overlays += gohan_adult_hair_assj
					overlays -= gohan_adult_hair_ussj
				if("Teen Gohan")
					overlays += gohan_teen_hair_assj
					overlays -= gohan_teen_hair_ussj
				if("Future Gohan")
					overlays += future_gohan_hair_assj
					overlays -= future_gohan_hair_ussj
				if("Vegeta")
					overlays += vegeta_hair_assj
					overlays -= vegeta_hair_ussj
				if("Trunks Long")
					overlays += trunks_long_hair_assj
					overlays -= trunks_long_hair_ussj
				if("Hercule")
					overlays += hercule_hair_assj
					overlays -= hercule_hair_ussj
		Hair_Apply()
			overlays -= hair_ssj3
			overlays -= hair_ssj4
			switch(hair)
				if("Raditz")
					overlays -= raditz_hair_ssjb
					overlays -= raditz_hair_ssjg
					overlays -= raditz_hair_ssj
					overlays -= raditz_hair_sh2
					overlays -= raditz_hair
					overlays += coloredhair
				if("Hercule")
					overlays -= hercule_hair_ssjb
					overlays -= hercule_hair_ssjg
					overlays -= hercule_hair_sh
					overlays -= hercule_hair_sh2
					overlays -= hercule_hair_ssj
					overlays -= hercule_hair_assj
					overlays -= hercule_hair_ussj
					overlays -= hercule_hair_sh
					overlays -= hercule_hair
					overlays += coloredhair
				if("Goku")
					overlays -= goku_hair_ssjb
					overlays -= goku_hair_ssjg
					overlays -= goku_hair_sh
					overlays -= goku_hair_sh2
					overlays -= goku_hair_ssj
					overlays -= goku_hair_assj
					overlays -= goku_hair_ussj
					overlays -= goku_hair
					overlays += coloredhair
				if("Adult Gohan")
					overlays -= gohan_adult_hair_ssjg
					overlays -= gohan_adult_hair_ssjb
					overlays -= gohan_adult_hair_sh
					overlays -= gohan_adult_hair_sh2
					overlays -= gohan_adult_hair_ssj
					overlays -= gohan_adult_hair_assj
					overlays -= gohan_adult_hair_ussj
					overlays -= gohan_adult_hair
					overlays += coloredhair
				if("Teen Gohan")
					overlays -= gohan_teen_hair_ssjb
					overlays -= gohan_teen_hair_ssjg
					overlays -= gohan_teen_hair_sh
					overlays -= gohan_teen_hair_sh2
					overlays -= gohan_teen_hair_ssj
					overlays -= gohan_teen_hair_assj
					overlays -= gohan_teen_hair_ussj
					overlays -= gohan_teen_hair
					overlays += coloredhair
				if("Future Gohan")
					overlays -= future_gohan_hair_ssjg
					overlays -= future_gohan_hair_ssjb
					overlays -= future_gohan_hair_sh
					overlays -= future_gohan_hair_sh2
					overlays -= future_gohan_hair_ssj
					overlays -= future_gohan_hair_assj
					overlays -= future_gohan_hair_ussj
					overlays -= future_gohan_hair
					overlays += coloredhair
				if("Vegeta")
					overlays -= vegeta_hair_ssjg
					overlays -= vegeta_hair_ssjb
					overlays -= vegeta_hair_sh
					overlays -= vegeta_hair_sh2
					overlays -= vegeta_hair_ssj
					overlays -= vegeta_hair_assj
					overlays -= vegeta_hair_ussj
					overlays -= vegeta_hair
					overlays += coloredhair
				if("Trunks Long")
					overlays -= trunks_long_hair_ssjg
					overlays -= trunks_long_hair_ssjb
					overlays -= trunks_long_hair_sh
					overlays -= trunks_long_hair_sh2
					overlays -= trunks_long_hair_ssj
					overlays -= trunks_long_hair_assj
					overlays -= trunks_long_hair_ussj
					overlays -= trunks_long_hair
					overlays += coloredhair
		Skin_Apply()
			if(!src.client)return
			switch(src.skin)
				if("Male White")
					src.icon = 'Male - White.dmi'
				if("Male Tan")
					src.icon = 'Male - Tan.dmi'
				if("Male Dark")
					src.icon = 'Male - Dark.dmi'
//				if("Female White")
//					src.icon = 'Male - White.dmi'
//				if("Female Tan")
//					src.icon = 'Male - Tan.dmi'
//				if("Female Dark")
//					src.icon = 'Male - Dark.dmi'
		USSJ_Apply()
			if(!src.client)return
			switch(src.skin)
				if("white")
					src.icon = 'Male - White USSJ.dmi'
				if("tan")
					src.icon = 'Male - Tan USSJ.dmi'
				if("dark")
					src.icon = 'Male - Dark USSJ.dmi'