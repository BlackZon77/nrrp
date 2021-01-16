ESX = nil
cachedData = {}

Citizen.CreateThread(function()
	while not ESX do
		TriggerEvent("esx:getSharedObject", function(library) 
			ESX = library 
		end)

		Citizen.Wait(0)
	end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerData)
	ESX.PlayerData = playerData
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(newJob)
	ESX.PlayerData["job"] = newJob
end)

Citizen.CreateThread(function()
	local CanDraw = function(action)
		if action == "vehicle" then
			if IsPedInAnyVehicle(PlayerPedId()) then
				local vehicle = GetVehiclePedIsIn(PlayerPedId())

				if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
					return true
				else
					return false
				end
			else
				return false
			end
		end

		return true
	end

	for garage, garageData in pairs(Config.Garages) do
		local garageBlip = AddBlipForCoord(garageData["positions"]["menu"]["position"])

		SetBlipSprite(garageBlip, 357)
		SetBlipDisplay(garageBlip, 4)
		SetBlipScale (garageBlip, 0.7)
		SetBlipColour(garageBlip, 67)
		SetBlipAsShortRange(garageBlip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Garagem")
		EndTextCommandSetBlipName(garageBlip)
	end

	while true do
		local sleepThread = 500

		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		for garage, garageData in pairs(Config.Garages) do
			for action, actionData in pairs(garageData["positions"]) do
				local dstCheck = #(pedCoords - actionData["position"])

				if dstCheck <= 10.0 then
					sleepThread = 5
					local draw = CanDraw(action)

					if draw then
						local markerSize = action == "vehicle" and 4.0 or 1.5
						if dstCheck <= markerSize - 0.1 then
							local usable = not DoesCamExist(cachedData["cam"])
							if Menu.hidden then

							end
							if IsControlJustPressed(1, 177) and not Menu.hidden then
								CloseMenu()
								PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
							end
							if usable then
								if IsControlJustPressed(0, 38) and Menu.hidden then
									cachedData["currentGarage"] = garage
									ESX.TriggerServerCallback("nrrp_garage:obtenerVehiculos", function(fetchedVehicles)
										EnvioVehLocal(fetchedVehicles[1])
										if fetchedVehicles[2] then
											EnvioVehFuera(fetchedVehicles[2])
										end
									end)
									Menu.hidden = not Menu.hidden
									MenuGarage(action)
									TriggerEvent("inmenu",true)
								end
								
							end
						end
						DrawScriptMarker({
							["type"] = 27,
							["pos"] = actionData["position"] - vector3(0.0, 0.0, 0.0),
							["sizeX"] = markerSize,
							["sizeY"] = markerSize,
							["sizeZ"] = markerSize,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0
						})
					end
				elseif (dstCheck > 10.0 and dentro == garage) then
					print(dentro)
					print(garage)
					dentro = nil
				end
			end
		end
		Menu.renderGUI()
		Citizen.Wait(sleepThread)
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("nrrp_olxdoscarros:Dar")
AddEventHandler("nrrp_olxdoscarros:Dar", function()
	venderCarro()
end)

RegisterNetEvent("nrrp_olxdoscarros:aceitarproposta")
AddEventHandler("nrrp_olxdoscarros:aceitarproposta", function(vendedor,plate,preco)
	local elements = {}
	table.insert(elements, {label= "Aceitar Proposta", value = "sim"})
	table.insert(elements, {label= "Recusar Proposta", value = "nao"})
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'propsta', {
		title    = "Proposta de Compra do Veículo com a matrícula " .. plate .. " por " .. preco .. "€ ?",
		align    = 'center',
		elements = elements
	}, function(data, menu)
		if data.current.value == "sim" then
			TriggerServerEvent("nrrp_olxdoscarros:respostas",vendedor,true,preco,plate)
		end
		if data.current.value == "nao" then
			TriggerServerEvent("nrrp_olxdoscarros:respostas",vendedor,false,preco,plate)
		end
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ultimaAccion = nil
local currentGarage = nil
local fetchedVehicles = {}
local fueravehicles = {}

function MenuGarage(action)
    if not action then action = ultimaAccion; elseif not action and not ultimaAccion then action = "menu"; end
    ped = GetPlayerPed(-1);
    MenuTitle = "Garagem"
    ClearMenu()
    ultimaAccion = action
    Citizen.Wait(150)
    DeleteActualVeh()
    if action == "menu" then
        Menu.addButton("Os Meus Carros","ListeVehicule",nil)
        Menu.addButton("Recuperar","recuperar",nil)
        Menu.addButton("Fechar","CloseMenu",nil) 
    elseif action == "vehicle" then
        PutInVehicle()
    end
end

function EnvioVehLocal(veh)
    local slots = {}
    for c,v in pairs(veh) do
        table.insert(slots,{["garage"] = v.garage, ["vehiculo"] = json.decode(v.vehicle)})
    end
    fetchedVehicles = slots
end

function EnvioVehFuera(data)
    local slots = {}
    for c,v in pairs(data) do

        if v.stored == 0 or v.stored == 2 or v.stored == false or v.garage == nil then
            table.insert(slots,{["vehiculo"] = json.decode(v.vehicle),["stored"] = v.stored})
        end
    end
    fueravehicles = slots
end

function recuperar()
    currentGarage = cachedData["currentGarage"]

    if not currentGarage then
        CloseMenu()
        return 
    end

	HandleCamera(currentGarage, true)
	ped = GetPlayerPed(-1);
	MenuTitle = "Recuperar: "
	ClearMenu()
	Menu.addButton("Voltar","MenuGarage",nil)

	for c,v in pairs(fueravehicles) do
        local vehicle = v.vehiculo
		local hashVehicle = vehicle.model
		local vehicleName = CarModelToLabel(hashVehicle)
		print(v.stored)
        if v.stored == 0 or v.stored == false then
            Menu.addButton("GUARDAR | "..vehicleName, "carroperdido", vehicle, "PERDIDO?", " Motor : " .. round(vehicle.engineHealth) /10 .. "%", " Fuel : " .. round(vehicle.fuelLevel) .. "%","SpawnLocalVehicle")
        end
    end 
end

function AbrirMenuGuardar()
    currentGarage = cachedData["currentGarage"]
    if not currentGarage then
        CloseMenu()
        return 
    end
   ped = GetPlayerPed(-1);
   MenuTitle = "Guardar: "
   ClearMenu()
   Menu.addButton("FECHAR","CloseMenu",nil)
   Menu.addButton("GARAGEM: "..currentGarage.." | GUARDAR", "SaveInGarage", currentGarage, "", "", "","DeleteActualVeh")
end

function ListeVehicule()
    currentGarage = cachedData["currentGarage"]

    if not currentGarage then
        CloseMenu()
        return 
    end

	HandleCamera(currentGarage, true)
	ped = GetPlayerPed(-1);
	MenuTitle = "Os meus veículos: "
	ClearMenu()
	Menu.addButton("Voltar","MenuGarage",nil)
    for c,v in pairs(fetchedVehicles) do
        if v then
            local vehicle = v.vehiculo
			local hashVehicle = vehicle.model
			local vehicleName = CarModelToLabel(hashVehicle)
			
			Menu.addButton("" ..(vehicle.plate).." | "..vehicleName, "OptionVehicle", {vehicle,nil}, "GARAGEM: "..currentGarage.."", " Motor : " .. round(vehicle.engineHealth) /10 .. "%", " Fuel: " .. round(vehicle.fuelLevel) .. "%","SpawnLocalVehicle")
		end
    end
end

CarModelToLabel = function(model)
    model = (type(model) == 'number' and model or GetHashKey(model))

    local displayName = GetDisplayNameFromVehicleModel(model)
    local vehicleName = GetLabelText(displayName)

    if (vehicleName == nil or string.lower(vehicleName) == 'null' or string.lower(vehicleName) == 'carnotfound') then
        vehicleName = displayName
    end

    if (vehicleName == nil or string.lower(vehicleName) == 'null' or string.lower(vehicleName) == 'carnotfound') then
        vehicleName = model
    end

    return vehicleName
end

function round(n)
    if not n then return 0; end
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

function OptionVehicle(data)
   MenuTitle = "Opções: "
   ClearMenu()
   Menu.addButton("Retirar", "SpawnVehicle", data)
   Menu.addButton("Voltar", "ListeVehicule", nil)
end

function carroperdido(data)
	SpawnVehicle({data,nil},true)
end

function CloseMenu()
    HandleCamera(currentGarage, false)
	TriggerEvent("inmenu",false)
    Menu.hidden = true
end
