_ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) _ESX = obj end)

-- Allowed to reset during server restart
-- You can use this number to calculate a vehicle spawn location index if you have multiple
-- eg: 3 spawnlocations = index % 3 + 1
local _UnimpoundedVehicleCount = 1;

RegisterServerEvent('NRRP:Apreendidos:ImpoundVehicle')
RegisterServerEvent('NRRP:Apreendidos:GetImpoundedVehicles')
RegisterServerEvent('NRRP:Apreendidos:GetVehicles')
RegisterServerEvent('NRRP:Apreendidos:UnimpoundVehicle')

AddEventHandler('NRRP:Apreendidos:ImpoundVehicle', function (form)
	Citizen.Trace("[nrrp_apreendidos] [^2INFO^7] Apreender veículo com a matrícula: " .. form.plate);
	_source = source;
	MySQL.Async.execute('INSERT INTO `impound` VALUES (@plate, @officer, @mechanic, @releasedate, @fee, @reason, @notes, CONCAT(@vehicle), @identifier)',
		{
			['@plate'] 			= form.plate,
			['@officer']     	= form.officer,
			['@mechanic']       = form.mechanic,
			['@releasedate']	= form.releasedate,
			['@fee']			= form.fee,
			['@reason']			= form.reason,
			['@notes']			= form.notes,
			['@vehicle']		= form.vehicle,
			['@identifier']		= form.identifier
		}, function(rowsChanged)
			if (rowsChanged == 0) then
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Não foi possivel apreender ', length = 4000})
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'success', text = 'Veículo apreendido ', length = 4000})
			end
	end)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate', {
		['@stored'] = 2,
		['@plate'] = form.plate
	}, function(rowsChanged)
	end)
end)

AddEventHandler('NRRP:Apreendidos:GetImpoundedVehicles', function (identifier)
	_source = source;
	MySQL.Async.fetchAll('SELECT * FROM `impound` WHERE `identifier` = @identifier ORDER BY `releasedate`',
		{
			['@identifier'] = identifier,
		}, function (impoundedVehicles)
			TriggerClientEvent('NRRP:Apreendidos:SetImpoundedVehicles', _source, impoundedVehicles)
	end)
end)

AddEventHandler('NRRP:Apreendidos:UnimpoundVehicle', function (plate)
	_source = source;
	xPlayer = _ESX.GetPlayerFromId(_source)

	_UnimpoundedVehicleCount = _UnimpoundedVehicleCount + 1;

	Citizen.Trace('[nrrp_apreendidos] [^2INFO^7] Libertar carro dos apreendidos com a matrícula: ' .. plate);

	local veh = MySQL.Sync.fetchAll('SELECT * FROM `impound` WHERE `plate` = @plate',
	{
		['@plate'] = plate,
	})

	if(veh == nil) then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'O teu veículo não pode ser libertado, tens dinheiro suficiente? ', length = 4000})
		return
	end

	if (xPlayer.getMoney() < veh[1].fee) then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'O teu veículo não pode ser libertado, tens dinheiro suficiente? ', length = 4000})
	else
		xPlayer.removeMoney(round(veh[1].fee));

		MySQL.Async.execute('DELETE FROM `impound` WHERE `plate` = @plate',
		{
			['@plate'] = plate,
		}, function (rows)
			TriggerClientEvent('NRRP:Apreendidos:VehicleUnimpounded', _source, veh[1], _UnimpoundedVehicleCount)
		end)
	end
		MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate', {
			['@stored'] = 0,
			['@plate'] = plate
		}, function(rowsChanged)
		end)
end)

AddEventHandler('NRRP:Apreendidos:GetVehicles', function ()
	_source = source;

	local vehicles = MySQL.Async.fetchAll('SELECT * FROM `impound`', nil, function (vehicles)
		TriggerClientEvent('NRRP:Apreendidos:SetImpoundedVehicles', _source, vehicles);
	end);
end)

-------------------------------------------------------------------------------------------------------------------------------
-- Stupid extra shit because fuck all of this
-------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('NRRP:ESX:GetCharacter')
AddEventHandler('NRRP:ESX:GetCharacter', function (identifier)
	local _source = source
	MySQL.Async.fetchAll('SELECT * FROM `users` WHERE `identifier` = @identifier',
		{
			['@identifier'] 		= identifier,
		}, function(users)
		TriggerClientEvent('NRRP:ESX:SetCharacter', _source, users[1]);
	end)
end)

RegisterServerEvent('NRRP:ESX:GetVehicleAndOwner')
AddEventHandler('NRRP:ESX:GetVehicleAndOwner', function (plate)
	local _source = source

	MySQL.Async.fetchAll('select * from `owned_vehicles` LEFT JOIN `users` ON users.identifier = owned_vehicles.owner WHERE `plate` = rtrim(@plate)',
		{
			['@plate'] 		= plate,
		}, function(vehicleAndOwner)
		TriggerClientEvent('NRRP:ESX:SetVehicleAndOwner', _source, vehicleAndOwner[1]);
	end)
end)


function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function round(x)
	return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end
