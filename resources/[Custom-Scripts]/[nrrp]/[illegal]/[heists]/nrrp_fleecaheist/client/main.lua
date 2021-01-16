ESX = nil

cachedData = {["banks"] = {}}
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent("esx:getSharedObject", function(obj)
			ESX = obj
		end)

		Citizen.Wait(0)
	end

	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(b)
	ESX.PlayerData = b
	ESX.TriggerServerCallback("nrrp_fleecaheist:getCurrentRobbery", function(c)
		if c then
			for d, e in pairs(c) do
				cachedData["banks"][d] = e["trolleys"]
				RobberyThread({["bank"] = d, ["trolleys"] = e["trolleys"]})
			end
		end
	end)
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    ESX.PlayerData["job"] = job
end)

RegisterNetEvent("nrrp_fleecaheist:eventHandler")
AddEventHandler("nrrp_fleecaheist:eventHandler", function(g, h)
	if g == "start_robbery" then
		RobberyThread(h)
	elseif g == "alarm_police" then
		TriggerEvent("chatMessage", "", {255, 0, 0}, Config.AlertInChatMessage .. h)

		if ESX.PlayerData["job"] and ESX.PlayerData["job"]["name"] == "police" then
			SetAudioFlag("LoadMPData", true)
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
			ESX.ShowNotification("Alguem está a tentar ~r~desencriptar ~s~a fechadura do banco - ~g~ " .. h .. ". ~s~Waypoint marcado.")

			local i = Config.Bank[h]
			SetNewWaypoint(i["start"]["pos"]["x"], i["start"]["pos"]["y"])

			local blip = AddBlipForCoord(i["start"]["pos"])
			SetBlipSprite(blip, 161)
			SetBlipScale(blip, 2.0)
			SetBlipColour(blip, 8)
			Citizen.CreateThread(function()
				local timer = GetGameTimer()
				while GetGameTimer() - timer < 60000 * 5 do
					Citizen.Wait(0)
				end
				RemoveBlip(blip)
			end)
		end
	else
	end
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)

	while true do
		local l = 500
		local m = PlayerPedId()
		local n = GetEntityCoords(m)

		for d, o in pairs(Config.Bank) do
			local p = GetDistanceBetweenCoords(n, o["start"]["pos"], true)

			if p <= 5.0 then
				l = 5

				if p <= 1.0 then
					local q, r =
					not cachedData["banks"][d],
					cachedData["hacking"] and "~r~Hacking..." or cachedData["banks"][d] and "~r~Roubo~s~ em progresso . . ." or "Clica ~INPUT_CONTEXT~ para começar a ~r~desencriptar~s~ a fechadura."
					ESX.ShowHelpNotification(r)
					if IsControlJustPressed(0, 38) then
						if q then
							TryHackingDevice(d)
						end
					end
				end
				DrawScriptMarker({
					["type"] = 6,
					["pos"] = o["start"]["pos"] - vector3(0.0, 0.0, 0.985),
					["r"] = 255,
					["g"] = 0,
					["b"] = 0
				})
			end
		end
		Citizen.Wait(l)
	end
end)