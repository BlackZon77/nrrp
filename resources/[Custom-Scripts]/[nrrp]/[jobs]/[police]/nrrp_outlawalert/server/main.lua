ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('nrrp_outlawalert:carJackInProgress')
AddEventHandler('nrrp_outlawalert:carJackInProgress', function(targetCoords, streetName, vehicleLabel, playerGender)
    mytype = 'police'
    data = {["code"] = '[112]', ["name"] = 'Furto de Viatura', ["loc"] = vehicleLabel}
    length = 3500
    TriggerClientEvent('nrrp_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('nrrp_outlawalert:combatInProgress', -1, targetCoords)
    TriggerClientEvent('nrrp_outlawalert:carJackInProgress', -1, targetCoords)
end, false)

RegisterServerEvent('nrrp_outlawalert:combatInProgress')
AddEventHandler('nrrp_outlawalert:combatInProgress', function(targetCoords, streetName, playerGender)
    mytype = 'police'
    data = {["code"] = '[112]', ["name"] = 'Luta em Progresso', ["loc"] = streetName}
    length = 3500
    TriggerClientEvent('nrrp_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('nrrp_outlawalert:combatInProgress', -1, targetCoords)
end, false)

RegisterServerEvent('nrrp_outlawalert:gunshotInProgress')
AddEventHandler('nrrp_outlawalert:gunshotInProgress', function(targetCoords, streetName, playerGender)
    mytype = 'police'
    data = {["code"] = '[112]', ["name"] = 'Tiros Disparados', ["loc"] = streetName}
    length = 5500
    TriggerClientEvent('nrrp_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('nrrp_outlawalert:gunshotInProgress', -1, targetCoords)
end, false)


RegisterServerEvent('nrrp_outlawalert:drugSellingInProgress')
AddEventHandler('nrrp_outlawalert:drugSellingInProgress', function(targetCoords, streetName, playerGender)
    mytype = 'ems'
    data = {["code"] = '[112]', ["loc"] = streetName}
    length = 5500

    TriggerClientEvent('nrrp_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('nrrp_outlawalert:drugSellingInProgress', -1, targetCoords)
end, false)

RegisterServerEvent('nrrp_outlawalert:houseRobberyInProgress')
AddEventHandler('nrrp_outlawalert:houseRobberyInProgress', function(targetCoords, streetName, playerGender)
    mytype = 'ems'
    data = {["code"] = '[112]', ["loc"] = streetName}
    length = 5500

    TriggerClientEvent('nrrp_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('nrrp_outlawalert:houseRobberyInProgress', -1, targetCoords)
end, false)

RegisterServerEvent('nrrp_outlawalert:bpalert')
AddEventHandler('nrrp_outlawalert:bpalert', function(targetCoords, streetName)
    mytype = 'officer-down'
    data = {
        ["code"] = 'PSP', 
        ["name"] = '[BUTÃO DE PANICO]', 
        ["loc"] = streetName,
    }

    length = 5000
    TriggerClientEvent('nrrp_outlawalert:outlawNotify2', -1, mytype, data, length)
    TriggerClientEvent('nrrp_outlawalert:bpBlip', -1, targetCoords)
end, false)


----------------------
ESX.RegisterServerCallback('nrrp_outlawalert:isVehicleOwner', function(source, cb, plate)
    local identifier = GetPlayerIdentifier(source, 0)

    MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
        ['@owner'] = identifier,
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            cb(result[1].owner == identifier)
        else
            cb(false)
        end
    end)
end)