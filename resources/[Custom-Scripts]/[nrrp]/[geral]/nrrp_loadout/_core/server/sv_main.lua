ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('nrrp:giveweapon')
AddEventHandler('nrrp:giveweapon', function(weaponName, ammoAmmount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not xPlayer.hasWeapon(weaponName) then
        xPlayer.addWeapon(weaponName, ammoAmmount)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { 
            type = 'error', 
            text = Languages[GameLanguage].AlreadyHasThatW, 
            length = 4000
        })
    end
end)

RegisterNetEvent('nrrp:removeweapon')
AddEventHandler('nrrp:removeweapon', function(weaponName)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not xPlayer.hasWeapon(weaponName) then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { 
            type = 'error', 
            text = Languages[GameLanguage].AlreadyUnquippedW, 
            length = 4000
        })
    else
        xPlayer.removeWeapon(weaponName)
    end
end)

RegisterNetEvent('nrrp:giveitem')
AddEventHandler('nrrp:giveitem', function(invItem, count)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    local itemLabel = xPlayer.getInventoryItem(invItem).label
    if xPlayer.canCarryItem(invItem, count) then
        xPlayer.addInventoryItem(invItem, count)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { 
            type = 'error', 
            text = 'Não consegues aguentar com mais nenhum ' ..itemLabel.. '. Estás com demasiado peso.', 
            length = 4000
        })
    end
end)

RegisterNetEvent('nrrp:removeitem')
AddEventHandler('nrrp:removeitem', function(invItem)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    local count = xPlayer.getInventoryItem(invItem).count
    local itemLabel = xPlayer.getInventoryItem(invItem).label
    if count > 0 then
        xPlayer.removeInventoryItem(invItem, count)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { 
            type = 'error', 
            text = 'Não tens mais nenhum ' ..itemLabel.. ' para guardar.', 
            length = 4000
        })
    end
end)