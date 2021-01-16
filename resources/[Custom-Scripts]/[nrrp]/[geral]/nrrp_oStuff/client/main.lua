local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local ViewMode, Carry, TPM, HideHudComp, TPwithCar, attachedWeapons
-----------------------------------------------------------------
ViewMode = true            -- /streamon | /streamoff
Carry = true               -- /carry
TPM = true                 -- /tpm
TPwithCar = true           -- Teleports with or without cars
replacePlate = true        -- Replace Plate
attachedWeapons = true     -- Weapons Sling
disableDispatchAndVehicleRewards = true     -- Disable dispatch services
-----------------------------------------------------------------

----------- Teleport to waypoint /tpm
if TPM == true then
    RegisterCommand("tpm", function(source) TeleportToWaypoint() end)
end
----------- Carry
if Carry == true then
    local carryingBackInProgress = false
    local carryAnimNamePlaying = ""
    local carryAnimDictPlaying = ""
    local carryControlFlagPlaying = 0

    RegisterCommand("carry",function(source, args)
        if not carryingBackInProgress then
            local player = PlayerPedId()	
            lib = 'missfinale_c2mcs_1'
            anim1 = 'fin_c2_mcs_1_camman'
            lib2 = 'nm'
            anim2 = 'firemans_carry'
            distans = 0.15
            distans2 = 0.27
            height = 0.63
            spin = 0.0		
            length = 100000
            controlFlagMe = 49
            controlFlagTarget = 33
            animFlagTarget = 1
            local closestPlayer = GetClosestPlayer(3)
            target = GetPlayerServerId(closestPlayer)
            if closestPlayer ~= -1 and closestPlayer ~= nil then
                carryingBackInProgress = true
                TriggerServerEvent('CarryPeople:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
            else
                drawNativeNotification("Nenhuma pessoa perto de ti!")
            end
        else
            carryingBackInProgress = false
            ClearPedSecondaryTask(GetPlayerPed(-1))
            DetachEntity(GetPlayerPed(-1), true, false)
            local closestPlayer = GetClosestPlayer(3)
            target = GetPlayerServerId(closestPlayer)
            if target ~= 0 then 
                TriggerServerEvent("CarryPeople:stop",target)
            end
        end
    end,false)

    RegisterNetEvent('CarryPeople:syncTarget')
    AddEventHandler('CarryPeople:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
        local playerPed = GetPlayerPed(-1)
        local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
        carryingBackInProgress = true
        RequestAnimDict(animationLib)

        while not HasAnimDictLoaded(animationLib) do
            Citizen.Wait(10)
        end
        if spin == nil then spin = 180.0 end
        AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
        if controlFlag == nil then controlFlag = 0 end
        TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
        carryAnimNamePlaying = animation2
        carryAnimDictPlaying = animationLib
        carryControlFlagPlaying = controlFlag
    end)

    RegisterNetEvent('CarryPeople:syncMe')
    AddEventHandler('CarryPeople:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
        local playerPed = GetPlayerPed(-1)
        RequestAnimDict(animationLib)

        while not HasAnimDictLoaded(animationLib) do
            Citizen.Wait(10)
        end
        Wait(500)
        if controlFlag == nil then controlFlag = 0 end
        TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
        carryAnimNamePlaying = animation
        carryAnimDictPlaying = animationLib
        carryControlFlagPlaying = controlFlag
    end)

    RegisterNetEvent('CarryPeople:cl_stop')
    AddEventHandler('CarryPeople:cl_stop', function()
        carryingBackInProgress = false
        ClearPedSecondaryTask(GetPlayerPed(-1))
        DetachEntity(GetPlayerPed(-1), true, false)
    end)

    Citizen.CreateThread(function()
        while true do
            if carryingBackInProgress then
                while not IsEntityPlayingAnim(GetPlayerPed(-1), carryAnimDictPlaying, carryAnimNamePlaying, 3) do
                    TaskPlayAnim(GetPlayerPed(-1), carryAnimDictPlaying, carryAnimNamePlaying, 8.0, -8.0, 100000, carryControlFlagPlaying, 0, false, false, false)
                    Citizen.Wait(0)
                end
            end
            Wait(0)
        end
    end)
end
-------- Movie View
if ViewMode == true then
    local movieview = false
    local UI = {
        x = 0.000,
        y = -0.001,
    }

    RegisterCommand("streamon", function(source, args, rawCommand)
        movieview = true
        ExecuteCommand('toggleui')
    end, false)

    RegisterCommand("streamoff", function(source, args, rawCommand)
        movieview = false
        ExecuteCommand('toggleui')
    end, false)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
            if movieview then
                drawRct(UI.x + 0.0, 	UI.y + -0.10, 1.0,0.18,0,0,0,255) -- Top Bar
                drawRct(UI.x + 0.0, 	UI.y + 0.93, 1.0,0.151,0,0,0,255) -- Bottom Bar
            end
        end
    end)
