local isInInventory = false
local targetPlayer, targetPlayerName, openedTrunk
local trunkData, gBoxData, stashData, propertyData, motelData, safeData, shopData, playerInv, Licenses, PlayerData = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
local Inclusions = Config.IncludeOptions
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
	while not ESX.IsPlayerLoaded() do Citizen.Wait(10) end
	while not HasCollisionLoadedAroundEntity(PlayerPedId()) do Citizen.Wait(10) end
	PlayerData = ESX.GetPlayerData()
	if Config.Weight.AddWeaponsToPlayerWeight then
		ESX.TriggerServerCallback('erp_invhud:getPlayerInventory', function(data)
			local items = {}
			local weapons = data.weapons
			local playerPed = PlayerPedId()
			for key, value in pairs(weapons) do
				local weaponHash = GetHashKey(weapons[key].name)
				if  weapons[key].name ~= 'WEAPON_UNARMED' then
					local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
					table.insert(
						items,
						{
							label = weapons[key].label,
							count = ammo,
							name = weapons[key].name,
						}
					)
				end
			end
			TriggerServerEvent('erp_invhud:setPlayerWeaponWeight', items)
		end, GetPlayerServerId(PlayerId()))
	end
	if Config.Use.Licenses then
		ESX.TriggerServerCallback('erp_invhud:getPlayerLicenses', function(licenses)
			for i = 1, #licenses, 1 do
				Licenses[licenses[i]] = true
			end
		end)
	end
	for k,v in pairs(Config.Shops) do
		if v.Blips.Use then
			for i = 1,#v.Locations.Store do
				CreateBlip(v.Locations.Store[i], k, v.Blips.Scale, v.Blips.Color, v.Blips.Sprite, v.Blips.Display)
			end
		end
	end
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		local dis
		for k,v in pairs(Config.Shops) do
			if v.Markers.Use then
				for i = 1,#v.Locations.Store do
					dis = #(pos - v.Locations.Store[i])
					if dis <= v.Markers.Draw then
						DrawMarker(v.Markers.Type, v.Locations.Store[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, v.Markers.RGB, 200, false, false, 0, false, 0, 0, 0)
						if v.Markers.UseText then
							DrawShopText(v.Locations.Store[i].x, v.Locations.Store[i].y, v.Locations.Store[i].z+1.0, k, v.Markers.RGB)
						end
					end
				end
				if v.Society.Name and (PlayerData.job.name == v.Society.Name) and PlayerData.job.grade_name == 'boss' then
					for i = 1,#v.Locations.Boss do
						dis = #(pos - v.Locations.Boss[i])
						if dis <= v.Markers.Draw then
							DrawMarker(v.Markers.Type, v.Locations.Boss[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, v.Markers.RGB, 200, false, false, 0, false, 0, 0, 0)
							if v.Markers.UseText then
								DrawShopText(v.Locations.Boss[i].x, v.Locations.Boss[i].y, v.Locations.Boss[i].z+1.0, k..' Boss Zone', v.Markers.RGB)
							end
							if dis <= 1.5 then
								if IsControlJustReleased(0, 51) then
									TriggerEvent('esx_society:openBossMenu', v.Society.Name, function(data, menu)
										menu.close()
									end, v.Society.Options)
								end
							end
						end
					end
				end
			end
		end
		for k,v in pairs(Config.Stash) do
			if PlayerData.job.name == v.job or v.job == 'identifier' then
				if v.markerType ~= -1 then
					local dis = #(pos - v.coords)
					if dis <= v.draw then
						DrawMarker(v.markerType, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.size.x, v.size.y, v.size.z, v.markerColour.x, v.markerColour.y, v.markerColour.z, 200, false, false, 0, false, 0, 0, 0)
						if v.useText then
							DrawShopText(v.coords.x, v.coords.y, v.coords.z, v.msg, v.markerColour)
						end
					end
				end
			end
		end
		if isInInventory then
			DisableAllControlActions(0)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		
        LicenseShop = Config.LicenseShop.LicenseShop.Locations
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)
		
		for i = 1, #LicenseShop, 1 do
			if GetDistanceBetweenCoords(coords, LicenseShop[i].x, LicenseShop[i].y, LicenseShop[i].z, true) < 8.0 then
				if IsControlJustReleased(0, 38) then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
						if hasWeaponLicense then
							exports['mythic_notify']:SendAlert('error', 'Já tens licença de porte de armas.')
						else
							OpenBuyLicenseMenu()
							Citizen.Wait(2000)
						end
					end, GetPlayerServerId(PlayerId()), 'weapon')
				end
			end
		end
    end
