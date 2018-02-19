turf/Cliffs
	name = ""
	icon = 'Cliffs.dmi'
	Shadow_1
		icon_state = "shadow 1"
		density = 0
	Shadow_2
		icon_state = "shadow 2"
		density = 0
	Cliff_Entrance
		icon_state = "cliff entrance"
		density = 0
	Cliff_001
		icon_state = "001"
		density = 1
	Cliff_002
		icon_state = "002"
		density = 1
	Cliff_003
		icon_state = "003"
		density = 1
	Cliff_004
		icon_state = "004"
		density = 1
	Cliff_005
		icon_state = "005"
		density = 0
	Cliff_006
		icon_state = "006"
		density = 1
	Cliff_007
		icon_state = "007"
		density = 1
	Cliff_008
		icon_state = "008"
		density = 1
	Cliff_009
		icon_state = "009"
		density = 1
	Cliff_010
		icon_state = "010"
		density = 1
	Cliff_011
		icon_state = "011"
		density = 1
	Cliff_012
		icon_state = "cliff down"
		density = 1
	Cliff_013
		icon_state = "cliff down 2"
		density = 1
	Cliff_Wall_East
		beast = 1
		icon_state = "beast"
		density = 1
		New()
			icon_state = null
		Enter(mob/m)
			if(m.buku) return 0
	Cliff_Wall_West
		bwest = 1
		icon_state = "bwest"
		density = 1
		New()
			icon_state = null
		Enter(mob/m)
			if(m.buku) return 0
	Cliff_Wall_North
		bnorth = 1
		icon_state = "bnorth"
		density = 1
		New()
			icon_state = null
		Enter(mob/m)
			if(m.buku) return 0
	Cliff_Wall_South
		bsouth = 1
		icon_state = "bsouth"
		density = 1
		New()
			icon_state = null
		Enter(mob/m)
			if(m.buku) return 0
	Cliff_Wall_South_West
		bsouth = 1
		bwest = 1
		icon_state = "bsouthwest"
		density = 1
		New()
			icon_state = null
		Enter(mob/m)
			if(m.buku) return 0
	Cliff_Wall_South_East
		bsouth = 1
		beast = 1
		icon_state = "bsoutheast"
		density = 1
		New()
			icon_state = null
		Enter(mob/m)
			if(m.buku) return 0
	Cliff_Wall_North_West
		bnorth = 1
		bwest = 1
		icon_state = "bnorthwest"
		density = 1
		New()
			icon_state = null
		Enter(mob/m)
			if(m.buku) return 0
	Cliff_Wall_North_East
		bnorth = 1
		beast = 1
		icon_state = "bnortheast"
		density = 1
		New()
			icon_state = null
		Enter(mob/m)
			if(m.buku) return 0
turf
	var
		bnorth = 0
		bsouth = 0
		beast = 0
		bwest = 0
		gnorth = 0
		gsouth = 0
		geast = 0
		gwest = 0
	Enter(mob/M as mob)
		if(ismob(M)&&!M.buku&&((src.gnorth&&M.dir==NORTH)||(src.gsouth&&M.dir==SOUTH)||(src.geast&&M.dir==EAST)||(src.gwest&&M.dir==WEST))) return
		return ..()
	Enter(obj/O as obj)
		if(isobj(O)&&src.density&&!istypemulti(src,/turf/Island_Edge/,/turf/Namek_Island_Edge/)) del(O)
		else return ..()
	Exit(mob/M as mob)
		if(ismob(M)&&!M.buku&&((src.bnorth&&M.dir==NORTH)||(src.bsouth&&M.dir==SOUTH)||(src.beast&&M.dir==EAST)||(src.bwest&&M.dir==WEST))) return
		return ..()