ESX = nil

local timing, isPlayerWhitelisted = math.ceil(Config.Timer * 60000), false
local streetName, playerGender

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	TriggerEvent('skinchanger:getSkin', function(skin)
		playerGender = skin.sex
	end)

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		if NetworkIsSessionStarted() then
			DecorRegister('isOutlaw', 3)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)

			return
		end
	end
end)

-- Gets the player's current street.
-- Aaalso get the current player gender
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)

		local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		streetName = GetStreetNameFromHashKey(streetName)
	end
end)

AddEventHandler('skinchanger:loadSkin', function(character)
	playerGender = character.sex
end)

function refreshPlayerWhitelisted()
	if not ESX.PlayerData then
		return false
	end

	if not ESX.PlayerData.job then
		return false
	end

	for k,v in ipairs(Config.WhitelistedCops) do
		if v == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end


RegisterNetEvent('nrrp_outlawalert:outlawNotify')
AddEventHandler('nrrp_outlawalert:outlawNotify', function(type, data, length)
	if isPlayerWhitelisted then
		SendNUIMessage({action = 'display', style = type, info = data, length = length})
    	PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)

		if DecorGetInt(PlayerPedId(), 'isOutlaw') == 2 then
			Citizen.Wait(timing)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)
		end
	end
end)

