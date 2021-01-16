ESX = nil
local cachedData = {}
local cars = {}

TriggerEvent("esx:getSharedObject", function(library) 
	ESX = library 
end)

ESX.RegisterServerCallback("nrrp_garage:obtenerVehiculos", function(source, callback)
	local player = ESX.GetPlayerFromId(source)

	if player then
		local sqlQuery = [[
			SELECT
				plate, vehicle
			FROM
				owned_vehicles
			WHERE
				owner = @cid
		]]

		MySQL.Async.fetchAll(sqlQuery, {
			["@cid"] = player["identifier"]
		}, function(responses)
			getPlayerVehiclesOut(player.identifier ,function(data)
				enviar = {responses,data}
				callback(enviar)
			end)
		end)
	else
		callback(false)
	end
end)

function getPlayerVehiclesOut(identifier,cb)
	local vehicles = {}
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = identifier})	
	cb(data)
end

ESX.RegisterServerCallback("nrrp_garage:validateVehicle", function(source, callback, vehicleProps)
	local player = ESX.GetPlayerFromId(source)

	if player then
		local sqlQuery = [[
			SELECT
				owner
			FROM
				owned_vehicles
			WHERE
				plate = @plate
		]]

		MySQL.Async.fetchAll(sqlQuery, {
			["@plate"] = vehicleProps["plate"]
		}, function(responses)
			if responses[1] then
				callback(true)
			else
				callback(false)
			end
		end)
	else
		callback(false)
	end
end)

RegisterServerEvent('nrrp_garage:modifystate')
AddEventHandler('nrrp_garage:modifystate', function(vehicleProps, stored)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local plate = vehicleProps.plate

	MySQL.Sync.execute("UPDATE owned_vehicles SET vehicle=@vehicle WHERE plate=@plate",{['@vehicle'] = json.encode(vehicleProps) , ['@plate'] = plate})
	MySQL.Sync.execute("UPDATE owned_vehicles SET stored=@stored WHERE plate=@plate",{['@stored'] = stored , ['@plate'] = plate})
end)

-----------------------------------------
--=====================================--
--============Sell Car=================--
--=====================================--
-----------------------------------------
ESX.RegisterServerCallback('nrrp_olxdoscarros:requestPlayerCars', function(source, cb, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = identifier,
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(result[1].owner == identifier)
		else
			cb(false)
		end
	end)
end)

function setVehicleOwner(source,plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = xPlayer.identifier

	MySQL.Async.execute('UPDATE owned_vehicles SET owner=@owner WHERE plate=@plate',
	{
		['@owner']   = identifier,
		['@plate']   = plate
	},
	function (rowsChanged)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Compraste o carro com a matrícula ~g~' ..plate..'!', length = 4000})
	end) 
end

RegisterCommand('vendercarro', function(source, args, raw)
    TriggerClientEvent('nrrp_olxdoscarros:Dar', source)
end)

RegisterServerEvent('nrrp_olxdoscarros:proposta')
AddEventHandler('nrrp_olxdoscarros:proposta', function (player,plate,preco)
	TriggerClientEvent("nrrp_olxdoscarros:aceitarproposta",player,source,plate,preco)
end)
RegisterServerEvent('nrrp_olxdoscarros:respostas')
AddEventHandler('nrrp_olxdoscarros:respostas', function (vendedor,resposta,preco,plate)
	if resposta then
		local xPlayer = ESX.GetPlayerFromId(source)
		local xPlayerVendedor = ESX.GetPlayerFromId(vendedor)
		if xPlayer.getMoney() >= preco then
			setVehicleOwner(source,plate)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Proposta de venda do veículo com a matrícula ~b~' .. plate .. '~g~Aceite!', length = 4000})
			xPlayer.removeMoney(preco)
			xPlayerVendedor.addMoney(preco)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Não tens dinheiro suficiente!', length = 2000})
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Proposta de venda do veículo com a matrícula ~b~' .. plate .. '~r~Recusada!', length = 4000})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Proposta de venda do veículo com a matrícula ~b~' .. plate .. '~r~Recusada!', length = 4000})
	end
end)
-----------------------------------------
--=====================================--
--===========Return Cars===============--
--=====================================--
-----------------------------------------
MySQL.ready(function()
  ReturnCarsJobs()
  ReturnCars()
end)

function ReturnCars()
  MySQL.Async.execute('UPDATE `owned_vehicles` SET `stored`=true WHERE `stored`=@stored', {
    ['@stored'] = false
  }, function (rowsChanged)
    if rowsChanged > 0 then
      print(('^2[nrrp_garage]^7 %s vehicle(s) have been returned to their garage!'):format(rowsChanged))
    else
    	print('^2[nrrp_garage]^7 0 vehicles have been returned to their garage! (their are already in their garage)')
    end
  end)
end

function ReturnCarsJobs()
  MySQL.Async.execute('UPDATE `owned_vehicles_jobs` SET `stored` = true WHERE `stored` = @stored', {
    ['@stored'] = false
  }, function (rowsChanged)
    if rowsChanged > 0 then
      print(('^2[nrrp_garage]^7 %s jobs vehicle(s) have been returned to their garage!'):format(rowsChanged))
    else
    	print('^2[nrrp_garage]^7 0 job vehicles have been returned to their garage! (their are already in their garage)')
    end
  end)
end

function all_trim(s)
	return s:match( "^%s*(.-)%s*$" )
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
  end