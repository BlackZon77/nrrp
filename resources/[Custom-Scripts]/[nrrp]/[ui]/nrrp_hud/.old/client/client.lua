ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

------------------------------------------ Toggle Hud
local toghud = true
RegisterCommand('toggleui', function(source, args, rawCommand)
    if toghud then 
        toghud = false
        SendNUIMessage({
            action = 'hidecar'
        })
    else
        toghud = true
        if IsPedInAnyVehicle(PlayerPedId()) then
            SendNUIMessage({
                action = 'showcar'
            })
        end
    end
end)

RegisterNetEvent('hud:toggleui')
AddEventHandler('hud:toggleui', function(show)
    if show == true then
        toghud = true
    else
        toghud = false
    end
end)
------------------------------------- Hunger ETC Stuff
Citizen.CreateThread(function()
    while true do

        if toghud == true then
            if not IsPedInAnyVehicle(PlayerPedId()) then
                DisplayRadar(0)
            else
                DisplayRadar(1)
            end
        else
            DisplayRadar(0)
        end 

        -- TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
        --     TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
        --         local myhunger = hunger.getPercent()
        --         local mythirst = thirst.getPercent()

                SendNUIMessage({
                    action = "updateStatusHud",
                    show = toghud,
                    -- hunger = myhunger,
                    -- thirst = mythirst,
                })
        --     end)
        -- end)
        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        -- local player = PlayerPedId()
        -- local health = (GetEntityHealth(player) - 100)
        -- local armor = GetPedArmour(player)
        -- local oxy = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 2.4

        SendNUIMessage({
            action = 'updateStatusHud',
            show = toghud,
            -- health = health,
            -- armour = armor,
            -- oxygen = oxy,
        })
        Citizen.Wait(200)
    end
end)

------------------------------------- Car Hud Stuff
local seatbeltIsOn = false
local seatbeltEjectSpeed = 45               -- Speed threshold to eject player (MPH)
local seatbeltEjectAccel = 100              -- Acceleration threshold to eject player (G's)

function CalculateTimeToDisplay()
    hour = GetClockHours()
    minute = GetClockMinutes()

    local obj = {}

    if hour <= 12 then
        obj.ampm = 'AM'
    elseif hour >= 13 then
        obj.ampm = 'PM'
        hour = hour - 12
    end

    if minute <= 9 then
        minute = "0" .. minute
    end

    obj.hour = hour
    obj.minute = minute

    return obj
end

function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function getCardinalDirectionFromHeading(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return "N" -- North
    elseif (heading >= 45 and heading < 135) then
        return "W" -- West
    elseif (heading >= 135 and heading < 225) then
        return "S" -- South
    elseif (heading >= 225 and heading < 315) then
        return "E" -- East
    end
end

function ToggleUI()
    showUi = not showUi

    if showUi then
        SendNUIMessage({
            action = 'hideui'
        })
        SendNUIMessage({
            action = 'hidecar'
        })
    else
        SendNUIMessage({
            action = 'showui'
        })
    
        if IsPedInAnyVehicle(PlayerPedId()) then
            SendNUIMessage({
                action = 'showcar'
            })
        end
    end
end


--General UI Updates
Citizen.CreateThread(function()
    Citizen.Wait(0)
    SendNUIMessage({
        action = 'showui'
    })

    while true do
        local player = PlayerPedId()
        currSpeed = GetEntitySpeed(GetVehiclePedIsIn(player))
        local speed
        local sign

        if ShouldUseMetricMeasurements() then
            speed = currSpeed * 3.6
            sign = 'KPH'
        else
            speed = currSpeed * 2.23694
            sign = 'MPH'
        end

        local time = CalculateTimeToDisplay()
        local heading = getCardinalDirectionFromHeading(GetEntityHeading(player))
        local pos = GetEntityCoords(player)
        local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
        local current_zone = GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z))

        SendNUIMessage({
            action = 'tick',
            show = IsPauseMenuActive(),
            time = time.hour .. ':' .. time.minute,
            ampm = time.ampm,
            direction = heading,
            street1 = GetStreetNameFromHashKey(var1),
            street2 = GetStreetNameFromHashKey(var2),
            area = current_zone,
            speed = math.ceil(speed),
            sign = sign
        })
        Citizen.Wait(200)
    end
end)

