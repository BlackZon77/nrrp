ESX	= nil
local HasAlreadyEnteredMarker, isDead = false, false
local LastZone, CurrentAction, CurrentActionMsg
local CurrentActionData	= {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- function OpenAccessoryMenu()
-- 	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'set_unset_accessory', {
-- 		title = _U('set_unset'),
-- 		align = 'left',
-- 		elements = {
-- 			{label = _U('helmet'), value = 'Helmet'},
-- 			{label = _U('ears'), value = 'Ears'},
-- 			{label = _U('mask'), value = 'Mask'},
-- 			{label = _U('glasses'), value = 'Glasses'}
-- 		}}, function(data, menu)
-- 		menu.close()
-- 		SetUnsetAccessory(data.current.value)
-- 	end, function(data, menu)
-- 		menu.close()
-- 	end)
-- end

function SetUnsetAccessory(accessory)
	ESX.TriggerServerCallback('nrrp_accessories:get', function(hasAccessory, accessorySkin)
		local _accessory = string.lower(accessory)

		if hasAccessory then
			TriggerEvent('skinchanger:getSkin', function(skin)
				local mAccessory = -1
				local mColor = 0

				if _accessory == "mask" then
					mAccessory = 0
				end

				if skin[_accessory .. '_1'] == mAccessory then
					mAccessory = accessorySkin[_accessory .. '_1']
					mColor = accessorySkin[_accessory .. '_2']
				end

				local accessorySkin = {}
				accessorySkin[_accessory .. '_1'] = mAccessory
				accessorySkin[_accessory .. '_2'] = mColor
				TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
			end)
		else
			ESX.ShowNotification(_U('no_' .. _accessory))
		end
	end, accessory)
end

function OpenShopMenu(accessory)
	local _accessory = string.lower(accessory)
	local restrict = {}

	restrict = { _accessory .. '_1', _accessory .. '_2' }

	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)

		menu.close()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = _U('valid_purchase'),
			align = 'left',
			elements = {
				{label = _U('no'), value = 'no'},
				{label = _U('yes', ESX.Math.GroupDigits(Config.Price)), value = 'yes'}
			}}, function(data, menu)
			menu.close()
			if data.current.value == 'yes' then
				ESX.TriggerServerCallback('nrrp_accessories:checkMoney', function(hasEnoughMoney)
					if hasEnoughMoney then
						TriggerServerEvent('nrrp_accessories:pay')
						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('nrrp_accessories:save', skin, accessory)
						end)
					else
						TriggerEvent('esx_skin:getLastSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
						end)
						ESX.ShowNotification(_U('not_enough_money'))
					end
				end)
			end

			if data.current.value == 'no' then
				local player = PlayerPedId()
				TriggerEvent('esx_skin:getLastSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
				if accessory == "Ears" then
					ClearPedProp(player, 2)
				elseif accessory == "Mask" then
					SetPedComponentVariation(player, 1, 0 ,0, 2)
				elseif accessory == "Helmet" then
					ClearPedProp(player, 0)
				elseif accessory == "Glasses" then
					SetPedPropIndex(player, 1, -1, 0, 0)
				end
			end
			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = _U('press_access')
			CurrentActionData = {}
		end, function(data, menu)
			menu.close()
			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = _U('press_access')
			CurrentActionData = {}
		end)
	end, function(data, menu)
		menu.close()
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('press_access')
		CurrentActionData = {}
	end, restrict)
end

AddEventHandler('playerSpawned', function()
	isDead = false
end)

AddEventHandler('esx:onPlayerDeath', function()
	isDead = true
end)

AddEventHandler('nrrp_accessories:hasEnteredMarker', function(zone)
	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = _U('press_access')
	CurrentActionData = { accessory = zone }
end)

