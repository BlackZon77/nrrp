fx_version 'bodacious'

game 'gta5'

ui_page "html/ui.html"

client_scripts {
  "@es_extended/locale.lua",
  "locales/cs.lua",
  "locales/en.lua",
  "locales/fr.lua",
  "config.lua",
  "client.lua"
}

server_scripts {
  "@mysql-async/lib/MySQL.lua",
  "@es_extended/locale.lua",
  "locales/cs.lua",
  "locales/en.lua",
  "locales/fr.lua",
  "config.lua",
  "server.lua"
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  -- JS LOCALES
  "html/locales/cs.js",
  "html/locales/en.js",
  "html/locales/fr.js",
  -- IMAGES
  "html/img/bullet.png",
  "html/img/items/*.png"
}

dependency 'es_extended'