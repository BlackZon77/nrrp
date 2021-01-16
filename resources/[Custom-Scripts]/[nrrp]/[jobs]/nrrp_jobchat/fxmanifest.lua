fx_version 'adamant'
game 'gta5'


files {
}

server_script "server.lua"
client_script "client.lua"

server_scripts {

    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
  
  }