end)

function OpenBuyLicenseMenu()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_license',{
        title = 'Compra da Licença de Porte de Armas', --Register a License
        align = 'left',
        elements = {
          { label = 'Sim' ..' (' .. Config.LicensePrice ..') €', value = 'yes' }, --yes
          { label = 'Não', value = 'no' },
        }
      },
      function (data, menu)		
		if data.current.value == 'yes' then
            ESX.TriggerServerCallback('erp_invhud:buyLicense', function(bought)
                if bought then
                    menu.close()
                end
            end)
        end
    end,
    function (data, menu)
        menu.close()
    end)
end

DrawShopText = function(x, y, z, text, rgb)
	local onScreen,_x,_y=World3dToScreen2d(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local scale = 0.5
	local text = text
	
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(0)
		SetTextProportional(1)
		SetTextColour(math.floor(rgb.x), math.floor(rgb.y), math.floor(rgb.z), 255)
		SetTextDropshadow(1, 1, 0, 0, 255)
		SetTextEdge(0, 0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(2)
		AddTextComponentString(text)
		DrawText(_x,_y)
	end
end

Notify = function(text, timer)
	if timer == nil then
		timer = 5000
	end
	exports['mythic_notify']:SendAlert('error', text, timer)
	-- exports.pNotify:SendNotification({layout = 'centerLeft', text = text, type = 'error', timeout = timer})
	-- ESX.ShowNotification(text)
end

setInventory = function(data)
	local invText = '%s %s<br>Peso: %s / %s'
	ESX.TriggerServerCallback('erp_invhud:doMath', function(total)
		SendNUIMessage(
			{
				action = 'setInfoText',
				text = invText:format(data.owner, data.type, tostring(total), tostring(data.limit))
			}
		)
		data = json.decode(data.data)
		items = {}

		if data.blackMoney > 0 then
			blackData = {
				label = _U('black_money'),
				count = data.blackMoney,
				type = 'item_account',
				name = 'black_money',
				usable = false,
				rare = false,
				limit = -1,
				canRemove = false
			}
			table.insert(items, blackData)
		end
		
		if data.cash > 0 then
			cashData = {
				label = 'cash',
				count = data.cash,
				type = 'item_money',
				name = 'cash',
				usable = false,
				rare = false,
				limit = -1,
				canRemove = false
			}
			table.insert(items, cashData)
		end

		if data.items ~= nil then
			for key, value in pairs(data.items) do
				data.items[key][1].name = key
				data.items[key][1].label = value[1].label
				data.items[key][1].type = 'item_standard'
				data.items[key][1].usable = false
				data.items[key][1].rare = false
				data.items[key][1].limit = -1
				data.items[key][1].canRemove = false
				table.insert(items, data.items[key][1])
			end
		end

		for key, value in pairs(data.weapons) do
			for i = 1,#data.weapons[key] do
				if data.weapons[key][i] ~= 'WEAPON_UNARMED' then
					table.insert(
						items,
						{
							label = data.weapons[key][i].label,
							count = data.weapons[key][i].count,
							limit = -1,
							type = 'item_weapon',
							name = key,
							usable = false,
							rare = false,
							canRemove = false
						}
					)
				end
			end
		end

	SendNUIMessage(
			{
				action = 'setSecondInventoryItems',
				itemList = items
			}
		)
	end, json.decode(data.data))
end

setShopInventory = function(data)
    SendNUIMessage(
        {
            action = 'setInfoText',
            text = 'SHOP'
        }
    )

    items = {}

    if data.items ~= nil then
        for k,v in pairs(data.items) do
			table.insert(items, v)
        end
    end

    if data.weapons ~= nil then
        for k,v in pairs(data.weapons) do
            if v.name ~= 'WEAPON_UNARMED' then
                table.insert(items, v)
            end
        end
    end

    SendNUIMessage(
        {
            action = 'setShopInventoryItems',
            itemList = items
        }
    )
end

InShopZone = function(pos)
	local inShop, shopIn = false, nil
	for k,v in pairs(Config.Shops) do
		for i = 1,#v.Locations.Store do
			local dis = #(pos - v.Locations.Store[i])
			if dis < 1.5 then
				inShop = true
				shopIn = k
			end
		end
	end
	return inShop, shopIn
end

InStashZone = function(pos)
	local atStash, stashAt = false, nil
	for k,v in pairs(Config.Stash) do
		local dis = #(pos - v.coords)
		if dis < 1.5 and (PlayerData.job.name == v.job or v.job == 'identifier') then
			atStash = true
			stashAt = k
		end
	end
	return atStash, stashAt
end

openInventory = function(invType, data)
    loadPlayerInventory()
	if data ~= nil then
		if invType ~= 'shop' then
			setInventory(data)
		else
			setShopInventory(data)
		end
	end
    isInInventory = true
    SendNUIMessage(
        {
            action = 'display',
            type = invType
        }
    )
    SetNuiFocus(true, true)
end

closeInventory = function()
    isInInventory = false
	if openedTrunk then
		SetVehicleDoorShut(openedTrunk, 5, false, false)
		openedTrunk = nil
	end
    SendNUIMessage(
        {
            action = 'hide'
        }
    )
    SetNuiFocus(false, false)
end

shouldCloseInventory = function(itemName)
    for index, value in ipairs(Config.CloseUiItems) do
        if value == itemName then
            return true
        end
    end

    return false
end

loadPlayerInventory = function(inv)
	local invText = '%s %s<br>Peso: %s / %s'
	if not inv then
		ESX.TriggerServerCallback('erp_invhud:getPlayerInventory', function(data)
			local items = {}
			local inventory = data.inventory
			local accounts = data.accounts
			local money = data.money
			local weapons = data.weapons
			if data.maxWeight == nil then
				invText = '%s %s<br>Peso: %s'
				SendNUIMessage(
					{
						action = 'setInfoText',
						text = invText:format('Your', 'Inventory', tostring(data.totalWeight))
					}
				)
			else
				SendNUIMessage(
					{
						action = 'setInfoText',
						text = invText:format('Your', 'Inventory', tostring(data.totalWeight), tostring(data.maxWeight))
					}
				)
			end
			if Inclusions.Cash and money ~= nil and money > 0 then
				if not Config.ESX1Point1  then
					moneyData = {
						label = _U('cash'),
						name = 'money',
						type = 'item_account',
						count = money,
						usable = false,
						rare = false,
						limit = -1,
						canRemove = true
					}

					table.insert(items, moneyData)
				else
					moneyData = {
						label = _U("cash"),
						name = "cash",
						type = "item_money",
						count = money,
						usable = false,
						rare = false,
						limit = -1,
						canRemove = true
					}

					table.insert(items, moneyData)
				end
			end

			if Inclusions.Dirty and accounts ~= nil then
				for key, value in pairs(accounts) do
					if accounts[key].name == 'black_money' then
						if accounts[key].money > 0 then
							accountData = {
								label = accounts[key].label,
								count = accounts[key].money,
								type = 'item_account',
								name = accounts[key].name,
								usable = false,
								rare = false,
								limit = -1,
								canRemove = true
							}
							table.insert(items, accountData)
						end
					end
				end
			end

			if inventory ~= nil then
				for key, value in pairs(inventory) do
					if inventory[key].count <= 0 then
						inventory[key] = nil
					else
						inventory[key].type = 'item_standard'
						inventory[key].id = id
						table.insert(items, inventory[key])
					end
				end
			end

			if Inclusions.Weapons and weapons ~= nil then
				for key, value in pairs(weapons) do
					local weaponHash = GetHashKey(value.name)
					local playerPed = PlayerPedId()
					if  value.name ~= 'WEAPON_UNARMED' then
						table.insert(
							items,
							{
								label = value.label,
								count = value.ammo,
								limit = -1,
								type = 'item_weapon',
								name = value.name,
								usable = false,
								rare = false,
								canRemove = true
							}
						)
					end
				end
			end
			playerInv = items
			SendNUIMessage(
				{
					action = 'setItems',
					itemList = items
				}
			)
		end, GetPlayerServerId(PlayerId()))
	else
		items = inv
		playerInv = items
		SendNUIMessage(
			{
				action = 'setItems',
				itemList = items
			}
		)
	end
end

CreateBlip = function(coords, text, scale, color, sprite, display)
	local blip = AddBlipForCoord(coords)
	SetBlipSprite(blip, sprite)
	SetBlipColour(blip, color)
	SetBlipScale(blip, scale)
	SetBlipDisplay(blip, display)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end

GetVehicleInFront = function()
	local playerPed    = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	local inDirection  = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 5.0, 0.0)
	local rayHandle    = StartShapeTestRay(playerCoords, inDirection, 10, playerPed, 0)
	local numRayHandle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)

	if hit == 1 and GetEntityType(entityHit) == 2 then
		return entityHit
	end

	return nil
