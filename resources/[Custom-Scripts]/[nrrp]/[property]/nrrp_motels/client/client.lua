local ESX = nil
local myMotel = false
local curMotel = nil
local curRoom = nil
local curRoomOwner = false
local inRoom = false
local roomOwner = nil
local playerIdent = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	ESX.PlayerData = ESX.GetPlayerData()
    createBlips()
    playerIdent = ESX.GetPlayerData().identifier
end)


function createBlips()
    for k,v in pairs(Config.Zones) do
        local blip = AddBlipForCoord(tonumber(v.Pos.x), tonumber(v.Pos.y), tonumber(v.Pos.z))
		SetBlipSprite(blip, v.Pos.sprite)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, v.Pos.size)
		SetBlipColour(blip, v.Pos.color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.Name)
		EndTextCommandSetBlipName(blip)
    end
end

function getMyMotel()
    ESX.TriggerServerCallback('nrrp_motels:checkOwnership', function(owned)
        myMotel = owned
    end)
end

RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
    if instance.type == 'motelroom' then
        roomOwner = ESX.GetPlayerData().identifier
		TriggerEvent('instance:enter', instance)
	end
end)

RegisterNetEvent('nrrp_motels:cancelRental')
AddEventHandler('nrrp_motels:cancelRental', function(room)
    local motelName = nil
    local motelRoom = nil
    for k,v in pairs(Config.Zones) do
        for kk,vm in pairs(v.Rooms) do       
            if room == vm.instancename then
                motelName = v.Name
                motelRoom = vm.number
            end
        end
    end
    TriggerServerEvent("nrrp_motels:cancelRental", room)
    TriggerEvent("mythic_progbar:client:progress", {
        name = "renting_motel",
        duration = 2000,
        label = "A cancelar o contrato do quarto #"..motelRoom,
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
        },
        animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
			anim = "idle_a",
        },
        prop = {
            model = "prop_notepad_01"	
        }
	}, function(status)
        if not status then
            myMotel = false
        end
	end)
end)

function PlayerDressings()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room', {
		title    = 'Vestuário',
		align    = 'left',
		elements = {
            {label = _U('player_clothes'), value = 'player_dressing'},
	        {label = _U('remove_cloth'), value = 'remove_cloth'}
        }
	}, function(data, menu)
		if data.current.value == 'player_dressing' then 
            menu.close()
			ESX.TriggerServerCallback('nrrp_motels:getPlayerDressing', function(dressing)
				elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing',
				{
					title    = _U('player_clothes'),
					align    = 'left',
					elements = elements
				}, function(data2, menu2)
					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('nrrp_motels:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data2.current.value)
					end)
				end, function(data2, menu2)
					menu2.close()
				end)
			end)
		elseif data.current.value == 'remove_cloth' then
            menu.close()
			ESX.TriggerServerCallback('nrrp_motels:getPlayerDressing', function(dressing)
				elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
					title    = _U('remove_cloth'),
					align    = 'left',
					elements = elements
				}, function(data2, menu2)
					menu2.close()
					TriggerServerEvent('nrrp_motels:removeOutfit', data2.current.value)
					ESX.ShowNotification(_U('removed_cloth'))
				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		end
	end, function(data, menu)
        menu.close()
	end)
end

RegisterNetEvent('instance:onEnter')
AddEventHandler('instance:onEnter', function(instance)
    if instance.type == 'motelroom' then
		local property = instance.data.property
		local motel = instance.data.motel
		local isHost   = GetPlayerFromServerId(instance.host) == PlayerId()
		Citizen.Wait(1000)
		SetNoiseoveride(true)
		local networkChannel = instance.data.vid
		NetworkSetVoiceChannel(networkChannel)
		NetworkSetTalkerProximity(30.0)
	end
end)

AddEventHandler('instance:loaded', function()
    TriggerEvent('instance:registerType', 'motelroom', function(instance)
        EnterProperty(instance.data.property, instance.data.owner, instance.data.motel, instance.data.room)
    end, function(instance)
        SetNoiseoveride(false)
        Citizen.InvokeNative(0xE036A705F989E049)
		ExitProperty(instance.data.property, instance.data.motel, instance.data.room)
	end)
end)

