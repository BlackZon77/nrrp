RegisterCommand('ping', function(source, args, rawCommand)
	if args[1] ~= nil then
        if args[1]:lower() == 'aceitar' then
            TriggerClientEvent('nrrp_pings:client:AcceptPing', source)
        elseif args[1]:lower() == 'rejeitar' then
            TriggerClientEvent('nrrp_pings:client:RejectPing', source)
        elseif args[1]:lower() == 'remover' then
            TriggerClientEvent('nrrp_pings:client:RemovePing', source)
        else
            local tSrc = tonumber(args[1])
			if tSrc ~= nil then
				if source ~= tSrc then
					TriggerClientEvent('nrrp_pings:client:SendPing', tSrc, GetPlayerName(source), source)
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Não te podes pingar' })
				end
			end
        end
    end
end, false)

RegisterServerEvent('nrrp_pings:server:SendPingResult')
AddEventHandler('nrrp_pings:server:SendPingResult', function(id, result)
	if result == 'aceitar' then
		TriggerClientEvent('mythic_notify:client:SendAlert', id, { type = 'inform', text = GetPlayerName(source) .. ' Aceitou o teu ping' })
	elseif result == 'rejeitar' then
		TriggerClientEvent('mythic_notify:client:SendAlert', id, { type = 'inform', text = GetPlayerName(source) .. ' Rejetou o teu ping' })
	elseif result == 'timeout' then
		TriggerClientEvent('mythic_notify:client:SendAlert', id, { type = 'inform', text = GetPlayerName(source) .. ' Não aceitou o teu ping' })
	elseif result == 'indesponivel' then
		TriggerClientEvent('mythic_notify:client:SendAlert', id, { type = 'inform', text = GetPlayerName(source) .. ' Não pôde receber o teu ping' })
	elseif result == 'enviado' then
		TriggerClientEvent('mythic_notify:client:SendAlert', id, { type = 'inform', text = 'Enviaste um ping para ' .. GetPlayerName(source) })
	end
end)
