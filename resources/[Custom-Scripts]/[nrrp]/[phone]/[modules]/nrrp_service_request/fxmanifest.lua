fx_version 'adamant'
game 'gta5'
description 'ESX Service Request'
version '1.0'

client_scripts {
    '@es_extended/locale.lua',
    'locales/br.lua',
    'locales/en.lua',
    '@nrrp_calls/common.lua',
    '@nrrp_calls/client.lua',
    '@nrrp_calls/esx/common.lua',
    'config.lua',
    'client.lua',
}

server_script {
    '@es_extended/locale.lua',
    'locales/br.lua',
    'locales/en.lua',
    '@nrrp_calls/common.lua',
    '@nrrp_calls/server.lua',
    '@nrrp_calls/esx/common.lua',
    'config.lua',
    'server.lua',
}
