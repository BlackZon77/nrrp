if ss_enable_door_window_sync then
  RegisterServerEvent( "nrrp_serversync:SetVehicleWindow" )
  AddEventHandler( "nrrp_serversync:SetVehicleWindow", function( windowsDown )
  	TriggerClientEvent( "VehicleWindow", -1, source, windowsDown )
  end)
end