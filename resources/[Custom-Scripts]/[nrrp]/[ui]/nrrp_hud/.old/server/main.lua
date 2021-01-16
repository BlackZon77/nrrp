ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('baseevents:enteringVehicle')
AddEventHandler('baseevents:enteringVehicle', function(currentVehicle, currentSeat, displayname, netId)
    TriggerClientEvent('nrrp_hud:EnteringVehicle', source, currentVehicle, currentSeat, displayname, netId)
end)

RegisterServerEvent('baseevents:enteringAborted')
AddEventHandler('baseevents:enteringAborted', function()
    TriggerClientEvent('nrrp_hud:EnteringVehicleAborted', source)
end)

RegisterServerEvent('baseevents:enteredVehicle')
AddEventHandler('baseevents:enteredVehicle', function(currentVehicle, currentSeat, displayname)
    TriggerClientEvent('nrrp_hud:EnteredVehicle', source, currentVehicle, currentSeat, displayname)
end)

RegisterServerEvent('baseevents:leftVehicle')
AddEventHandler('baseevents:leftVehicle', function(currentVehicle, currentSeat, displayname)
    TriggerClientEvent('nrrp_hud:LeftVehicle', source, currentVehicle, currentSeat, displayname)
end)