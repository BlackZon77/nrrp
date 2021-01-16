ESX = nil
local display = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function isWeapon(item)
	local weaponList = ESX.GetWeaponList()
	for i=1, #weaponList, 1 do
		if weaponList[i].label == item then
			return true
		end
	end
	return false
end

local function craftItem(ingredients)
	local ingredientsPrepped = {}
	for name, count in pairs(ingredients) do
		if count > 0 then
			table.insert(ingredientsPrepped, { item = name , quantity = count})
		end
	end
	TriggerServerEvent('nrrp_craftsys:craftItem', ingredientsPrepped)
end

RegisterNetEvent('nrrp_craftsys:openMenu')
AddEventHandler('nrrp_craftsys:openMenu', function(playerInventory)
	SetNuiFocus(true,true)
	local preppedInventory = {}
	for i=1, #playerInventory, 1 do
		if playerInventory[i].count > 0 and not isWeapon(playerInventory[i].label) then
			table.insert(preppedInventory, playerInventory[i])
		end
	end
	SendNUIMessage({
		inventory = preppedInventory,
		display = true
	})
	display = true
end)

RegisterNUICallback('craftItemNUI', function(data, cb)
	craftItem(data)
end)

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
	SendNUIMessage({
		display = false
	})
	display = false
end)

if Config.Keyboard.useKeyboard then
	-- Handle menu input
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if IsControlJustReleased(1, Config.Keyboard.keyCode) and GetLastInputMethod(2) then
				TriggerServerEvent('nrrp_craftsys:getPlayerInventory')
			end
		end
	end)
end

if Config.Shop.useShop then
	local inDrawingRange = false
	local function isPlayerInRange(coords1, coords2, range)	
		return (Vdist2(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z) < range)
	end
	
	Citizen.CreateThread(function()
		-- local blip = AddBlipForCoord(Config.Shop.shopCoordinates.x, Config.Shop.shopCoordinates.y, Config.Shop.shopCoordinates.z)
		-- SetBlipSprite (blip, Config.Shop.shopBlipID)
		-- SetBlipDisplay(blip, 4)
		-- SetBlipScale  (blip, 1.0)
		-- SetBlipAsShortRange(blip, true)
		-- BeginTextCommandSetBlipName("STRING")
		-- AddTextComponentString(Config.Shop.shopName)
		-- EndTextCommandSetBlipName(blip)
		
		local bench = GetHashKey("gr_prop_gr_bench_04b")
		RequestModel(bench)

		while not HasModelLoaded(bench) do
			Citizen.Wait(1)
		end
		local ent = CreateObject(bench, -2149.09, 3302.73, 37.73,  false, false, true)
	
		SetEntityHeading(ent, 62.7 or 0)
		FreezeEntityPosition(ent, true)
		SetEntityInvincible(ent, true)
		
		SetModelAsNoLongerNeeded(bench)

		while true do
			Citizen.Wait(250)
			inDrawingRange = isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop.shopCoordinates, 100)
		end
	end)
		
	Citizen.CreateThread(function()		
		while true do
			Citizen.Wait(0)
			if inDrawingRange then
				DrawMarker(1, Config.Shop.shopCoordinates.x, Config.Shop.shopCoordinates.y, Config.Shop.shopCoordinates.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Shop.zoneSize.x, Config.Shop.zoneSize.y, Config.Shop.zoneSize.z, Config.Shop.zoneColor.r, Config.Shop.zoneColor.g, Config.Shop.zoneColor.b, Config.Shop.zoneColor.a, false, true, 2, false, false, false, false)
				if not display and isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop.shopCoordinates, Config.Shop.zoneSize.x) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Pressiona ~INPUT_CONTEXT~ para craftar um item")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(1, 38) then
						TriggerServerEvent('nrrp_craftsys:getPlayerInventory')
					end
				end
			end
		end
	end)
end

AddEventHandler('onClientResourceStop', function (resourceName)
  ESX.Game.DeleteObject(GetHashKey("gr_prop_gr_bench_04b"))
end)