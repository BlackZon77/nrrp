ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('nrrp_skinshop:saveOutfit')
AddEventHandler('nrrp_skinshop:saveOutfit', function(label, skin)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	TriggerEvent('esx_datastore:getDataStore', 'housing', identifier, function(store)
		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		table.insert(dressing, {
			label = label,
			skin  = skin
		})

		store.set('dressing', dressing)
		store.save()
	end)
end)

ESX.RegisterServerCallback('nrrp_skinshop:buyClothes', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	
	if xPlayer.getMoney() >= Config.Price then
		xPlayer.removeMoney(Config.Price)
		TriggerClientEvent('esx:showNotification', source, _U('you_paid', Config.Price))
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('nrrp_skinshop:checkPropertyDataStore', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier
	local foundStore = false

	TriggerEvent('esx_datastore:getDataStore', 'housing', identifier, function(store)
		foundStore = true
	end)

	cb(foundStore)
end)

ESX.RegisterServerCallback('nrrp_skinshop:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	TriggerEvent('esx_datastore:getDataStore', 'housing', identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('nrrp_skinshop:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	TriggerEvent('esx_datastore:getDataStore', 'housing', identifier, function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)

RegisterServerEvent('nrrp_skinshop:removeOutfit')
AddEventHandler('nrrp_skinshop:removeOutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	TriggerEvent('esx_datastore:getDataStore', 'housing', identifier, function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)