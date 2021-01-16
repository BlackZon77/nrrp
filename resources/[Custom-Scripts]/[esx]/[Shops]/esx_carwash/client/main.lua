ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	for i=1, #Config.Locations, 1 do
		carWashLocation = Config.Locations[i]

		local blip = AddBlipForCoord(carWashLocation)
		SetBlipSprite(blip, 100)
		SetBlipScale(blip, 0.7)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(_U('blip_carwash'))
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local canSleep = true

		if CanWashVehicle() then

			for i=1, #Config.Locations, 1 do
				local carWashLocation = Config.Locations[i]
				local distance = GetDistanceBetweenCoords(coords, carWashLocation, true)
				local textCoords = vector3(26.5906, -1392.0261, 29.5634)
				if distance < 50 then
					DrawMarker(1, carWashLocation, 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.0, 0, 157, 0, 155, false, false, 2, false, false, false, false)
					canSleep = false
				end

				if distance < 5 then
					canSleep = false

					if Config.EnablePrice then
						-- ESX.ShowHelpNotification(_U('prompt_wash_paid', ESX.Math.GroupDigits(Config.Price)))
						ESX.Game.Utils.DrawText3D(textCoords, _U('prompt_wash_paid', ESX.Math.GroupDigits(Config.Price)), 1, 0)
					else
						ESX.ShowHelpNotification(_U('prompt_wash'))
					end

					if IsControlJustReleased(0, 38) then
						local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

						if GetVehicleDirtLevel(vehicle) > 2 then
							WashVehicle()
						else
							exports['mythic_notify']:SendAlert('error', _U('wash_failed_clean'))
						end
					end
				end
			end

			if canSleep then
				Citizen.Wait(500)
			end

		else
			Citizen.Wait(500)
		end
	end
end)

CanWashVehicle = function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)

		if GetPedInVehicleSeat(vehicle, -1) == playerPed then
			return true
		end
	end

	return false
end

WashVehicle = function()
	ESX.TriggerServerCallback('esx_carwash:canAfford', function(canAfford)
		if canAfford then
			local vehicle = GetVehiclePedIsIn(PlayerPedId())
			local washTime = 15000

			exports["nrrp_progbar"]:startUI(washTime, "O teu carro está a ser lavado")
			Wait(washTime)

			SetVehicleDirtLevel(vehicle, 0.1)

			if Config.EnablePrice then
				exports['mythic_notify']:SendAlert('success', _U('wash_successful_paid', ESX.Math.GroupDigits(Config.Price)))
			else
				exports['mythic_notify']:SendAlert('success', _U('wash_successful'))
			end
			Wait(5000)
		else
			exports['mythic_notify']:SendAlert('error', _U('wash_failed'))
			Wait(5000)
		end
	end)
end
