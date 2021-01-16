ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('nrrp_chopshop:success')
AddEventHandler('nrrp_chopshop:success', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addMoney(math.random(10,35))
end)
