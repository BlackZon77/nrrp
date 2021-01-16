local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

---------- Carry
RegisterServerEvent('CarryPeople:sync')
AddEventHandler('CarryPeople:sync', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('CarryPeople:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('CarryPeople:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)

RegisterServerEvent('CarryPeople:stop')
AddEventHandler('CarryPeople:stop', function(targetSrc)
	TriggerClientEvent('CarryPeople:cl_stop', targetSrc)
end)

---------- Make Hostage
RegisterServerEvent('nrrp_hostage:sync')
AddEventHandler('nrrp_hostage:sync', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget,attachFlag)
	TriggerClientEvent('nrrp_hostage:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget,attachFlag)
	TriggerClientEvent('nrrp_hostage:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)

RegisterServerEvent('nrrp_hostage:stop')
AddEventHandler('nrrp_hostage:stop', function(targetSrc)
	TriggerClientEvent('nrrp_hostage:cl_stop', targetSrc)
end)


---------- Teleport to marker /tpm
ESX.RegisterServerCallback("nrrp_oStuff:fetchUserRank", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

local logs = "https://discordapp.com/api/webhooks/767154469954912276/5Z_oLdF44FGpuz2xjW28L_ldJd0xM7DvtnsXyIMS9Tt41_0MOGbT8WUHX-GAEPnRqh1z"
local communityname = "Big Logger YEEIKS"
local communtiylogo = "https://i.imgur.com/e8VsdLL.jpg" --Must end with .png or .jpg

AddEventHandler('playerConnecting', function()
    local src = source
    local name = GetPlayerName(src)
    local ip = GetPlayerEndpoint(src)
    local ping = GetPlayerPing(src)
    local steamhex = GetPlayerIdentifier(src)
    local connect = {
        {
            ["color"] = "8663711",
            ["title"] = "Player Connected to Server #1",
            ["description"] = "Player: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Big Yoda Server Logger", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    local name = GetPlayerName(src)
    local ip = GetPlayerEndpoint(src)
    local ping = GetPlayerPing(src)
    local steamhex = GetPlayerIdentifier(src)
    local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Player Disconnected from Server #1",
            ["description"] = "Player: **"..name.."** \nReason: **"..reason.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Big Yoda Server Logger", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)