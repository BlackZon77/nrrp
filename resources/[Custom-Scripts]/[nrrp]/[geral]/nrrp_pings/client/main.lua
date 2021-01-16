Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

BZCore = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if BZCore == nil then
            TriggerEvent('BZCore:GetObject', function(obj) BZCore = obj end)
            Citizen.Wait(200)
        end
    end
end)

local pendingPing = nil
local isPending = false

function AddBlip(bData)
    pendingPing.blip = AddBlipForCoord(bData.x, bData.y, bData.z)
    SetBlipSprite(pendingPing.blip, bData.id)
    SetBlipAsShortRange(pendingPing.blip, true)
    SetBlipScale(pendingPing.blip, bData.scale)
    SetBlipColour(pendingPing.blip, bData.color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(bData.name)
    EndTextCommandSetBlipName(pendingPing.blip)

    pendingPing.count = 0
end

function TimeoutPingRequest()
    Citizen.CreateThread(function()
        local count = 0
        while isPending do
            count = count + 1
            if count >= Config.Timeout and isPending then
                exports['mythic_notify']:SendAlert('inform', 'Ping de ' .. pendingPing.name .. ' Timed Out')
                TriggerServerEvent('nrrp_pings:server:SendPingResult', pendingPing.id, 'timeout')
                pendingPing = nil
                isPending = false
            end
            Citizen.Wait(1000)
        end
    end)
end

function TimeoutBlip()
    Citizen.CreateThread(function()
        while pendingPing ~= nil do
            if pendingPing.count ~= nil then
                if pendingPing.count >= Config.BlipDuration then
                    RemoveBlip(pendingPing.blip)
                    pendingPing = nil
                else
                    pendingPing.count = pendingPing.count + 1
                end
            end
            Citizen.Wait(1000)
        end
    end)
end

function RemoveBlipDistance()
    local player = PlayerPedId()
    Citizen.CreateThread(function()
        while pendingPing ~= nil do
            local plyCoords = GetEntityCoords(player)
            local dist = math.floor(#(vector2(pendingPing.pos.x, pendingPing.pos.y) - vector2(plyCoords.x, plyCoords.y)))

            if dist < Config.DeleteDistance then
                RemoveBlip(pendingPing.blip)
                pendingPing = nil
            else
                Citizen.Wait(math.floor((dist - Config.DeleteDistance) * 30))
            end
        end
    end)
end

RegisterNetEvent('nrrp_pings:client:SendPing')
AddEventHandler('nrrp_pings:client:SendPing', function(sender, senderId)
	if not exports['police']:IsHandcuffed() then
		if pendingPing == nil then
			pendingPing = {}
			pendingPing.id = senderId
			pendingPing.name = sender
			pendingPing.pos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(pendingPing.id)), false) 

			TriggerServerEvent('nrrp_pings:server:SendPingResult', pendingPing.id, 'enviado')
			exports['mythic_notify']:SendAlert('inform', pendingPing.name .. ' Enviou-te um ping, Usa /ping aceitar para Aceitar', (Config.Timeout * 1000))
			isPending = true

			if Config.Timeout > 0 then
				TimeoutPingRequest()
			end

		else
			exports['mythic_notify']:SendAlert('inform', sender .. ' Tentou te enviar um ping')
			TriggerServerEvent('nrrp_pings:server:SendPingResult', senderId, 'indesponivel')
		end
	else
        BZCore.Functions.Notify('Por enquanto não podes enviar pings.', 'error')
    end
end)

RegisterNetEvent('nrrp_pings:client:AcceptPing')
AddEventHandler('nrrp_pings:client:AcceptPing', function()
	if not exports['police']:IsHandcuffed() then
		if isPending then
			local playerBlip = { name = pendingPing.name, color = Config.BlipColor, id = Config.BlipIcon, scale = Config.BlipScale, x = pendingPing.pos.x, y = pendingPing.pos.y, z = pendingPing.pos.z }
			AddBlip(playerBlip)

			if Config.RouteToPing then
				SetNewWaypoint(pendingPing.pos.x, pendingPing.pos.y)
			end

			if Config.Timeout > 0 then
				TimeoutBlip()
			end

			if Config.DeleteDistance > 0 then
				RemoveBlipDistance()
			end

			exports['mythic_notify']:SendAlert('inform', 'Localização de '.. pendingPing.name .. ' marcada no mapa')
			TriggerServerEvent('nrrp_pings:server:SendPingResult', pendingPing.id, 'aceitar')
			isPending = false
		else
			exports['mythic_notify']:SendAlert('inform', 'Não tens nenhum ping pendente')
		end
	else
        BZCore.Functions.Notify('Por enquanto não podes enviar pings.', 'error')
    end
end)

RegisterNetEvent('nrrp_pings:client:RejectPing')
AddEventHandler('nrrp_pings:client:RejectPing', function()
	if not exports['police']:IsHandcuffed() then
		if pendingPing ~= nil then
			exports['mythic_notify']:SendAlert('inform', 'Ping rejeitado de ' .. pendingPing.name)
			TriggerServerEvent('nrrp_pings:server:SendPingResult', pendingPing.id, 'rejeitado')
			pendingPing = nil
			isPending = false
		else
			exports['mythic_notify']:SendAlert('inform', 'Não tens nenhum ping pendente')
		end
	else
        BZCore.Functions.Notify('Por enquanto não podes enviar pings.', 'error')
    end
end)

RegisterNetEvent('nrrp_pings:client:RemovePing')
AddEventHandler('nrrp_pings:client:RemovePing', function()
	if not exports['police']:IsHandcuffed() then
		if pendingPing ~= nil then
			RemoveBlip(pendingPing.blip)
			pendingPing = nil
			exports['mythic_notify']:SendAlert('inform', 'Ping removido')
		else
			exports['mythic_notify']:SendAlert('inform', 'Não tens nenhum ping pendente')
		end
	else
        BZCore.Functions.Notify('Por enquanto não podes enviar pings.', 'error')
    end
end)