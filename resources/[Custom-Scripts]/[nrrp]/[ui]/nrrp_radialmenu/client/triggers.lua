-------------------------------- Props Stuff
RegisterNetEvent('props:mala');
RegisterNetEvent('props:gchuva');
RegisterNetEvent('props:cafe');
RegisterNetEvent('props:notepad');
AddEventHandler('props:mala', function() ExecuteCommand('e suitcase2') end)
AddEventHandler('props:gchuva', function() ExecuteCommand('e umbrella') end)
AddEventHandler('props:cafe', function() ExecuteCommand('e coffee') end)
AddEventHandler('props:notepad', function() ExecuteCommand('e notepad') end)

-------------------------------- Animations & Gestos Stuff
RegisterNetEvent('animgest:bracos');
RegisterNetEvent('animgest:nao');
RegisterNetEvent('animgest:palmas');
RegisterNetEvent('animgest:encostar');
RegisterNetEvent('animgest:cintura');
RegisterNetEvent('animgest:continencia');
RegisterNetEvent('animgest:teclar');
RegisterNetEvent('animgest:deitar');
RegisterNetEvent('animgest:manguito');
RegisterNetEvent('animgest:paz');
RegisterNetEvent('animgest:facepalm');
RegisterNetEvent('animgest:bolas');
RegisterNetEvent('animgest:fumar');
RegisterNetEvent('animgest:sentarchao');
RegisterNetEvent('animgest:sentarcadeira');
RegisterNetEvent('animgest:policia');
RegisterNetEvent('animgest:render');
AddEventHandler('animgest:bracos', function() ExecuteCommand('e crossarms') end)
AddEventHandler('animgest:nao', function() ExecuteCommand('e no') end)
AddEventHandler('animgest:palmas', function() ExecuteCommand('e cheer') end)
AddEventHandler('animgest:encostar', function() ExecuteCommand('e lean4') end)
AddEventHandler('animgest:cintura', function() ExecuteCommand('e wait') end)
AddEventHandler('animgest:continencia', function() ExecuteCommand('e salute') end)
AddEventHandler('animgest:teclar', function() ExecuteCommand('e type') end)
AddEventHandler('animgest:deitar', function() ExecuteCommand('e passout3') end)
AddEventHandler('animgest:manguito', function() ExecuteCommand('e finger') end)
AddEventHandler('animgest:paz', function() ExecuteCommand('e peace') end)
AddEventHandler('animgest:facepalm', function() ExecuteCommand('e facepalm') end)
AddEventHandler('animgest:bolas', function() ExecuteCommand('e damn') end)
AddEventHandler('animgest:fumar', function() ExecuteCommand('e smoke') end)
AddEventHandler('animgest:sentarchao', function() ExecuteCommand('e sit') end)
AddEventHandler('animgest:sentarcadeira', function() ExecuteCommand('e sitchair') end)
AddEventHandler('animgest:policia', function() ExecuteCommand('e cop3') end)
AddEventHandler('animgest:render', function() ExecuteCommand('e surrender') end)


-------------------------------- Other Stuff
RegisterNetEvent('FlipVehicle')
AddEventHandler('FlipVehicle', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vehicle = nil
    if IsPedInAnyVehicle(ped, false) then vehicle = GetVehiclePedIsIn(ped, false) else vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71) end
        if DoesEntityExist(vehicle) then
        exports['mythic_progbar']:Progress({
            name = "flipping_vehicle",
            duration = 5000,
            label = "A virar veículo",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "random@mugging4",
                anim = "struggle_loop_b_thief",
                flags = 49,
            }
        }, function(status)

            local playerped = PlayerPedId()
            local coordA = GetEntityCoords(playerped, 1)
            local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
            local targetVehicle = getVehicleInDirection(coordA, coordB)
            SetVehicleOnGroundProperly(targetVehicle)
        end)
    else
        exports['mythic_notify']:SendAlert('error', 'Nenhum veículo ao pé de ti', 7000)
    end
end)


RegisterNetEvent('general:sellcar')
RegisterNetEvent('general:ccver')
RegisterNetEvent('general:ccdar')
AddEventHandler('general:sellcar', function() ExecuteCommand('vendercarro') end)
AddEventHandler('general:ccver', function() TriggerServerEvent('nrrp_idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId())) end)
AddEventHandler('general:ccdar', function() local player = ESX.Game.GetClosestPlayer() TriggerServerEvent('nrrp_idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player)) end)

RegisterNetEvent('medic:reanimar')
AddEventHandler('medic:reanimar', function() ExecuteCommand('reanimar') end)
RegisterNetEvent('medic:curarferidaspequenas')
AddEventHandler('medic:curarferidaspequenas', function() ExecuteCommand('curarferidaspequenas') end)
RegisterNetEvent('medic:tratarferidasgraves')
AddEventHandler('medic:tratarferidasgraves', function() ExecuteCommand('tratarferidasgraves') end)
RegisterNetEvent('medic:colocarnoveiculo')
AddEventHandler('medic:colocarnoveiculo', function() ExecuteCommand('colocarnoveiculo') end)
RegisterNetEvent('medic:procurarcidadao')
AddEventHandler('medic:procurarcidadao', function() ExecuteCommand('procurarcidadao') end)

RegisterNetEvent('mech:bills')
AddEventHandler('mech:bills', function() ExecuteCommand('faturas') end)
RegisterNetEvent('mech:cleanvehicle')
AddEventHandler('mech:cleanvehicle', function() ExecuteCommand('limparveiculo') end)
RegisterNetEvent('mech:repairveh')
AddEventHandler('mech:repairveh', function() ExecuteCommand('repararcarro') end)
RegisterNetEvent('mech:removeveh')
AddEventHandler('mech:removeveh', function() ExecuteCommand('delveiculo') end)
RegisterNetEvent('mech:ferramentas')
AddEventHandler('mech:ferramentas', function() ExecuteCommand('ferramentas') end)
RegisterNetEvent('mech:trolley')
AddEventHandler('mech:trolley', function() ExecuteCommand('trolley') end)
RegisterNetEvent('mech:cone')
AddEventHandler('mech:cone', function() ExecuteCommand('cone') end)
