NRRP.Commands = {}
local NRRPCMD = NRRP.Commands
NRRPCMD.ESX = NRRP.ESX

ESX = nil
Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end while ESX.GetPlayerData().job == nil do Citizen.Wait(10) end ESX.PlayerData = ESX.GetPlayerData() end)

function NRRPCMD:Start()
	if not self then return; end
	while not ESX do Citizen.Wait(100); end
	self.ESX = ESX
	while not ESX.IsPlayerLoaded() do Citizen.Wait(100); end
	print("nrrp_Commands:Start() - Successful")
	self.Started = 1
end

--------------------------------------------------- Comando 1 >> Veículos Extras
function ToggleVehicleExtra(vehicle, extraId, extraState) SetVehicleExtra(vehicle, extraId, extraState) end
function GetExtraLabel(state) if state then return '<span style="color:green;">ON</span>' elseif not state then return '<span style="color:darkred;">OFF</span>' end end
function NRRPCMD:VHExtras()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local availableExtras = {}

    if not DoesEntityExist(vehicle) then return end

    for i=0, 12 do
        if DoesExtraExist(vehicle, i) then
            local state = IsVehicleExtraTurnedOn(vehicle, i) == 1

            table.insert(availableExtras, {
                label = ('Extra <span style="color:darkgoldenrod;">%s</span>: %s'):format(i, GetExtraLabel(state)),
                state = state,
                extraId = i
            })
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_extras', {
        title    = 'Veículos - Extras',
        align    = 'left',
        elements = availableExtras
    }, function(data, menu)
        ToggleVehicleExtra(vehicle, data.current.extraId, data.current.state)
		menu.close()
        NRRPCMD:VHExtras()
    end, function(data, menu)
        menu.close()
    end)
end
--------------------------------------------------- Comando 2 >> Veículos Neons
local isOn	=	false
function NRRPCMD:ToggleNeon()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if isOn then
            SetVehicleNeonLightEnabled(veh, 0, false)
            SetVehicleNeonLightEnabled(veh, 1, false)
            SetVehicleNeonLightEnabled(veh, 2, false)
            SetVehicleNeonLightEnabled(veh, 3, false)
			isOn = false
        else
            SetVehicleNeonLightEnabled(veh, 0, true)
            SetVehicleNeonLightEnabled(veh, 1, true)
            SetVehicleNeonLightEnabled(veh, 2, true)
            SetVehicleNeonLightEnabled(veh, 3, true)
			isOn = true
        end
    end
end

RegisterCommand('livery', function(source, args)

	if ESX.PlayerData and ESX.PlayerData.job and ESX.PlayerData.job.name == "police" or ESX.PlayerData.job.name == "ambulance" then
		local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
		local liveryID = tonumber(args[1])

		SetVehicleLivery(Veh, liveryID)
	end
end, false)

--------------------------------------------------- Comando 3 >> Comandos de Ajuda

RegisterCommand ("comandos", function()
    msg ("Comandos Servidor:")
    msg ("/candidaturas, /me, /report, /discord")
end, false)

RegisterCommand ("ajuda", function()
    msg ("Se precisas de AJUDA faz /report e um STAFF irá te ajudar!")
end, false)

RegisterCommand ("candidaturas", function()
    msg ("Entra no nosso forum!")
    msg ("https://novarepublicarp.com/")
end, false)

RegisterCommand ("discord", function()
    msg ("Entra no nosso discord!")
    msg ("https://discord.gg/N3PX4uK")
end, false)

function msg(text) TriggerEvent ("chatMessage", "[NRRP AJUDA]", {0,97,255}, text) end

RegisterCommand('vextras', function(source, args) NRRPCMD:VHExtras(args); end)
RegisterCommand('neon', function() NRRPCMD:ToggleNeon(); end)

Citizen.CreateThread(function() TriggerEvent('chat:addSuggestion', "/neon", "Liga e Desliga os neons do carro") end)
Citizen.CreateThread(function(...) NRRPCMD:Start(...); end)