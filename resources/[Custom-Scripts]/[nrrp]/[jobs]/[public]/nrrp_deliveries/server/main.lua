ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Register events
RegisterServerEvent('nrrp_deliveries:returnSafe:server')
RegisterServerEvent('nrrp_deliveries:finishDelivery:server')
RegisterServerEvent('nrrp_deliveries:removeSafeMoney:server')
RegisterServerEvent('nrrp_deliveries:getPlayerJob:server')

-- Return safe deposit event
AddEventHandler('nrrp_deliveries:returnSafe:server', function(deliveryType, safeReturn)
	_source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if safeReturn then
		local SafeMoney = 2000
		for k, v in pairs(Config.Safe) do
			if k == deliveryType then
				SafeMoney = v
				break
			end
		end
		xPlayer.addAccountMoney("bank", SafeMoney)
		xPlayer.showNotification(Config.Locales["safe_deposit_returned"])
	else
		xPlayer.showNotification(Config.Locales["safe_deposit_withheld"])
	end
end)

-- Finish delivery mission event
AddEventHandler('nrrp_deliveries:finishDelivery:server', function(deliveryType)
	_source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local deliveryMoney = 200
	for k, v in pairs(Config.Rewards) do
		if k == deliveryType then
			deliveryMoney = v
			break
		end
	end
    xPlayer.addMoney(deliveryMoney)
	xPlayer.showNotification(Config.Locales["delivery_point_reward"] .. tostring(deliveryMoney))
end)

-- Remove safe deposit event (On start mission)
AddEventHandler('nrrp_deliveries:removeSafeMoney:server', function(deliveryType)
	_source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local SafeMoney = 2000
	for k, v in pairs(Config.Safe) do
		if k == deliveryType then
			SafeMoney = v
			break
		end
	end
	
	local PlayerMoney = xPlayer.getAccount('bank').money
	if PlayerMoney >= SafeMoney then
		xPlayer.removeAccountMoney("bank", SafeMoney)
		xPlayer.showNotification(Config.Locales["safe_deposit_received"])
		TriggerClientEvent('nrrp_deliveries:startJob:client', source, deliveryType)
	else
		xPlayer.showNotification(Config.Locales["not_enough_money"])
	end
end)

-- Get the player job name
AddEventHandler('nrrp_deliveries:getPlayerJob:server', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		TriggerClientEvent('nrrp_deliveries:setPlayerJob:client', source, xPlayer.job.name)
	end
end)