AddEventHandler('nrrp_accessories:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

-- Create Blips --
Citizen.CreateThread(function()
	for k,v in pairs(Config.ShopsBlips) do
		if v.Pos ~= nil then
			for i=1, #v.Pos, 1 do
				local blip = AddBlipForCoord(v.Pos[i])

				SetBlipSprite (blip, v.Blip.sprite)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 0.7)
				SetBlipColour (blip, v.Blip.color)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(_U('shop', _U(string.lower(k))))
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if(Config.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos[i], true) < Config.DrawDistance) then
					DrawMarker(Config.Type, v.Pos[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(200)

		local coords = GetEntityCoords(PlayerPedId())
		local isInMarker = false
		local currentZone = nil
		for k,v in pairs(Config.Zones) do
			for i = 1, #v.Pos, 1 do
				if GetDistanceBetweenCoords(coords, v.Pos[i], true) < Config.Size.x then
					isInMarker  = true
					currentZone = k
				end
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone = currentZone
			TriggerEvent('nrrp_accessories:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('nrrp_accessories:hasExitedMarker', LastZone)
		end
	end
end)

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) and CurrentActionData.accessory then
				OpenShopMenu(CurrentActionData.accessory)
				CurrentAction = nil
			end
		elseif CurrentAction and not Config.EnableControls then
			Citizen.Wait(500)
		end

		-- if Config.EnableControls then
		-- 	if IsControlJustReleased(0, 311) and IsInputDisabled(0) and not isDead then
		-- 		OpenAccessoryMenu()
		-- 	end
		-- end
	end
end)


------------ Comandos
Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/t1', 'Retirar/Meter TShirt', {})
	TriggerEvent('chat:addSuggestion', '/c1', 'Retirar/Meter Calças', {})
	TriggerEvent('chat:addSuggestion', '/s1', 'Retirar/Meter Sapatos', {})

	TriggerEvent('chat:addSuggestion', '/rr', 'Mete as roupas todas', {})
	TriggerEvent('chat:addSuggestion', '/rc', 'Remover colete á prova de bala', {})

	TriggerEvent('chat:addSuggestion', '/ao2', 'Retirar/Meter Acessórios de ouvido', {})
	TriggerEvent('chat:addSuggestion', '/am1', 'Retirar/Meter Máscara', {})
	TriggerEvent('chat:addSuggestion', '/ac1', 'Retirar/Meter Chapeu', {})
	TriggerEvent('chat:addSuggestion', '/ao1', 'Retirar/Meter Óculos', {})
  end)

RegisterCommand('t1', function(source, args, raw)
	TriggerEvent('nrrp_accessories:shirt')
end)
RegisterCommand('c1', function(source, args, raw)
	TriggerEvent('nrrp_accessories:pants')
end)
RegisterCommand('s1', function(source, args, raw)
	TriggerEvent('nrrp_accessories:shoes')
end)
RegisterCommand('rc', function(source)
	local plyPed = GetPlayerPed(-1)
	SetPedComponentVariation(plyPed, 9, 0, 0, 0)
	AddArmourToPed(plyPed, 0)
    SetPedArmour(plyPed, 0)
end)
RegisterCommand('rr', function(source, args, raw)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end)
RegisterCommand('ao2', function(source)
	SetUnsetAccessory('Ears')
end)
RegisterCommand('am1', function(source)
	SetUnsetAccessory('Mask')
end)
RegisterCommand('ac1', function(source)
	SetUnsetAccessory('Helmet')
end)
RegisterCommand('ao1', function(source)
	SetUnsetAccessory('Glasses')
end)

RegisterNetEvent('nrrp_accessories:shirt')
AddEventHandler('nrrp_accessories:shirt', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
		local clothesSkin = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 15, ['torso_2'] = 0,
			['arms'] = 15, ['arms_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)

RegisterNetEvent('nrrp_accessories:pants')
AddEventHandler('nrrp_accessories:pants', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
		local clothesSkin = {
			['pants_1'] = 21, ['pants_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)

RegisterNetEvent('nrrp_accessories:shoes')
AddEventHandler('nrrp_accessories:shoes', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
		if(skin.sex == 0) then
			local clothesSkin = {
				['shoes_1'] = 34, ['shoes_2'] = 0
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		else
			local clothesSkin = {
				['shoes_1'] = 35, ['shoes_2'] = 0
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end
	end)
end)