function EnterProperty(name, owner, motel, room)
    curMotel      = motel
    curRoom       = room
    inRoom        = true
    local playerPed     = PlayerPedId() 
    Citizen.CreateThread(function()
		DoScreenFadeOut(800)
		while not IsScreenFadedOut() do
			Citizen.Wait(1)
        end
        for k,v in pairs(Config.Zones) do     
                if curMotel == k then
                    SetEntityCoords(playerPed, v.roomLoc.x, v.roomLoc.y, v.roomLoc.z)
                end
        end
		DoScreenFadeIn(800)
	end)
end

RegisterNetEvent('nrrp_motels:enterRoom')
AddEventHandler('nrrp_motels:enterRoom', function(room, motel)
    local roomID = nil
    local playerPed = PlayerPedId()
    local roomIdent = room
    local reqmotel = motel
    ESX.TriggerServerCallback('nrrp_motels:getMotelRoomID', function(roomno)
    roomID = roomno
    end, room)
    Citizen.Wait(500)
    if roomID ~= nil then
    local instanceid = 'motel'..roomID..''..roomIdent
        TriggerEvent('instance:create', 'motelroom', {property = instanceid, owner = ESX.GetPlayerData().identifier, motel = reqmotel, room = roomIdent, vid = roomID})
    end
end)

RegisterNetEvent('nrrp_motels:exitRoom')
AddEventHandler('nrrp_motels:exitRoom', function(motel, room)
    local roomID = room
    local playerPed = PlayerPedId()
    Citizen.Wait(500)
    roomOwner = nil
    TriggerEvent('instance:leave')
end)

RegisterNetEvent('nrrp_motels:roomOptions')
AddEventHandler('nrrp_motels:roomOptions', function(room, motel)
    local motelName = nil
    local motelRoom = nil
    for k,v in pairs(Config.Zones) do
        for kk,vm in pairs(v.Rooms) do       
            if room == vm.instancename then
                motelName = v.Name
                motelRoom = vm.number
            end
        end
    end
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'nrrp_motels',
        {
            title    = motelName..'Quarto #'..motelRoom,
            align    = 'left',
            elements = { 
                { label = 'Entrar no Quarto', value = 'enter' },
                { label = 'Cancelar Renda', value = 'cancel' }
            }
        },
    function(data, entry)
        local value = data.current.value

        if value == 'enter' then
            entry.close()
            TriggerEvent("nrrp_motels:enterRoom", room, motel)

        elseif value == 'cancel' then
            entry.close()
            TriggerEvent("nrrp_motels:cancelRental", room)
        end

    end,
    function(data, entry)
        entry.close()
    end)
end)


