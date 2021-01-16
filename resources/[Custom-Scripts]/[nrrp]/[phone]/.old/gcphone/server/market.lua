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
		print('gcphone: ' .. xPlayer.identifier .. ' is trying to exploit market..', itemName, amount, price)
		return
	end

	-- get price
	local itemLabel = ''

	price = price * amount

	-- can the player afford this item?
	if xPlayer.getBank() >= price then
		-- can the player carry the said amount of x item?
		-- if sourceItem.weight ~= -1 and (sourceItem.count + amount) > sourceItem.weight then
		if (sourceItem.count + amount) > sourceItem.limit then
			TriggerClientEvent('esx:showNotification', _source, "Não tens espaço suficiente!")
		else
			xPlayer.removeAccountMoney('bank', price)
			xPlayer.addInventoryItem(itemName, amount)
			TriggerClientEvent('esx:showNotification', _source, "Fatura de: " .. price .. " € ")
		end
	else
		local missingMoney = price - xPlayer.getBank()
		TriggerClientEvent('esx:showNotification', _source, "Não tens dinheiro suficiente, em falta" .. missingMoney .. "€~s~!")
	end
end)

