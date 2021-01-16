fx_version 'adamant'

game 'gta5'

name 'Mythic RP HUD'
author 'Alzar - https://github.com/Alzar'
version 'v1.0.0'

ui_page {
	'html/index.html',
}

files {
	'html/css/style.css',
	'html/fonts/Zetafonts-DomotikaMedium.ttf',
	'html/js/app.js',
	'html/index.html',
	"html/img/*.svg",
	'html/css/jquery-ui.min.css',
	'html/js/jquery.min.js',
	'html/js/jquery-ui.min.js',
}

client_scripts {
	'client/client.lua',
}

server_scripts {
	'server/main.lua',
}

dependencies {
	'baseevents'
}
