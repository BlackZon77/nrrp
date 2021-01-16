fx_version 'adamant'
game 'gta5'

description 'NRRP Motel Rooms'
version '1.0.0'

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
    'server/server.lua',
    'config.lua',
    'locales/en.lua'
}

client_scripts {
	'@es_extended/locale.lua',
    'client/client.lua',
    'config.lua',
    'locales/en.lua'
}

-- dependencies {
-- 	'async',
-- 	'es_extended',
-- 	'instance',
-- 	'cron',
-- 	'esx_addonaccount',
-- 	'esx_addoninventory',
-- 	'esx_datastore'
-- }