-------------------------------------------------------------------------------
-- Native Shortcuts
-------------------------------------------------------------------------------
function nrrp_calls.NetEvent(name, thunk)
    RegisterNetEvent(name)
    AddEventHandler(name, thunk)
end