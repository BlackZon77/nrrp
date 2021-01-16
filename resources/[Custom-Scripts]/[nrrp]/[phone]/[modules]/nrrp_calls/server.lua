-------------------------------------------------------------------------------
-- Native Shortcuts
-------------------------------------------------------------------------------
function nrrp_calls.Event(name, thunk)
    AddEventHandler(name,
        function(...)
            thunk(source, ...)
        end)
end

function nrrp_calls.NetEvent(name, thunk)
    RegisterNetEvent(name)
    nrrp_calls.Event(name, thunk)
end
