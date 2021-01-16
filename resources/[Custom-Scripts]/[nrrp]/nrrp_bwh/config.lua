Config = {}

-- To enable discord logs go to line 2 of the server.lua and paste your discord webhook between the quotes.
Config.admin_groups = {"admin","superadmin"} -- groups that can use admin commands
Config.banformat = "BANIDO!\nRazão: %s\nExpira em: %s\nBanido por: %s (Ban ID: #%s)" -- message shown when banned (1st %s = reason, 2nd %s = expire, 3rd %s = banner, 4th %s = ban id)
Config.popassistformat = "O jogador %s está a pedir ajuda\nEscreve <span class='text-success'>/accreport %s</span> para aceitar ou <span class='text-danger'>/decreport</span> para rejeitar" -- popup assist message format
Config.chatassistformat = "O jogador %s está a pedir ajuda\nEscreve ^2/accreport %s^7 para aceitar ou ^1/decreport^7 para rejeitar\n^4Reason^7: %s" -- chat assist message format

Config.assist_keys = {
	enable=true,
	accept=161,
	decline=162
} -- keys for accepting/declining assist messages (default = page up, page down) - https://docs.fivem.net/game-references/controls/

Config.warning_screentime = 10.0 -- warning display length (in seconds)
Config.backup_kick_method = false -- set this to true if banned players don't get kicked when banned or they can re-connect after being banned.
Config.kick_without_steam = true -- prevent a player from joining your server without a steam identifier.
Config.page_element_limit = 250