end

RegisterNUICallback('PutIntoGBox', function(data, cb)
	if not IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('You are not in a car somehow')
		return
	end
	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		local count = tonumber(data.number)

		if data.item.type == 'item_weapon' then
			count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
		end
		if count == 0 then
			count = 1
		end
		TriggerServerEvent('erp_invhud:putItem', 'gbox', gBoxData.plate, data, count)
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('gbox', data)
	end, 'gbox', gBoxData.plate)

	cb('ok')
end)

RegisterNUICallback('TakeFromGBox', function(data, cb)
	if not IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Não estás num carro de alguma forma')
		return
	end

	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		TriggerServerEvent('erp_invhud:getItem', 'gbox', gBoxData.plate, data, tonumber(data.number))
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		
		openInventory('gbox',data)
	end, 'gbox', gBoxData.plate)

	cb('ok')
end)

RegisterNUICallback('PutIntoTrunk', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Estás num carro de alguma forma')
		return
	end
	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		local count = tonumber(data.number)

		if data.item.type == 'item_weapon' then
			count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
		end
		if count == 0 then
			count = 1
		end
		TriggerServerEvent('erp_invhud:putItem', 'trunk', trunkData.plate, data, count)
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		
		openInventory('trunk',data)
	end, 'trunk', trunkData.plate)

	cb('ok')
