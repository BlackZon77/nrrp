local truckId      	        = nil
local jobStatus    		    = CONST_NOTWORKING
local currentRoute          = nil
local currentDestination    = nil
local routeBlip             = nil
local trailerId             = nil
local lastDropCoordinates   = nil
local totalRouteDistance    = nil

--
-- Threads
--

Citizen.CreateThread(function()
	NRRPHelper.CreateBlip(Config.JobStart.Coordinates, 'Camionista', Config.Blip.SpriteID, Config.Blip.ColorID, Config.Blip.Scale)

	while true do
		Citizen.Wait(0)

		local playerId             = PlayerPedId()
		local playerCoordinates    = GetEntityCoords(playerId)
		local distanceFromJobStart = GetDistanceBetweenCoords(playerCoordinates, Config.JobStart.Coordinates, false)
		local sleep                = 1000

		if distanceFromJobStart < Config.Marker.DrawDistance then
			sleep = 0
		
			DrawMarker(Config.Marker.Type, Config.JobStart.Coordinates, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.Size,  Config.Marker.Color.r, Config.Marker.Color.g, Config.Marker.Color.b, 100, false, true, 2, false, nil, nil, false)

			if distanceFromJobStart < Config.Marker.Size.x then

				if truckId and GetVehiclePedIsIn(playerId, false) == truckId and GetPedInVehicleSeat(truckId, -1) == playerId then
					NRRPHelper.ShowAlert('~INPUT_PICKUP~: para guardar o camião.', true)

					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('nrrp_trucking:returnTruck')

						abortJob()
					end
				elseif not IsPedInAnyVehicle(playerId, false) then
					NRRPHelper.ShowAlert('~INPUT_PICKUP~: para alugar o camião por ' .. Config.TruckRentalPrice .. ' €.', true)

					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('nrrp_trucking:rentTruck')
					end
				end
			end
		end

		if jobStatus ~= CONST_NOTWORKING then
			sleep = 0

			if jobStatus == CONST_WAITINGFORTASK then
				assignTask()
			elseif jobStatus == CONST_PICKINGUP then
				pickingUpThread(playerId, playerCoordinates)
			elseif jobStatus == CONST_DELIVERING then
				deliveringThread(playerId, playerCoordinates)
			end
		
			-- Abort Hotkey
			if IsControlJustReleased(0, Config.AbortKey) then
				abortJob()
			end
		end

		if sleep > 0 then
			Citizen.Wait(sleep)
		end
	end
end)

function pickingUpThread(playerId, playerCoordinates)
	if not trailerId and GetDistanceBetweenCoords(playerCoordinates, currentRoute.PickupCoordinates, true) < 100.0 then
		trailerId = NRRPHelper.SpawnVehicle(currentRoute.TrailerModel, currentRoute.PickupCoordinates, currentRoute.PickupHeading)
	end

	if trailerId and IsEntityAttachedToEntity(trailerId, truckId) then
		RemoveBlip(routeBlip)
		NRRPHelper.CreateRouteBlip(currentDestination)

		NRRPHelper.ShowNotification('Leva a embalagem ao ~y~ponto de entrega~s~.')

		jobStatus = CONST_DELIVERING
	end
end

function deliveringThread(playerId, playerCoordinates)
	local distanceFromDelivery = GetDistanceBetweenCoords(playerCoordinates, currentDestination, true)

	if distanceFromDelivery < Config.Marker.DrawDistance then
		DrawMarker(Config.Marker.Type, currentDestination, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.Size,  Config.Marker.Color.r, Config.Marker.Color.g, Config.Marker.Color.b, 100, false, true, 2, false, nil, nil, false)	
	
		if distanceFromDelivery < Config.Marker.Size.x then
			NRRPHelper.ShowAlert('~INPUT_PICKUP~: para descarregar a embalagem.', true)

			if IsControlJustReleased(0, 38) then
				TriggerServerEvent('nrrp_trucking:loadDelivered', totalRouteDistance)
				cleanupTask()
			end
		end
	end

	if trailerId and (not DoesEntityExist(trailerId) or not IsEntityAttachedToEntity(trailerId, truckId)) then
		if DoesEntityExist(trailerId) then
			DeleteVehicle(trailerId)
		end

		RemoveBlip(routeBlip)

		currentRoute        = nil
		currentDestination  = nil
		lastDropCoordinates = playerCoordinates

		NRRPHelper.ShowNotification('Perdeste a tua embalagem. Uma nova rota foi te assignada.')

		jobStatus = CONST_WAITINGFORTASK
	end
end

--
-- Functions
--

function cleanupTask()
	if DoesEntityExist(trailerId) then
		DeleteVehicle(trailerId)
	end

	RemoveBlip(routeBlip)

	trailerId          = nil
	routeBlip          = nil
	currentDestination = nil
	currentRoute       = nil

	jobStatus = CONST_WAITINGFORTASK
end

function abortJob()
	DoScreenFadeOut(500)
	Citizen.Wait(500)

	if truckId and DoesEntityExist(truckId) then
		DeleteVehicle(truckId)
	end

	if trailerId and DoesEntityExist(trailerId) then
		DeleteVehicle(trailerId)
	end

	if routeBlip then
		RemoveBlip(routeBlip)
	end

	truckId  		    = nil
	trailerId		    = nil
	routeBlip			= nil
	currentDestination  = nil
	currentRoute        = nil
	lastDropCoordinates = nil
	totalRouteDistance  = nil

	Citizen.Wait(500)
	DoScreenFadeIn(500)
end

function assignTask()
	currentRoute       = Config.Routes[math.random(1, #Config.Routes)]
	currentDestination = currentRoute.Destinations[math.random(1, #currentRoute.Destinations)]
	routeBlip          = NRRPHelper.CreateRouteBlip(currentRoute.PickupCoordinates)

	local distanceToPickup   = GetDistanceBetweenCoords(lastDropCoordinates, currentRoute.PickupCoordinates)
	local distanceToDelivery = GetDistanceBetweenCoords(currentRoute.PickupCoordinates, currentDestination)

	totalRouteDistance  = distanceToPickup + distanceToDelivery
	lastDropCoordinates = currentDestination

	NRRPHelper.ShowNotification('Dirige-te ao ~y~ponto de partida~s~ marcada no teu GPS.')

	jobStatus = CONST_PICKINGUP
end

--
-- Events
--

RegisterNetEvent('nrrp_trucking:startJob')
AddEventHandler('nrrp_trucking:startJob', function()
	local playerId = PlayerPedId()

	truckId = NRRPHelper.SpawnVehicle(Config.TruckModel, Config.JobStart.Coordinates, Config.JobStart.Heading)

	SetPedIntoVehicle(playerId, truckId, -1)

	lastDropCoordinates = Config.JobStart.Coordinates

	jobStatus = CONST_WAITINGFORTASK
end)