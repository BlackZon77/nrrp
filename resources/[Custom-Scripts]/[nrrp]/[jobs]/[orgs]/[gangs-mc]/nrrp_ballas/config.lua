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


Config.BallasStations = {
	BallasBase = {

		Blip = {
			Coords  = vector3(118.6, -1951.12, 20.76),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(119.86, -1968.6, 21.33)
		},

		Armories = {
			vector3(106.13, -1981.48, 20.96)
		},

		Vehicles = {
			{
				Spawner = vector3(114.14, -1949.88, 20.64),
				InsideShop = vector3(114.32, -1935.06, 20.65),
				SpawnPoints = {
					{coords = vector3(90.36, -1964.41, 20.75), heading = 90.0, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(121.38, -1971.24, 21.33)
		}
	}
}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 }
	},

	member = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 }
	},

	intercircle = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 }
	},

	boss = {
		{ weapon = 'WEAPON_MINISMG',   components = { nil }, price = 175000 },
		{ weapon = 'WEAPON_PISTOL',   components = { nil }, price = 75000 }
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{ model = 'hermes', price = 1000 },
			{ model = 'manchez', price = 1000 },
			{ model = 'primo2', price = 1000 },
			{ model = 'kamacho', price = 1000 }
		},

		member = {
			{ model = 'hermes', price = 1000 },
			{ model = 'manchez', price = 1000 },
			{ model = 'primo2', price = 1000 },
			{ model = 'kamacho', price = 1000 }
		},

		intercircle = {
			{ model = 'hermes', price = 1000 },
			{ model = 'manchez', price = 1000 },
			{ model = 'primo2', price = 1000 },
			{ model = 'kamacho', price = 1000 }
		},

		boss = {
			{ model = 'hermes', price = 1000 },
			{ model = 'manchez', price = 1000 },
			{ model = 'primo2', price = 1000 },
			{ model = 'kamacho', price = 1000 }
		},
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
			 ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			 ['torso_1'] = 84,  ['torso_2'] = 5,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 5,   ['pants_2'] = 9,
			 ['shoes_1'] = 4,   ['shoes_2'] = 1,
			 ['helmet_1'] = 4,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -1,    ['ears_2'] = 0
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
			 ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			 ['torso_1'] = 84,  ['torso_2'] = 5,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 5,   ['pants_2'] = 9,
			 ['shoes_1'] = 4,   ['shoes_2'] = 1,
			 ['helmet_1'] = 4,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -1,    ['ears_2'] = 0
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
			 ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			 ['torso_1'] = 84,  ['torso_2'] = 5,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 5,   ['pants_2'] = 9,
			 ['shoes_1'] = 4,   ['shoes_2'] = 1,
			 ['helmet_1'] = 4,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -1,    ['ears_2'] = 0
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
			 ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			 ['torso_1'] = 84,  ['torso_2'] = 5,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 5,   ['pants_2'] = 9,
			 ['shoes_1'] = 4,   ['shoes_2'] = 1,
			 ['helmet_1'] = 4,  ['helmet_2'] = 0,
			 ['chain_1'] = 0,    ['chain_2'] = 0,
			 ['ears_1'] = -1,    ['ears_2'] = 0
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
