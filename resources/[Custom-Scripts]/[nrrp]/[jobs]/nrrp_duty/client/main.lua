ESX = nil
local PlayerData = {}
local inMarker = false


Citizen.CreateThread(function ()
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

Citizen.CreateThread(function()
    local sleep = 7
    local jobs = {
        'offpolice',
        'police',
        'offambulance',
        'ambulance',
    }

    while true do
        Citizen.Wait(sleep)
        player = PlayerPedId()
        coords = GetEntityCoords(player)
        
        if IsPedOnFoot(player) then
            for k, v in pairs(Config.Zones) do
                local distance = GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true)
                if distance < 7 then
                    DrawMarker(27, v.Pos.x, v.Pos.y, v.Pos.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 1, 157, 0, 155, false, false, 2, false, false, false, false)
                    if distance < 2.0 then 
                        DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z + 1, "[~g~E~w~] ~g~Entrar~w~/~r~Sair ~w~de Serviço")

                        for k, v in pairs(jobs) do
                            if ESX.PlayerData.job.name == v then
                                if IsControlJustPressed(0, 38) then
                                    TriggerServerEvent('nnrp_duty:onoff')
                                end
                            end
                        end

                        near = true
                        break
                    end
                    near = true
                end
            end
            if not near then 
                sleep = 1500
            else
                sleep = 7
            end
            near = false
        else
            Citizen.Wait(1500)
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x,y,z)
    local scale = 0.3

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(6)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end