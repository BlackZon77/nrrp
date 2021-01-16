ESX = nil
local display = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

function OpenMenu()
	ESX.TriggerServerCallback('nrrp_myinfo:obterinfo', function(thongtin) 
		local gioitinhod = thongtin[1].sex
		if gioitinhod == "m" then
			gioitinhthat = "Homem"
		else
			gioitinhthat = "Mulher"
		end

		SendNUIMessage({
			playerid       	= thongtin[1].playerid,
			name       		= thongtin[1].name,
			sex      		= gioitinhthat,
			height			= thongtin[1].height,
			dateofbirth 	= thongtin[1].dateofbirth,
			job 			= thongtin[1].job,
			phone_number	= thongtin[1].phone_number,
			money 			= ESX.Math.GroupDigits(thongtin[1].money),
			bank 			= ESX.Math.GroupDigits(thongtin[1].bank),
			black_money 	= ESX.Math.GroupDigits(thongtin[1].black_money),
			display = true
		})

		SetNuiFocus(true, true)
	end)
end 

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
end)

RegisterCommand("minhainfo", function(source, args, raw)
	OpenMenu()
end, false)

function round(num, numDecimalPlaces)
	local mult = 10^(2)
	return math.floor(num * mult + 0.5) / mult
end