local ESX = nil
local banks = {}

TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback("nrrp_fleecaheist:getCurrentRobbery", function(source, data)
	data(banks)
end)

ESX.RegisterServerCallback("nrrp_fleecaheist:fetchCops", function(source, data)
	local plys = ESX.GetPlayers()
	local copsNeeded = 0

	for g, ply in ipairs(plys) do
		local ply = ESX.GetPlayerFromId(ply)
		if ply then
			if ply["job"]["name"] == "police" then
				copsNeeded = copsNeeded + 1
			end
		end
	end

	data(copsNeeded >= Config.CopsNeeded)
end)

RegisterServerEvent("nrrp_fleecaheist:globalEvent")
AddEventHandler("nrrp_fleecaheist:globalEvent", function(i)
	local _source = source

	if type(i["data"]) == "table" then
		if i["data"]["save"] then
			banks[i["data"]["bank"]] = {
				["started"] = os.time(),
				["robber"] = _source,
				["trolleys"] = i["data"]["trolleys"]
			}
		end
	end

	TriggerClientEvent("nrrp_fleecaheist:eventHandler", -1, i["event"] or "none", i["data"] or nil)
end)

RegisterServerEvent("nrrp_fleecaheist:receiveCash")
AddEventHandler("nrrp_fleecaheist:receiveCash", function()
	local _source = source
	local ply = ESX.GetPlayerFromId(_source)

	if ply then
		local cash = math.random(Config.Trolley["cash"][1], Config.Trolley["cash"][2])

		if Config.BlackMoney then
			ply.addAccountMoney("black_money", cash)
			TriggerClientEvent("esx:showNotification", _source, "Recebeste ~r~~n~" .. cash .. "~s~€ de  ~r~dinheiro sujo ")
		else
			ply.addMoney(cash)
			TriggerClientEvent("esx:showNotification", _source, "Recebeste~g~ " .. cash .. "~s~ €")
		end
	end
end)