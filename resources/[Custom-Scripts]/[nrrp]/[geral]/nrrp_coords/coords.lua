ESX = nil
local characterLoaded = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	characterLoaded = true
end)

function DrawTxt(text, x, y)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(0.0, 0.4)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

RegisterNUICallback("closeWindow", function(data, cb)
    SendNUIMessage({
		action = "closemenu",
	})
	SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("saveCoords", function(data, cb)
	if data ~= nil then
		TriggerServerEvent('nrrp_coords:saveCoords', data)
	end
    cb("ok")
end)

RegisterNUICallback("copiedClipboard", function(data, cb)
	exports['mythic_notify']:SendAlert('success', 'As coordenadas foram salvas na area de transferência')
    cb("ok")
end)

function openSaverMenu(x, y, z, h)
	local xpos, ypos, zpos, hpos = x, y, z, h
	local tmpTable = { ['x'] = x, ['y'] = y, ['z'] = z, ['h'] = h}
	SendNUIMessage({
		action = "openmenu",
		x = xpos,
		y = ypos,
		z = zpos,
		h = hpos,
		json = json.encode(tmpTable)
	})
	SetNuiFocus(true, true)
end

local showCoords = false
Citizen.CreateThread(function()
	local previousX = 0
    while true do
		Citizen.Wait(1)
		if characterLoaded then
			if showCoords then
				local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				if previousX ~= x then
					previousX = x
					roundx = tonumber(string.format("%.2f", x))
					roundy = tonumber(string.format("%.2f", y))
					roundz = tonumber(string.format("%.2f", z))				
					heading = GetEntityHeading(GetPlayerPed(-1))
					roundh = tonumber(string.format("%.2f", heading))
					local tmpTable = { ['x'] = roundx, ['y'] = roundy, ['z'] = roundz, ['h'] = roundh}
					SendNUIMessage({
						action = "updateCoords",
						x = roundx,
						y = roundy,
						z = roundz,
						h = roundh,
						json = json.encode(tmpTable)
					})
				end

				if IsControlJustPressed(0, 57) then
					openSaverMenu(roundx, roundy, roundz, roundh)
				end
			end

			if IsControlJustPressed(0, 57) then
				showCoords = not showCoords
				if showCoords then
					SendNUIMessage({
						action = "showCoords",
					})
				else
					SendNUIMessage({
						action = "hideCoords",
					})
				end
			end
		end
    end
end)
