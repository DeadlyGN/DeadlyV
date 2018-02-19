mob
	var
		guild_name 			= "None"
		guild_name_html 	= "None"
		guild_rank 			= ""
		in_guild 			= 0
		guild_mute 			= 0
		tmp/guild_say_delay	= 0
		guildbrank			= 0
		tmp/guildb			= 0
mob
	var
		guild_leader = 0
		guild_co_leader = 0
		guild_member = 0
		// -- Custom Permissions Templates
		guild_invite = 0
		guild_announce = 0
		guild_boot = 0
		guild_change_rank = 0
mob/var/tmp/opponent
var
	list/
		Guilds = new()
		Guild_Names = new()