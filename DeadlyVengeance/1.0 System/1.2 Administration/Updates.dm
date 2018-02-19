updates
	var{date="";version="";list/updated[0];}
	v100
		date="28/05/2015"
		version=1.00
		updated=list("Welcome To the New and Improved Deadly Vengeance!",
		"We hope you enjoy your stay and train hard and become the strongest!",
		"---------------------------")

var/
	updates
mob/proc/Updates()
	var/updatets = {"<html>
  <head>
  <title>Updates</title>
  </head>
  <body bgcolor="black" text="white"><b>
  [updates]
  </body>
  </html>
  "}
	src<< browse("[updatets]","window=Updates;size=475x580")
mob/PC/verb/View_Updates()
	set category = "Channels"
	src.Updates()