RegisterNetEvent('nrrp_motels:roomMenu')
AddEventHandler('nrrp_motels:roomMenu', function(room, motel)
    local motelName = nil
    local motelRoom = nil
    local roomID = nil
    local owner = ESX.GetPlayerData().identifier
    for k,v in pairs(Config.Zones) do
        for kk,vm in pairs(v.Rooms) do       
            if room == vm.instancename then
                motelName = v.Name
                motelRoom = vm.number
            end
        end
    end
   
	options = {}

	if Config.SwitchCharacterSup then
		table.insert(options, {label = 'Change Character', value = 'changechar'})
	end
		table.insert(options, {label = 'Sair do Quarto', value = 'leaveroom'})
	if roomOwner == playerIdent then
		table.insert(options, {label = 'Abrir armário', value = 'inventory'})
		table.insert(options, {label = 'Convidar pessoas', value = 'inviteplayer'})
	end
        
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'nrrp_motels',
        {
            title    = motelName..' Quarto  #'..motelRoom,
            align    = 'left',
            elements = options
        }, function(data, menu)
		local value = data.current.value
        if value == 'changechar' then
            menu.close()
            TriggerServerEvent("kashactersS:SaveSwitchedPlayer")
            TriggerEvent("mythic_progbar:client:progress", {
                name = "renting_motel",
                duration = 2000,
                label = "Leaving the City",
                useWhileDead = true,
                canCancel = false,
                controlDisables = {
					disableMovement = false,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
			},
        }, function(status)
			if not status then
				TriggerEvent('kashactersC:ReloadCharacters')
			end
        end)
        elseif value == 'leaveroom' then
			menu.close()
			TriggerEvent('nrrp_motels:exitRoom', curMotel, curRoom)
        elseif value == 'inventory' then
            menu.close()
            owner = ESX.GetPlayerData().identifier
			if roomOwner == owner then
				TriggerEvent("mythic_progbar:client:progress", {
					name = "renting_motel",
					duration = 1500,
					label = "A abrir portas do armário",
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
							disableMovement = true,
							disableCarMovement = false,
							disableMouse = false,
							disableCombat = true,
					},
				}, function(status)
					if not status then
						OpenPropertyInventoryMenu('motels', ESX.GetPlayerData().identifier)
					end
				end)    
			else
				TriggerClientEvent('esx:showNotification', '~w~Apenas acessivel pelo ~r~dono~w~ do quarto!')  
			end
        elseif value == 'inviteplayer' then
            local myInstance = nil
            local roomIdent = room
            local reqmotel = motel
            
            for k,v in pairs(Config.Zones) do
                for kk,vm in pairs(v.Rooms) do       
                    if room == vm.instancename then
                        playersInArea = ESX.Game.GetPlayersInArea(vm.entry, 5.0)
                    end
                end
            end
             
			local elements      = {}
            if playersInArea ~= nil then
                for i=1, #playersInArea, 1 do
                    if playersInArea[i] ~= PlayerId() then
                        table.insert(elements, {label = GetPlayerName(playersInArea[i]), value = playersInArea[i]})
                    end
                end
            else
                table.insert(elements, {label = 'Nenhuma pessoa lá fora.'})
            end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_invite', {
				title    = motelName..' Quarto #'..motelRoom .. ' - ' .. _U('invite') ..' Cidadão',
				align    = 'left',
				elements = elements,
            }, function(data2, menu2)
                ESX.TriggerServerCallback('nrrp_motels:getMotelRoomID', function(roomno)
                    print(room)
                    roomID = roomno
				end, room)
                myInstance = 'motel'..roomID..''..roomIdent
				TriggerEvent('instance:invite', 'motelroom', GetPlayerServerId(data2.current.value), {property = myInstance, owner = ESX.GetPlayerData().identifier, motel = reqmotel, room = roomIdent, vid = roomID})
				ESX.ShowNotification(_U('you_invited', GetPlayerName(data2.current.value)))
			end, function(data2, menu2)
				menu2.close()
			end)
        end
    end,
    function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent('nrrp_motels:rentRoom')
AddEventHandler('nrrp_motels:rentRoom', function(room)
    local motelName = nil
    local motelRoom = nil
    for k,v in pairs(Config.Zones) do
        for kk,vm in pairs(v.Rooms) do       
            if room == vm.instancename then
                motelName = v.Name
                motelRoom = vm.number
            end
        end
    end
    TriggerServerEvent('nrrp_motels:rentRoom', room)
    TriggerEvent("mythic_progbar:client:progress", {
        name = "renting_motel",
        duration = 2000,
        label = "Número do quarto de aluguer:  "..motelRoom,
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
        },
        animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
			anim = "idle_a",
        },
        prop = {
            model = "prop_notepad_01"	
        }
	}, function(status)
        if not status then

        end
	end)

end)

function roomMarkers()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    -- Exit Marker
    -- Room Menu Marker
    for k,v in pairs(Config.Zones) do
        distance = GetDistanceBetweenCoords(coords, v.Menu.x, v.Menu.y, v.Menu.z, true)
        if distance < 1.0 then
            DrawText3D(v.Menu.x, v.Menu.y, v.Menu.z + 0.35, '~g~E~s~: para abrir as opções.')
                if IsControlJustReleased(0, 38) then
                    TriggerEvent('nrrp_motels:roomMenu', curRoom, curMotel)
                end
        end
    end

    -- Clothing Menu
    for k,v in pairs(Config.Zones) do
        distance = GetDistanceBetweenCoords(coords, v.Inventory.x, v.Inventory.y, v.Inventory.z, true)
        if distance < 1.0 then
            if roomOwner == playerIdent then
            DrawText3D(v.Inventory.x, v.Inventory.y, v.Inventory.z + 0.35, ' ~g~E~s~: para trocar de roupa.')
                if IsControlJustReleased(0, 38) then
                    PlayerDressings()
                end
            end
        end
    end

    -- Bed Stash Marker
    for k,v in pairs(Config.Zones) do
        distance = GetDistanceBetweenCoords(coords, v.BedStash.x, v.BedStash.y, v.BedStash.z, true)
        if distance < 1.0 then
            if roomOwner == playerIdent then
            DrawText3D(v.BedStash.x, v.BedStash.y, v.BedStash.z + 0.1, '~g~E~s~: abrir o esconderijo.')
                if IsControlJustReleased(0, 38) then
                    OpenStash()
                end
            end
        end
    end

