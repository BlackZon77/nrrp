local ESX = nil
local robbableItems = {
    [1]  = {chance = 85, id = 0, name = 'Dinheiro', quantity = math.random(1, 500)}, 
    -- [2]  = {chance = 10, id = 'WEAPON_PISTOL', name = 'Pistol', isWeapon = true},

    [2]  = {chance = 30, id = 'earrings', name = 'Brincos', quantity = math.random(1, 5)}, 
    [3]  = {chance = 30, id = 'necklace', name = 'Colar', quantity = math.random(1, 5)}, 
    [4]  = {chance = 30, id = 'wedding_ring', name = 'Anel de Casamento', quantity = 1}, 
    [5]  = {chance = 35, id = 'rolex', name = 'Rolex', quantity = math.random(1, 5)}, 
    [6]  = {chance = 36, id = 'goldbar', name = 'Barra de Ouro', quantity = math.random(1, 3)}, 
    [7]  = {chance = 50, id = 'diamondbox', name = 'Caixa de Diamante', quantity = 1}, 

    [8]  = {chance = 40, id = 'phone', name = 'Telemovel', quantity = 1}, 
    [9]  = {chance = 68, id = 'radio', name = 'Rádio', quantity = 1}, 
    [10] = {chance = 68, id = 'lockpick', name = 'Lockpick', quantity = 1}, 
    [11] = {chance = 30, id = 'lighter', name = 'Isqueiro', quantity = 1}, 
    [12] = {chance = 30, id = 'cigarett', name = 'Cigarro', quantity = math.random(1, 3)}, 

    [13] = {chance = 30, id = 'joint2g', name = 'Ganza', quantity = math.random(1, 14)}, 
    [14] = {chance = 40, id = 'coke1g', name = 'Cocaina 1G', quantity = math.random(1, 12)}, 
    [15] = {chance = 70, id = 'meth1g', name = 'Meth 1G', quantity = math.random(1, 10)}, 
    [16] = {chance = 50, id = 'drugbags', name = 'Sacos', quantity = math.random(1, 10)}, 

    [17] = {chance = 60, id = 'repairkit', name = 'Kit de Reparação', quantity = 1}, 
    [18] = {chance = 60, id = 'tyrekit', name = 'Roda Suplente', quantity = 1}, 
    [19] = {chance = 75, id = 'bulletproof', name = 'Colete á Prova de Bala', quantity = 1}, 
    [20] = {chance = 70, id = 'warehouse_key', name = 'Chave de acesso á Warehouse', quantity = 1}, 
    [21] = {chance = 70, id = 'access_key', name = 'USB de Acesso ao PC', quantity = 1}, 
    [22] = {chance = 30, id = 'sim', name = 'Cartão SIM', quantity = 1}, 

    [22] = {chance = 30, id = 'beer', name = 'Cerveja', quantity = math.random(1, 3)}, 
    [23] = {chance = 30, id = 'vodka', name = 'Vodka', quantity = math.random(1, 3)}, 
    [24] = {chance = 30, id = 'wine', name = 'Vinho', quantity = math.random(1, 3)}, 
    [25] = {chance = 30, id = 'cocacola', name = 'Cocacola', quantity = math.random(1, 3)}, 
    [26] = {chance = 30, id = 'sprite', name = 'Sprite', quantity = math.random(1, 3)}, 
    [27] = {chance = 30, id = 'sandwich', name = 'Sandwich', quantity = math.random(1, 3)}, 
    [28] = {chance = 30, id = 'chips', name = 'Batatas Fritas', quantity = math.random(1, 3)}, 
    [29] = {chance = 30, id = 'cupcake', name = 'Cupcake', quantity = math.random(1, 3)}, 

    [31] = {chance = 60, id = 'cloth', name = 'Tecido', quantity = math.random(1, 3)}, 
    [32] = {chance = 82, id = '9mm', name = 'Bala 9mm', quantity = math.random(1, 4)}, 
    [33] = {chance = 82, id = '12gauge', name = 'Bala 12 Gauge', quantity = math.random(1, 2)}, 
    [34] = {chance = 84, id = 'spring', name = 'Mola', quantity = 1}, 
    [35] = {chance = 85, id = 'springbig', name = 'Mola Grande', quantity = 1}, 

    [36] = {chance = 82, id = 'blueprint_pistol', name = 'Blueprint de Pistola', quantity = 1}, 
    [37] = {chance = 80, id = 'pistolframe', name = 'Frame de Pistola', quantity = 1}, 
    [38] = {chance = 81, id = 'pistolpipe', name = 'Cano de Pistola', quantity = 1}, 

    [39] = {chance = 88, id = 'blueprint_microsmg', name = 'Blueprint de Pistola', quantity = 1}, 
    [40] = {chance = 86, id = 'microsmgframe', name = 'Frame de SMG', quantity = 1}, 
    [41] = {chance = 85, id = 'microsmgpipe', name = 'Cano de SMG', quantity = 1}, 

    [42] = {chance = 95, id = 'blueprint_assaultrifle', name = 'Blueprint de Pistola', quantity = 1}, 
    [43] = {chance = 92, id = 'assaultrifleframe', name = 'Frame de AK-47', quantity = 1}, 
    [44] = {chance = 93, id = 'assaultriflepipe', name = 'Cano de AK-47', quantity = 1}, 

    [45] = {chance = 85, id = 'blueprint_sawnoffshotgun', name = 'Blueprint de Pistola', quantity = 1}, 
    [46] = {chance = 82, id = 'sawnoffshotgunframe', name = 'Frame de Shotgun', quantity = 1}, 
    [47] = {chance = 83, id = 'sawnoffshotgunpipe', name = 'Cano de Shotgun', quantity = 1}, 
}

--[[chance = 1 is very common, the higher the value the less the chance]]--

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('lockpick', function(source) --Hammer high time to unlock but 100% call cops
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('houseRobberies:attempt', source, xPlayer.getInventoryItem('lockpick').count)
end)

RegisterServerEvent('houseRobberies:removeLockpick')
AddEventHandler('houseRobberies:removeLockpick', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('lockpick', 1)
    TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Essa lockpick está estragada ', length = 2000})
end)

RegisterServerEvent('houseRobberies:giveMoney')
AddEventHandler('houseRobberies:giveMoney', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local cash = math.random(0, 700)
    xPlayer.addMoney(cash)
    TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'success', text = 'Encontraste ' .. cash, length = 4000})
end)


RegisterServerEvent('houseRobberies:searchItem')
AddEventHandler('houseRobberies:searchItem', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item, gotID = {}, {}


    for i=1, math.random(1, 2) do
        item = robbableItems[math.random(1, #robbableItems)]

        if item ~= nil then
            if math.random(1, 100) >= item.chance then
                if tonumber(item.id) == 0 and not gotID[item.id] then
                    gotID[item.id] = true
                    xPlayer.addMoney(item.quantity)

                    TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'success', text = 'Encontraste ' .. item.quantity .. ' €', length = 4000})
                elseif item.isWeapon and not gotID[item.id] then
                    gotID[item.id] = true
                    xPlayer.addWeapon(item.id, 50)

                    TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'success', text = 'Encontraste uma Arma!', length = 4000})
                elseif not gotID[item.id] then
                    gotID[item.id] = true
                    xPlayer.addInventoryItem(item.id, item.quantity)
                    
                    TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'success', text = 'Encontraste um Item', length = 4000})
                end
            end
        end
    end
end)
