ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('nrrp_coords:saveCoords')
AddEventHandler('nrrp_coords:saveCoords', function(data)
    local _src = source
    if data ~= nil then
        local _user = ESX.GetPlayerFromId(_src)

        MySQL.Async.insert("INSERT INTO saved_coords (`description`,`x`,`y`,`z`,`h`,`type`,`savedby`) VALUES (@description, @x, @y, @z, @h, @type, @by)", {
            ['@description']    = data.description,
            ['@x']              = data.xpos,
            ['@y']              = data.ypos,
            ['@z']              = data.zpos,
            ['@h']              = data.hpos,
            ['@type']           = data.type,
            ['@by']             = _user.getName(),
        }, function() end)
    end
end)