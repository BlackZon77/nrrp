--================================================================================================
--==                                                XenKnighT                                  ==
--================================================================================================


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('gcPhone:transfer')
AddEventHandler('gcPhone:transfer', function(to, amountt)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local zPlayer = ESX.GetPlayerFromId(to)
    local balance = 0
    if zPlayer ~= nil then
        balance = xPlayer.getAccount('bank').money
        zbalance = zPlayer.getAccount('bank').money
        if tonumber(_source) == tonumber(to) then
            -- advanced notification with bank icon
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Não podes transferir para ti mesmo.', length = 4000})
		else
            if balance <= 0 or balance < tonumber(amountt) or tonumber(amountt) <= 0 then
                -- advanced notification with bank icon
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Não tens essa quantidade de dinheiro na tua conta.', length = 4000})
            else
                xPlayer.removeAccountMoney('bank', tonumber(amountt))
                zPlayer.addAccountMoney('bank', tonumber(amountt))
                -- advanced notification with bank icon
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Transferiste ' .. amountt .. '€ para ~r~' .. to .. '.', length = 4000})
        		TriggerClientEvent('mythic_notify:client:SendAlert', to, { type = 'inform', text = 'Recebeste ~r~' .. amountt .. '€~s~ de ~r~' .. _source ..  ' .', length = 4000})
            end
        end
    end
end)

--================================================================================================
--==                                           Ad ve Soyad                                      ==
--================================================================================================

function getorfirstname (sourcePlayer, identifier, cb)
    local sourcePlayer = sourcePlayer
	local xplayer = ESX.GetPlayerFromId(source)
    local identifier = xplayer.identifier
    local firstname = getFirstname(identifier)
	local lastname = getLastname(identifier)
end

function getFirstname(identifier)
    local result = MySQL.Sync.fetchAll("SELECT users.firstname FROM users WHERE users.identifier = @identifier", {
        ['@identifier'] = identifier
    })
    if result[1] ~= nil then
        return result[1].firstname
    end
    return nil
end

function getLastname(identifier)
    local result = MySQL.Sync.fetchAll("SELECT users.lastname FROM users WHERE users.identifier = @identifier", {
        ['@identifier'] = identifier
    })
    if result[1] ~= nil then
        return result[1].lastname
    end
    return nil
end