RegisterNetEvent('nrrp_hud:EnteredVehicle')
AddEventHandler('nrrp_hud:EnteredVehicle', function()
    SendNUIMessage({
        action = 'showcar'
    })

    local player = PlayerPedId()
    local veh = GetVehiclePedIsIn(player)

    local prevHp = GetEntityHealth(veh)

    DisplayRadar(true)
    seatbeltIsOn = false
    Citizen.CreateThread(function()
        local currSpeed = 0
        local prevVelocity = { x = 0.0, y = 0.0, z = 0.0 }
        while true do
            Citizen.Wait(0)
            local prevSpeed = currSpeed
            local position = GetEntityCoords(player)
            currSpeed = GetEntitySpeed(veh)
            if not seatbeltIsOn then
                local vehIsMovingFwd = GetEntitySpeedVector(veh, true).y > 1.0
                local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()
                if (vehIsMovingFwd and (prevSpeed > seatbeltEjectSpeed) and (vehAcc > (seatbeltEjectAccel * 9.81))) then
                    SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
                    SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                    Citizen.Wait(1)
                    SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                else
                    prevVelocity = GetEntityVelocity(veh)
                end
            else
                DisableControlAction(0, 75)
            end
        end
    end)

    Citizen.CreateThread(function()
        while IsPedInAnyVehicle(player) do
            Citizen.Wait(0)
            if IsControlJustReleased(0, 29) then
                local vehClass = GetVehicleClass(veh)
                if vehClass ~= 8 and vehClass ~= 13 and vehClass ~= 14 then
                    if seatbeltIsOn then
                        exports['mythic_notify']:SendAlert('inform', 'Cinto se segurança retirado')
                    else
                        exports['mythic_notify']:SendAlert('inform', 'Cinto se segurança posto')
                    end
                    seatbeltIsOn = not seatbeltIsOn
                    SendNUIMessage({
                        action = 'toggle-seatbelt'
                    })
                end
            end
        end
    end)

    Citizen.CreateThread(function()
        while IsPedInAnyVehicle(player) do
            Citizen.Wait(1000)
        end
        DisplayRadar(false)
        seatbeltIsOn = false
        SendNUIMessage({
            action = 'hidecar'
        })
    end)

    Citizen.CreateThread(function()
        while IsPedInAnyVehicle(player) do
            SendNUIMessage({
                action = 'update-fuel',
                fuel = math.ceil(GetVehicleFuelLevel(veh))
            })
            Citizen.Wait(5000)
        end
    end)
end)

RegisterNetEvent('nrrp_hud:EnteringVehicle')
AddEventHandler('nrrp_hud:EnteringVehicle', function(veh)
    seatbeltIsOn = false
    SendNUIMessage({
        action = "set-seatbelt",
        seatbelt = false
    })
end)


------------------------------------------ Hide GTA Components
Citizen.CreateThread(function()
    local isPauseMenu = false
    while true do
        Citizen.Wait(1)

		if IsPauseMenuActive() then -- ESC Key
			if not isPauseMenu then
				isPauseMenu = not isPauseMenu
				toghud = false
			end
		else
			if isPauseMenu then
				isPauseMenu = not isPauseMenu
				toghud = true
			end

            -- Wanted Stars
            if IsHudComponentActive(1) then 
                HideHudComponentThisFrame(1)
            end
            -- Cash
            if IsHudComponentActive(3) then 
                HideHudComponentThisFrame(3)
            end
            -- MP Cash
            if IsHudComponentActive(4) then 
                HideHudComponentThisFrame(4)
            end
            -- Vehicle Name
            if IsHudComponentActive(6) then 
                HideHudComponentThisFrame(6)
            end
            -- Area Name
            if IsHudComponentActive(7) then 
                HideHudComponentThisFrame(7)
            end
            -- Vehicle Class
            if IsHudComponentActive(8) then 
                HideHudComponentThisFrame(8)
            end
            -- Street Name
            if IsHudComponentActive(9) then 
                HideHudComponentThisFrame(9)
            end
            -- Cash Change
            if IsHudComponentActive(13) then 
                HideHudComponentThisFrame(13)
            end
            -- Save Game
            if IsHudComponentActive(17) then 
                HideHudComponentThisFrame(17)
            end
        end    

        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
        SetPedMinGroundTimeForStungun(PlayerPedId(), 6000)
    end
end)
