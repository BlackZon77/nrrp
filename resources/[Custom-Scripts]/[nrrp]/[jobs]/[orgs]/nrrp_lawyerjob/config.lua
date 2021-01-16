Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 2
Config.MarkerSize                 = { x = 1.3, y = 1.3, z = 0.65 }
Config.MarkerColor                = { r = 33, g = 107, b = 255 }

Config.EnablePlayerManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'br'

Config.LawyerStations = {
	Lawyer = {
		Blip = {
		    Pos     = {x = -773.07,y = 299.98,z = 85.71 },
		    Sprite  = 498,
		    Display = 4,
		    Scale   = 0.8,
		    Colour  = 5,
		},

		Cloakrooms = {
			{ x = -132.6,y = -633.12,z = 168.82},
		},

		Vehicles = {
			{
				Spawner    = { x = -803.2,y = 307.83,z = 86.01, },
				SpawnPoints = {
					{ x =-795.78,y = 304.33,z = 85.7, heading = 90.0, radius = 6.0 }
				}
			}
		},

		VehicleDeleters = {
			{ x = 1299.28,y = -725.31,z = 63.73 }
		},

		BossActions = {
			{x = -125.96,y =-640.89,z = 168.82, }
		},
	},
}
-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	Shared = {

	},

	recruit = { --Cadete
		{
			model = 'wraith',
			label = 'Rolls Royce'
		}
	},

	employe = { --Chefe
		{
			model = 'wraith',
			label = 'Rolls Royce'
		}
	},

	boss = { --Comissário
		{
			model = 'wraith',
			label = 'Rolls Royce'
		}
	}
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		-- male = {
			-- ['tshirt_1'] = 53,  ['tshirt_2'] = 1,
			-- ['torso_1'] = 149,  ['torso_2'] = 5,
			-- ['decals_1'] = 0,   ['decals_2'] = 0,
			-- ['arms'] = 0,
			-- ['pants_1'] = 35,   ['pants_2'] = 0,
			-- ['shoes_1'] = 51,   ['shoes_2'] = 0,
			-- ['helmet_1'] = 10,  ['helmet_2'] = 6,
			-- ['chain_1'] = 8,    ['chain_2'] = 0,
			-- ['ears_1'] = -1,    ['ears_2'] = 0
		-- },
		-- female = {
			-- ['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			-- ['torso_1'] = 48,   ['torso_2'] = 0,
			-- ['decals_1'] = 0,   ['decals_2'] = 0,
			-- ['arms'] = 44,
			-- ['pants_1'] = 34,   ['pants_2'] = 0,
			-- ['shoes_1'] = 27,   ['shoes_2'] = 0,
			-- ['helmet_1'] = 45,  ['helmet_2'] = 0,
			-- ['chain_1'] = 0,    ['chain_2'] = 0,
			-- ['ears_1'] = 2,     ['ears_2'] = 0
		-- }
	},
	employe_wear = {
		-- male = {
			-- ['tshirt_1'] = 53,  ['tshirt_2'] = 1,
			-- ['torso_1'] = 149,  ['torso_2'] = 3,
			-- ['decals_1'] = 0,   ['decals_2'] = 0,
			-- ['arms'] = 0,
			-- ['pants_1'] = 35,   ['pants_2'] = 0,
			-- ['shoes_1'] = 51,   ['shoes_2'] = 0,
			-- ['helmet_1'] = 10,  ['helmet_2'] = 6,
			-- ['chain_1'] = 8,    ['chain_2'] = 0,
			-- ['ears_1'] = -1,    ['ears_2'] = 0
		-- },
		-- female = {
			-- ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			-- ['torso_1'] = 48,   ['torso_2'] = 0,
			-- ['decals_1'] = 7,   ['decals_2'] = 3,
			-- ['arms'] = 44,
			-- ['pants_1'] = 34,   ['pants_2'] = 0,
			-- ['shoes_1'] = 27,   ['shoes_2'] = 0,
			-- ['helmet_1'] = -1,  ['helmet_2'] = 0,
			-- ['chain_1'] = 0,    ['chain_2'] = 0,
			-- ['ears_1'] = 2,     ['ears_2'] = 0
		-- }
	},

	boss_wear = { -- currently the same as chef_wear
		-- male = {
			-- ['tshirt_1'] = 53,  ['tshirt_2'] = 1,
			-- ['torso_1'] = 149,  ['torso_2'] = 4,
			-- ['decals_1'] = 0,   ['decals_2'] = 0,
			-- ['arms'] = 0,
			-- ['pants_1'] = 35,   ['pants_2'] = 0,
			-- ['shoes_1'] = 51,   ['shoes_2'] = 0,
			-- ['helmet_1'] = 10,  ['helmet_2'] = 6,
			-- ['chain_1'] = 8,    ['chain_2'] = 0,
			-- ['ears_1'] = -1,    ['ears_2'] = 0
		-- },
		-- female = {
			-- ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			-- ['torso_1'] = 48,   ['torso_2'] = 0,
			-- ['decals_1'] = 7,   ['decals_2'] = 3,
			-- ['arms'] = 44,
			-- ['pants_1'] = 34,   ['pants_2'] = 0,
			-- ['shoes_1'] = 27,   ['shoes_2'] = 0,
			-- ['helmet_1'] = -1,  ['helmet_2'] = 0,
			-- ['chain_1'] = 0,    ['chain_2'] = 0,
			-- ['ears_1'] = 2,     ['ears_2'] = 0
		-- }
	}
}
