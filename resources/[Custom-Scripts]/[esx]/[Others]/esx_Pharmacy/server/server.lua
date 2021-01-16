ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx:Farmacia')
AddEventHandler('esx:Farmacia', function(item, price, amount)
	 local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
		account.addMoney(price)
		end)
		if xPlayer.getMoney() >= price then
			
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(item, amount)
			TriggerClientEvent('esx:showNotification', _source, "~g~Obrigado pela sua visita, volte sempre!" )
		else
			TriggerClientEvent('esx:showNotification', _source, "~s~Não tens dinheiro suficiente")

		end
end)

--[[
]]
