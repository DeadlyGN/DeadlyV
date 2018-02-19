turf/Island_Edge
	name = ""
	icon = 'Island Edge.dmi'
	Island_Edge_001
		icon_state = "001"
		density = 1
	Island_Edge_002
		icon_state = "002"
		density = 1
	Island_Edge_003
		icon_state = "003"
		density = 1
	Island_Edge_004
		icon_state = "004"
		density = 1
	Island_Edge_005
		icon_state = "005"
		density = 0
	Island_Edge_005x
		icon_state = "005x"
		density = 0
	Island_Edge_006
		icon_state = "006"
		density = 1
	Island_Edge_007
		icon_state = "007"
		density = 1
	Island_Edge_008
		icon_state = "008"
		density = 1
	Island_Edge_009
		icon_state = "009"
		density = 1
	Island_Edge_010
		icon_state = "010"
		density = 1
	Island_Edge_011
		icon_state = "011"
		density = 1
	Island_Edge_012
		icon_state = "012"
		density = 1
	Island_Edge_013
		icon_state = "013"
		density = 1
	Island_Edge_014
		icon_state = "014"
		density = 1
	Island_Edge_015
		icon_state = "015"
		density = 1
	Island_Edge_016
		icon_state = "016"
		density = 1
	Island_Edge_017
		icon_state = "017"
		density = 1
	Island_Edge_018
		icon_state = "018"
		density = 1
	Island_Edge_019
		icon_state = "019"
		density = 1
	Island_Edge_001b
		icon_state = "001hyu"
		density = 1
	Island_Edge_002b
		icon_state = "002hyu"
		density = 1
	Island_Edge_003b
		icon_state = "003hyu"
		density = 1
	Island_Edge_004b
		icon_state = "004hyu"
		density = 1
	Island_Edge_005b
		icon_state = "005hyu"
		density = 0
	Island_Edge_006b
		icon_state = "006hyu"
		density = 1
	Island_Edge_007b
		icon_state = "007hyu"
		density = 1
	Island_Edge_008b
		icon_state = "008hyu"
		density = 1
	Island_Edge_009b
		icon_state = "009hyu"
		density = 1
	Island_Edge_010b
		icon_state = "010hyu"
		density = 1
	Island_Edge_011b
		icon_state = "011hyu"
		density = 1
	Island_Edge_012b
		icon_state = "012hyu"
		density = 1
	Island_Edge_013b
		icon_state = "013hyu"
		density = 1
	Island_Edge_014b
		icon_state = "014hyu"
		density = 1
	Island_Edge_015b
		icon_state = "015hyu"
		density = 1
	Island_Edge_016b
		icon_state = "016hyu"
		density = 1
	Island_Edge_017b
		icon_state = "017hyu"
		density = 1
	Island_Edge_018b
		icon_state = "018hyu"
		density = 1
	Grass_Edge_1
		name = ""
		icon_state = "grass edge 1"
		density = 1
	Grass_Edge_2
		name = ""
		icon_state = "grass edge 2"
		density = 1
	Grass_Edge_3
		name = ""
		icon_state = "grass edge 3"
		density = 1
	Grass_Edge_4
		name = ""
		icon_state = "grass edge 4"
		density = 1
	Spike
		name = "spike"
		icon_state = "spike"
		density = 1
	Rock
		name = ""
		icon_state = "rock"
		density = 1
	Dead_Grass
		name = ""
		icon_state = "dead"
		density = 0
	Water_Fall
		name = ""
		layer = 11
		icon_state = "wover"
		density = 1
turf/worldedge
	density=1
	Left
		Enter(var/mob/M)
			if(isobj(M)||istype(M,/obj/)) del M
			else
				if(M && istype(M,/mob/PC/) && ismob(M)) M.loc=locate(249,M.y,M.z)
	Right
		Enter(var/mob/M)
			if(isobj(M)||istype(M,/obj/)) del M
			else
				if(M && istype(M,/mob/PC/) && ismob(M)) M.loc=locate(2,M.y,M.z)
	Bottom
		Enter(var/mob/M)
			if(isobj(M)||istype(M,/obj/)) del M
			else
				if(M && istype(M,/mob/PC/) && ismob(M)) M.loc=locate(M.x,249,M.z)
	Top
		Enter(var/mob/M)
			if(isobj(M)||istype(M,/obj/)) del M
			else
				if(M && istype(M,/mob/PC/) && ismob(M)) M.loc=locate(M.x,2,M.z)
	Corner1
		Enter(var/mob/M)
			if(isobj(M)||istype(M,/obj/)) del M
			else
				if(M && istype(M,/mob/PC/) && ismob(M)) M.loc=locate(249,249,M.z)
	Corner2
		Enter(var/mob/M)
			if(isobj(M)||istype(M,/obj/)) del M
			else
				if(M && istype(M,/mob/PC/) && ismob(M)) M.loc=locate(2,249,M.z)
	Corner3
		Enter(var/mob/M)
			if(isobj(M)||istype(M,/obj/)) del M
			else
				if(M && istype(M,/mob/PC/) && ismob(M)) M.loc=locate(249,2,M.z)
	Corner4
		Enter(var/mob/M)
			if(isobj(M)||istype(M,/obj/)) del M
			else
				if(M && istype(M,/mob/PC/) && ismob(M)) M.loc=locate(2,2,M.z)