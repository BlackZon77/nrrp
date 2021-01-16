ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- RegisterServerEvent('nrrp_notify:admNotifyCheck')
-- AddEventHandler('nrrp_notify:admNotifyCheck', function(args)
	
	-- local xPlayer = ESX.GetPlayerFromId(source)
	-- if (xPlayer.getGroup() == 'admin') or (xPlayer.getGroup() == 'superadmin') then
		-- TriggerEvent('nrrp_notify:adminNotifyAllPlayers', args, 'adm')
	-- end
-- end)

-- RegisterServerEvent('nrrp_notify:adminNotifyAllPlayers')
-- AddEventHandler('nrrp_notify:adminNotifyAllPlayers', function(args, tipo)
	-- local xPlayers = ESX.GetPlayers()
	-- for i=1, #xPlayers, 1 do
		-- TriggerClientEvent('nrrp_notify:client:Notify', xPlayers[i], {type = tipo, text = args})
	-- end
	
-- end)