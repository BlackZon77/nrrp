ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function MarketGetItem (accountId, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll([===[
      SELECT *
      FROM phone_shops
      ]===], {}, cb)
  end 


RegisterServerEvent('gcPhone:market_getItem')
AddEventHandler('gcPhone:market_getItem', function(phone_number, firstname)
  local sourcePlayer = tonumber(source)
    MarketGetItem(nil, function (markets)
      TriggerClientEvent('gcPhone:market_getItem', sourcePlayer, markets)
    end)
end)

RegisterServerEvent('gcPhone:buyMarket')
AddEventHandler('gcPhone:buyMarket', function(itemName, amount, price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	amount = ESX.Math.Round(amount)

	-- is the player trying to exploit?
	if amount < 0 then
		print('gcPhone: ' .. xPlayer.identifier .. ' attempted to exploit the shop!')
		return
	end

	-- get price
	local itemLabel = ''
	price = price * amount

	-- can the player afford this item?
	if xPlayer.getAccount('bank').money >= price then
		-- can the player carry the said amount of x item?
		if xPlayer.canCarryItem(sourceItem.name, sourceItem.count) then
			TriggerClientEvent('esx:showNotification', _source, "Não tens espaço suficiente no teu inventário!")
		else
			xPlayer.removeAccountMoney('bank', price)
            local time = 10 -- 10 seconds
            while (time ~= 0) do -- Whist we have time to wait
               Wait( 1000 ) -- Wait a second
               time = time - 1
		       TriggerClientEvent('esx:showNotification', _source, "Tempo restante " .. time)
               -- 1 Second should have past by now
            end
			xPlayer.addInventoryItem(itemName, amount)
			TriggerClientEvent('esx:showNotification', _source, "Compraste por" .. price .. " um/uma " .. itemName .. ".")
		end
	else
		local missingMoney = price - xPlayer.getAccount('bank').money
		TriggerClientEvent('esx:showNotification', _source, "Não tens dinheiro suficiente, falta-te" .. missingMoney .. "€~s~!")
	end
end)
