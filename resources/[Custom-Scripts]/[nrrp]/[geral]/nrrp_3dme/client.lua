-----------
-- 3D ME --
-----------

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/me', 'Mostrar ações, espressões etc.')
end)

local nbrDisplaying = 1

RegisterCommand('me', function(source, args, raw)
    local text = string.sub(raw, 4)
    TriggerServerEvent('nnrp_3dme:shareDisplay', text)
end)

RegisterNetEvent('nnrp_3dme:triggerDisplay')
AddEventHandler('nnrp_3dme:triggerDisplay', function(text, source)
    local offset = 1 + (nbrDisplaying*0.15)
    Display(GetPlayerFromServerId(source), text, offset)
end)

function Display(mePlayer, text, offset)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(5000)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z']+offset-0.750, text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DrawText3D(x,y,z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
		local factor = (string.len(text)) / 370
		DrawRect(_x,_y+0.0125, 0.015+ factor, 0.022, 40, 11, 41, 68)
    end
end






local actions = {}

function chatMessage(prefix, message)
    TriggerEvent('chat:addMessage', {
      color = { 255, 0, 0},
      multiline = true,
      args = {prefix, message}
    })
end

function Draw3DText(x, y, z, text, color)

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.25*scale, 1.0*scale)
        SetTextFont(0)
        SetTextProportional(1)
        --SetTextScale(0.0, 0.55)
        SetTextColour(color.r, color.g, color.b, color.a)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function findClosestAction(x, y, z)

    local closestAction = 1000
    local closestIndex = 0
    local closestValue = nil

    for k, v in pairs(actions) do

        local dist = GetDistanceBetweenCoords(x, y, z, v.x, v.y, v.z, false)
        if dist < closestAction then
            closestAction = dist
            closestIndex = k
            closestValue = v
        end
    end

    if closestAction < 7.5 then
        return { closestIndex, closestValue }
    else
        return nil
    end
end

RegisterCommand('acao', function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerPed)

    TriggerServerEvent('staticAction:server:actionCommand', coords, args, playerPed)
end)

RegisterCommand('raacao', function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1)
    local x, y, z = table.unpack(GetEntityCoords(playerPed))
    local closestAction = findClosestAction(x, y, z)

    if closestAction ~= nil then
        if closestAction[2].pid == playerPed then
            TriggerServerEvent('staticAction:server:ractionCommand', closestAction[1])
        else
            chatMessage('ERRO', '~r~Esta acao nao te pertence!')
        end
    else
        chatMessage('ERRO', '~r~Nenhuma acao encontrada.')
    end
end)

RegisterNetEvent('staticAction:client:actionCommand')
AddEventHandler('staticAction:client:actionCommand', function(coords, args, pid)

    local msg = table.concat(args, ' ')
    local data = { pid = pid, x = coords.x, y = coords.y, z = coords.z, action = msg, color = { r = 0, g = 255, b = 0, a = 255 }, time = 30 }

    if msg == '' then
        chatMessage('ERRO', '~r~Acao Invalida!')
    else
        table.insert(actions, data)
    end
end)

RegisterNetEvent('staticAction:client:ractionCommand')
AddEventHandler('staticAction:client:ractionCommand', function(action)
    table.remove(actions, action)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k, v in pairs(actions) do
            Draw3DText(v.x, v.y, v.z, v.action, v.color)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        for k, v in pairs(actions) do

            if v.time == 30 then
                v.color = { r = 0, g = 255, b = 0, a = 255 }
            elseif v.time == 20 then
                v.color = { r = 255, g = 255, b = 0, a = 255 }
            elseif v.time == 10 then
                v.color = { r = 255, g = 00, b = 0, a = 255 }
            elseif v.time == 0 then
                table.remove(actions, k)
            end

            v.time = v.time - 1
        end
    end
end)
