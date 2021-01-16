local vehiclesKHM = {}

Citizen.CreateThread(function()
    local loadFile = LoadResourceFile(GetCurrentResourceName(), "vehicles.json")
    vehiclesKHM = json.decode(loadFile)

end)


RegisterServerEvent("nrrp-hud:server:vehiclesKHM")
AddEventHandler("nrrp-hud:server:vehiclesKHM", function(plate,kmh)
    if plate and kmh and type(vehiclesKHM) == 'table' then
        vehiclesKHM[plate] = kmh
        SaveResourceFile(GetCurrentResourceName(), "vehicles.json", json.encode(vehiclesKHM), -1)
        TriggerClientEvent("nrrp-hud:client:vehiclesKHM", -1, plate,kmh)
    end
end)

RegisterServerEvent("nrrp-hud:server:requestTable")
AddEventHandler("nrrp-hud:server:requestTable", function()
    TriggerClientEvent("nrrp-hud:client:vehiclesKHMTable", source, vehiclesKHM)
end)