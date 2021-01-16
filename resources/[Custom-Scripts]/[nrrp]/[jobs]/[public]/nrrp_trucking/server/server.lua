ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--
-- Functions
--

function getMoney(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local money = xPlayer.getMoney()
	
	return money
end

function addMoney(playerId, amount)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addMoney(amount)
	
	return true
end

function removeMoney(playerId, amount)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.removeMoney(amount)
	
	return true
end

--
-- Events
--

RegisterNetEvent('nrrp_trucking:loadDelivered')
AddEventHandler('nrrp_trucking:loadDelivered', function(totalRouteDistance)
	local playerId = source
	local payout   = math.floor(totalRouteDistance * Config.PayPerMeter)

	addMoney(playerId, payout)

	TriggerClientEvent('nrrp_trucking:helper:showNotification', playerId, 'Recebeste ~g~' .. payout .. '~s~ € de comissão por seres camionista.')
end)

RegisterNetEvent('nrrp_trucking:rentTruck')
AddEventHandler('nrrp_trucking:rentTruck', function()
	local playerId = source

	if getMoney(playerId) < Config.TruckRentalPrice then
		TriggerClientEvent('nrrp_trucking:helper:showNotification', playerId, 'Não tens dinheiro suficiente para alugar um camião.')
		return
	end

	removeMoney(playerId, Config.TruckRentalPrice)

	TriggerClientEvent('nrrp_trucking:startJob', playerId)
end)

RegisterNetEvent('nrrp_trucking:returnTruck')
AddEventHandler('nrrp_trucking:returnTruck', function()
	local playerId = source

	addMoney(playerId, Config.TruckRentalPrice)

	TriggerClientEvent('nrrp_trucking:helper:showNotification', playerId, 'O teu depósito de' .. Config.TruckRentalPrice .. ' € foi devolvido.')
end)