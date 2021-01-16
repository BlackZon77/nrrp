-- Use GetPlayerServerId to trigger server events with an explicit source.

nrrp_calls.ESX = {}
nrrp_calls.ESX.Instance = nil

function nrrp_calls.ESX.Summon(callback)
    Citizen.CreateThread(
        function()
            while not nrrp_calls.ESX.Instance do
                TriggerEvent('esx:getSharedObject',
                    function(esx)
                        nrrp_calls.ESX.Instance = esx
                    end)

                Citizen.Wait(10)
            end

            callback(nrrp_calls.ESX.Instance)
        end)
end
