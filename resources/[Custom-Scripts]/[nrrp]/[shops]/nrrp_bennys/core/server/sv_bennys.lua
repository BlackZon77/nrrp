ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('nrrp_bennys:attemptToPurchase', function(source, cb, menuTypeCB)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
		
	if menuTypeCB == "cosmetics" then
		price = vehicleCustomisationPrices.cosmetics.price
	elseif menuTypeCB == "respray" then
		price = vehicleCustomisationPrices.respray.price
	elseif menuTypeCB == "oldlivery" then
		price = vehicleCustomisationPrices.oldlivery.price
	elseif menuTypeCB == "xenoncolours" then
		price = vehicleCustomisationPrices.xenoncolours.price
	elseif menuTypeCB == "neoncolours" then
		price = vehicleCustomisationPrices.neoncolours.price
	elseif menuTypeCB == "headlights" then
		price = vehicleCustomisationPrices.headlights.price
	elseif menuTypeCB == "windowtint" then
		price = vehicleCustomisationPrices.windowtint.price
	elseif menuTypeCB == "neonside" then
		price = vehicleCustomisationPrices.neonside.price
	elseif menuTypeCB == "turbo" then
		price = vehicleCustomisationPrices.turbo.price
	elseif menuTypeCB == "wheelsmoke" then
		price = vehicleCustomisationPrices.wheelsmoke.price
	elseif menuTypeCB == "customwheels" then
		price = vehicleCustomisationPrices.customwheels.price
	elseif menuTypeCB == "wheels" then
		price = vehicleCustomisationPrices.wheels.price
	elseif menuTypeCB == "repair" then
		price = vehicleBaseRepairCost
	end
	
	if useMechanicJob then
		local societyAccount

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
			societyAccount = account
		end)
		
		if menuTypeCB == menuTypeCB then
			if price < societyAccount.money then
				cb(true)
				societyAccount.removeMoney(price)
				TriggerClientEvent("nrrp_bennys:purchaseSuccessful", src)
			else			
				cb(false)
				TriggerClientEvent("nrrp_bennys:purchaseFailed", src)
			end
		end
	else
		if menuTypeCB == menuTypeCB then
			if price < xPlayer.getMoney() then
				cb(true)
				xPlayer.removeMoney(price)
				TriggerClientEvent("nrrp_bennys:purchaseSuccessful", src)
			else			
				cb(false)
				TriggerClientEvent("nrrp_bennys:purchaseFailed", src)
			end	
		end	
	end
end)

ESX.RegisterServerCallback('nrrp_bennys:attemptToPurchasePerformance', function(source, cb, currentCategory, tempNum)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	
	if currentCategory == 11 then -- engine category
		if tempNum == 0 then
			price = vehicleCustomisationPrices.performance.prices[0]
		elseif tempNum == 1 then
			price = vehicleCustomisationPrices.performance.prices[1]
		elseif tempNum == 2 then
			price = vehicleCustomisationPrices.performance.prices[2]
		elseif tempNum == 3 then 
			price = vehicleCustomisationPrices.performance.prices[3]
		elseif tempNum == 4 then
			price = vehicleCustomisationPrices.performance.prices[4]
		elseif tempNum == 5 then
			price = vehicleCustomisationPrices.performance.prices[5]
		end
	elseif currentCategory == 12 then -- brakes category
		if tempNum == 0 then
			price = vehicleCustomisationPrices.performance.prices[0]
		elseif tempNum == 1 then
			price = vehicleCustomisationPrices.performance.prices[1]
		elseif tempNum == 2 then
			price = vehicleCustomisationPrices.performance.prices[2]
		elseif tempNum == 3 then 
			price = vehicleCustomisationPrices.performance.prices[3]
		elseif tempNum == 4 then
			price = vehicleCustomisationPrices.performance.prices[4]
		elseif tempNum == 5 then
			price = vehicleCustomisationPrices.performance.prices[5]
		end
	elseif currentCategory == 13 then -- transmission category
		if tempNum == 0 then
			price = vehicleCustomisationPrices.performance.prices[0]
		elseif tempNum == 1 then
			price = vehicleCustomisationPrices.performance.prices[1]
		elseif tempNum == 2 then
			price = vehicleCustomisationPrices.performance.prices[2]
		elseif tempNum == 3 then 
			price = vehicleCustomisationPrices.performance.prices[3]
		elseif tempNum == 4 then
			price = vehicleCustomisationPrices.performance.prices[4]
		elseif tempNum == 5 then
			price = vehicleCustomisationPrices.performance.prices[5]
		end
	elseif currentCategory == 15 then -- idk wtf is that category
		if tempNum == 0 then
			price = vehicleCustomisationPrices.performance.prices[0]
		elseif tempNum == 1 then
			price = vehicleCustomisationPrices.performance.prices[1]
		elseif tempNum == 2 then
			price = vehicleCustomisationPrices.performance.prices[2]
		elseif tempNum == 3 then 
			price = vehicleCustomisationPrices.performance.prices[3]
		elseif tempNum == 4 then
			price = vehicleCustomisationPrices.performance.prices[4]
		elseif tempNum == 5 then
			price = vehicleCustomisationPrices.performance.prices[5]
		end
	elseif currentCategory == 16 then -- armor category
		if tempNum == 0 then
			price = vehicleCustomisationPrices.performance.prices[0]
		elseif tempNum == 1 then
			price = vehicleCustomisationPrices.performance.prices[1]
		elseif tempNum == 2 then
			price = vehicleCustomisationPrices.performance.prices[2]
		elseif tempNum == 3 then 
			price = vehicleCustomisationPrices.performance.prices[3]
		elseif tempNum == 4 then
			price = vehicleCustomisationPrices.performance.prices[4]
		elseif tempNum == 5 then
			price = vehicleCustomisationPrices.performance.prices[5]
		end
	end
	
	if useMechanicJob then
		local societyAccount

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic', function(account)
			societyAccount = account
		end)
		
		if price < societyAccount.money then
			cb(true)
			societyAccount.removeMoney(price)
			TriggerClientEvent("nrrp_bennys:purchaseSuccessful", src)
		else			
			cb(false)
			TriggerClientEvent("nrrp_bennys:purchaseFailed", src)
		end
	else
		if price < xPlayer.getMoney() then
			cb(true)
			xPlayer.removeMoney(price)
			TriggerClientEvent("nrrp_bennys:purchaseSuccessful", src)
		else			
			cb(false)
			TriggerClientEvent("nrrp_bennys:purchaseFailed", src)
		end	
	end
end)

RegisterServerEvent('nrrp_bennys:refreshOwnedVehicle')
AddEventHandler('nrrp_bennys:refreshOwnedVehicle', function(vehicleProps)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT vehicle FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = vehicleProps.plate
	}, function(result)
		if result[1] then
			local vehicle = json.decode(result[1].vehicle)

			if vehicleProps.model == vehicle.model then
				MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle WHERE plate = @plate', {
					['@plate'] = vehicleProps.plate,
					['@vehicle'] = json.encode(vehicleProps)
				})
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Estás a modificar um carro de NPC! ', length = 4000})
			end
		end
	end)
end)