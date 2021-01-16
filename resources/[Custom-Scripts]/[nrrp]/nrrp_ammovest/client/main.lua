ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('nrrp_craftsys:useAmmoItem')
AddEventHandler('nrrp_craftsys:useAmmoItem', function(ammo)
    local playerPed = GetPlayerPed(-1)
    local weapon

    local found, currentWeapon = GetCurrentPedWeapon(playerPed, true)
    if found then
        for _, v in pairs(ammo.weapons) do
            if currentWeapon == v then
                weapon = v
                break
            end
        end
        if weapon ~= nil then
            local pedAmmo = GetAmmoInPedWeapon(playerPed, weapon)
            local newAmmo = pedAmmo + ammo.count
            ClearPedTasks(playerPed)
            local found, maxAmmo = GetMaxAmmo(playerPed, weapon)
            if newAmmo < maxAmmo then
                exports["nrrp_progbar"]:startUI(1000, "A carregar arma")
                TaskReloadWeapon(playerPed)
                -- if Config.EnableInventoryHUD then
                --     TriggerServerEvent('disc-inventoryhud:updateAmmoCount', weapon, newAmmo)
                -- end
                SetPedAmmo(playerPed, weapon, newAmmo)
                TriggerServerEvent('nrrp_craftsys:removeAmmoItem', ammo)
                exports['mythic_notify']:SendAlert('success', 'Recarregado')
            else
                exports['mythic_notify']:SendAlert('error', 'Está com a munição cheia')
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local currentWeapon = GetSelectedPedWeapon(GetPlayerPed(-1)) --morpheause show ammo fix
        DisplayAmmoThisFrame(currentWeapon)
    end
end)

RegisterNetEvent('nrrp_craftsys:bulletproof')
AddEventHandler('nrrp_craftsys:bulletproof', function()
	local playerPed = GetPlayerPed(-1)
    exports["nrrp_progbar"]:startUI(8000, "A vestir colete")
    Wait(8000)
    if ESX.PlayerData.job.name == 'police' then
        SetPedComponentVariation(playerPed, 9, 12, 0, 0)
    else
        SetPedComponentVariation(playerPed, 9, 20, 9, 0)
    end
    
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
end)
