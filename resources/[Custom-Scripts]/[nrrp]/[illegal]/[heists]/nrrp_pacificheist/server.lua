ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local mincash = 150000 -- minimum amount of cash a pile holds
local maxcash = 500000 -- maximum amount of cash a pile can hold
local black = true -- enable this if you want blackmoney as a reward
local mincops = 6 -- minimum required cops to start mission
local enablesound = true -- enables bank alarm sound
local lastrobbed = 0 -- don't change this
local cooldown = 3600 -- amount of time to do the heist again in seconds (1h)
local info = {stage = 0, style = nil, locked = false}
local totalcash = 0
local PoliceDoors = {
    {loc = vector3(257.10, 220.30, 106.28), txtloc = vector3(257.10, 220.30, 106.28), model = "hei_v_ilev_bk_gate_pris", model2 = "hei_v_ilev_bk_gate_molten", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(236.91, 227.50, 106.29), txtloc = vector3(236.91, 227.50, 106.29), model = "v_ilev_bk_door", model2 = "v_ilev_bk_door", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(262.35, 223.00, 107.05), txtloc = vector3(262.35, 223.00, 107.05), model = "hei_v_ilev_bk_gate2_pris", model2 = "hei_v_ilev_bk_gate2_pris", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(252.72, 220.95, 101.68), txtloc = vector3(252.72, 220.95, 101.68), model = "hei_v_ilev_bk_safegate_pris", model2 = "hei_v_ilev_bk_safegate_molten", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(261.01, 215.01, 101.68), txtloc = vector3(261.01, 215.01, 101.68), model = "hei_v_ilev_bk_safegate_pris", model2 = "hei_v_ilev_bk_safegate_molten", obj = nil, obj2 = nil, locked = true},
    {loc = vector3(253.92, 224.56, 101.88), txtloc = vector3(253.92, 224.56, 101.88), model = "v_ilev_bk_vaultdoor", model2 = "v_ilev_bk_vaultdoor", obj = nil, obj2 = nil, locked = true}
}
ESX.RegisterServerCallback("nrrp_pacificheist:GetData", function(source, cb)
    cb(info)
end)
ESX.RegisterServerCallback("nrrp_pacificheist:GetDoors", function(source, cb)
    cb(PoliceDoors)
end)
ESX.RegisterServerCallback("nrrp_pacificheist:startevent", function(source, cb, method)
    local xPlayers = ESX.GetPlayers()
    local copcount = 0
    local yPlayer = ESX.GetPlayerFromId(source)

    if not info.locked then
        if (os.time() - cooldown) > lastrobbed then
            for i = 1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

                if xPlayer then
                    if xPlayer.job.name == "police" then
                        copcount = copcount + 1
                    end
                end
            end
            if copcount >= mincops then
                if method == 1 then
                    local item = yPlayer.getInventoryItem("thermal_charge")["count"]

                    if item >= 1 then
                        yPlayer.removeInventoryItem("thermal_charge", 1)
                        cb(true)
                        info.stage = 1
                        info.style = 1
                        info.locked = true
                    else
                        cb("Não tens nenhuma carga térmica.")
                    end
                elseif method == 2 then
                    local item = yPlayer.getInventoryItem("lockpick")["count"]

                    if item >= 1 then
                        yPlayer.removeInventoryItem("lockpick", 1)
                        info.stage = 1
                        info.style = 2
                        info.locked = true
                        cb(true)
                    else
                        cb("Não tens nenhuma lockpick.")
                    end
                end
            else
                cb("Tem de ter no mínimo "..mincops.." polícias na cidade.")
            end
        else
            cb(math.floor((cooldown - (os.time() - lastrobbed)) / 60)..":"..math.fmod((cooldown - (os.time() - lastrobbed)), 60).." até ao próximo roubo.")
        end
    else
        cb("Banco está a ser assaltado.")
    end
end)
ESX.RegisterServerCallback("nrrp_pacificheist:checkItem", function(source, cb, itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(itemname)["count"]

    if item >= 1 then
        cb(true)
    else
        cb(false)
    end
end)
ESX.RegisterServerCallback("nrrp_pacificheist:gettotalcash", function(source, cb)
    cb(totalcash)
end)
RegisterServerEvent("nrrp_pacificheist:removeitem")
AddEventHandler("nrrp_pacificheist:removeitem", function(itemname)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem(itemname, 1)
end)
RegisterServerEvent("nrrp_pacificheist:updatecheck")
AddEventHandler("nrrp_pacificheist:updatecheck", function(var, status)
    TriggerClientEvent("nrrp_pacificheist:updatecheck_c", -1, var, status)
end)
RegisterServerEvent("nrrp_pacificheist:policeDoor")
AddEventHandler("nrrp_pacificheist:policeDoor", function(doornum, status)
    PoliceDoors[doornum].locked = status
    TriggerClientEvent("nrrp_pacificheist:policeDoor_c", -1, doornum, status)
end)
RegisterServerEvent("nrrp_pacificheist:moltgate")
AddEventHandler("nrrp_pacificheist:moltgate", function(x, y, z, oldmodel, newmodel, method)
    TriggerClientEvent("nrrp_pacificheist:moltgate_c", -1, x, y, z, oldmodel, newmodel, method)
end)
RegisterServerEvent("nrrp_pacificheist:fixdoor")
AddEventHandler("nrrp_pacificheist:fixdoor", function(hash, coords, heading)
    TriggerClientEvent("nrrp_pacificheist:fixdoor_c", -1, hash, coords, heading)
end)
RegisterServerEvent("nrrp_pacificheist:openvault")
AddEventHandler("nrrp_pacificheist:openvault", function(method)
    TriggerClientEvent("nrrp_pacificheist:openvault_c", -1, method)
end)
RegisterServerEvent("nrrp_pacificheist:startloot")
AddEventHandler("nrrp_pacificheist:startloot", function()
    TriggerClientEvent("nrrp_pacificheist:startloot_c", -1)
end)
RegisterServerEvent("nrrp_pacificheist:rewardCash")
AddEventHandler("nrrp_pacificheist:rewardCash", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local reward = math.random(mincash, maxcash)

    if black then
        xPlayer.addAccountMoney("black_money", reward)
        totalcash = totalcash + reward
    else
        xPlayer.addMoney(reward)
        totalcash = totalcash + reward
    end
end)
RegisterServerEvent("nrrp_pacificheist:rewardGold")
AddEventHandler("nrrp_pacificheist:rewardGold", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem("goldbar", 1)
end)
RegisterServerEvent("nrrp_pacificheist:rewardDia")
AddEventHandler("nrrp_pacificheist:rewardDia", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem("diamondbox", 1)
end)
RegisterServerEvent("nrrp_pacificheist:giveidcard")
AddEventHandler("nrrp_pacificheist:giveidcard", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addInventoryItem("bankid_card", 1)
end)
RegisterServerEvent("nrrp_pacificheist:ostimer")
AddEventHandler("nrrp_pacificheist:ostimer", function()
    lastrobbed = os.time()
    info.stage, info.style, info.locked = 0, nil, false
    Citizen.Wait(300000)
    for i = 1, #PoliceDoors, 1 do
        PoliceDoors[i].locked = true
        TriggerClientEvent("nrrp_pacificheist:policeDoor_c", -1, i, true)
    end
    totalcash = 0
    TriggerClientEvent("nrrp_pacificheist:reset", -1)
end)
RegisterServerEvent("nrrp_pacificheist:gas")
AddEventHandler("nrrp_pacificheist:gas", function()
    TriggerClientEvent("nrrp_pacificheist:gas_c", -1)
end)
RegisterServerEvent("nrrp_pacificheist:ptfx")
AddEventHandler("nrrp_pacificheist:ptfx", function(method)
    TriggerClientEvent("nrrp_pacificheist:ptfx_c", -1, method)
end)
RegisterServerEvent("nrrp_pacificheist:alarm_s")
AddEventHandler("nrrp_pacificheist:alarm_s", function(toggle)
    if enablesound then
        TriggerClientEvent("nrrp_pacificheist:alarm", -1, toggle)
    end
    TriggerClientEvent("nrrp_pacificheist:policenotify", -1, toggle)
end)