end)

RegisterNUICallback('TakeFromTrunk', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Estás num carro de alguma forma')
		return
	end

	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		TriggerServerEvent('erp_invhud:getItem', 'trunk', trunkData.plate, data, tonumber(data.number))
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('trunk',data)
	end, 'trunk', trunkData.plate)

	cb('ok')
end)

RegisterNUICallback('PutIntoProperty', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Estás num carro de alguma forma')
		return
	end
	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		local count = tonumber(data.number)

		if data.item.type == 'item_weapon' then
			count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
		end
		if count == 0 then
			count = 1
		end
		TriggerServerEvent('erp_invhud:putItem', 'property', propertyData.id, data, count)
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('property',data)
	end, 'property', propertyData.id, propertyData.interior)

	cb('ok')
end)

RegisterNUICallback('PutIntoMotel', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Estás num carro de alguma forma')
		return
	end
	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		local count = tonumber(data.number)

		if data.item.type == 'item_weapon' then
			count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
		end
		if count == 0 then
			count = 1
		end
		TriggerServerEvent('erp_invhud:putItem', motelData.type, motelData.owner, data, count)
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('motel',data)
	end, motelData.type, motelData.owner)

	cb('ok')
end)

RegisterNUICallback('TakeFromProperty', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Estás num carro de alguma forma')
		return
	end

	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		TriggerServerEvent('erp_invhud:getItem', 'property', propertyData.id, data, tonumber(data.number))
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('property',data)
	end, 'property', propertyData.id, propertyData.interior)

	cb('ok')