end


function enteredMarker()
    local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if myMotel then 
		for k,v in pairs(Config.Zones) do
			for km,vm in pairs(v.Rooms) do
				if vm.instancename == myMotel then
					distance = GetDistanceBetweenCoords(coords, vm.entry.x, vm.entry.y, vm.entry.z, true)
					if (distance < v.Boundries) then
					DrawMarker(20, vm.entry.x, vm.entry.y, vm.entry.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.RoomMarker.x, Config.RoomMarker.y, Config.RoomMarker.z, Config.RoomMarker.Owned.r, Config.RoomMarker.Owned.g, Config.RoomMarker.Owned.b, 100, false, true, 2, false, false, false, false)	
					end
					if (distance < 1.0) then
						DrawText3D(vm.entry.x, vm.entry.y, vm.entry.z + 0.35, '~g~E~s~: para acessar ás opções')
						if IsControlJustReleased(0, 38) then
							TriggerEvent("nrrp_motels:roomOptions", vm.instancename, k)
						end
					end
				end
			end
		end
	else
        for k,v in pairs(Config.Zones) do
            distance = GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true)
            if (distance < v.Boundries) then
                for km,vm in pairs(v.Rooms) do
                    distance = GetDistanceBetweenCoords(coords, vm.entry.x, vm.entry.y, vm.entry.z, true)
                    if (distance < 1.0) then
                        DrawText3D(vm.entry.x, vm.entry.y, vm.entry.z + 0.35, '~g~E~s~: para alugar o quarto  #~b~'..vm.number..' ~w~por: ~b~'..Config.PriceRental.. ' €')
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent('nrrp_motels:rentRoom', vm.instancename)
                        end
                    end
                end
            end
        end    
    end
end



function ExitProperty(name, motel, room)
	local property  = name
    local playerPed = PlayerPedId()
	
    inRoom          = false
	Citizen.CreateThread(function()
		DoScreenFadeOut(800)
		while not IsScreenFadedOut() do
			Citizen.Wait(1)
		end
        for k,v in pairs(Config.Zones) do
            for km,vm in pairs(v.Rooms) do
                if room == vm.instancename then
                SetEntityCoords(playerPed, vm.entry.x, vm.entry.y, vm.entry.z)
                end
            end
        end
		DoScreenFadeIn(800)
	end)
end

Citizen.CreateThread(function()
    Citizen.Wait(0)
    while true do
       Citizen.Wait(0)
       enteredMarker() 
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(0)
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if inRoom then
			roomMarkers()
		end 

		if not inRoom then
			for k,v in pairs(Config.Zones) do
				distance = GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true)
				if (distance < v.Boundries) then
					getMyMotel()
					Citizen.Wait(3000)
				end
			end
		end
	end
end)


function OpenPropertyInventoryMenu(property, owner)
	-- ESX.TriggerServerCallback("nrrp_motels:getPropertyInventory", function(inventory)
		TriggerEvent("erp_invhud:openMotelInv", property, owner)
	-- end, owner)
end

function OpenPropertyInventoryMenuBed(property, owner)
	-- ESX.TriggerServerCallback("nrrp_motels:getPropertyInventoryBed", function(inventory)
		TriggerEvent("erp_invhud:openMotelInv", property, owner)
	-- end, owner)
end

function OpenStash()
    owner = ESX.GetPlayerData().identifier
    ESX.TriggerServerCallback('nrrp_motels:checkIsOwner', function(isOwner)
        if isOwner then
                    TriggerEvent("mythic_progbar:client:progress", {
                        name = "renting_motel",
                        duration = 1500,
                        label = "Acessando debaixo da cama",
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                                disableMovement = true,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                        },
                        
                }, function(status)
					if not status then
						OpenPropertyInventoryMenuBed('motelsbed', ESX.GetPlayerData().identifier)
					end
                end)    
        else
            TriggerEvent('esx:showNotification', '~w~Somente o ~r~dono~w~ pode acessar!')  
        end
    end, curRoom, owner)
end

DrawText3D = function(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords()) 
	local scale = 0.45
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.030 + factor , 0.030, 66, 66, 66, 150)
	end
end