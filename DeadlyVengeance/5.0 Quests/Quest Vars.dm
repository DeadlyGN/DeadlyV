mob
	PC
		var
			questnamekgoku_kill 		= 0
			questnamekgohan_kill 		= 0
			questnamekvegeta_kill 		= 0
		proc
			QuestMedal()
				if(src.bulma_quest2_complete&&src.trunks_quest_complete&&src.bulma_quest_complete&&src.korin_quest2_finish&&src.krilin_quest_complete&&src.roshi_quest_complete&&src.saiyaman_quest_complete&&src.warrior_quest_complete&&src.frieza_quest2_complete&&src.guru_quest_complete&&src.dabura_quest_complete&&src.goku_quest_complete&&src.kk_quest2_complete&&src.Tapion_quest_complete&&src.Yadrat_taught)
					GiveMedal("Quest Master",src)