end)

RegisterNUICallback('TakeFromMotel', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Estás num carro de alguma forma')
		return
	end

	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		TriggerServerEvent('erp_invhud:getItem', motelData.type, motelData.owner, data, tonumber(data.number))
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('motel',data)
	end, motelData.type, motelData.owner)

	cb('ok')
end)

RegisterNUICallback('PutIntoSafe', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Estás num carro de alguma forma')
		return
	end
	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		local count = tonumber(data.number)

		if data.item.type == 'item_weapon' then
			count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
		end
		if count == 0 then
			count = 1
		end
		TriggerServerEvent('erp_invhud:putItem', 'safe', safeData.id, data, count)
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('safe',data)
	end, 'safe', safeData.id)

	cb('ok')
end)

RegisterNUICallback('TakeFromSafe', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Estás num carro de alguma forma')
		return
	end

	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		TriggerServerEvent('erp_invhud:getItem', 'safe', safeData.id, data, tonumber(data.number))
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('safe',data)
	end, 'safe', safeData.id)

	cb('ok')
end)

RegisterNUICallback('TakeFromShop', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Estás num carro de alguma forma')
		return
	end
	if shopData.Type ~= 'purchase' and shopData.Type ~= 'mix' then
		Notify('Esta loja não vende items')
		return
	else
		if type(data.number) == 'number' and math.floor(data.number) == data.number then
			TriggerServerEvent('erp_invhud:SellItemToPlayer', data.item.type, data.item.name, tonumber(data.number), shopData)
		end

		Wait(150)
		loadPlayerInventory()

		cb('ok')
	end
end)

RegisterNUICallback('SellToShop', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		Notify('Estás num carro de alguma forma')
		return
	end
	if shopData.Type ~= 'sell' and shopData.Type ~= 'mix' then
		Notify('Esta loja não compra items')
		return
	else
		if type(data.number) == 'number' and math.floor(data.number) == data.number then
			TriggerServerEvent('erp_invhud:SellItemToShop', data.item.type, data.item.name, tonumber(data.number), shopData)
		end

		Wait(150)
		loadPlayerInventory()

		cb('ok')
	end
end)

RegisterNUICallback('PutIntoStash', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		return
	end
	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		local count = tonumber(data.number)

		if data.item.type == 'item_weapon' then
			count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
		end
		if count == 0 then
			count = 1
		end
		TriggerServerEvent('erp_invhud:putItem', 'stash', stashData.stash, data, count)
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('stash',data)
	end, 'stash', stashData.stash)

	cb('ok')
end)

RegisterNUICallback('TakeFromStash', function(data, cb)
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		return
	end

	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		TriggerServerEvent('erp_invhud:getItem', 'stash', stashData.stash, data, tonumber(data.number))
	end
	Wait(250)
	loadPlayerInventory()
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('stash',data)
	end, 'stash', stashData.stash)

	cb('ok')
end)

RegisterNUICallback('NUIFocusOff', function()
	TriggerEvent('erp_invhud:closeInventory')
end)

RegisterNUICallback('GetNearPlayers', function(data, cb)
	local playerPed = PlayerPedId()
	local playerPed = PlayerPedId()
	if IsPedDeadOrDying(playerPed) then
		Notify('Estás morto')
		return
	end
	local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
	local foundPlayers = false
	local elements = {}

	for i = 1, #players, 1 do
		if players[i] ~= PlayerId() then
			foundPlayers = true

			table.insert(
				elements,
				{
					label = GetPlayerName(players[i]),
					player = GetPlayerServerId(players[i])
				}
			)
		end
	end

	if not foundPlayers then
		Notify('Ninguem perto de ti')
	else
		SendNUIMessage(
			{
				action = 'nearPlayers',
				foundAny = foundPlayers,
				players = elements,
				item = data.item
			}
		)
	end
	cb('ok')
end)

