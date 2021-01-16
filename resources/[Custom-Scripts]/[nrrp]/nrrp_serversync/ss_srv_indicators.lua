if ss_enable_turn_signal_sync then
	RegisterServerEvent( "nrrp_serversync:SetVehicleIndicator" )
	AddEventHandler( "nrrp_serversync:SetVehicleIndicator", function( dir, state )
		TriggerClientEvent( "nrrp_serversync:VehicleIndicator", -1, source, dir, state )
	end)
end
