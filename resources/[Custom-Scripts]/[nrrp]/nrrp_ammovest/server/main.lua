ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    Citizen.Wait(0)
    for k, v in pairs(Config.Ammo) do
        ESX.RegisterUsableItem(v.name, function(source)
            TriggerClientEvent('nrrp_craftsys:useAmmoItem', source, v)
        end)
    end
end)

RegisterServerEvent('nrrp_craftsys:removeAmmoItem')
AddEventHandler('nrrp_craftsys:removeAmmoItem', function(ammo)
    local player = ESX.GetPlayerFromId(source)
    player.removeInventoryItem(ammo.name, 1)
end)

----------------------------- Kevlar
ESX.RegisterUsableItem('bulletproof', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('nrrp_craftsys:bulletproof', source)
	xPlayer.removeInventoryItem('bulletproof', 1)
end)

