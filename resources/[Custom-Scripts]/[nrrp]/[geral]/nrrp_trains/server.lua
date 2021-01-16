ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("RequestTrain")
AddEventHandler("RequestTrain",function()
	TriggerClientEvent("AskForTrainConfirmed", source)
end)