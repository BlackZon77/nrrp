fx_version 'adamant'
game 'gta5'

client_scripts {
	-- Base
	'nnrp_Main.lua',
	'nnrp_Client.lua',
	'nnrp_Utilities.lua',

	-- Commands
	'nnrp_Commands/nnrp_Commands_Client.lua',


	-- Items
	'nnrp_Items/nnrp_NightVision_Client.lua',
	'nnrp_Items/nnrp_ExtraItems_Client.lua',
	'nnrp_Items/nnrp_ExtraItems_Config.lua',
}

server_scripts {	
	-- Base
	'nnrp_Main.lua',
	'nnrp_Server.lua',
	'nnrp_Utilities.lua',

	-- MySQL
	'@mysql-async/lib/MySQL.lua',

	-- Items
	'nnrp_Items/nnrp_ExtraItems_Server.lua',
	'nnrp_Items/nnrp_ExtraItems_Config.lua',
}
