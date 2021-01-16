ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('nnrp_duty:onoff')
AddEventHandler('nnrp_duty:onoff', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    
    if job == 'police' or job == 'ambulance' then
        xPlayer.setJob('off' ..job, grade)
        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Saiste de Serviço', length = 4000})
    elseif job == 'offpolice' then
        xPlayer.setJob('police', grade)
        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'success', text = 'Entras-te de Serviço', length = 4000})
    elseif job == 'offambulance' then
        xPlayer.setJob('ambulance', grade)
        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'success', text = 'Entras-te de Serviço', length = 4000})
    end
end)