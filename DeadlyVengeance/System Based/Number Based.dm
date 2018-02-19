proc
	commaapplier(var/eNum,var/ShowCommas=1)
		eNum=num2text(round(eNum),99)
		var/Negetive=FALSE
		if(findtext(eNum,"-")){ Negetive=TRUE; eNum=copytext(eNum,2); }
		if(ShowCommas && length(eNum)>3)
			for(var/i=1;i<=round(length(eNum)/4);i++)
				var/CutLoc=length(eNum)+1-(i*3)-(i-1)
				eNum="[copytext(eNum,1,CutLoc)],[copytext(eNum,CutLoc)]"
		if(Negetive) eNum="-"+eNum
		return eNum
	abs2(N as num)
		if(N<0) return abs(N)
		return -N
	NumCheck(N as num)
		if(!N) return FALSE
		if(N/2==round(N/2,1)) return TRUE
	WholeNumCheck(N as num)
		if(!N) return FALSE
		if(N==round(N,1)) return TRUE