RegisterNUICallback('UseItem', function(data, cb)
	local playerPed = PlayerPedId()
	if IsPedDeadOrDying(playerPed) then
		Notify('Estás morto')
		return
	end
	TriggerServerEvent('esx:useItem', data.item.name)

	if shouldCloseInventory(data.item.name) then
		TriggerEvent('erp_invhud:closeInventory')
	else
		Citizen.Wait(250)
		loadPlayerInventory()
	end

	cb('ok')
end)

RegisterNUICallback('DropItem', function(data, cb)
	local playerPed = PlayerPedId()
	if IsPedDeadOrDying(playerPed) then
		Notify('Estás morto')
		return
	end
	if IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		TriggerServerEvent('esx:removeInventoryItem', data.item.type, data.item.name, data.number)
	end

	Wait(250)
	loadPlayerInventory()

	cb('ok')
end)

RegisterNUICallback('GiveItem', function(data, cb)
	local playerPed = PlayerPedId()
	if IsPedDeadOrDying(playerPed) then
		Notify('Estás morto')
		return
	end
	local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
	local foundPlayer = false
	for i = 1, #players, 1 do
		if players[i] ~= PlayerId() then
			if GetPlayerServerId(players[i]) == data.player then
				foundPlayer = true
			end
		end
	end

	if foundPlayer then
		local count = tonumber(data.number)

		if data.item.type == 'item_weapon' then
			count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
		end

		TriggerServerEvent('erp_invhud:tradePlayerItem', GetPlayerServerId(PlayerId()), data.player, data.item.type, data.item.name, count)
		Wait(250)
		loadPlayerInventory()
	else
		Notify('Ninguem perto de ti')
	end
	cb('ok')
end)

RegisterNetEvent('erp_invhud:openPropertyInv')
AddEventHandler('erp_invhud:openPropertyInv', function(name, int)
	local ped = PlayerPedId()
	propertyData.id = name
	propertyData.interior = int
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('property',data)
	end, 'property', propertyData.id, propertyData.interior)
end)

RegisterNetEvent('erp_invhud:openMotelInv')
AddEventHandler('erp_invhud:openMotelInv', function(type, owner)
	local ped = PlayerPedId()
	motelData.type = type
	motelData.owner = owner
	print(motelData.type)
	print(motelData.owner)
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('motel',data)
	end, motelData.type, motelData.owner)
end)

RegisterNetEvent('erp_invhud:openSafeInv')
AddEventHandler('erp_invhud:openSafeInv', function(name)
	local ped = PlayerPedId()
	safeData.id = name
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory('safe',data)
	end, 'safe', safeData.id)
end)

RegisterNetEvent('erp_invhud:adminSearch')
AddEventHandler('erp_invhud:adminSearch', function(invType, id)
	ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
		openInventory(invType, data)
	end, invType, id)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function()
	PlayerData = ESX.GetPlayerData()
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('erp_invhud:closeInventory')
	end
end)

AddEventHandler('erp_invhud:closeInventory', function()
	closeInventory()
end)

