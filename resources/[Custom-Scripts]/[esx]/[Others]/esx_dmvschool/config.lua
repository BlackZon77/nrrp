Config                 = {}
Config.DrawDistance    = 100.0
Config.MaxErrors       = 5
Config.SpeedMultiplier = 3.6
Config.Locale          = 'br'

Config.Prices = {
	dmv         = 250,
	drive       = 500,
	drive_bike  = 375,
	drive_truck = 1250
}

Config.VehicleModels = {
	drive       = 'serv_vwpolo',
	drive_bike  = 'cb500f',
	drive_truck = 'mule3'
}

Config.SpeedLimits = {
	residence = 50,
	town      = 90,
	freeway   = 120
}

Config.Zones = {

	DMVSchool = {
		Pos   = {x = -914.74, y = -170.55, z = 36.27},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 140, b = 0},
		Type  = 25
	},

	VehicleSpawnPoint = {
		Pos   = {x = -932.09, y = -185.74, z = 37.65, h = 37.6},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1
	}

}

Config.CheckPoints = {

	{
		Pos = {x = -945.36, y = -193.4, z = 37.85},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('next_point_speed', Config.SpeedLimits['residence']), 5000)
		end
	},

	{
		Pos = {x = -963.45, y = -202.2, z = 37.79},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')

			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_look_left', Config.SpeedLimits['town']), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(6000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_turn_right'), 5000)
			end)
		end
	},

	{
		Pos = {x = -964.38, y = -203.19, z = 36.98},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('watch_traffic_lightson'), 5000)
		end
	},

	{
		Pos = {x = -1002.42, y = -199.73, z = 37.16},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -1393.46, y = -57.81, z = 52.22},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('stop_for_passing'), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(6000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = -1622.01, y = -275.9, z = 52.11},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -1982.52, y = -165.39, z = 30.18},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -2167.95, y = -324.4, z = 12.55},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('freeway')

			DrawMissionText(_U('hway_time', Config.SpeedLimits['freeway']), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
		end
	},

	{
		Pos = {x = -2063.56, y = -401.08, z = 10.75},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -763.59, y = -537.33, z = 24.42},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -69.91, y = -534.25, z = 31.15},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 249.97, y = -543.48, z = 42.97},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')
			DrawMissionText(_U('in_town_speed', Config.SpeedLimits['town']), 5000)
		end
	},

	{
		Pos = {x = 305.75, y = -486.98, z = 42.75},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 209.36, y = -345.25, z = 43.47},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = -84.61, y = -234.36, z = 44.22},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('residence')

			Citizen.CreateThread(function()
				DrawMissionText(_U('tuneis_hehe', Config.SpeedLimits['residence']), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(6000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_continuar'), 5000)
			end)
		end
	},

	{
		Pos = {x = -256.07, y = -172.54, z = 39.78},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')

			Citizen.CreateThread(function()
				DrawMissionText(_U('tuneis_saida', Config.SpeedLimits['town']), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(6000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_continuar2'), 5000)
			end)
		end
	},

	{
		Pos = {x = -549.54, y = -282.77, z = 34.53},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('gratz_stay_alert'), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
		end
	},

	{
		Pos = {x = -760.49, y = -122.75, z = 37.22},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')

			Citizen.CreateThread(function()
				DrawMissionText(_U('chegada', Config.SpeedLimits['town']), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(6000)

				FreezeEntityPosition(vehicle, false)
			end)
		end
	},
	{
		Pos = {x = -910.18, y = -173.98, z = 36.74},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			ESX.Game.DeleteVehicle(vehicle)
		end
	}
}
