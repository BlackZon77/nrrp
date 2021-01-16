NRRP = {}

TriggerEvent('esx:getSharedObject', function(obj) NRRP.ESX = obj; ESX = obj; end)
AddEventHandler('onMySQLReady', function(...) NRRP.SQLReady = true; end)

NRRP.Testing = true

Citizen.CreateThread(function(...)
	while not ESX or not NRRP.ESX do 
		Citizen.Wait(100)
		TriggerEvent('esx:getSharedObject', function(obj) NRRP.ESX = obj; ESX = obj; end)
	end

	if NRRP.Testing then 
		Citizen.Wait(3000)
		if not NRRP.SQLReady then NRRP.SQLReady = true; end
	end
end)
