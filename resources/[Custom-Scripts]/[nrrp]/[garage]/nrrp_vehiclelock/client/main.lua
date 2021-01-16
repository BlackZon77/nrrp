ESX = nil

local isRunningWorkaround = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function StartWorkaroundTask()
	if isRunningWorkaround then
		return
	end

	local timer = 0
	local playerPed = PlayerPedId()
	isRunningWorkaround = true

	while timer < 100 do
		Citizen.Wait(0)
		timer = timer + 1

		local vehicle = GetVehiclePedIsTryingToEnter(playerPed)

		if DoesEntityExist(vehicle) then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 4 then
				ClearPedTasks(playerPed)
			end
		end
	end

	isRunningWorkaround = false
end

function ToggleVehicleLock()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)
	end

	if not DoesEntityExist(vehicle) then
		return
	end

	ESX.TriggerServerCallback('nrrp_vehiclelock:requestPlayerCars', function(isOwnedVehicle)
		if isOwnedVehicle then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 1 then -- unlocked
				exports['nrrp_progbar']:startUI(800, 'A trancar o carro')
				TriggerEvent("nrrp_vehiclelock:anim")
				Citizen.Wait(800)

				SetVehicleDoorsLocked(vehicle, 2)
				PlayVehicleDoorCloseSound(vehicle, 1)

				exports['mythic_notify']:SendAlert('inform', _U('message_locked'))

			elseif lockStatus == 2 then -- locked
				exports['nrrp_progbar']:startUI(800, 'A destrancar o carro')
				TriggerEvent("nrrp_vehiclelock:anim")
				Citizen.Wait(800)

				SetVehicleDoorsLocked(vehicle, 1)
				PlayVehicleDoorOpenSound(vehicle, 0)

				exports['mythic_notify']:SendAlert('inform', _U('message_unlocked'))
			end
		end
	end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))

	ESX.TriggerServerCallback('nrrp_vehiclelock:requestPlayerCarsJobs', function(isOwnedVehicle)
		if isOwnedVehicle then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 1 then -- unlocked
				exports['nrrp_progbar']:startUI(800, 'A trancar o carro')
				TriggerEvent("nrrp_vehiclelock:anim")
				Citizen.Wait(800)

				SetVehicleDoorsLocked(vehicle, 2)
				PlayVehicleDoorCloseSound(vehicle, 1)

				exports['mythic_notify']:SendAlert('inform', _U('message_locked'))

			elseif lockStatus == 2 then -- locked
				exports['nrrp_progbar']:startUI(800, 'A destrancar o carro')
				TriggerEvent("nrrp_vehiclelock:anim")
				Citizen.Wait(800)

				SetVehicleDoorsLocked(vehicle, 1)
				PlayVehicleDoorOpenSound(vehicle, 0)

				exports['mythic_notify']:SendAlert('inform', _U('message_unlocked'))
			end
		end
	end, ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)))
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, 182) and IsInputDisabled(0) then
			ToggleVehicleLock()
			Citizen.Wait(300)
		end
	end
end)



RegisterNetEvent('nrrp_vehiclelock:anim')
AddEventHandler('nrrp_vehiclelock:anim', function()
	inanimation = true

    ClearPedTasksImmediately(IPed)
    if not handCuffed then
		local lPed = GetPlayerPed(-1)

		RequestAnimDict("anim@mp_player_intmenu@key_fob@")
		while not HasAnimDictLoaded("anim@mp_player_intmenu@key_fob@") do
			Citizen.Wait(0)
		end

		if IsEntityPlayingAnim(lPed, "anim@mp_player_intmenu@key_fob@", "fob_click_fp", 3) then
			ClearPedSecondaryTask(lPed)
			TaskPlayAnim(lPed, "anim@mp_player_intmenu@key_fob@", "fob_click_fp", 8.0, -8, -1, 16, 0, 0, 0, 0)
		else
			ClearPedTasksImmediately(IPed)
			TaskPlayAnim(lPed, "anim@mp_player_intmenu@key_fob@", "fob_click_fp", 8.0, -8, -1, 16, 0, 0, 0, 0)
			ClearPedSecondaryTask(lPed)
		end
    else
      ClearPedSecondaryTask(lPed)
    end
	inanimation = false
end)