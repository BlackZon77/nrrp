NRRPHelper = {}

NRRPHelper.ShowAlert = function(message, playNotificationSound)
    SetTextComponentFormat('STRING')
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, playNotificationSound, -1)
end

NRRPHelper.ShowNotification = function(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(true, false)
end

NRRPHelper.SpawnVehicle = function(name, coordinates, heading)
    RequestModel(name)

    while not HasModelLoaded(name) do
        Citizen.Wait(100)
    end

    local vehicle = CreateVehicle(name, coordinates, heading, true, true)

    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleOnGroundProperly(vehicle)
    SetModelAsNoLongerNeeded(name)

    return vehicle
end

NRRPHelper.CreateBlip = function(coordinates, name, spriteId, colorId, scale)
	local blip = AddBlipForCoord(coordinates)

	SetBlipSprite(blip, spriteId)
	SetBlipColour(blip, colorId)
	SetBlipScale(blip, scale)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(name)
	EndTextCommandSetBlipName(blip)

	return blip
end

NRRPHelper.CreateRouteBlip = function(coordinates)
	local blip = AddBlipForCoord(coordinates)

	SetBlipSprite(blip, 57)
	SetBlipColour(blip, 5)
	SetBlipScale(blip, 0.30)
	SetBlipRoute(blip,  true)

	return blip
end

--
-- Events
--

RegisterNetEvent('nrrp_trucking:helper:showAlert')
AddEventHandler('nrrp_trucking:helper:showAlert', function(message, playNotificationSound)
	NRRPHelper.ShowAlert(message, playNotificationSound)
end)

RegisterNetEvent('nrrp_trucking:helper:showNotification')
AddEventHandler('nrrp_trucking:helper:showNotification', function(message)
	NRRPHelper.ShowNotification(message)
end)