end
--------- Teleports with car
if TPwithCar == true then
    key_to_teleport = 38
    positions = {
        {{322.95, 264.42, 103.39, 271.45}, {405.96, 243.92, 92.09, 78.48},{36,237,157}, "Garagem do Galaxy"}, -- Outside the Sheriff's Station
    }

    Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(5)
            local player = GetPlayerPed(-1)
            local playerLoc = GetEntityCoords(player)

            for _,location in ipairs(positions) do
                teleport_text = location[4]
                loc1 = {
                    x=location[1][1],
                    y=location[1][2],
                    z=location[1][3],
                    heading=location[1][4]
                }
                loc2 = {
                    x=location[2][1],
                    y=location[2][2],
                    z=location[2][3],
                    heading=location[2][4]
                }
                Red = location[3][1]
                Green = location[3][2]
                Blue = location[3][3]

                DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)
                DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)

                if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                    alert(teleport_text)

                    if IsControlJustReleased(1, key_to_teleport) then
                        if IsPedInAnyVehicle(player, true) then
                            SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                            SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                        else
                            SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                            SetEntityHeading(player, loc2.heading)
                        end
                    end

                elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                    alert(teleport_text)

                    if IsControlJustReleased(1, key_to_teleport) then
                        if IsPedInAnyVehicle(player, true) then
                            SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                            SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                        else
                            SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                            SetEntityHeading(player, loc1.heading)
                        end
                    end
                end
            end
        end
    end)
end

