fx_version 'adamant'
game 'gta5'


ui_page 'html/index.html'

client_scripts {
    'client.lua',
} 

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    'server.lua',
} 

files{
	-- Main
	'html/index.html',
	'html/css/bootstrap.css',
	'html/css/style.css',
	'html/app.js',
	
	-- Images
	'html/img/chieucao.jpg',
	'html/img/congviec.png',
	'html/img/gioitinh.png',
	'html/img/hovaten.png',
	'html/img/nganhang.png',
	'html/img/ngaysinh.png',
	'html/img/profile.png',
	'html/img/sodienthoai.png',
	'html/img/sotienban.png',
	'html/img/sotienmat.png',
	'html/img/thongtin.png',
}

dependency 'es_extended'

