fx_version 'adamant'
game 'gta5'

description 'Drugs System'

version '2.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/main.lua',
	'config.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/drugmissions.lua',
	'client/drugsale.lua',
	'client/drugeffects.lua',
	'client/drugconvert.lua',
	'config.lua'
}

dependencies {
	'es_extended',
}