if replacePlate == true then
	imageUrl = "https://i.imgur.com/o5KTRgn.png" -- Paste your image URL here (doesn't have to be from imgur)

	local textureDic = CreateRuntimeTxd('duiTxd')
	for i = 1, 10 do

	    local object = CreateDui(imageUrl, 540, 300)
	    _G.object = object

	    local handle = GetDuiHandle(object)
	    local tx = CreateRuntimeTextureFromDuiHandle(textureDic, 'duiTex', handle)

	    AddReplaceTexture('vehshare', 'plate01', 'duiTxd', 'duiTex')

	end


	local textureDic = CreateRuntimeTxd('duiTxd')
	for i = 1, 10 do

	    local object = CreateDui('https://i.imgur.com/Q3uw6V7.png', 540, 300)-- this URL doesn't need to be edited, its just the 2d model for the plate
	    _G.object = object

	    local handle = GetDuiHandle(object)
	    local tx = CreateRuntimeTextureFromDuiHandle(textureDic, 'duiTex', handle)

	    AddReplaceTexture('vehshare', 'plate01_n', 'duiTxd', 'duiTex')

	end
end

if attachedWeapons == true then
	--[[
	List of weapons and hashes: https://wiki.rage.mp/index.php?title=Weapons
	List of all weapon components and hashes: https://wiki.rage.mp/index.php?title=Weapons_Components
	List of all bone ids (use the actual ID, not name.): https://wiki.gtanet.work/index.php?title=Bones
	]]

	local attached_weapons = {} -- Do NOT edit. Table for storing the attached weapons.
	local slingWeapons = true -- Is the functionality of the script enabled? Default: true
	local cfg = {
		-- Add weapons here with the specified format. If you don't want attachments to attach, leave the attachments table empty, eg. attachments = {}.
		validWeapons = {
			{hash = GetHashKey("WEAPON_ASSAULTRIFLE"), bone = 24816,  x = 0.20, y = 0.21, z = -0.001, xRot = 180.0, yRot = 145.0, zRot = -10.0, attachments = {0xBE5EEA16, 0xB1214F9B, 0xDBF0A53D, 0x7BC4CDDC, 0x9D2FBF29, 0xA73D4664, 0xC164F53, 0x4EAD7533}},
			{hash = GetHashKey("WEAPON_CARBINERIFLE"), bone = 24816,  x = 0.20, y = 0.21, z = -0.001, xRot = 180.0, yRot = 145.0, zRot = -10.0, attachments = {0x9FBE33EC, 0x91109691, 0xBA62E935, 0x7BC4CDDC, 0xA0D89C42, 0x837445AA, 0xC164F53, 0xD89B9658}},
			{hash = GetHashKey("WEAPON_PUMPSHOTGUN"), bone = 24816,  x = 0.075, y = -0.15, z = -0.02, xRot = 0.0, yRot = 0.0, zRot = 0.0, attachments = {0x7BC4CDDC, 0xE608B35E, 0xA2D79DDB}},
			{hash = GetHashKey("WEAPON_SMG"), bone = 24818, x = 0.20, y = 0.21, z = -0.001, xRot = 180.0, yRot = 145.0, zRot = -10.0, attachments = {0x26574997, 0x350966FB, 0x79C77076, 0x7BC4CDDC, 0x3CC6BA57, 0xC304849A, 0x27872C90}},
		}
	}

	-- I got very annoyed with weapons being stuck when restarting this script every 2 seconds, so here you go. Removes all weapons when restarting/stopping the script. Good riddance..
	AddEventHandler("onResourceStop", function(resource)
		if resource == GetCurrentResourceName() then
			DestroyWeapons()
		end
	end)

	-- Command for toggling the functionality of the script. Not sure why this would be needed. I guess if you are roleplaying hiding a rifle up your ass this might be useful?
	RegisterCommand("sling", function(source, args, rawCommand)
		slingWeapons = not slingWeapons
		if not slingWeapons then
			DestroyWeapons()
		end
		TriggerEvent("chat:addMessage", {
			color = {52, 152, 219},
			args = {"[Sling]", ("Slinged weapons %s^7."):format(slingWeapons and "^2enabled" or "^1disabled")}
		})
	end, false)

	Citizen.CreateThread(function()
		while true do
			-- If it's enabled, do this!
			if slingWeapons then
				local ped_l = PlayerPedId()
				-- Add Weapons
				for i = 1, #cfg.validWeapons, 1 do
					-- Begin by loading only hash and checking if player has that weapon.
					local hash = cfg.validWeapons[i].hash
					-- If player has weapon and it is not attached and not in the players hand then attach it.
					if HasPedGotWeapon(ped_l, hash, false) and not attached_weapons[hash] and not GetCurrentPedWeapon(ped_l, hash) then
						-- Load all additional information about the positions, rotations and attachments.
						local bone = cfg.validWeapons[i].bone -- Bone to attach weapon to
						local x = cfg.validWeapons[i].x
						local y = cfg.validWeapons[i].y --  Coordinates in relation to bone.
						local z = cfg.validWeapons[i].z
						local xRot = cfg.validWeapons[i].xRot
						local yRot = cfg.validWeapons[i].yRot --  Rotation in relation to bone.
						local zRot = cfg.validWeapons[i].zRot
						local attachments = cfg.validWeapons[i].attachments -- Attachments
						AttachWeapon(hash, bone, x, y, z, xRot, yRot, zRot, attachments)
					end
				end
				-- Remove Weapons
				for name, attached_object in pairs(attached_weapons) do
					-- If current weapon is in hand and on back or if player does not have weapon at all, remove it from the back.
					if GetSelectedPedWeapon(ped_l) == attached_object.hash or not HasPedGotWeapon(ped_l, attached_object.hash, false) then
						RemoveWeaponAsset(attached_object.handle)
						DeleteObject(attached_object.handle)
						attached_weapons[name] = nil
					end
				end
			end
			Wait(250)
		end
	end)

	-- Destroy all weapons on body.
	function DestroyWeapons()
		for name, attached_object in pairs(attached_weapons) do
			-- Clean up weapons
			RemoveWeaponAsset(attached_object.handle)
			DeleteObject(attached_object.handle)
			attached_weapons[name] = nil
		end
	end

	-- Attaches the weapon sent to the players character, including attachments.
	function AttachWeapon(modelHash, boneNumber, x, y, z, xRot, yRot, zRot, attachments)
		local bone = GetPedBoneIndex(PlayerPedId(), boneNumber)
		-- Load the weapon
		if not HasWeaponAssetLoaded(modelHash) then
			RequestWeaponAsset(modelHash)
			while not HasWeaponAssetLoaded(modelHash) do
				Wait(0)
			end
		end
		-- Insert into table
		attached_weapons[modelHash] = {
			hash = modelHash,
			handle = CreateWeaponObject(modelHash, GetAmmoInPedWeapon(PlayerPedId(), modelHash), 1.0, 1.0, 1.0, true, 1.0, 0) 
		}
		-- Check for attachments on weapon and attach the correct ones to the weapon object.
		for k, v in ipairs(attachments) do
			if HasPedGotWeaponComponent(PlayerPedId(), modelHash, v) then
				GiveWeaponComponentToWeaponObject(attached_weapons[modelHash].handle, v)
			end
		end
		-- Attach to player.
		AttachEntityToEntity(attached_weapons[modelHash].handle, PlayerPedId(), bone, x, y, z, xRot, yRot, zRot, 1, 1, 0, 0, 2, 1)
	end
end

if disableDispatchAndVehicleRewards == true then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            id = PlayerId()
            DisablePlayerVehicleRewards(id)	
        end
    end)

    local dispatchTypes = {
        DT_PoliceAutomobile = { ID = 1, ACTIVE = false },
        DT_PoliceHelicopter = { ID = 2, ACTIVE = false },
        DT_FireDepartment = { ID = 3, ACTIVE = false },
        DT_SwatAutomobile = { ID = 4, ACTIVE = false },
        DT_AmbulanceDepartment = { ID = 5, ACTIVE = false },
        DT_PoliceRiders = { ID = 6, ACTIVE = false },
        DT_PoliceVehicleRequest = { ID = 7, ACTIVE = false },
        DT_PoliceRoadBlock = { ID = 8, ACTIVE = false},
        DT_PoliceAutomobileWaitPulledOver = { ID = 9, ACTIVE = false },
        DT_PoliceAutomobileWaitCruising = { ID = 10, ACTIVE = false },
        DT_Gangs = { ID = 11, ACTIVE = false },
        DT_SwatHelicopter = { ID = 12, ACTIVE = false },
        DT_PoliceBoat = { ID = 13, ACTIVE = false },
        DT_ArmyVehicle = { ID = 14, ACTIVE = false },
        DT_BikerBackup = { ID = 15, ACTIVE = false }
    }

    Citizen.CreateThread(function()
        for i = 1, 12 do
            Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
        end
        
        while true do
            Wait(0)
            if NetworkIsPlayerActive(PlayerId()) then
                for k,v in pairs(dispatchTypes) do
                    EnableDispatchService(dispatchTypes[k].ID, dispatchTypes[k].ACTIVE)
                end
                SetMaxWantedLevel(0)
                break;
            end
        end
    end)
end