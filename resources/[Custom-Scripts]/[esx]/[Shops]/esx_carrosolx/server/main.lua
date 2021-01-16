ESX               = nil
local cars 		  = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_carrosolx:requestPlayerCars', function(source, cb, plate)

	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE owner = @identifier', 
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)
			local found = false
			for i=1, #result, 1 do	
				if result[i].plate .. " " == plate then
					found = true
					break
				end

			end
			if found then
				cb(true)
			else
				cb(false)
			end

		end
	)
end)

function setVehicleOwner(source,plate)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET owner=@owner WHERE plate=@plate',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = plate
	},
	function (rowsChanged)
		TriggerClientEvent('esx:showNotification', source, 'Compraste o carro com a matrícula ~g~' ..plate..'!')
	end) 
end

TriggerEvent('es:addGroupCommand', 'vendercarro', 'user', function(source, args, user)
	TriggerClientEvent('esx_carrosolx:Dar', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { 'ERRO' } })
end)
RegisterServerEvent('esx_carrosolx:proposta')
AddEventHandler('esx_carrosolx:proposta', function (player,plate,preco)
	TriggerClientEvent("esx_carrosolx:aceitarproposta",player,source,plate,preco)
end)
RegisterServerEvent('esx_carrosolx:respostas')
AddEventHandler('esx_carrosolx:respostas', function (vendedor,resposta,preco,plate)
	if resposta then
		local xPlayer = ESX.GetPlayerFromId(source)
		local xPlayerVendedor = ESX.GetPlayerFromId(vendedor)
		if xPlayer.getMoney() >= preco then
			setVehicleOwner(source,plate)
			TriggerClientEvent('esx:showNotification', vendedor, 'Proposta de venda do veículo com a matrícula ~b~' .. plate .. '~g~Aceite!')
			xPlayer.removeMoney(preco)
			xPlayerVendedor.addMoney(preco)
		else
			TriggerClientEvent('esx:showNotification', source, 'Não tens dinheiro suficiente!')
			TriggerClientEvent('esx:showNotification', vendedor, 'Proposta de venda do veículo com a matrícula ~b~' .. plate .. '~r~Recusada!')
		end
	else
		TriggerClientEvent('esx:showNotification', vendedor, 'Proposta de venda do veículo com a matrícula ~b~' .. plate .. '~r~Recusada!')
	end
end)