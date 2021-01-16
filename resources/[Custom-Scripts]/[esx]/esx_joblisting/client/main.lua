local menuIsShowed, hasAlreadyEnteredMarker, isInMarker = false, false, false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function ShowJobListingMenu()
	ESX.TriggerServerCallback('esx_joblisting:getJobsList', function(jobs)
		local elements = {}

		for i=1, #jobs, 1 do
			table.insert(elements, {
				label = jobs[i].label,
				job   = jobs[i].job
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'joblisting', {
			title    = _U('job_center'),
			align = 'left',
			elements = elements
		}, function(data, menu)
			local contractTime = 7000
			exports["nrrp_progbar"]:startUI(contractTime, "A assinar contrato de trabalho")
			Wait(contractTime)

			TriggerServerEvent('esx_joblisting:setJob', data.current.job)
			exports['mythic_notify']:SendAlert('inform', 'Tens agora um novo emprego')
			menu.close()
		end, function(data, menu)
			menu.close()
		end)

	end)
end

AddEventHandler('esx_joblisting:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- Activate menu when player is inside marker, and draw markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		local coords = GetEntityCoords(PlayerPedId())
		local textCoords = vector3(-1082.03, -247.82, 38.76)
		isInMarker = false

		for i=1, #Config.Zones, 1 do
			local distance = GetDistanceBetweenCoords(coords, Config.Zones[i], true)

			if distance < Config.DrawDistance then
				DrawMarker(Config.MarkerType, Config.Zones[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end

			ESX.Game.Utils.DrawText3D(textCoords, _U('access_job_center'), 1, 0)

			if distance < (Config.ZoneSize.x / 2) then
				isInMarker = true
				-- ESX.ShowHelpNotification(_U('access_job_center'))
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_joblisting:hasExitedMarker')
		end
	end
end)





-- Create blips
Citizen.CreateThread(function()
	for i=1, #Config.Zones, 1 do
		local blip = AddBlipForCoord(Config.Zones[i])

		SetBlipSprite (blip, 407)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 27)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName(_U('job_center'))
		EndTextCommandSetBlipName(blip)
	end
end)

-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, 38) and isInMarker and not menuIsShowed then
			ESX.UI.Menu.CloseAll()
			ShowJobListingMenu()
		end
	end
end)
