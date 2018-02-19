proc
	ReplaceTxt(T as text, Search as text, Replace as text)
		if(!T) return T
		if(cmptextEx(Search,Replace)) return T
		var/S_len = lentext(Search)
		var/F = findtextEx(T, Search)
		while(F)
			if(F>1)
				T = copytext(T,1,F) + (Replace) + copytext(T,F+S_len)
			else T=Replace+copytext(T,S_len+1)
			F = findtextEx(T, Search)
		return T
	ReplaceTxtex(T as text, Search as text, Replace as text)
		if(!T) return T
		if(cmptext(Search,Replace)) return T
		var/S_len = lentext(Search)
		var/F = findtext(T, Search)
		while(F)
			if(F>1)
				T = copytext(T,1,F) + (Replace) + copytext(T,F+S_len)
			else T=Replace+copytext(T,S_len+1)
			F = findtext(T, Search)
		return T
	truelength(T as text)
		set background=1
		if(!T) return
		var/R=lentext(T)
		for(var/I=1, I <= R, I++)
			if(findtextEx(T,"<")&&findtextEx(T,">",I))
				var/F=findtextEx(T,"<")
				var/L=findtextEx(T,">",F)
				if(!F||!L) return T
				if(F>1)
					T=copytext(T,1,F)+copytext(T,L+1)
					I=F-2
				else T=copytext(T,L+1);R=lentext(T)
			else return T
		return T
	Censor(T as text)
		if(!T) return T
		var/i=1
		var/l
		for(var/a in BAD_WORDS)
			i=lentext(a)
			for(i, i --)
				l+="*"
			T=ReplaceTxt(T,a,l)
			l=""
		return T
	propername(S as text)
		if(!S)return S
		S=lowertext(S)
		var/Y
		var/W=0
		var/F
		var/E
		var/H
		S=Remove_Whitespace(S)
		if(!S) return S
		if(!findtextEx(S," "))
			Y=copytext(S,1,2)
			Y=uppertext(Y)
			S=Y+copytext(S,2)
			return S
		while(findtextEx(S," ",W+1))
			if(S==null) return S
			if(findtextEx(S," ",W+1))
				W=findtextEx(S," ",W+1)
				Y=copytext(S,1,2)
				Y=uppertext(Y)
				F=uppertext(copytext(S,W,W+2))
				E=copytext(S,W+2)
				H=copytext(S,2,W)
				S=Y+H+F+E
				continue
			else return S
		return S
	Remove_Whitespace(T as text)
		if(!T) return T
		T=Swap_Tabs(T)
		if(lentext(T)==1)
			if(T==" ") return
			else return T
		while(T&&findtextEx(T," ",1,2)) T=copytext(T,2)
		while(T&&findtextEx(T," ",lentext(T))) T=copytext(T,1,lentext(T))
		while(findtextEx(T,"  ")) T=ReplaceTxt(T,"  "," ")
		return T
	Swap_Tabs(T as text)
		if(!T) return T
		T=ReplaceTxtex(T,"	"," ")
		return T
	CheckPicLink(link)
		if(istext(link))
			if(findtext(link,{"http://"},1,8)||findtext(link,{"https://"},1,9))
				if(findtext(link,{".jpg"},-4)||findtext(link,{".jpeg"},-5)||findtext(link,{".png"},-4))
					return TRUE
		return FALSE
	list2text(var/list/L,var/a = ",")
		if(!L) return
		if(!a) a=","
		var/T=""
		for(var/l in L)
			if(!T) T+="[l]"
			else T+="[a][l]"
		if(findtextEx(T,a,1,2)) T=("EMPTY"+T)
		if(findtextEx(T,a,-1)) T=(T+"[a]EMPTY")
		if(findtextEx(T,"[a][a]")) T=ReplaceTxt(T,"[a][a]","[a]EMPTY[a]")
		//world<<T
		return T
	text2list(var/T as text,var/a as text)
		if(!T) return
		if(!a) a=","
		var/list/L=new()
		if(!findtextEx(T,a)) {L.Add(T); return L}
		if(findtextEx(T,a,1,2)) T=("EMPTY"+T)
		if(findtextEx(T,a,lentext(T))) T=(T+"EMPTY")
		if(findtextEx(T,"[a][a]")) T=ReplaceTxt(T,"[a][a]","[a]EMPTY[a]")
		//world<<T
		while(findtextEx(T,a,1))
			var/f=findtextEx(T,a,1)
			var/i=copytext(T,1,f)
			L.Add(i)
			//world<<i
			T=copytext(T,f+1)
		//list2text(L)
		return L