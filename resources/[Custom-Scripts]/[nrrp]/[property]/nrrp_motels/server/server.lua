ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('nrrp_motels:cancelRental')
AddEventHandler('nrrp_motels:cancelRental', function(room)

    local src = source
    local pid = ESX.GetPlayerFromId(src)
    local playerIdent = pid.identifier

    MySQL.Sync.execute("DELETE FROM motels WHERE ident=@ident AND motel_id=@roomno", {['@ident'] = playerIdent, ['@roomno'] = room})
    

end)

RegisterServerEvent('nrrp_motels:rentRoom')
AddEventHandler('nrrp_motels:rentRoom', function(room)

    local src = source
    local pid = ESX.GetPlayerFromId(src)
    local playerIdent = pid.identifier

    MySQL.Sync.execute("INSERT INTO motels (ident, motel_id) VALUES (@ident, @roomno)", {['@ident'] = playerIdent, ['@roomno'] = room})
    

end)

ESX.RegisterServerCallback('nrrp_motels:getMotelRoomID', function(source, cb, room)
    local src = source
    local pid = ESX.GetPlayerFromId(src)
    local playerIdent = pid.identifier

    MySQL.Async.fetchScalar("SELECT id FROM motels WHERE ident=@ident AND motel_id = @room", {['@ident'] = playerIdent, ['@room'] = room}, function(rentalID)
        if rentalID ~= nil then
            cb(rentalID)
        else
            cb(false)
        end
    end)

end)

ESX.RegisterServerCallback('nrrp_motels:checkOwnership', function(source, cb)
    local src = source
    local pid = ESX.GetPlayerFromId(src)

    if pid ~= nil then
        local playerIdent = pid.identifier

        MySQL.Async.fetchScalar("SELECT motel_id FROM motels WHERE ident = @ident", {['@ident'] = playerIdent}, function(motelRoom)
            if motelRoom ~= nil then
				cb(motelRoom)
            else
				cb(false)
            end
        end)
    end

end)


RegisterServerEvent('nrrp_motels:getItem')
AddEventHandler('nrrp_motels:getItem', function(owner, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then
		local sourceItem = xPlayer.getInventoryItem(item)

		TriggerEvent('esx_addoninventory:getInventory', 'motels', xPlayerOwner.identifier, function(inventory)
			local inventoryItem = inventory.getItem(item)

			-- is there enough in the property?
			if count > 0 and inventoryItem.count >= count then
			
				-- can the player carry the said amount of x item?
				if not xPlayer.canCarryItem(item, sourceItem.count) then
					TriggerClientEvent('esx:showNotification', _source, _U('player_cannot_hold'))
				else
					inventory.removeItem(item, count)
					xPlayer.addInventoryItem(item, count)
					TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
				end
			else
				TriggerClientEvent('esx:showNotification', _source, _U('not_enough_in_property'))
			end
		end)
	elseif type == 'item_account' then
		TriggerEvent('esx_addonaccount:getAccount', 'motels_' .. item, xPlayerOwner.identifier, function(account)
			local roomAccountMoney = account.money

			if roomAccountMoney >= count then
				account.removeMoney(count)
				xPlayer.addAccountMoney(item, count)
			else
				TriggerClientEvent('esx:showNotification', _source, _U('amount_invalid'))
			end
		end)
	elseif type == 'item_weapon' then
		TriggerEvent('esx_datastore:getDataStore', 'motels', xPlayerOwner.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}
			local weaponName   = nil
			local ammo         = nil

			for i=1, #storeWeapons, 1 do
				if storeWeapons[i].name == item then
					weaponName = storeWeapons[i].name
					ammo       = storeWeapons[i].ammo

					table.remove(storeWeapons, i)
					break
				end
			end

			store.set('weapons', storeWeapons)
			xPlayer.addWeapon(weaponName, ammo)
		end)
	end
end)

