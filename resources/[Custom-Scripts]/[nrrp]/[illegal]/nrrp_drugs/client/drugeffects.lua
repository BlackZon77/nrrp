RegisterNetEvent("esx_drugs:activate_meth")
AddEventHandler("esx_drugs:activate_meth",function()
    local ped = GetPlayerPed(-1)
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
		exports["nrrp_progbar"]:startUI(10000, "A fumar meth...")
		Citizen.Wait(10000)
		ClearPedTasks(PlayerPedId())
	else
		exports["nrrp_progbar"]:startUI(10000, "A fumar meth...")
		Citizen.Wait(10000)
	end	
    SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
    if GetEntityHealth(ped) <= 180 then
        SetEntityHealth(ped,GetEntityHealth(ped)+20)
    elseif GetEntityHealth(ped) <= 199 then
        SetEntityHealth(ped,200)
    end
	Citizen.Wait(10000)
    SetTimecycleModifier("default")
	SetPedMotionBlur(playerPed, false)
end)

RegisterNetEvent("esx_drugs:activate_weed")
AddEventHandler("esx_drugs:activate_weed",function()
    local ped = GetPlayerPed(-1)
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
		exports["nrrp_progbar"]:startUI(10000, "A fumar ganza...")
		Citizen.Wait(10000)
		ClearPedTasks(PlayerPedId())
	else
		exports["nrrp_progbar"]:startUI(10000, "A fumar ganza...")		
		Citizen.Wait(10000)
	end	
    SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
    if GetPedArmour(ped) <= 90 then
        AddArmourToPed(ped,10)
    elseif GetPedArmour(ped) <= 99 then
        SetPedArmour(ped,100)
    end
	Citizen.Wait(10000)
    SetTimecycleModifier("default")
	SetPedMotionBlur(playerPed, false)
end)

RegisterNetEvent("esx_drugs:activate_coke")
AddEventHandler("esx_drugs:activate_coke",function()
    local playerPed = PlayerId()
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true)
		exports["nrrp_progbar"]:startUI(10000, "A snifar coca...")
		Citizen.Wait(10000)
		ClearPedTasks(PlayerPedId())
	else
		exports["nrrp_progbar"]:startUI(10000, "A snifar coca...")		
		Citizen.Wait(10000)
	end
	local timer = 0
	while timer < 60 do
    SetRunSprintMultiplierForPlayer(playerPed,1.2)
    SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
	ResetPlayerStamina(PlayerId())
	Citizen.Wait(2000)
	timer = timer + 2
	end
    SetTimecycleModifier("default")
	SetPedMotionBlur(playerPed, false)
    SetRunSprintMultiplierForPlayer(playerPed,1.0)
end)

RegisterNetEvent("nrrp_drugs:UsableItem")
AddEventHandler("nrrp_drugs:UsableItem",function()
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
		TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_MOBILE', 0, true)
		exports["nrrp_progbar"]:startUI(8000, "A connectar...")
		Citizen.Wait(8000)
	else
		exports["nrrp_progbar"]:startUI(8000, "A connectar...")
		Citizen.Wait(8000)
	end
end)

RegisterNetEvent("nrrp_drugs:HackingMiniGame")
AddEventHandler("nrrp_drugs:HackingMiniGame",function()
	toggleHackGame()
end)

function toggleHackGame()
	TriggerEvent("mhacking:show")
	TriggerEvent("mhacking:start",6,30,AtmHackFirstSuccess) 
	FreezeEntityPosition(GetPlayerPed(-1),true)
end

function AtmHackFirstSuccess(success)
    FreezeEntityPosition(GetPlayerPed(-1),false)
    TriggerEvent('mhacking:hide')
	if success then
		ESX.TriggerServerCallback("nrrp_drugs:StartMissionNow",function()
		exports['mythic_notify']:SendAlert('success', 'Conseguiste com sucesso acessar á network')
		end)
    else
		exports['mythic_notify']:SendAlert('error', 'Falhaste ao hacker a network')
		ClearPedTasks(PlayerPedId())
	end
	ClearPedTasks(PlayerPedId())
end