ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
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

RegisterCommand('comu', function(source, args, rawCommand)
	local msg = rawCommand:sub(6)
	local job = ESX.PlayerData.job.label
    TriggerServerEvent('nnrp_jobChat:chat', job, msg)
end, false)

RegisterCommand('112', function(source, args, rawCommand)
    local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
        streetName = GetStreetNameFromHashKey(streetName)
	local msg = rawCommand:sub(5)
	local emergency = '112'
    TriggerServerEvent('nnrp_jobChat:911',{
        x = ESX.Math.Round(playerCoords.x, 1),
        y = ESX.Math.Round(playerCoords.y, 1),
        z = ESX.Math.Round(playerCoords.z, 1)
	}, msg, streetName, emergency)
end, false)


RegisterNetEvent('nnrp_jobChat:Send')
AddEventHandler('nnrp_jobChat:Send', function(messageFull, job)
    --if ESX.PlayerData.job.label == job then
		TriggerEvent('chat:addMessage', messageFull)
    --end
end)

RegisterNetEvent('nnrp_jobChat:EmergencySend')
AddEventHandler('nnrp_jobChat:EmergencySend', function(messageFull)
    if ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' then
		TriggerEvent('chat:addMessage', messageFull)
    end
end)