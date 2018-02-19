#define alert_SCROLL			1
#define alert_SELECT_MULTI	2
#define alert_LINKS			4
#define alert_NOVALIDATE		8
proc/alert(client/who, message, title, buttons = list("Ok"),\
	default, duration = 0, unfocus = 1, size = "250x150", \
	table = "width=100% height=100%", style={"<body bgcolor="black" text="white">"}, tag, select, flags = alert_SCROLL)
	if(ismob(who))
		var/mob/M = who
		if(!M.client) return
		who = M.client
	if(!istype(who)) CRASH("alert: Invalid target:[who] (\ref[who])")
	var/alert/T = locate(tag)
	if(T)
		if(istype(T)) del(T)
		else CRASH("alert: tag \"[tag]\" is already in use by datum '[T]' (type: [T.type])")
	T = new(who, tag)
	if(duration)
		spawn(duration)
			if(T) del(T)
			return
	T.Display(message,title,buttons,default,unfocus,size,table,style,select,flags)
	. = T.Response()
alert
	var
		client/target
		response
		list/validation
	Del()
		target << browse(null,"window=\ref[src]")
		..()
	New(who, tag)
		..()
		target = who
		src.tag = tag
	Topic(href,params[])
		if(usr.client != target) return
		response = params["clk"]
	proc/Display(message,title,list/buttons,default,unfocus,size,table,style,select,flags)
		if(unfocus)
			var/Focus=winget(target,null,"focus")
			if(Focus) spawn(1) winset(target,Focus,"focus=true")
		if(istext(buttons)) buttons = list(buttons)
		if(!default) default = buttons[1]
		if(!(flags & alert_NOVALIDATE)) validation = buttons.Copy()
		var/html = {"<head><title>[title]</title>[style]<script>\
		function c(x) {document.location.href='BYOND://?src=\ref[src];'+x;}\
		</script></head><body onLoad="fcs.focus();"\
		[(flags&alert_SCROLL)?"":" scroll=no"]><table [table]><tr>\
		<td><center>[message]</center></td></tr><tr><th>"}
		if(select || (flags & alert_SELECT_MULTI))
			html += {"<FORM ID=fcs ACTION='BYOND://?' METHOD=GET>\
				<INPUT TYPE=HIDDEN NAME=src VALUE='\ref[src]'>
				<SELECT NAME=clk SIZE=[select]\
				[(flags & alert_SELECT_MULTI)?" MULTIPLE":""]>"}
			for(var/b in buttons)
				html += "<OPTION[(b == default)?" SELECTED":""]>\
					[html_encode(b)]</OPTION>"
			html += "</SELECT><BR><INPUT TYPE=SUBMIT VALUE=Submit></FORM>"
		else if(flags & alert_LINKS)
			for(var/b in buttons)
				var/list/L = list()
				L["clk"] = b
				var/html_string=list2params(L)
				var/focus
				if(b == default) focus = " ID=fcs"
				html += "<A[focus] href=# onClick=\"c('[html_string]')\">[html_encode(b)]</A>\
					<BR>"
		else
			for(var/b in buttons)
				var/list/L = list()
				L["clk"] = b
				var/html_string=list2params(L)
				var/focus
				if(b == default) focus = " ID=fcs"
				html += "<INPUT[focus] TYPE=button VALUE='[html_encode(b)]' \
					onClick=\"c('[html_string]')\"> "
		html += "</th></tr></table></body>"
		target << browse(html,"window=\ref[src];size=[size];can_close=0")
	proc/Response()
		var/validated
		while(!validated)
			while(target && !response) sleep(2)
			if(response && validation)
				if(istype(response, /list))
					var/list/L = response - validation
					if(L.len) response = null
					else validated = 1
				else if(response in validation) validated = 1
				else response=null
			else validated = 1
		spawn(2) del(src)
		return response