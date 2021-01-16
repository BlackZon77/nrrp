fx_version 'adamant'
game 'gta5'

name 'Pings'
description 'Allow Players To Ping Eachother Their Location'

client_scripts {
    'config.lua',
	'client/main.lua',
}

server_scripts {
	'server/main.lua',
}

dependencies {
	'mythic_notify',
}