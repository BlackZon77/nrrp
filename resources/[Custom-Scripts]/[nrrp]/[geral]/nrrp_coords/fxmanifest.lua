description 'Coord Shower & Saver'

client_scripts {
	"coords.lua"
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

ui_page 'nui/index.html'

files {
	'nui/app.js',
	'nui/index.html',
	'nui/image/logo.png',
	'nui/style.css',
}

fx_version 'adamant'
games { 'gta5' }