-- FiveM Heli Cam by mraes
-- Version 1.3 2017-06-12

RegisterServerEvent('nrrp_rapel:spotlight')
AddEventHandler('nrrp_rapel:spotlight', function(state)
	local serverID = source
	TriggerClientEvent('nrrp_rapel:spotlight', -1, serverID, state)
end)