mob/var
	korin_quest1_start=0
	korin_quest1_finish=0
	korin_quest2_start=0
	korin_quest2_finish=0
	korin_quest_skins=0
obj/Quests/Korin
	Gather_Fertilizer
		name = "Saiba Skins"
		icon = 'Skills.dmi'
		icon_state = "critical"
		density = 0
		verb
			View_Quest()
				set category = null
				var/examine_sensu = {"<body bgcolor=#000000 text=#FFFFFF>
<table border=0 cellspacing=1 width=492 id=AutoNumber1 height=210>
  <tr>
    <td colspan=2 rowspan="4"><div align="center"><font face=Tahoma color=#FF0000><img src="http://media.animevice.com/uploads/0/2262/508876-korin_large.png"></font></div></td>
    <td height=18 colspan=2><font face=Tahoma color=#FF0000>Quest: [name]
      </font></td>
  </tr>
  <tr>
    <td width=79><font size=1 color=red face=Tahoma>Objective:</font></td>
    <td width=143 height=12><font size=1><font face=Tahoma>Obtain 5 Saiba Skins!</font></font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Reward</font><font size=1 color=red face=Tahoma>:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Senzus</font></td>
  </tr>
  <tr>
    <td width=79><font face=Tahoma size=1 color=#FF0000>Quest Giver:</font></td>
    <td width=143 height=12><font face=Tahoma size=1>Korin</font></td>
  </tr>
  <tr>
    <td colspan=4 height=48><font face=Tahoma size=1>Hey [usr.name]. I've heard
      you were insterested in my senzu beans. I'm afraid I cannot give you any, I've run out of fertilizer for the plants.
      If you'd be willing to track down some Saiba Skins for me, I'd be happy to sell you some senzus!</font></td>
  </tr>
</table>
"}
				usr<< browse(examine_sensu,"window=Korin;size=550x350;border=0;can_resize=0; can_minimize=0;")
			Abandon_Quest()
				set category = null
				switch(alert(usr,"Do you wish to abandon the Quest: [src.name]?","Abandon Quest","Yes","No"))
					if("Yes")
						usr.korin_quest1_start = 0
						del(src)