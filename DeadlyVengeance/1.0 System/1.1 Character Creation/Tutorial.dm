mob
	proc
		Tutorial()
			switch(src.Tutorial)
				if("Complete")
					alert(src,"You've completed the tutorial!")
					return
				if("Creation")
					alert(src,{"There are several races to choose from, each has an advantage and disadvantage. \n
 Each race, however, has been designed to be balanced. \n
 'Member' Races are unlockable, members get early access."})
					src.Tutorial="Getting Started"
				if("Getting Started")
					alert(src,"The first thing you should do is read the rules. \n Rules can change at any time, be sure to check them when you can!")
					alert(src,"After that it's ideal to start training by going into your Training tab and Self Training.")
					alert(src,"For further Tutorials goto your channels tab and press 'Tutorial'.")
					src.Tutorial="Resting"
				if("Resting")
					alert(src,"You should probaly rest after training. \n It allows you to train more.")
					alert(src,{"After you're rested up you should find the nearest treadmill(south of spawn). \n
 Running on this will increase your endurance and in turn, allow you to train longer."})
					src.Tutorial="Combat"
				if("Combat")
					alert(src,{"Now lets introduce you to the main attraction, combat! \n
 Here player vs player(PvP) combat is the focal point for players. \n
  Every building is a Safe Zone(SZ) in which you cannot die in. \n
   Outside of these SZs and in events PvP is present."})
					alert(src,{"This should be most present in tournaments. \n
 Tournaments are events in which players combat eachother for a prize. \n
  This prize is often determained by the amount of the prize you already have. \n
   (i.e. powerlevel as a prize would be 1/7th of your max powerlevel.) \n
    There are special prizes that can be given at certain win amounts. \n
     (i.e. You can unlock member races once per 10 wins)"})
					alert(src,"That's it for the current tutorial! \n Please check in every update for more additions!")
					src.Tutorial="Complete"