RegisterCommand('erp_invhud:openInventory', function(raw)
	if not HasCollisionLoadedAroundEntity(PlayerPedId()) then return end
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)
	if not IsPedSittingInAnyVehicle(ped) then
		local inZone, zoneIn = InShopZone(pos)
		if inZone then
			shopData = Config.Shops[zoneIn]
			if Config.Use.Licenses then
				if shopData.NeedsLicense ~= nil then
					if Licenses[shopData.NeedsLicense] ~= nil then
						ESX.TriggerServerCallback('erp_invhud:getShopItems', function(data)
							setShopInventory(data)
							openInventory('shop',data)
						end, zoneIn)
						Citizen.Wait(250)
					else
						ESX.TriggerServerCallback('erp_invhud:getPlayerLicenses', function(licenses)
							for i = 1, #licenses, 1 do
								Licenses[licenses[i]] = true
							end
							if Licenses[shopData.NeedsLicense] ~= nil then
								ESX.TriggerServerCallback('erp_invhud:getShopItems', function(data)
									setShopInventory(data)
									openInventory('shop',data)
								end, zoneIn)
								Citizen.Wait(250)
							else
								Notify('Não tens uma licença de porte de armas, não podemos te vender armas')
							end
						end)
					end
				else
					ESX.TriggerServerCallback('erp_invhud:getShopItems', function(data)
						setShopInventory(data)
						openInventory('shop',data)
					end, zoneIn)
					Citizen.Wait(250)
				end
			else
				ESX.TriggerServerCallback('erp_invhud:getShopItems', function(data)
					setShopInventory(data)
					openInventory('shop',data)
				end, zoneIn)
				Citizen.Wait(250)
			end
		else
			local atStash, stashAt = InStashZone(pos)
			if atStash then
				if tonumber(stashAt) ~= nil then
					ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
						
						openInventory('stash',data)
						stashData.stash = PlayerData.identifier..stashAt
					end, 'stash', PlayerData.identifier..stashAt)
				else
					ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
						
						openInventory('stash',data)
						stashData.stash = stashAt
					end, 'stash', stashAt)
				end
			else
				local veh = GetVehicleInFront()
				if DoesEntityExist(veh) then
					local plate = ESX.Game.GetVehicleProperties(veh).plate
					local model, class = ESX.Game.GetVehicleProperties(veh).model
					if not Config.Weight.VehicleLimits.CustomWeight[model] then
						class = GetVehicleClass(veh)
					else
						class = model
					end
					trunkData.plate = plate
					local trunk = GetEntityBoneIndexByName(veh, 'platelight')
					if trunk == -1 then
						trunk = GetEntityBoneIndexByName(veh, 'taillight_l')
					end
					local trunkPos =  GetWorldPositionOfEntityBone(veh, trunk)
					local dis = #(pos - trunkPos)
					if dis < 2.5 then
						local lok = GetVehicleDoorLockStatus(veh)
						if lok == 1 then
							ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
								
								SetVehicleDoorOpen(veh, 5)
								openedTrunk = veh
								openInventory('trunk',data)
							end, 'trunk', plate, class)
						else
							Notify('Esta bagageira está trancada')
						end
					else
						if Config.Use.ForceSearch then
							local cP, cD = ESX.Game.GetClosestPlayer()
							if cD > 0 and cD < 3.0 then
								TriggerEvent('erp_invhud:openPlayerInventory', GetPlayerServerId(cP), GetPlayerName(cP))
								TriggerServerEvent('erp_invhud:server:notify', GetPlayerServerId(cP), 'Estás a ser revistado ', 4000)
							else
								openInventory('normal')
							end
						else
							openInventory('normal')
						end
					end
				else
					if Config.Use.ForceSearch then
						local cP, cD = ESX.Game.GetClosestPlayer()
						if cD > 0 and cD < 3.0 then
							TriggerEvent('erp_invhud:openPlayerInventory', GetPlayerServerId(cP), GetPlayerName(cP))
							TriggerServerEvent('erp_invhud:server:notify', GetPlayerServerId(cP), 'Estás a ser revistado ', 4000)
						else
							openInventory('normal')
						end
					else
						openInventory('normal')
					end
				end
			end
		end
	else
		local veh = GetVehiclePedIsIn(ped, true)
		if DoesEntityExist(veh) then
			local plate = ESX.Game.GetVehicleProperties(veh).plate
			local model, class = ESX.Game.GetVehicleProperties(veh).model
			if not Config.Weight.VehicleLimits.CustomWeight[model] then
				class = GetVehicleClass(veh)
			else
				class = model
			end
			gBoxData.plate = plate
			ESX.TriggerServerCallback('erp_invhud:getInv', function(data)
				
				openInventory('gbox',data)
			end, 'gbox', plate, class)
		end
	end
end)

-- RegisterKeyMapping('erp_invhud:openInventory', 'Open the inventory menu', 'keyboard', Config.OpenKeyName)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
		if IsControlJustReleased(0, Config.OpenKeyName) and IsInputDisabled(0) then
			ExecuteCommand('erp_invhud:openInventory')
		end
    end
end)

-------------PLAYER----------------

