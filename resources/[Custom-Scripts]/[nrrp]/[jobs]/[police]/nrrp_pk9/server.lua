ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('nrrp_pk9:hasClosestDrugs')
AddEventHandler('nrrp_pk9:hasClosestDrugs', function(playerId)
    local target = ESX.GetPlayerFromId(playerId)
    local src = source
    local inventory = target.inventory
    for i = 1, #inventory do
        for k, v in pairs(Config.Drugs) do
            if inventory[i].name == v and inventory[i].count > 0 then
                TriggerClientEvent('nrrp_pk9:hasDrugs', src, true)
                return
            end
        end
    end
    TriggerClientEvent('nrrp_pk9:hasDrugs', src, false)
end)