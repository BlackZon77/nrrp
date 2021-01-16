fx_version 'bodacious'
game 'gta5'

description 'Loadout'
author 'BlackZon'

client_script '@warmenu/warmenu.lua'
client_scripts {
    '_core/client/cl_functions.lua',
    '_core/client/cl_main.lua',

    '_core/_config.lua'
}

server_scripts {
    '_core/server/sv_main.lua',

    '_core/_config.lua'
}