RegisterNetEvent('nrrp_outlawalert:outlawNotify2')
AddEventHandler('nrrp_outlawalert:outlawNotify2', function(type, data, length)
	if isPlayerWhitelisted then
		SendNUIMessage({action = 'display', style = type, info = data, length = length})
    	PlaySound(-1, "5_Second_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0, 0, 1)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)

		if DecorGetInt(PlayerPedId(), 'isOutlaw') == 2 then
			Citizen.Wait(timing)
			DecorSetInt(PlayerPedId(), 'isOutlaw', 1)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		-- is jackin'
		if (IsPedTryingToEnterALockedVehicle(playerPed) or IsPedJacking(playerPed)) and Config.CarJackingAlert then

			Citizen.Wait(3000)
			local vehicle = GetVehiclePedIsIn(playerPed, true)

			if vehicle and ((isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted) then
				local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))

				ESX.TriggerServerCallback('nrrp_outlawalert:isVehicleOwner', function(owner)
					if not owner then

						local vehicleLabel = ERPCarModelToLabel(GetEntityModel(vehicle))

						DecorSetInt(playerPed, 'isOutlaw', 2)

						TriggerServerEvent('nrrp_outlawalert:carJackInProgress', {
							x = ESX.Math.Round(playerCoords.x, 1),
							y = ESX.Math.Round(playerCoords.y, 1),
							z = ESX.Math.Round(playerCoords.z, 1)
						}, streetName, vehicleLabel, playerGender)
					end
				end, plate)
			end
			-- is in combat
		elseif IsPedInMeleeCombat(playerPed) and Config.MeleeAlert then

			Citizen.Wait(3000)

			if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
				DecorSetInt(playerPed, 'isOutlaw', 2)

				TriggerServerEvent('nrrp_outlawalert:combatInProgress', {
					x = ESX.Math.Round(playerCoords.x, 1),
					y = ESX.Math.Round(playerCoords.y, 1),
					z = ESX.Math.Round(playerCoords.z, 1)
				}, streetName, playerGender)
			end
			-- is shootin'
		elseif IsPedShooting(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and Config.GunshotAlert then

			Citizen.Wait(3000)

			if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
				DecorSetInt(playerPed, 'isOutlaw', 2)

				TriggerServerEvent('nrrp_outlawalert:gunshotInProgress', {
					x = ESX.Math.Round(playerCoords.x, 1),
					y = ESX.Math.Round(playerCoords.y, 1),
					z = ESX.Math.Round(playerCoords.z, 1)
				}, streetName, playerGender)
			end

		end
	end
end)

RegisterNetEvent('nrrp_outlawalert:carJackInProgress')
AddEventHandler('nrrp_outlawalert:carJackInProgress', function(targetCoords)
	if isPlayerWhitelisted then
		if Config.CarJackingAlert then
			local alpha = 250
			local thiefBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

			SetBlipSprite (thiefBlip, 229)
			SetBlipDisplay(thiefBlip, 4)
			SetBlipScale  (thiefBlip, 1.8)
			SetBlipAsShortRange(thiefBlip, true)
			SetBlipAlpha(thiefBlip, alpha)

			SetBlipHighDetail(thiefBlip, true)
			SetBlipAsShortRange(thiefBlip, true)
			SetBlipAsShortRange(blip, false)

			SetBlipColour (thiefBlip, 1)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString('112 - Furto de Viatura')
			EndTextCommandSetBlipName(thiefBlip)

			while alpha ~= 0 do
				Citizen.Wait(Config.BlipJackingTime * 4)
				alpha = alpha - 1
				SetBlipAlpha(thiefBlip, alpha)

				if alpha == 0 then
					RemoveBlip(thiefBlip)
					return
				end
			end

		end
	end
end)

RegisterNetEvent('nrrp_outlawalert:gunshotInProgress')
AddEventHandler('nrrp_outlawalert:gunshotInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.GunshotAlert then
		local alpha = 250
		local gunshotBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite (gunshotBlip, 433)
		SetBlipDisplay(gunshotBlip, 4)
		SetBlipScale  (gunshotBlip, 1.8)
        SetBlipAsShortRange(gunshotBlip, true)
        SetBlipAlpha(gunshotBlip, alpha)

        SetBlipHighDetail(gunshotBlip, true)
		SetBlipAsShortRange(gunshotBlip, true)
		SetBlipAsShortRange(blip, false)

		SetBlipColour (gunshotBlip, 1)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('112 - Tiros Disparados')
		EndTextCommandSetBlipName(gunshotBlip)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipGunTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(gunshotBlip)
				return
			end
		end
	end
end)

RegisterNetEvent('nrrp_outlawalert:combatInProgress')
AddEventHandler('nrrp_outlawalert:combatInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.MeleeAlert then
		local alpha = 250
		local meleeBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite (meleeBlip, 480)
		SetBlipDisplay(meleeBlip, 4)
		SetBlipScale  (meleeBlip, 1.8)
        SetBlipAsShortRange(meleeBlip, true)
        SetBlipAlpha(meleeBlip, alpha)

        SetBlipHighDetail(meleeBlip, true)
		SetBlipAsShortRange(meleeBlip, true)
		SetBlipAsShortRange(blip, false)

		SetBlipColour (meleeBlip, 1)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('112 - Combate')
		EndTextCommandSetBlipName(meleeBlip)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipMeleeTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(meleeBlip, alpha)

			if alpha == 0 then
				RemoveBlip(meleeBlip)
				return
			end
		end
	end
end)

RegisterNetEvent('nrrp_outlawalert:bpBlip')
AddEventHandler('nrrp_outlawalert:bpBlip', function(targetCoords)
	if isPlayerWhitelisted then
		local alpha = 250
		local bpBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite (bpBlip, 459)
		SetBlipDisplay(bpBlip, 4)
		SetBlipScale  (bpBlip, 1.8)
        SetBlipAsShortRange(bpBlip, true)
        SetBlipAlpha(bpBlip, alpha)

        SetBlipHighDetail(bpBlip, true)
		SetBlipAsShortRange(bpBlip, true)
		SetBlipAsShortRange(blip, false)

		SetBlipColour (bpBlip, 1)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('[BUTÃO DE PANICO] - PSP')
		EndTextCommandSetBlipName(bpBlip)

		while alpha ~= 0 do
			Citizen.Wait(14 * 4)
			alpha = alpha - 1
			SetBlipAlpha(bpBlip, alpha)

			if alpha == 0 then
				RemoveBlip(bpBlip)
				return
			end
		end
	end
end)

RegisterCommand('bp', function(source, args, raw)
	local targetCoords = GetEntityCoords(PlayerPedId(), true)
	streetName,_ = GetStreetNameAtCoord(targetCoords.x, targetCoords.y, targetCoords.z)
	streetName = GetStreetNameFromHashKey(streetName)

	TriggerServerEvent('nrrp_outlawalert:bpalert', targetCoords, streetName)	
end)

RegisterNetEvent('nrrp_outlawalert:drugSellingInProgress')
AddEventHandler('nrrp_outlawalert:drugSellingInProgress', function(targetCoords)
	if isPlayerWhitelisted then
		local alpha = 250
		local drugSellingBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite (drugSellingBlip, 500)
		SetBlipDisplay(drugSellingBlip, 4)
		SetBlipScale  (drugSellingBlip, 1.8)
        SetBlipAsShortRange(drugSellingBlip, true)
        SetBlipAlpha(drugSellingBlip, alpha)

        SetBlipHighDetail(drugSellingBlip, true)
		SetBlipAsShortRange(drugSellingBlip, true)
		SetBlipAsShortRange(blip, false)

		SetBlipColour (drugSellingBlip, 1)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('112 - Venda de Drogas')
		EndTextCommandSetBlipName(drugSellingBlip)

		while alpha ~= 0 do
			Citizen.Wait(14 * 4)
			alpha = alpha - 1
			SetBlipAlpha(drugSellingBlip, alpha)

			if alpha == 0 then
				RemoveBlip(drugSellingBlip)
				return
			end
		end
	end
end)

RegisterNetEvent('nrrp_outlawalert:houseRobberyInProgress')
AddEventHandler('nrrp_outlawalert:houseRobberyInProgress', function(targetCoords)
	if isPlayerWhitelisted then
		local alpha = 250
		local hRobberyBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite (hRobberyBlip, 500)
		SetBlipDisplay(hRobberyBlip, 4)
		SetBlipScale  (hRobberyBlip, 1.8)
        SetBlipAsShortRange(hRobberyBlip, true)
        SetBlipAlpha(hRobberyBlip, alpha)

        SetBlipHighDetail(hRobberyBlip, true)
		SetBlipAsShortRange(hRobberyBlip, true)
		SetBlipAsShortRange(blip, false)

		SetBlipColour (hRobberyBlip, 1)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString('112 - Roubo a casa')
		EndTextCommandSetBlipName(hRobberyBlip)

		while alpha ~= 0 do
			Citizen.Wait(14 * 4)
			alpha = alpha - 1
			SetBlipAlpha(hRobberyBlip, alpha)

			if alpha == 0 then
				RemoveBlip(hRobberyBlip)
				return
			end
		end
	end
end)

AddEventHandler('police:houseRobbery', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('nrrp_outlawalert:houseRobberyInProgress', {x = pos.x, y = pos.y, z = pos.z}, streetName)
end)

ERPCarModelToLabel = function(model)
    model = (type(model) == 'number' and model or GetHashKey(model))

    local displayName = GetDisplayNameFromVehicleModel(model)
    local vehicleName = GetLabelText(displayName)

    if (vehicleName == nil or string.lower(vehicleName) == 'null' or string.lower(vehicleName) == 'carnotfound') then
        vehicleName = displayName
    end

    if (vehicleName == nil or string.lower(vehicleName) == 'null' or string.lower(vehicleName) == 'carnotfound') then
        vehicleName = model
    end

    return vehicleName
end