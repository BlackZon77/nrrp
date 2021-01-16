NRRP.ExtraItems = {}
local NRRPEI = NRRP.ExtraItems
NRRPEI.ESX = NRRP.ESX

ESX.RegisterUsableItem('binoculars', function(source)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('NRRPEI:binoculars:Activate', _source)
end)

ESX.RegisterUsableItem('cigarett', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local lighter = xPlayer.getInventoryItem('lighter')

		if lighter.count > 0 then
			xPlayer.removeInventoryItem('cigarett', 1)
			TriggerClientEvent('NRRP:cigarett:startSmoke', source)
		else
			TriggerClientEvent('esx:showNotification', source, ('Estás a fumar um ~r~cigarro'))
		end
end)

