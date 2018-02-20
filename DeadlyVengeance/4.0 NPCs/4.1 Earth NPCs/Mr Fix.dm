mob
	AI
		Mr_Fixit
			name = "{NPC} Mr. Fixit"
			icon = 'npcs.dmi'
			icon_state = "Robot"
			energy_code = 2634523
			verb
				Talk()
					set category = null
					set src in oview(2)
					switch(input("What do you want to Fix?")in list("Overlays","Underlays","Inventory","Fix Self Training/Resting","Lost Revert/Transform","Fix Focus Training","Fix Dual Train","Fix Regenrate","All","Never Mind"))
						if("Inventory") usr.Inven()
						if("Overlays") usr.Over()
						if("Underlays") usr.Under()
						if("Fix Regenerate") usr.MR()
						if("Fix Dual Train") usr.Fix_DT()
						if("Lost Revert/Transform") usr.RT()
						if("Fix Self Training/Resting") usr.Fix_ST()
						if("All") usr.Fix_All()
						if("Never Mind") return
					GiveMedal("Fix Me!",usr)
					usr<<"Fixed!"
mob
	proc
		Over()
			src.overlays -= src.overlays
			if(src.race == "Android" && src.form=="Refitted Android") src.overlays += src.hair_droid
			else src.Hair_Apply()
			if(src.race == "Saiyan"&&src.has_tail) src.overlays += tail
		Inven()
			src.speed = src.speed_max
			src.head = "EMPTY"
			src.back = "EMPTY"
			src.chest = "EMPTY"
			src.legs = "EMPTY"
			src.feet = "EMPTY"
			src.arms = "EMPTY"
			src.hands = "EMPTY"
			src.waist = "EMPTY"
			src.underclothes = "EMPTY"
			src.weapon 	= "EMPTY"
			src.scouter = 0
			src.scouter_eq = 0
			src.scouter_channel = 0
			src.armor = 0
			src.armor_eq = 0
			src.under = 0
			src.under_eq = 0
			src.helmet = 0
			src.helmet_eq = 0
			src.gi = 0
			src.gi_eq = 0
			src.turban = 0
			src.turban_eq = 0
			src.capes = 0
			src.capes_eq = 0
			src.gloves = 0
			src.gloves_eq = 0
			src.z_sword = 0
			src.radar = 0
			src.hench_eq = 0
			src.saiyan_eq = 0
			src.weightgi = 0
			src.weightcape = 0
			src.weightarmor = 0
			src.weightarm = 0
			src.weightleg = 0
			src.weightankle = 0
			src.weightwrist = 0
			src.weighthead = 0
			src.G_item = 0
			src.cloak = 0
			src.cloak_eq = 0
			src.swordd = 0
			src.swordd_eq = 0
			src.trunks	= 0
			src.trunks_eq = 0
			src.demonb = 0
			src.demonb_eq = 0
			src.belt = 0
			src.belt_eq = 0
			src.pant = 0
			src.pant_eq = 0
			spawn() src.Over()
			for(var/obj/Equipment/E in src.contents)
				E.equiped = 0
				E.suffix = null
		Under()
			src.underlays -= src.underlays
		MR()
			src.regenerating = 0
			src.regen_dead = 0
		RT()
			if(src.race == "Saiyan" && src.gone_ssj)
				src.contents += new/obj/Transform/Transform
				src.contents += new/obj/Transform/Revert
				usr<<"Fixed"
			else if(src.race == "Half Saiyan" ||src.race == "Demon"||src.race=="Good Demon"||src.race=="Xicor"||src.race=="Chaos Demon"||src.race == "Changling"||src.race == "Bio-Android"||src.race == "Human"||src.race == "Namek"||src.race == "Tuffle"||src.race=="Bardock")
				src.contents += new/obj/Transform/Transform
				src.contents += new/obj/Transform/Revert
				usr<<"Fixed"
			else if(src.learn_invert) src.contents += new/obj/Transform/Revert
			else src<< "You dont have invert power."
		Fix_All()
			if(src.has_tail) src.overlays += tail
			src.Inven()
			Over()
			RT()
			Under()
			Fix_ST()
			Fix_DT()
			Give_Verbs()
		Fix_ST()
			src.waiting = 0
			src.selftraining=0
			src.boxing=0
			src.doing =0
		Fix_DT()
			src.dualtrain = 0
			src.dual_training = 0
			src.dual_delay = 0
		Give_Verbs()
			if(src.pranger) src.verbs += new/mob/learn/verb/Morph
			var/hasmedal = world.GetMedal("All Star Player",src)
			if(hasmedal||src.level>=5000000)
				src.verbs += new/mob/learn/AllStar/verb/ASK
				src.verbs += new/mob/learn/verb/Dark_Renegade
			hasmedal = world.GetMedal("King of Kings",src)
			if(hasmedal||src.level>=1000000) src.verbs += new/mob/learn/verb/Godly_Blast
			hasmedal = world.GetMedal("Nothing But Time")
			if(hasmedal) src.verbs += new/mob/Member/verb/Emoticons
			if(src.client.IsByondMember())
				src.verbs += typesof(/mob/Member/verb/)
				src.verbs += new/mob/learn/Namek/verb/Shooting_All_Star
				src.verbs += new/mob/learn/verb/Rapid_Ki_Blast
				src.verbs += new/mob/learn/verb/Galactic_Donut
				src.verbs += new/mob/learn/verb/Createcell
				src.verbs += new/mob/learn/verb/Super_Ghost_Kamikaze_Attack
				src.verbs += new/mob/learn/verb/World_Scan
				src.verbs += new/mob/learn/Demon/verb/Stone_Spit
				src.verbs += new/mob/learn/Changling/verb/Changling_Distructo_Disk
				src.verbs += new/mob/learn/verb/Genocide
				src.verbs += new/mob/learn/verb/Sense
				src.verbs += new/mob/learn/verb/Kamehameha
				src.verbs += new/mob/learn/verb/Split_Form
				src.verbs += new/mob/learn/verb/Kill_Split
				src.verbs += new/mob/learn/verb/Ki_Absorb
				src.verbs += new/mob/learn/verb/Self_Destruct
				src.verbs += new/mob/learn/verb/Galatic_Tyrant
				src.verbs += new/mob/learn/verb/Dragon_Thunder
				src.verbs += new/mob/learn/verb/Brave_Cannon
				src.verbs += new/mob/learn/verb/Finish_Buster
				src.verbs += new/mob/learn/verb/Shocking_Death_Ball
				src.verbs += new/mob/learn/verb/Brave_Cannon
				src.verbs += new/mob/learn/verb/Brave_Sword_Attack
				src.verbs += new/mob/learn/verb/Darkness_Blaster
				src.verbs += new/mob/learn/verb/Riot_Kavelin
				src.verbs += new/mob/learn/verb/Heat_Phalanx
				src.verbs += new/mob/learn/verb/Burning_Storm
				src.verbs += new/mob/learn/verb/Legend_Shield
				src.verbs += new/mob/learn/verb/Omega_Blaster
				src.verbs += new/mob/learn/verb/Super_Spirit_Bomb
				src.verbs += new/mob/learn/verb/All_Star_Bombs
				src.verbs += new/mob/learn/verb/Dark_Renegade
				src.verbs += new/mob/learn/verb/Dark_Chaotic_Wave
			if(src.race=="Vampire")
				src.contents += new/obj/Techniques/Vamp/Bite
			if(src.race=="Majin") src.contents += new/obj/Techniques/Bio_Android/Absorb
			if(src.race == "Slayer"||src.race=="Vampire")
				if(src.level >= 25000)
					src.verbs += /mob/learn/verb/Super_Dark_Chaotic_Wave
					src.verbs += /mob/learn/verb/Dark_Chaotic_Wave
			if(src.warrior_quest_complete) src.verbs += new/mob/learn/verb/Wolf
			if(src.learn_burning_attack) src.verbs += new/mob/learn/verb/Burning_Attack
			if(src.learn_big_bang) src.verbs += new/mob/learn/verb/Big_Bang_Attack
			if(src.learn_spirit_bomb) src.verbs += new/mob/learn/verb/Spirit_Bomb
			if(src.learn_cont_kame) src.verbs += new/mob/learn/verb/Continuous_Kamehameha
			if(src.learn_invert) src.verbs += new/mob/learn/verb/Invert
			if(!src.learn_chaos_blitz) src.verbs += new/mob/learn/verb/Chaos_Demon_Ki_Blast
			if(!src.learn_superdarkchaoticwave)
				src.verbs += new/mob/learn/verb/Super_Dark_Chaotic_Wave
				src.verbs += new/mob/learn/verb/Dark_Chaotic_Wave
			if(!src.learn_superkalokenkamehamehawave) src.verbs += new/mob/learn/verb/Super_Kalo_Ken_Kamehameha_Wave
			if(!src.learn_supermysticbomb) src.verbs += new/mob/learn/verb/Super_Mystic_Bomb
			if(src.learn_RKB) src.verbs += new/mob/learn/verb/Rapid_Ki_Blast
			if(src.learn_GD) src.verbs += new/mob/learn/verb/Galactic_Donut
			if(src.learn_beamcannon) src.verbs += new/mob/learn/verb/Special_Beam_Cannon
			if(src.learn_celljr) src.verbs += new/mob/learn/verb/Createcell
			if(src.learn_ghost_attack) src.verbs += new/mob/learn/verb/Super_Ghost_Kamikaze_Attack
			if(src.learn_masenko) src.verbs += new/mob/learn/verb/Masenko
			if(src.learn_superk) src.verbs += new/mob/learn/verb/Super_Kamehameha
			if(src.race == "Android")
				src.verbs += new/mob/learn/verb/World_Scan
				src.verbs += new/mob/learn/verb/Dragon_Scan
			if(src.learn_hell_flash) src.verbs += new/mob/learn/verb/Hell_Flash
			if(src.race == "Demon"||src.race == "Chaos Demon")
				if(src.learn_stone) src.verbs += new/mob/learn/Demon/verb/Stone_Spit
				if(src.learn_mouth_blast) src.verbs += new/mob/learn/Demon/verb/Mouth_Blast
				src.verbs += new/mob/learn/verb/Demon_Ki_Blast
			else src.verbs += new/mob/learn/verb/Ki_Blast
			if(src.race == "Human" || src.race == "Bio-Android") src.verbs += new/mob/learn/verb/Distructo_Disk
			else
				if(src.race == "Changling")
					if(src.learn_Kdisk) src.verbs += new/mob/learn/Changling/verb/Changling_Distructo_Disk
					if(src.learn_Dbeam) src.verbs += new/mob/learn/verb/Death_Beam
				else
					if(src.race == "Saiyan")
						if(src.learn_oozaru) src.verbs += new/mob/learn/Saiyan/verb/Fake_Moon
						if(src.learn_x10_kame) src.verbs += new/mob/learn/Saiyan/verb/X10_Kamehameha
			if(src.in_guild) src.verbs -= new/mob/PC/verb/Guild_Create()
			if(src.learn_finalkamehameha) src.verbs += new/mob/learn/verb/Final_Kamehameha
			if(src.learn_soulpunisher) src.verbs += new/mob/learn/verb/Soul_Punisher
			if(src.learn_sdf) src.verbs += new/mob/learn/verb/Super_Dragon_Fist
			if(src.learn_FS) src.verbs += new/mob/learn/verb/Final_Shine
			if(src.learn_ht) src.verbs += new/mob/learn/verb/Hyper_Tornado
			if(src.learn_bk100) src.verbs += new/mob/learn/verb/Big_Bang_Kamehameha_X100
			if(src.learn_fskama) src.verbs += new/mob/learn/verb/Father_Son_Kamehameha
			if(src.learn_vball) src.verbs += new/mob/learn/verb/Vanishing_Ball
			if(src.learn_MinusEnergyPowerBall) src.verbs += new/mob/learn/verb/Minus_Energy_Power_Ball
			if(src.learn_finalrevenger) src.verbs += new/mob/learn/verb/Final_Revenger
			if(src.learn_supernova) src.verbs += new/mob/learn/verb/Supernova
			if(src.learn_fuse) src.verbs += new/mob/learn/verb/Fuse
			if(src.learn_DB) src.verbs += new/mob/learn/verb/Death_Ball
			if(src.race == "Majin") src.verbs += new/mob/learn/Majin/verb/Candy_Ray
			if(src.learn_geno) src.verbs += new/mob/learn/verb/Genocide
			if(src.learn_Revenge_Ball) src.verbs += new/mob/learn/verb/Revenge_Ball
			if(src.learn_FF) src.verbs += new/mob/learn/verb/Final_Flash
			if(src.learn_hell_gren) src.verbs += new/mob/learn/Namek/verb/Hellzone_Grenade
			if(src.learn_light_grenade) src.verbs += new/mob/learn/Namek/verb/Light_Grenade
			if(src.learn_sense) src.verbs += new/mob/learn/verb/Sense
			if(src.learn_kamehameha) src.verbs += new/mob/learn/verb/Kamehameha
			if(src.learn_aura) src.verbs += new/mob/learn/verb/Aura
			if(src.learn_buku) src.verbs += new/mob/learn/verb/Fly
			if(src.learn_it)
				if(src.race != "Android") src.verbs += new/mob/learn/verb/Instant_Transmission
				else src.verbs += new/mob/learn/verb/Advanced_Instant_Transmission
			if(src.learn_powerup)
				src.verbs += new/mob/learn/verb/Power_Up
			if(src.learn_fuse) src.verbs += new/mob/learn/verb/Fuse
			if(src.learn_advanced_it) src.verbs += new/mob/learn/verb/Advanced_Instant_Transmission
			if(src.learn_Golden_Oozaru) src.verbs += new/mob/learn/Tuffle/verb/Golden_Oozaru
			if(src.learn_enrage) src.verbs += new/mob/learn/verb/Unleash_Rage
			if(src.learn_powerdown) src.verbs += new/mob/learn/verb/Power_Down
			if(src.learn_kaioken) src.verbs += new/mob/learn/verb/Kaioken
			if(src.learn_split_form) src.verbs += new/mob/learn/verb/Split_Form
			if(src.learn_kill_split) src.verbs += new/mob/learn/verb/Kill_Split
			if(src.learn_kiai) src.verbs += new/mob/learn/verb/Kiai
			if(src.learn_scan) src.verbs += new/mob/learn/verb/Scan
			if(src.learn_absorb) src.verbs += new/mob/learn/verb/Ki_Absorb
			if(src.learn_selfdestruct) src.verbs += new/mob/learn/verb/Self_Destruct
			if(src.learn_zanzoken) src.verbs += new/mob/learn/verb/Zanzoken
			if(src.learn_goodkiblast) src.verbs += new/mob/learn/verb/Good_Demon_Ki_Blast
			if(src.learn_neoball) src.verbs += new/mob/learn/verb/Neo_Ball
			if(src.learn_trapball) src.verbs += new/mob/learn/verb/Trap_Ball
			if(src.learn_kicatalyst) src.verbs += new/mob/learn/verb/Ki_Catalyst
			if(src.learn_vileenergy) src.verbs += new/mob/learn/verb/Vile_Energy
			if(src.learn_swordattack) src.verbs += new/mob/learn/verb/Sword_Attack
			if(src.learn_bravecannon) src.verbs += new/mob/learn/verb/Brave_Cannon
			if(src.learn_braveswordattack) src.verbs += new/mob/learn/verb/Brave_Sword_Attack
			if(src.learn_trapshooter) src.verbs += new/mob/learn/verb/Trap_Shooter
			if(src.learn_dshatter) src.verbs += new/mob/learn/verb/Dimension_Shatter
			if(src.learn_hellinpact) src.verbs += new/mob/learn/verb/Hell_Impact
			if(src.learn_staticshot) src.verbs += new/mob/learn/verb/Static_Shot
			if(src.learn_kicannon) src.verbs += new/mob/learn/verb/Ki_Cannon
			if(src.learn_omegablaster) src.verbs += new/mob/learn/verb/Omega_Blaster
			if(src.learn_finalgalickcannon) src.verbs += new/mob/learn/verb/Final_Galick_Cannon
			if(src.learn_killdriver) src.verbs += new/mob/learn/verb/Kill_Driver
			if(src.learn_mysticbreath) src.verbs += new/mob/learn/verb/Mystic_Breath
			if(src.learn_fullpowerball) src.verbs += new/mob/learn/verb/Full_Power_Energy_Ball
			if(src.learn_hellstorm) src.verbs += new/mob/learn/verb/Hells_Storm
			if(src.learn_acid) src.verbs += new/mob/learn/verb/Acid
			if(src.learn_acidburn) src.verbs += new/mob/learn/verb/Acid_Burn
			if(src.learn_heatphalanx) src.verbs += new/mob/learn/verb/Heat_Phalanx
			if(src.learn_finalspiritcannon) src.verbs += new/mob/learn/verb/Final_Spirit_Cannon
			if(src.learn_riotkavelin) src.verbs += new/mob/learn/verb/Riot_Kavelin
			if(src.learn_energyfield) src.verbs += new/mob/learn/verb/Energy_Field
			if(src.learn_deathchaser) src.verbs += new/mob/learn/verb/Death_Chaser
			if(src.learn_darknesseyebeam) src.verbs += new/mob/learn/verb/Darkness_Eye_Beam
			if(src.learn_darknessblaster) src.verbs += new/mob/learn/verb/Darkness_Blaster
			if(src.learn_galacticbuster) src.verbs += new/mob/learn/verb/Galactic_Buster
			if(src.learn_psychobarrier) src.verbs += new/mob/learn/verb/Psycho_Barrier
			if(src.learn_fullwaveball) src.verbs += new/mob/learn/verb/Full_Power_Energy_Wave
			if(src.learn_neokiblastcannon) src.verbs += new/mob/learn/verb/Neo_Ki_Blast_Cannon
			if(src.learn_ssbm) src.verbs += new/mob/learn/verb/SS_Deadly_Bomb
			if(src.learn_dodon) src.verbs += new/mob/learn/verb/Dodon_Ray
			if(src.learn_kiblastcannon) src.verbs += new/mob/learn/verb/Ki_Blast_Cannon
			if(src.learn_crusherball) src.verbs += new/mob/learn/verb/Crusher_Ball
			if(src.learn_finishbuster) src.verbs += new/mob/learn/verb/Finish_Buster
			if(src.learn_erasercannon) src.verbs += new/mob/learn/verb/Eraser_Cannon
			if(src.learn_dragonthunder) src.verbs += new/mob/learn/verb/Dragon_Thunder
			if(src.learn_whirlwindspin) src.verbs += new/mob/learn/verb/Whirlwind_Spin
			if(src.learn_blastershell) src.verbs += new/mob/learn/verb/Blaster_Shell
			if(src.learn_burningstorm) src.verbs += new/mob/learn/verb/Burning_Storm
			if(src.learn_drongfist) src.verbs += new/mob/learn/verb/Dragon_Fist
			if(src.learn_x100k) src.verbs += new/mob/learn/verb/X100_Kamehameha
			if(src.learn_x1000k) src.verbs += new/mob/learn/verb/X1000_Kamehameha