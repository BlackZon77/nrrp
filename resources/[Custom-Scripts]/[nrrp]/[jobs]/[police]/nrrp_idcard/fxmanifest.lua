fx_version 'adamant'
game 'gta5'

client_scripts {
	'client.lua',
}
server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua',
}


ui_page 'html/index.html'

files {
	'handling.meta',
	'html/index.html',
	'html/assets/css/style.css',
	'html/assets/js/jquery.js',
	'html/assets/js/init.js',
	'html/assets/fonts/roboto/Roboto-Bold.woff',
	'html/assets/fonts/roboto/Roboto-Bold.woff2',
	'html/assets/fonts/roboto/Roboto-Light.woff',
	'html/assets/fonts/roboto/Roboto-Light.woff2',
	'html/assets/fonts/roboto/Roboto-Medium.woff',
	'html/assets/fonts/roboto/Roboto-Medium.woff2',
	'html/assets/fonts/roboto/Roboto-Regular.woff',
	'html/assets/fonts/roboto/Roboto-Regular.woff2',
	'html/assets/fonts/roboto/Roboto-Thin.woff',
	'html/assets/fonts/roboto/Roboto-Thin.woff2',
	'html/assets/css/materialize.min.css',
	'html/assets/js/materialize.js',
	'html/assets/images/legitimation.png',
}
