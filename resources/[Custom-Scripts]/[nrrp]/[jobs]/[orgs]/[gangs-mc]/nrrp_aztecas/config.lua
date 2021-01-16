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


Config.AztecasStations = {
	AztecasBase = {

		Blip = {
			Coords  = vector3(-1886.95, 2053.84, 140.98),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(-1881.64, 2060.82, 140.98)
		},

		Armories = {
			-- vector3(-1870.29, 2057.56, 135.44)
		}, 

		Vehicles = {
			{
				Spawner = vector3(1545.44, -81.25, 157.51),
				InsideShop = vector3(1545.44, -81.25, 166.78),
				SpawnPoints = { 
					{coords = vector3(1579.43, -72.66, 160.91), heading = 90.0, radius = 6.0}
				} 
			}
		},

		BossActions = {
			vector3(1541.74, -81.37, 160.46)
		} 
	}
}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_KNIFE',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_MUSKET',   components = { nil }, price = 120000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL',   components = { nil }, price = 75000 }
	},

	member = {
		{ weapon = 'WEAPON_KNIFE',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_MUSKET',   components = { nil }, price = 120000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL',   components = { nil }, price = 75000 }
	},

	intercircle = {
		{ weapon = 'WEAPON_KNIFE',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_MUSKET',   components = { nil }, price = 120000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL',   components = { nil }, price = 75000 }
	},

	boss = {
		{ weapon = 'WEAPON_KNIFE',   components = { nil }, price = 5000 }
		
		
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{ model = 'sanchez', price = 30000 },
			{ model = 'x6m', price = 30000 },
			{ model = 'g65amg', price = 30000 }
		},

		member = {
			{ model = 'sanchez', price = 30000 },
			{ model = 'x6m', price = 30000 },
			{ model = 'g65amg', price = 30000 }
		},

		intercircle = {
			{ model = 'sanchez', price = 30000 },
			{ model = 'x6m', price = 30000 },
			{ model = 'g65amg', price = 30000 }
		},

		boss = {
			{ model = 'sanchez', price = 30000 },
			{ model = 'x6m', price = 30000 },
			{ model = 'g65amg', price = 30000 }
		}
	}
}

Config.CustomPeds = {
	shared = {},

	recruit = {},
	member = {},
	intercircle = {},
	boss = {}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			 ['tshirt_1'] = 31,  ['tshirt_2'] = 2,
			 ['torso_1'] = 142,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 17,
			 ['pants_1'] = 24,   ['pants_2'] = 0,
			 ['shoes_1'] = 10,   ['shoes_2'] = 0,
			 ['helmet_1'] = 12,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -0,    ['ears_2'] = 0
		 },
		 female = {
			 ['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			 ['torso_1'] = 48,   ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 44,
			 ['pants_1'] = 34,   ['pants_2'] = 0,
			 ['shoes_1'] = 27,   ['shoes_2'] = 0,
			 ['helmet_1'] = 45,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = 2,     ['ears_2'] = 0
		 }
	},
	member = {
		male = {
			 ['tshirt_1'] = 31,  ['tshirt_2'] = 2,
			 ['torso_1'] = 142,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 17,
			 ['pants_1'] = 24,   ['pants_2'] = 0,
			 ['shoes_1'] = 10,   ['shoes_2'] = 0,
			 ['helmet_1'] = 12,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -0,    ['ears_2'] = 0
		 },
		 female = {
			 ['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			 ['torso_1'] = 48,   ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 44,
			 ['pants_1'] = 34,   ['pants_2'] = 0,
			 ['shoes_1'] = 27,   ['shoes_2'] = 0,
			 ['helmet_1'] = 45,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = 2,     ['ears_2'] = 0
		 }
	},
	intercircle = {
		male = {
			 ['tshirt_1'] = 31,  ['tshirt_2'] = 2,
			 ['torso_1'] = 142,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 17,
			 ['pants_1'] = 24,   ['pants_2'] = 0,
			 ['shoes_1'] = 10,   ['shoes_2'] = 0,
			 ['helmet_1'] = 12,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -0,    ['ears_2'] = 0
		 },
		 female = {
			 ['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			 ['torso_1'] = 48,   ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 44,
			 ['pants_1'] = 34,   ['pants_2'] = 0,
			 ['shoes_1'] = 27,   ['shoes_2'] = 0,
			 ['helmet_1'] = 45,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = 2,     ['ears_2'] = 0
		 }
	},
	boss = {
		male = {
			 ['tshirt_1'] = 22,  ['tshirt_2'] = 0,
			 ['torso_1'] = 11,  ['torso_2'] = 1,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 17,
			 ['pants_1'] = 28,   ['pants_2'] = 0,
			 ['shoes_1'] = 10,   ['shoes_2'] = 0,
			 ['helmet_1'] = 12,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -0,    ['ears_2'] = 0
		 },
		 female = {
			 ['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			 ['torso_1'] = 48,   ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 44,
			 ['pants_1'] = 34,   ['pants_2'] = 0,
			 ['shoes_1'] = 27,   ['shoes_2'] = 0,
			 ['helmet_1'] = 45,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = 2,     ['ears_2'] = 0
		 }
	}
}