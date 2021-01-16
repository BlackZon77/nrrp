ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Make the kit usable!
ESX.RegisterUsableItem('repairkit', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if Config.AllowMecano then
		TriggerClientEvent('esx_repairkit:onUse', _source)
	else
		if xPlayer.job.name ~= 'mechanic' then
			TriggerClientEvent('esx_repairkit:onUse', _source)
		end
	end
end)

ESX.RegisterUsableItem('tyrekit', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if Config.AllowMecano then
		TriggerClientEvent('tyrekit:onUse', _source)
	else
		if xPlayer.job.name ~= 'mechanic' then
			TriggerClientEvent('tyrekit:onUse', _source)
		end
	end
end)

RegisterNetEvent('esx_repairkit:removeTyreKit')
AddEventHandler('esx_repairkit:removeTyreKit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if not Config.InfiniteRepairsTyreKit then
		xPlayer.removeInventoryItem('tyrekit', 1)
		TriggerClientEvent(_U('used_tyrekit'))
	end
end)

RegisterNetEvent('esx_repairkit:removeKit')
AddEventHandler('esx_repairkit:removeKit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if not Config.InfiniteRepairs then
		xPlayer.removeInventoryItem('repairkit', 1)
		TriggerClientEvent(_U('used_kit'))
	end
end)

function MecanoOnline()

	local xPlayers = ESX.GetPlayers()

	MechanicConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'mechanic' then
			MechanicConnected = MechanicConnected + 1
		end
	end

	SetTimeout(10000, MecanoOnline)

end

MecanoOnline()

RegisterServerEvent('jobonline:get')
AddEventHandler('jobonline:get', function()
	local counted = {}

	counted['mechanic'] = MechanicConnected

	TriggerClientEvent('jobonline:set', source, counted)
end)