RegisterNetEvent('erp_invhud:openPlayerInventory')
AddEventHandler('erp_invhud:openPlayerInventory', function(target, playerName)
	targetPlayer = target
	targetPlayerName = playerName
	setPlayerInventoryData()
end)

refreshPlayerInventory = function()
    setPlayerInventoryData()
end

setPlayerInventoryData = function()
    ESX.TriggerServerCallback('erp_invhud:getPlayerInventory', function(data)
		SendNUIMessage(
			{
				action = 'setInfoText',
				text = '<strong>' .. _U('player_inventory') .. '</strong><br>' .. targetPlayerName .. ' (' .. targetPlayer .. ')'
			}
		)

		local items = {}
		local inventory = data.inventory
		local accounts = data.accounts
		local money = data.money
		local weapons = data.weapons
		if Inclusions.Cash and money ~= nil and money > 0 then
			if not Config.ESX1Point1  then
				moneyData = {
					label = _U('cash'),
					name = 'money',
					type = 'item_account',
					count = money,
					usable = false,
					rare = false,
					limit = -1,
					canRemove = true
				}

				table.insert(items, moneyData)
			else
				moneyData = {
					label = _U("cash"),
					name = "cash",
					type = "item_money",
					count = money,
					usable = false,
					rare = false,
					limit = -1,
					canRemove = true
				}

				table.insert(items, moneyData)
			end
		end

		if Inclusions.Dirty and accounts ~= nil then
			for key, value in pairs(accounts) do
				if accounts[key].name == 'black_money' then
					if accounts[key].money > 0 then
						accountData = {
							label = accounts[key].label,
							count = accounts[key].money,
							type = 'item_account',
							name = accounts[key].name,
							usable = false,
							rare = false,
							limit = -1,
							canRemove = true
						}
						table.insert(items, accountData)
					end
				end
			end
		end

		if inventory ~= nil then
			for key, value in pairs(inventory) do
				if inventory[key].count <= 0 then
					inventory[key] = nil
				else
					inventory[key].type = 'item_standard'
					inventory[key].id = id
					table.insert(items, inventory[key])
				end
			end
		end

		if Inclusions.Weapons and weapons ~= nil then
			for key, value in pairs(weapons) do
				local weaponHash = GetHashKey(weapons[key].name)
				local playerPed = GetPlayerPed(GetPlayerFromServerId(targetPlayer))
				if  weapons[key].name ~= 'WEAPON_UNARMED' then
					local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
					table.insert(
						items,
						{
							label = weapons[key].label,
							count = ammo,
							limit = -1,
							type = 'item_weapon',
							name = weapons[key].name,
							usable = false,
							rare = false,
							canRemove = true
						}
					)
				end
			end
		end

		SendNUIMessage(
			{
				action = 'setSecondInventoryItems',
				itemList = items
			}
		)
		openInventory('player')
	end, targetPlayer)
end

RegisterNUICallback('PutIntoPlayer', function(data, cb)
	local playerPed = PlayerPedId()
	if IsPedDeadOrDying(playerPed) then
		Notify('Estás morto')
		return
	end
	if IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		local count = tonumber(data.number)

		if data.item.type == 'item_weapon' then
			count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
		end

		TriggerServerEvent('erp_invhud:tradePlayerItem', GetPlayerServerId(PlayerId()), targetPlayer, data.item.type, data.item.name, count)
	end

	Wait(250)
	refreshPlayerInventory()
	loadPlayerInventory()

	cb('ok')
end)

RegisterNUICallback('TakeFromPlayer', function(data, cb)
	local playerPed = PlayerPedId()
	if IsPedDeadOrDying(playerPed) then
		Notify('Estás morto')
		return
	end
	if IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	if type(data.number) == 'number' and math.floor(data.number) == data.number then
		local count = tonumber(data.number)

		if data.item.type == 'item_weapon' then
			count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
		end

		TriggerServerEvent('erp_invhud:tradePlayerItem', targetPlayer, GetPlayerServerId(PlayerId()), data.item.type, data.item.name, count)
	end

	Wait(250)
	refreshPlayerInventory()
	loadPlayerInventory()

	cb('ok')
end)