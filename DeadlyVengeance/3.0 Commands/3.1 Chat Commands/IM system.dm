mob/var
	chatcolour="white"
	colour="white"
	rankcolour ="white"

/***************************Created By : Razor(LightningNinja91)**************************/
var/smiley/S=new
mob
	var/tmp
		list/InstantMessenger=list()
		im_checked=0
	proc
		IMAnnounce()
			while(!im_checked)
				if(!src)break
				src<<"<font color = blue><u>Mailman:</u> You Have A Message!</font>"
				src<<"<font color = aqua><u>To view the message click on CheckIMs on bottom right."
				sleep(600)
mob/var/whispers_off=0
mob/PC/verb
	CheckIMs()
		set hidden=1
		im_checked=1
		var/which=input("Which IM do you wish to see?","")as null|anything in InstantMessenger
		winset(usr,"Main.IMbutton","background-color=black;text-color=white")
		if(!which)return
		winshow(usr,"\ref[which]",1)
	Instant_Message()
		set category="Channels"
		set name="Whisper"
		if(World_Mute)
			usr<<"The world is muted"
			return
		if(Channel_Mute&&!src.GMLevel)
			usr<<"All Chat Channels are Muted!"
			return
		if(muted)
			usr<<"You are muted"
			return
		var/list/varPeople=new()
		for(var/client/T)varPeople += T.mob
		var/mob/R=input("Who would you like to whisper to?","")as null|anything in varPeople-usr
		if(!R||R.whispers_off)return
		var/msg=input("Whisper to [R]")as null|text
		if(!msg||!R)return
		if(!R.whispers_off)
			winclone(R,"windowIM","\ref[usr]")
			winclone(usr,"windowIM","\ref[R]")
			winset(usr,"\ref[R]","title=\"PM [R]\"")
			winset(R,"\ref[usr]","title=\"PM [usr]\"")
			winset(usr,"\ref[R].IMin","command='send \"\ref[R]\" \"'")
			winset(R, "\ref[usr].IMin","command='send \"\ref[usr]\" \"'")
			R<<output("\white <font color=white> [usr]</font>: <font color=[textcolor]>[msg]","\ref[usr].IMout")
			usr<<output("\white <font color=white> [usr]</font>: <font color=[textcolor]>[msg]","\ref[R].IMout")
			R.im_checked=0
			winset(R,"Main.IMbutton","background-color=#FFA500;text-color=black")
			R<<"<font color=green>You've got a message from [src.title] [usr]!</font>"
			winshow(src,"\ref[R]",1)
			InstantMessenger-=R
			R.InstantMessenger-=usr
			InstantMessenger+=R
			R.InstantMessenger+=usr
			R.IMAnnounce()
			return
		else
			usr<<"[R]'s messages are off!"
			return
	send(var/ref as text,var/msg as text)
		set category=null
		var/R=locate(ref)
		if(!R||!msg)return
		winshow(usr,"\ref[R]",1)
		R<<output("\white <font color=white> [usr]</font>: <font color=[textcolor]>[msg]","\ref[usr].IMout")
		R<<"<font color=green>You've got a message from [src.title] [usr]!</font>"
		usr<<output("\white <font color=white> [usr]</font>: <font color=[textcolor]>[msg]","\ref[R].IMout")
		return
