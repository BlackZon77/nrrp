Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = 5

Config.Locale                     = 'br'


Config.UVanillaStations = {
	Unicorn = {

		Blip = {
			Coords  = vector3(129.246, -1299.363, 29.501),
			Sprite  = 121,
			Display = 4,
			Scale   = 0.8,
			Colour  = 27
		},

		Cloakrooms = {
			vector3(105.98, -1302.5, 28.77)
		},

		Armories = {
			vector3(93.62, -1291.87, 29.27),
			vector3(130.4, -1284.57, 29.27)
		},

		Vehicles = {
			{
				Spawner = vector3(144.31, -1278.22, 29.11),
				InsideShop = vector3(138.436, -1263.095, 28.626),
				SpawnPoints = {
					{coords = vector3(142.6, -1271.28, 29.0), heading = 90.0, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(94.78, -1293.99, 29.27)
		}
	}
}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2500 }
	},

	barmen = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2500 }
	},

	security = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2500 }
	},

	boss = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2500 }
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{ model = 'master2019', price = 15000 }
		
		},
	barmen = {
			{ model = 'master2019', price = 15000 },
			{ model = 'x6m', price = 25000 },
		},
	security = {
			{ model = 'patriot', price = 15000 },
			{ model = 'x6m', price = 25000 },
                        { model = 'master2019', price = 15000 },

		},
	boss =  {
			{ model = 'patriot', price = 15000 },
			{ model = 'x6m', price = 25000 },
                        { model = 'master2019', price = 15000 },

			}
		}
	}
			
			
Config.CustomPeds = {
	shared = {},

	{
		recruit = {},

		barmen = {},

		security = {},

		boss = {}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			 ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
			 ['torso_1'] = 4,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 20,   ['pants_2'] = 0,
			 ['shoes_1'] = 7,   ['shoes_2'] = 0,
			 ['helmet_1'] = 5,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -1,    ['ears_2'] = 0
		 },
		 female = {
			 ['tshirt_1'] = 0,  ['tshirt_2'] = 0,
			 ['torso_1'] = 0,   ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 0,   ['pants_2'] = 0,
			 ['shoes_1'] = 0,   ['shoes_2'] = 0,
			 ['helmet_1'] = 0,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = 0,     ['ears_2'] = 0
		 }

	},
	barmen = {
		male = {
			 ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
			 ['torso_1'] = 4,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 20,   ['pants_2'] = 0,
			 ['shoes_1'] = 7,   ['shoes_2'] = 0,
			 ['helmet_1'] = 5,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -1,    ['ears_2'] = 0
		 },
		 female = {
			 ['tshirt_1'] = 0,  ['tshirt_2'] = 0,
			 ['torso_1'] = 0,   ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 0,   ['pants_2'] = 0,
			 ['shoes_1'] = 0,   ['shoes_2'] = 0,
			 ['helmet_1'] = 0,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = 0,     ['ears_2'] = 0
		 }
	},
	security = {
		male = {
			 ['tshirt_1'] = 23,  ['tshirt_2'] = 0,
			 ['torso_1'] = 4,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 20,   ['pants_2'] = 0,
			 ['shoes_1'] = 7,   ['shoes_2'] = 0,
			 ['helmet_1'] = -1,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -1,    ['ears_2'] = 0
		 },
		 female = {
			 ['tshirt_1'] = 0,  ['tshirt_2'] = 0,
			 ['torso_1'] = 0,   ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 0,   ['pants_2'] = 0,
			 ['shoes_1'] = 0,   ['shoes_2'] = 0,
			 ['helmet_1'] = 0,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = 0,     ['ears_2'] = 0
		 }
	},
	boss = {
		male = {
			 ['tshirt_1'] = 75,  ['tshirt_2'] = 0,
			 ['torso_1'] = 4,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 20,   ['pants_2'] = 0,
			 ['shoes_1'] = 10,   ['shoes_2'] = 0,
			 ['helmet_1'] = 7,  ['helmet_2'] = 2,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -1,    ['ears_2'] = 0
		 },
		 female = {
			 ['tshirt_1'] = 0,  ['tshirt_2'] = 0,
			 ['torso_1'] = 0,   ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 0,   ['pants_2'] = 0,
			 ['shoes_1'] = 0,   ['shoes_2'] = 0,
			 ['helmet_1'] = 0,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = 0,     ['ears_2'] = 0
		 }
         }
}
