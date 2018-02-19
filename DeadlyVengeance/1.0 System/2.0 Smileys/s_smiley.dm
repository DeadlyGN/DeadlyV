world/New()
	..()
	spawn()
		var/L[0] //originally added typesof(/smiley) but the order was messed
		for(var/S in typesof(/smiley)-/smiley)
			L += S
		var/A
		for(A in L)
			s_smileys += new A
var/s_smileys[0]
smiley
	var
		smileys[]
		iconstate
	//Allows s_smiley to work on HTML-encoded strings
	New()
		..()
		for(var/smiley in smileys)
			var/new_string = ReplaceTxt( ReplaceTxt( ReplaceTxt( ReplaceTxt(smiley, "<", "&lt;"), ">", "&gt;"), "©", "&copy;"), "^", "&#94;")
			if(!cmptext(new_string, smiley))
				smileys += new_string
	surprised_thoughtful_wink
		smileys = list("<;|","<;-|","<;^|", "<;o|")
		iconstate = "surprised/thoughtful wink"
	cool
		smileys = list("}$")
		iconstate = "cool"
	an_happy
		smileys = list("^^","^=^")
		iconstate = "an happy"
	sadistic
		smileys = list(">=)",">:)",">:-)",">=-)",">=^)",">:^)",">=\]",">:\]",">:-\]",
			">=-\]",">=^\]",">:^\]",">:>",">:->",">=->",">=^>",">:^>",">=o>",">:o>",
			">=o)",">:o)",">=o\]",">:o\]")
		iconstate = "sadistic"
	surprised
		smileys = list("<=)","<:)","<:-)","<=-)","<=^)","<:^)","<=\]","<:\]","<:-\]",
			"<=-\]","<=^\]","<:^\]","<:>","<:->","<=->","<=^>","<:^>","<=o>","<:o>",
			"<=o)","<:o)","<=o\]","<:o\]")
		iconstate = "surprised"
	angry
		smileys = list(">=(",">:(",">:-(",">=-(",">=^(",">:^(",">=\[",">:\[",">:-\[",
			">=-\[",">=^\[",">:^\[",">:<",">:-<",">=-<",">=^<",">:^<",">=o<",">:o<",
			">=o(",">:o(",">_<",">.<",">o<")
		iconstate = "angry"
	sad_b
		smileys = list("<=(","<:(","<:-(","<=-(","<=^(","<:^(","<=\[","<:\[","<:-\[",
			"<=-\[","<=^\[","<:^\[","<:<","<:-<","<=-<","<=^<","<:^<","<:o\[","<:o(",
			"<=o\[","<=o(")
		iconstate = "sad_b"
	mad_tongue
		smileys = list(">=P",">:P",">:oP",">:-P",">=-P",">=^P",">:^P",">:oP",">=oP")
		iconstate = "mad/tongue"
	mad_tongue2
		smileys = list(">=p",">:p",">:-p",">=-p",">=^p",">:^p",">=þ",">:þ",">:-þ",
			">=-þ",">=^þ",">:^þ",">=op",">:op",">=oþ",">:oþ")
		iconstate = "mad/tongue2"
	sigh_tongue2
		smileys = list("<=p","<:p","<:-p","<=-p","<=^p","<:^p","<=þ","<:þ","<:-þ",
			"<=-þ","<=^þ","<:^þ","<=op","<:op","<=oþ","<:oþ")
		iconstate = "sigh/tongue2"
	sigh_tongue
		smileys = list("<=P","<:P","<:-P","<=-P","<=^P","<:^P","<=oP","<:oP")
		iconstate = "sigh/tongue"
	evil_grin
		smileys = list(">=D",">:D",">:-D",">=-D",">=^D",">:^D")
		iconstate = "evil grin"
	worried_grin
		smileys = list("<=D","<:D","<:-D","<=-D","<=^D","<:^D")
		iconstate = "worried grin"
	naughty_wink
		smileys = list(">;)",">;-)",">;^)",">;\]",">;-\]",">;^\]",">;>",">;->",">;^>",">;o>",
			">;o)")
		iconstate = "naughty wink"
	surprised_wink
		smileys = list("<;)","<;-)","<;^)","<;\]","<;-\]","<;^\]","<;>","<;->","<;^>","<;o>",
			"<;o)")
		iconstate = "surprised wink"
	angry_wink
		smileys = list(">;(",">;-(",">;^(",">;\[",">;-\[",">;^\[",">;<",">;-<",">;^<",">;o<",
			">;o(")
		iconstate = "angry wink"
	sad_wink_b
		smileys = list("<;(","<;-(","<;^(","<;\[","<;-\[","<;^\[","<;<","<;-<","<;^<",
			"<;o<")
		iconstate = "sad wink_b"
	sad_wink_tongue2
		smileys = list("<;p","<;-p","<;^p","<;þ","<;-þ","<;^þ","<;oþ","<;op")
		iconstate = "sad wink/tongue2"
	sad_wink_tongue
		smileys = list("<;P","<;-P","<;^P","<;oP")
		iconstate = "sad wink/tongue"
	angry_thoughtful_wink
		smileys = list(">;|",">;-|",">;^|",">;o|")
		iconstate = "angry/thoughtful wink"
	skeptical
		smileys = list(">=|",">:|",">:-|",">=-|",">=^|",">:^|",,">=o|",">:o|")
		iconstate = "skeptical"
	confused
		smileys = list("<=|","<:|","<:-|","<=-|","<=^|","<:^|","<=o|","<:o|")
		iconstate = "confused"
	angry_wink_tongue2
		smileys = list(">;p",">;-p",">;^p",">;þ",">;-þ",">;^þ",">;oþ",">;op")
		iconstate = "angry wink/tongue2"
	angry_wink_tongue
		smileys = list(">;P",">;-P",">;^P",">;oP")
		iconstate = "angry wink/tongue"
	angry_uncertain
		smileys = list(">:/",">:\\",">=/",">=\\",">:o\\",">:o/",">=^/",">=^\\",">:^/",">:^\\",
			">=-/",">=-\\",">:-/",">:-\\")
		iconstate = "angry/uncertain"
	frustrated
		smileys = list(">=o",">:o",">:-o",">=-o",">=^o",">:^o",">=O",">:O",">:-O",
			">=-O",">=^O",">:^O",">=oO",">:oO")
		iconstate = "frustrated"
	naughty_wink_grin
		smileys = list(">;D",">;-D",">;^D",">;oD")
		iconstate = "naughty wink/grin"
	sheepish_wink_grin
		smileys = list("<;D","<;-D","<;^D","<;oD")
		iconstate = "sheepish wink/grin"
	surprised_b
		smileys = list("<=o","<:o","<:-o","<=-o","<=^o","<:^o","<=O","<:O","<:-O",
			"<=-O","<=^O","<:^O","O.O","O_O","<=oO","<:oO")
		iconstate = "surprised_b"
	angry_weird
		smileys = list(">:S",">=S",">=oS",">:oS",">:-S",">=-S",">:^S",">=^S",">:oS",">=oS",
			">=}",">={",">:}",">:{",">:@",">:?",">=?",">:-?",">=-?",">:^?",">=^?",">:o?",">=o?")
		iconstate = "angry/weird"
	sad_weird
		smileys = list("<:S","<=S","<=oS","<:oS","<:-S","<=-S","<:^S","<=^S","<:oS","<=oS",
			"<=}","<={","<:}","<:{","<:@","<:?","<=?","<:-?","<=-?","<:^?","<=^?","<:o?","<=o?")
		iconstate = "sad/weird"
	sad_uncertain
		smileys = list("<:/","<:\\","<=/","<=\\","<:o\\","<:o/","<=^/","<=^\\","<:^/","<:^\\",
			"<=-/","<=-\\","<:-/","<:-\\")
		iconstate = "sad/uncertain"
	uncertain_skeptical2
		smileys = list("/:/","/:\\","/=/","/=\\","/:o\\","/:o/","/=^/","/=^\\","/:^/","/:^\\",
			"/=-/","/=-\\","/:-/","/:-\\","\\:/","\\:\\","\\=/","\\=\\","\\:o\\","\\:o/",
			"\\=^/","\\=^\\","\\:^/","\\:^\\","\\=-/","\\=-\\","\\:-/","\\:-\\")
		iconstate = "uncertain/skeptical2"
	skeptical2
		smileys = list("/=|","/:|","/:-|","/=-|","/=^|","/:^|","/=o|","/:o|","/=l",
			"/:l","/:-l","/=-l","/=^l","/:^l","/=I","/:I","/:-I","/=-I","/=^I","/:^I",
			"/=oI","/:oI","\\=|","\\:|","\\:-|","\\=-|","\\=^|","\\:^|","\\=o|","\\:o|",
			"\\=l","\\:l","\\:-l","\\=-l","\\=^l","\\:^l","\\=I","\\:I","\\:-I","\\=-I",
			"\\=^I","\\:^I","\\=oI","\\:oI")
		iconstate = "skeptical2"
	sad_skeptical2
		smileys = list("/=(","/:(","/:-(","/=-(","/=^(","/:^(","/=\[","/:\[","/:-\[",
			"/=-\[","/=^\[","/:^\[","/:<","/:-<","/=-<","/=^<","/:^<","/:o\[","/:o(",
			"/=o\[","/=o(","\\=(","\\:(","\\:-(","\\=-(","\\=^(","\\:^(","\\=\[","\\:\[",
			"\\:-\[","\\=-\[","\\=^\[","\\:^\[","\\:<","\\:-<","\\=-<","\\=^<","\\:^<",
			"\\:o\[","\\:o(","\\=o\[","\\=o(")
		iconstate = "sad/skeptical2"
	happy_skeptical2
		smileys = list("/=)","/:)","/:-)","/=-)","/=^)","/:^)","/=)","/:]","/:-]",
			"/=-]","/=^]","/:^]","/:>","/:->","/=->","/=^>","/:^>","/:o]","/:o)",
			"/=o]","/=o)","\\=)","\\:)","\\:-)","\\=-)","\\=^)","\\:^)","\\=]","\\:]",
			"\\:-]","\\=-]","\\=^]","\\:^]","\\:>","\\:->","\\=->","\\=^>","\\:^>",
			"\\:o]","\\:o)","\\=o]","\\=o)")
		iconstate = "happy/skeptical2"
	wink_grin
		smileys = list(";D",";-D",";^D")
		iconstate = "wink/grin"
	tongue2
		smileys = list("=p",":p",":-p","=-p","=^p",":^p","=þ",":þ",":-þ","=-þ","=^þ",":^þ",
			"=oþ",":oþ","=op",":op")
		iconstate = "tongue2"
	tongue
		smileys = list("=P",":P",":-P","=-P","=^P",":^P","=oP",":oP")
		iconstate = "tongue"
	grin
		smileys = list("=D",":D",":-D","=-D","=^D",":^D")
		iconstate = "grin"
	wink
		smileys = list(";)",";-)",";^)",";\]",";-\]",";^\]",";>",";->",";^>",
			"^_-","-_^","^.-","-.^","O_-","-_O","O.-","-.O","o_-","-_o","o.-","-.o",
			"0_-","-_0","0.-","-.0")
		iconstate = "wink"
	sad_wink_a
		smileys = list(";(",";-(",";^(",";\[",";-\[",";^\[",";<",";-<",";^<")
		iconstate = "sad wink_a"
	wink_tongue2
		smileys = list(";p",";-p",";^p",";þ",";-þ",";^þ",";oþ",";op")
		iconstate = "wink/tongue2"
	wink_tongue
		smileys = list(";P",";-P",";^P",";oP")
		iconstate = "wink/tongue"
	smile
		smileys = list("=)",":)",":-)","=-)","=^)",":^)","=\]",":\]",":-\]","=-\]",
			"=^\]",":^\]","=\]",":>",":->","=->","=^>",":^>","=o>",":o>","=o)","=o\]",
			":o)",":o\]")
		iconstate = "smile"
	neutral
		smileys = list("=|",":|",":-|","=-|","=^|",":^|","o_o","o.o","=o|",":o|",
			"=l",":l",":-l","=-l","=^l",":^l","=I",":I",":-I","=-I","=^I",":^I","=oI",":oI")
		iconstate = "neutral"
	sad_a
		smileys = list("=(",":(",":-(","=-(","=^(",":^(","=\[",":\[",":-\[","=-\[",
			"=^\[",":^\[",":<",":-<","=-<","=^<",":^<",":o<",":o(",":o\[","=o<","=o(","=o\[")
		iconstate = "sad_a"
	thoughtful_wink
		smileys = list(";|",";-|",";^|",";o|",";l",";-l",";^l",";ol",";I",";-I",";^I",";oI")
		iconstate = "thoughtful wink"
	weird
		smileys = list(":S","=S","=oS",":oS",":-S","=-S",":^S","=^S",":oS","=oS","=}",
			"={",":}",":{",":@","@.@",":?","=?",":-?","=-?",":^?","=^?",":o?","=o?")
		iconstate = "weird"
	surprised_a
		smileys = list("=o",":o",":-o","=-o","=^o",":^o","=O",":O",":-O","=-O","=^O",
			":^O","o.O","O.o","O_o","o_O","=oo",":oo","=oO",":oO",":0",":-0","=0","=-0",
			":^0","=^0",":o0","=o0")
		iconstate = "surprised_a"
	anime_smile
		smileys = list("^_^","^-^")
		iconstate = "anime smile"
	anime_O
		smileys = list("^.^","^o^","^0^","^O^")
		iconstate = "anime O"
	anime_sleepy
		smileys = list("-_-","-.-","_-_","_._")
		iconstate = "anime sleepy"
	shifty
		smileys = list("<.<","<_<","<-<")
		iconstate = "shifty"
	shifty2
		smileys = list(">.>",">_>",">->")
		iconstate = "shifty2"
	uncertain
		smileys = list(":/",":\\","=/","=\\",":o\\",":o/","=^/","=^\\",":^/",":^\\",
			"=-/","=-\\",":-/",":-\\")
		iconstate = "uncertain"
	crying
		smileys = list(":©(","=©(",":©<")
		iconstate = "crying"
	infuriated
		smileys = list("D:<","D]<","D/<","D\<","D|<","D{<","D}<")
		iconstate = "reallyangry"
	saddend
		smileys = list("D:",":C")
		iconstate = "reallysadd"
	iwon
		smileys = list("iwon","ulost")
		iconstate = "won"
	ilost
		smileys = list("ilost","uwon")
		iconstate = "lost"
	monoclegrin
		smileys = list("©QD","©Q-D","monocle")
		iconstate = "monoclegrin"
	pman
		smileys = list("<pacman","<waka")
		iconstate = "man2"
	pkman
		smileys = list("vpacman","vwaka")
		iconstate = "man3"
	pqman
		smileys = list("^pacman","^waka")
		iconstate = "man4"
	pacman
		smileys = list("pacman","wakawaka")
		iconstate = "man1"
	pghost
		smileys = list("pghost")
		iconstate = "ghost1"
	rghost
		smileys = list("pacghost","rghost")
		iconstate = "ghost2"
	oghost
		smileys = list("oghost")
		iconstate = "ghost3"
	aghost
		smileys = list("aghost")
		iconstate = "ghost4"
	bghost
		smileys = list("bghost")
		iconstate = "ghost5"
	wghost
		smileys = list("wghost")
		iconstate = "ghost6"
	troll
		smileys = list("uMad","trolol.jpg")
		iconstate = "trollface"
	Sharin
		smileys = list("sharn6")
		iconstate = "sassharin"
	SharinR
		smileys = list("sharn5")
		iconstate = "regsharin"
	SharinM
		smileys = list("sharn4")
		iconstate = "madsharin"
	Dot
		smileys = list("<dot>")
		iconstate = "dot"
	Alert
		smileys = list("<ALERT>")
		iconstate = "alert"
	PikaFace
		smileys = list("<pikaf>")
		iconstate = "pika"
	PikaChu
		smileys = list("<pikap>")
		iconstate = "chu2"
	PikaU
		smileys = list("<<pikap>")
		iconstate = "chu"
	PikaZz
		smileys = list("<sleeppikaz>")
		iconstate = "zpikaz"
	Shui
		smileys = list("sharn7")
		iconstate = "shuishar"
	ItaMang
		smileys = list("sharn8","sharn9","sharn0")
		iconstate = "itashar"
	SharinRE
		smileys = list("sharn3")
		iconstate = "sharx1"
	SharinE
		smileys = list("sharn1")
		iconstate = "sharx2"
	Mang
		smileys = list("sharn2")
		iconstate = "semang"
	Heart
		smileys = list("<3")
		iconstate = "heart"
	Question
		smileys = list("<Question?>")
		iconstate = "question"
	FuckU
		smileys = list("FuckYou2")
		iconstate = "fuckyou"
	YinYang
		smileys = list("( ,)")
		iconstate = "yinyang"
	Watch
		smileys = list("aq32573a")
		iconstate="Watch"
	Ban
		smileys = list("aq32574b")
		iconstate="Ban"
	Jail
		smileys = list("aq32575c")
		iconstate="Jail"
	Mute
		smileys = list("aq32576d")
		iconstate="Mute"
	Whisper
		smileys = list("aq32577e")
		iconstate="Whisper"
	DPool1
		smileys = list("(o|o)r")
		iconstate="DPoolR"
	DPool2
		smileys = list("(o|o)w")
		iconstate="DPoolW"
	TombStone
		smileys = list("(RIP)")
		iconstate="TombStone"
proc/s_smileys(text as text)
	var/smiley/smiley
	for(smiley in s_smileys)
		var/B
		for(B in smiley.smileys)
			if(!findtext(text,B)) continue
			var/image/O = new
			O.icon = 's_smileys.dmi'
			O.icon_state = smiley.iconstate
			text = replaceWord(text, B, {" <IMG CLASS=\"icon\" SRC=\"\ref[O.icon]\" \
				ICONSTATE=\"[smiley.iconstate]\"> "})
			del O
	return(text)