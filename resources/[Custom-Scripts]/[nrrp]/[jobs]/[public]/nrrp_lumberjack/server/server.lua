ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('nrrp_lumberjack:doymadera')
AddEventHandler('nrrp_lumberjack:doymadera', function(madera)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)	
	xPlayer.addInventoryItem(madera, 1)
end)

RegisterServerEvent('nrrp_lumberjack:recibodata')
AddEventHandler('nrrp_lumberjack:recibodata',function(data)
	maderas = data
	TriggerClientEvent('nrrp_lumberjack:recibodatacliente',-1,data)
end)

RegisterServerEvent('nrrp_lumberjack:getJob')
AddEventHandler('nrrp_lumberjack:getJob',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayers[i] == source then
			TriggerClientEvent('nrrp_lumberjack:setJob',xPlayers[i],xPlayer.job.name)
		end
	end
end)

RegisterServerEvent('nrrp_lumberjack:quitomad')
AddEventHandler('nrrp_lumberjack:quitomad',function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	for i = 1, #xPlayer.inventory,1 do
		if xPlayer.inventory[i].name == "maderag" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(4,6))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
			end
		elseif xPlayer.inventory[i].name == "maderam" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(3,5))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
			end
		elseif xPlayer.inventory[i].name == "maderaf" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(2,4))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
			end
		elseif xPlayer.inventory[i].name == "madera" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(2,3))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
			end
		end
	end
end)

function recamaderas()
	for i=1, #maderas, 1 do
		if maderas[i].vida < maderas[i].max then
			maderas[i].vida = maderas[i].vida + 1
		end
	end

	TriggerClientEvent('nrrp_lumberjack:recibodatacliente',-1,maderas)
end

function loop()
	Citizen.CreateThread(function()
		while true do
			recamaderas()
			Citizen.Wait(30000)
		end
	end)
end
loop()