RegisterServerEvent('nrrp_motels:putItem')
AddEventHandler('nrrp_motels:putItem', function(owner, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then
		local playerItemCount = xPlayer.getInventoryItem(item).count

		if playerItemCount >= count and count > 0 then
			TriggerEvent('esx_addoninventory:getInventory', 'motels', xPlayerOwner.identifier, function(inventory)
				xPlayer.removeInventoryItem(item, count)
				inventory.addItem(item, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_deposited', count, inventory.getItem(item).label))
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_quantity'))
		end
	elseif type == 'item_account' then

		local playerAccountMoney = xPlayer.getAccount(item).money

		if playerAccountMoney >= count and count > 0 then
			xPlayer.removeAccountMoney(item, count)

			TriggerEvent('esx_addonaccount:getAccount', 'motels_' .. item, xPlayerOwner.identifier, function(account)
				account.addMoney(count)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('amount_invalid'))
		end
	elseif type == 'item_weapon' then
		TriggerEvent('esx_datastore:getDataStore', 'motels', xPlayerOwner.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}

			table.insert(storeWeapons, {
				name = item,
				ammo = count
			})

			store.set('weapons', storeWeapons)
			xPlayer.removeWeapon(item)
		end)
	end
end)

ESX.RegisterServerCallback('nrrp_motels:getPropertyInventory', function(source, cb, owner)
	local xPlayer    = ESX.GetPlayerFromIdentifier(owner)
	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getAccount', 'motels_black_money', xPlayer.identifier, function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_addoninventory:getInventory', 'motels', xPlayer.identifier, function(inventory)
		items = inventory.items
	end)

	TriggerEvent('esx_datastore:getDataStore', 'motels', xPlayer.identifier, function(store)
		weapons = store.get('weapons') or {}
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)

ESX.RegisterServerCallback('nrrp_motels:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local items      = xPlayer.inventory

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = xPlayer.getLoadout()
	})
end)

RegisterServerEvent('nrrp_motels:getItemBed')
AddEventHandler('nrrp_motels:getItemBed', function(owner, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then
		local sourceItem = xPlayer.getInventoryItem(item)

		TriggerEvent('esx_addoninventory:getInventory', 'motels_bed', xPlayerOwner.identifier, function(inventory)
			local inventoryItem = inventory.getItem(item)

			-- is there enough in the property?
			if count > 0 and inventoryItem.count >= count then
			
				-- can the player carry the said amount of x item?
				if not xPlayer.canCarryItem(item, sourceItem.count) then
					TriggerClientEvent('esx:showNotification', _source, _U('player_cannot_hold'))
				else
					inventory.removeItem(item, count)
					xPlayer.addInventoryItem(item, count)
					TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
				end
			else
				TriggerClientEvent('esx:showNotification', _source, _U('not_enough_in_property'))
			end
		end)
	elseif type == 'item_account' then
		TriggerEvent('esx_addonaccount:getAccount', 'motels_bed_' .. item, xPlayerOwner.identifier, function(account)
			local roomAccountMoney = account.money

			if roomAccountMoney >= count then
				account.removeMoney(count)
				xPlayer.addAccountMoney(item, count)
			else
				TriggerClientEvent('esx:showNotification', _source, _U('amount_invalid'))
			end
		end)
	elseif type == 'item_weapon' then
		TriggerEvent('esx_datastore:getDataStore', 'motels_bed', xPlayerOwner.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}
			local weaponName   = nil
			local ammo         = nil

			for i=1, #storeWeapons, 1 do
				if storeWeapons[i].name == item then
					weaponName = storeWeapons[i].name
					ammo       = storeWeapons[i].ammo

					table.remove(storeWeapons, i)
					break
				end
			end

			store.set('weapons', storeWeapons)
			xPlayer.addWeapon(weaponName, ammo)
		end)
	end
end)

