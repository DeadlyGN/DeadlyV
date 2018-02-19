var/list/BugReports[0]
proc
	Load_BugReports()
		BugReports=new()
		for(var/f in flist("World Save Files/Bug Reports/"))
			if(findtext(f,"/",-1))
				for(var/s in flist("World Save Files/Bug Reports/"+f))
					var/savefile/l = new("World Save Files/Bug Reports/"+f+s)
					var/datum/BugReport/b=new()
					b.name=l["Title"]
					b.desc=l["Description"]
					b.authur=l["Authur"]
					b.authur_key=l["Key"]
					b.status=l["Status"]
					b.timestamp=l["Timestamp"]
					if(l["Screen Shot"]) b.screenshot=fcopy_rsc(l["Screen Shot"])
					if(l["Comments"]) b.comments=l["Comments"]
					BugReports.Add(b)
datum
	BugReport
		var{name="Bug Report";desc="";authur="";authur_key="";status="Open";timestamp="";icon/screenshot;list/comments=new();}
		proc
			Save()
				if(fexists("World Save Files/Bug Reports/[authur_key]/[name].sav")) fdel("World Save Files/Bug Reports/[authur_key]/[src].sav")
				var/savefile/f
				f=new("World Save Files/Bug Reports/[authur_key]/[name].sav","-1")
				f["Title"]=name
				f["Description"]=desc
				f["Authur"]=authur
				f["Key"]=authur_key
				f["Status"]=status
				f["Timestamp"]=timestamp
				f["Screen Shot"]=screenshot
				f["Comments"]=comments
				return 1
mob
	verb
		Submit_Bug_Report()
			set category = "Channels"
			winset(src,"Bug Report.label3","text='[src.name]([src.key])'")
			winset(src,"Bug Report","is-visible=true")
		View_Bug_Report()
			set category = "Channels"
			if(!BugReports.len) return
			var/list/l[0]
			for(var/datum/BugReport/b in BugReports)
				l+="[b.name] by [b.authur]([b.authur_key]) on [b.timestamp]"
			var/choice=input(src,"What bug report would you like to view?","Bug Reports") as null|anything in l
			var/datum/BugReport/b
			for(var/datum/BugReport/d in BugReports)
				if(choice == "[d.name] by [d.authur]([d.authur_key]) on [d.timestamp]")
					b=d
					break
			winclone(src,"Bug Report","[choice]")
			winset(src,"[choice].input4","is-disabled=true;text=\"[b.name]")
			winset(src,"[choice].input5","is-disabled=true;text=\"[b.desc]")
			winset(src,"[choice].label3","is-disabled=true;text=\"[b.authur]([b.authur_key])")
			b.timestamp=time2text(world.timeofday)
			winset(src,"[choice].button3","command='';is-disabled=true;")
			if(b.screenshot) winset(src,"[choice].button3","text='';image-mode=stretch;keep-aspect=true;image=\ref[b.screenshot]")
			winset(src,"[choice].button4","is-visible=false;is-disabled=true")
			winset(src,"[choice].button5","text='Close';command='CloseReport [choice]'")
			winset(src,"[choice]","is-visible=true")
		ScreenShotBug()
			set hidden = 1
			var/i = fcopy_rsc(input(src,"What image would you like to use as your screen shot?","Screen Shot")as icon)
			if(i) winset(src,"Bug Report.button3","text=;image-mode=stretch;keep-aspect=true;image=\ref[i]")
		SubmitBugReport()
			set hidden = 1
			var/datum/BugReport/b=new()
			b.name=winget(src,"Bug Report.input4","text")
			if(!b.name){alert(src,"Please fill in a name for your bug report.","Bug Report"); del b; return;}
			b.desc=winget(src,"Bug Report.input5","text")
			if(!b.desc){alert(src,"Please fill in a description for your bug report.","Bug Report"); del b; return;}
			b.authur="[src.name]"
			b.authur_key="[src.key]"
			b.timestamp=time2text(world.timeofday)
			b.screenshot=fcopy_rsc(winget(src,"Bug Report.button3","image"))
			winset(src,"Bug Report","is-visible=false")
			while(!b.Save())
				sleep(10)
			BugReports.Add(b)
		CancelBugReport()
			set hidden = 1
			winshow(src,"Bug Report",0)
		CloseReport(var/ref as text)
			set hidden = 1
			winset(src,"[ref]","parent=none")