ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("nrrp_warehouse:getWH", function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer == nil then return; end
    local Identifier = xPlayer.identifier

    MySQL.Async.fetchAll("SELECT warehouse FROM warehouse WHERE identifier = @identifier", {
        ["@identifier"] = Identifier
    }, function(result)
        if result[1] ~= nil then
            local warehouselist = json.decode(result[1].warehouse)
            cb(warehouselist)
        else
            cb(nil)
        end
    end)
end)

RegisterServerEvent("nrrp_warehouse:insertWH")
AddEventHandler("nrrp_warehouse:insertWH", function(warehouselist)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer == nil then return; end
    local Identifier = xPlayer.identifier

    MySQL.Async.execute("INSERT INTO warehouse (identifier, warehouse) VALUES (@identifier, @warehouse)", {
        ["@identifier"] = Identifier,
        ["@warehouse"] = json.encode(warehouselist)
    })
end)

RegisterServerEvent("nrrp_warehouse:updateWH")
AddEventHandler("nrrp_warehouse:updateWH", function(Warehouse)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer == nil then return; end
    local Identifier = xPlayer.identifier

    MySQL.Async.execute("UPDATE warehouse SET warehouse = @warehouse WHERE identifier = @identifier", {
        ["@identifier"] = Identifier,
        ["@warehouse"] = json.encode(Warehouse)
    })
end)

RegisterServerEvent("nrrp_warehouse:checkKey")
AddEventHandler("nrrp_warehouse:checkKey", function(thing)
    local _source = source
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(_source)
    local key = xPlayer.getInventoryItem("warehouse_key")["count"]
    local card = xPlayer.getInventoryItem("access_key")["count"]

    if thing == 1 then
        if key >= 1 then
            for i = 1, #xPlayers, 1 do
                TriggerClientEvent("nrrp_warehouse:upVar", xPlayers[i], "shouldlock", true)
                TriggerClientEvent("nrrp_warehouse:upVar", xPlayers[i], "locked", true)
            end
        else
            for i = 1, #xPlayers, 1 do
                TriggerClientEvent("nrrp_warehouse:upVar", xPlayers[i], "shouldlock", false)
            end
        end
    elseif thing == 2 then
        if key >= 1 then
            TriggerClientEvent("nrrp_warehouse:tpWH", _source, true, true)
            for i=1, #xPlayers, 1 do
                TriggerClientEvent("nrrp_warehouse:upVar", xPlayers[i], "locked", false)
            end
        else
            TriggerClientEvent("nrrp_warehouse:tpWH", _source, false)
        end
    elseif thing == 3 then
        if card >= 1 then
            TriggerClientEvent("nrrp_warehouse:openLaptop", _source)
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'inform', text = _("no_access"), length = 3000, style = { ['background-color'] = '#FF0000', ['color'] = '#000000' } })
        end
    end
end)

RegisterServerEvent("nrrp_warehouse:upVar_s")
AddEventHandler("nrrp_warehouse:upVar_s", function(var, status)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent("nrrp_warehouse:upVar", xPlayers[i], var, status)
    end
end)

RegisterServerEvent("nrrp_warehouse:checkMoney")
AddEventHandler("nrrp_warehouse:checkMoney", function(amount, action)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= amount then
        xPlayer.removeMoney(amount)
        TriggerClientEvent("nrrp_warehouse:start", _source ,action)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'inform', text = _("enough_m"), length = 3000, style = { ['background-color'] = '#FF0000', ['color'] = '#000000' } })
    end
end)

RegisterServerEvent("nrrp_warehouse:sellGoods")
AddEventHandler("nrrp_warehouse:sellGoods", function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if not Config.blackmoney then
        xPlayer.addMoney(amount)
    else
        xPlayer.addAccountMoney("black_money", amount) -- thx for reminding me Mikolas
    end
end)