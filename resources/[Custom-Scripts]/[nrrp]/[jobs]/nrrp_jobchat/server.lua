ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = xPlayer.identifier

	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
		}
	else
		return nil
	end
end

RegisterServerEvent('nnrp_jobChat:chat')
AddEventHandler('nnrp_jobChat:chat', function(job, msg)
    local _source = source
    local pName= getIdentity(_source)
	fal = pName.firstname .. " " .. pName.lastname
	jobName = string.upper(job)
	local messageFull = {
        template = '<div style="padding: 10px; margin: 10px; background-color: rgba(50, 50, 255, 0.9); border-radius: 5px;"><i class="far fa-building"style="font-size:15px"></i> [{0}] {1} : {2}</font></i></b></div>',
        args = {jobName, fal, msg}
    }
	TriggerClientEvent('nnrp_jobChat:Send', -1, messageFull, job)
end)

RegisterServerEvent('nnrp_jobChat:911')
AddEventHandler('nnrp_jobChat:911', function(targetCoords, msg, streetName, emergency)
    local _source = source
	local pName= getIdentity(_source)
	local messageFull
	fal = pName.firstname .. " " .. pName.lastname
	if emergency == '112' then
		messageFull = {
			template = '<div style="padding: 10px; margin: 10px; background-color: rgba(219, 35, 35, 0.9); border-radius: 5px;"><i class="fas fa-bell"style="font-size:15px"></i> [Chamada 112] <p> Nome : {0} <p> Localização : {1} <p> Mensagem:  {2}</font></i></b></div>',
        	args = {fal, streetName, msg}
		}
	end
	TriggerClientEvent('nnrp_jobChat:EmergencySend', -1, messageFull)
	TriggerEvent("mdt:newCall", msg --[[string]], fal --[[int]], targetCoords --[[vector3]])
end)

RegisterServerEvent('nnrp_jobchats:robberys')
AddEventHandler('nnrp_jobchats:robberys', function(targetCoords, msg, streetName, emergency)
    local _source = source
	local messageFull

	if emergency == '112' then
		messageFull = {
			template = '<div style="padding: 10px; margin: 10px; background-color: rgba(219, 35, 35, 0.9); border-radius: 5px;"><i class="fas fa-bell"style="font-size:15px"></i> [Chamada 112] <p> Localização : {0} <p> Mensagem : {1}</font></i></b></div>',
        	args = {streetName, msg}
		}
	end
	
	TriggerClientEvent('nnrp_jobChat:EmergencySend', -1, messageFull)
	TriggerEvent("mdt:newCall", msg --[[string]], "Roubo" --[[int]], targetCoords --[[vector3]])
end)