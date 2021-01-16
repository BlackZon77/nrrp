RegisterNetEvent("nrrp_hack:playSound")
AddEventHandler("nrrp_hack:playSound", function(name)
    local t = {transactionType = name}

    SendNuiMessage(json.encode(t))
end)