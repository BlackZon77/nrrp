ESX = nil 
local joblist = {}
local resettime = nil
local policeclosed = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('nrrp_jewelrobbery:closestore')
AddEventHandler('nrrp_jewelrobbery:closestore', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ispolice = false
	for i, v in pairs(Config.PoliceJobs) do
		if xPlayer.job.name == v then
			ispolice = true
			break
		end
	end
    if ispolice and resettime ~= nil then
        TriggerClientEvent('nrrp_jewelrobbery:policeclosure', -1)
        policeclosed = true
    elseif ispolice and resettime == nil then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { 
            type = 'inform', 
            text = 'A joalharia não parece ter sido assaltado - não a podes fechar ', 
            length = 4000
        })        
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { 
            type = 'inform', 
            text = 'Apenas agentes da polícia podem fechar a joalharia', 
            length = 4000
        })    
    end
end)

RegisterServerEvent('nrrp_jewelrobbery:playsound')
AddEventHandler('nrrp_jewelrobbery:playsound', function(x,y,z, soundtype)
    TriggerClientEvent('nrrp_jewelrobbery:playsound', -1, x, y, z, soundtype)
end)

RegisterServerEvent('nrrp_jewelrobbery:setcase')
AddEventHandler('nrrp_jewelrobbery:setcase', function(casenumber, switch)
    _source = source
    if not Config.CaseLocations[casenumber].Broken then
        Config.CaseLocations[casenumber].Broken  = true
        TriggerEvent('nrrp_jewelrobbery:RestTimer')
        TriggerClientEvent('nrrp_jewelrobbery:setcase', -1, casenumber, true)
        TriggerEvent('nrrp_jewelrobbery:AwardItems', _source)
    end
end)

RegisterServerEvent('nrrp_jewelrobbery:policenotify')
AddEventHandler('nrrp_jewelrobbery:policenotify', function()
    TriggerClientEvent('nrrp_jewelrobbery:policenotify', -1)    
end)

RegisterServerEvent('nrrp_jewelrobbery:loadconfig')
AddEventHandler('nrrp_jewelrobbery:loadconfig', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local buildlist = {id = _source,job = xPlayer.job.name,}
    table.insert(joblist, buildlist)
    TriggerClientEvent('nrrp_jewelrobbery:loadconfig', _source, Config.CaseLocations)
    if policeclosed then
        TriggerClientEvent('nrrp_jewelrobbery:policeclosure', _source)
    end
end)

AddEventHandler('nrrp_jewelrobbery:RestTimer', function()
    if resettime == nil then
        totaltime = Config.ResetTime * 60
        resettime = os.time() + totaltime

        while os.time() < resettime do
            Citizen.Wait(2350)
        end

        for i, v in pairs(Config.CaseLocations) do
            v.Broken = false
        end
        TriggerClientEvent('nrrp_jewelrobbery:resetcases', -1, Config.CaseLocations)
        resettime = nil
        policeclosed = false
    end
end)

AddEventHandler('nrrp_jewelrobbery:AwardItems', function(serverid)
    local xPlayer = ESX.GetPlayerFromId(serverid)
    local randomitem = math.random(1,100)
    for i, v in pairs(Config.ItemDrops) do 
        if randomitem <= v.chance then
            randomamount = math.random(1, v.max)
            sourceItem = xPlayer.getInventoryItem(v.name)
            if sourceItem.weight ~= nil then
                if sourceItem.weight ~= -1 and (sourceItem.count + randomamount) > sourceItem.weight then
                    randomamount = sourceItem.weight - sourceItem.count
                    xPlayer.addInventoryItem(v.name, randomamount)
                else
                    xPlayer.addInventoryItem(v.name, randomamount)
                end
                break
            else
                xPlayer.addInventoryItem(v.name, randomamount)
                break
            end
        end
    end
end)
