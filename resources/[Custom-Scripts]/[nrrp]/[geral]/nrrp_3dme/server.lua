RegisterServerEvent('nnrp_3dme:shareDisplay')
AddEventHandler('nnrp_3dme:shareDisplay', function(text)
	TriggerClientEvent('nnrp_3dme:triggerDisplay', -1, text, source)
end)

RegisterNetEvent('staticAction:server:actionCommand')
AddEventHandler('staticAction:server:actionCommand', function(coords, args, name)
    TriggerClientEvent('staticAction:client:actionCommand', -1, coords, args, name)
end)

RegisterNetEvent('staticAction:server:ractionCommand')
AddEventHandler('staticAction:server:ractionCommand', function(source, args)
    TriggerClientEvent('staticAction:client:ractionCommand', -1, source, args)
end)