RegisterServerEvent('nrrp_motels:putItemBed')
AddEventHandler('nrrp_motels:putItemBed', function(owner, type, item, count)
	local _source      = source
	local xPlayer      = ESX.GetPlayerFromId(_source)
	local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

	if type == 'item_standard' then
		local playerItemCount = xPlayer.getInventoryItem(item).count

		if playerItemCount >= count and count > 0 then
			TriggerEvent('esx_addoninventory:getInventory', 'motels_bed', xPlayerOwner.identifier, function(inventory)
				xPlayer.removeInventoryItem(item, count)
				inventory.addItem(item, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_deposited', count, inventory.getItem(item).label))
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('invalid_quantity'))
		end
	elseif type == 'item_account' then
		local playerAccountMoney = xPlayer.getAccount(item).money

		if playerAccountMoney >= count and count > 0 then
			xPlayer.removeAccountMoney(item, count)

			TriggerEvent('esx_addonaccount:getAccount', 'motels_bed_' .. item, xPlayerOwner.identifier, function(account)
				account.addMoney(count)
			end)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('amount_invalid'))
		end
	elseif type == 'item_weapon' then
		TriggerEvent('esx_datastore:getDataStore', 'motels_bed', xPlayerOwner.identifier, function(store)
			local storeWeapons = store.get('weapons') or {}

			table.insert(storeWeapons, {
				name = item,
				ammo = count
			})

			store.set('weapons', storeWeapons)
			xPlayer.removeWeapon(item)
		end)
	end
end)

ESX.RegisterServerCallback('nrrp_motels:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'housing', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('nrrp_motels:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'housing', xPlayer.identifier, function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)

RegisterServerEvent('nrrp_motels:removeOutfit')
AddEventHandler('nrrp_motels:removeOutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'housing', xPlayer.identifier, function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

ESX.RegisterServerCallback('nrrp_motels:checkIsOwner', function(source, cb, room, owner)
    local xPlayer    = ESX.GetPlayerFromIdentifier(owner)

    MySQL.Async.fetchScalar("SELECT motel_id FROM motels WHERE motel_id = @room AND ident = @id", {
        ['@room'] = room,
        ['@id'] = xPlayer.identifier
     }, function(isOwner)

        if isOwner ~= nil then
            cb(true)
        else
            cb(false)
        end

    end)

end)

ESX.RegisterServerCallback('nrrp_motels:getPropertyInventoryBed', function(source, cb, owner)
	local xPlayer    = ESX.GetPlayerFromIdentifier(owner)
	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getAccount', 'motels_bed_black_money', xPlayer.identifier, function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_addoninventory:getInventory', 'motels_bed', xPlayer.identifier, function(inventory)
		items = inventory.items
	end)

	TriggerEvent('esx_datastore:getDataStore', 'motels_bed', xPlayer.identifier, function(store)
		weapons = store.get('weapons') or {}
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)

ESX.RegisterServerCallback('nrrp_motels:getPlayerInventoryBed', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local items      = xPlayer.inventory

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = xPlayer.getLoadout()
	})
end)

function payRent(d, h, m)
	local tasks, timeStart = {}, os.clock()
	print('[nrrp_motels] [^2INFO^7] Paying rent cron job started')

	MySQL.Async.fetchAll('SELECT * FROM motels', {}, function(result)
		for k,v in ipairs(result) do
			table.insert(tasks, function(cb)
				local xPlayer = ESX.GetPlayerFromIdentifier(v.owner)

				if xPlayer then
					if xPlayer.getAccount('bank').money >= Config.PriceRental then
						xPlayer.removeAccountMoney('bank', Config.PriceRental)
						TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'O aluguer do hotel foi cobrado. Quantidade: '..ESX.Math.GroupDigits(Config.PriceRental)..'€', length = 8000})
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Por favor arranja dinheiro para pagares a renda do motel', length = 8000})
					end
				else
					MySQL.Async.fetchScalar('SELECT accounts FROM users WHERE identifier = @identifier', {
						['@identifier'] = v.owner
					}, function(accounts)
						if accounts then
							local playerAccounts = json.decode(accounts)

							if playerAccounts and playerAccounts.bank then
								if playerAccounts.bank >= Config.PriceRental then
									playerAccounts.bank = playerAccounts.bank - Config.PriceRental

									MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE identifier = @identifier', {
										['@identifier'] = v.owner,
										['@accounts'] = json.encode(playerAccounts)
									})
								else
									TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Por favor arranja dinheiro para pagares a renda do motel', length = 8000})
								end
							end
						end
					end)
				end

				cb()
			end)
		end

		Async.parallelLimit(tasks, 5, function(results) end)

		local elapsedTime = os.clock() - timeStart
		print(('[nrrp_motels] [^2INFO^7] Paying rent cron job took %s seconds'):format(elapsedTime))
	end)
end

TriggerEvent('cron:runAt', 20, 0, PayRent)


