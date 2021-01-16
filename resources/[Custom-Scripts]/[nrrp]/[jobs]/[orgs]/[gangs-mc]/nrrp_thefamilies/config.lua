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

Config.TheFamiliesStations = {
	TheFamiliesBase = {

		Blip = {
			Coords  = vector3(-216.76, -1673.96, 34.48),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(-157.16, -1602.96, 35.04)
		},

		Armories = {
			vector3(-137.65, -1609.87, 35.03)
		},

		Vehicles = {
			{
				Spawner = vector3(-158.98, -1586.58, 34.52),
				InsideShop = vector3(-1524.68, 99.4, 56.72),
				SpawnPoints = {
					{coords = vector3(-1528.74, 82.99, 56.65), heading = 90.0, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(-149.96, -1588.45, 35.03)
		}
	}
}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 }
	},

	member = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 },
                { weapon = 'WEAPON_SNSPISTOL',   components = { nil }, price = 90000 }
	},

	intercircle = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 },
                { weapon = 'WEAPON_SNSPISTOL',   components = { nil }, price = 90000 }
	},

	boss = {
	     { weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 },
	     { weapon = 'WEAPON_SNSPISTOL',   components = { nil }, price = 90000 },
		 { weapon = 'WEAPON_COMPACTRIFLE',   components = { nil }, price = 200000 },
		
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{ model = 'nissantitan17', price = 35000 },
			{ model = 'hcbr17', price = 25000 },
			{ model = 'rs7', price = 35000 }
		},

		member = {
			{ model = 'nissantitan17', price = 35000 },
			{ model = 'hcbr17', price = 35000 },
			{ model = 'rs7', price = 25000 }
		},

		intercircle = {
			{ model = 'nissantitan17', price = 25000 },
			{ model = 'x6m', price = 25000 },
			{ model = 'rs7', price = 25000 }
		},

		boss = {
			{ model = 'nissantitan17', price = 25000 },
			{ model = 'x6m', price = 25000 },
			{ model = 'rs7', price = 25000 }
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
			 ['tshirt_1'] = 0,  ['tshirt_2'] = 2,
			 ['torso_1'] = 230,  ['torso_2'] = 8,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 22,
			 ['pants_1'] = 102,   ['pants_2'] = 14,
			 ['shoes_1'] = 7,   ['shoes_2'] = 8,
			 ['helmet_1'] = 63,  ['helmet_2'] = 0,
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
			 ['tshirt_1'] = 0,  ['tshirt_2'] = 2,
			 ['torso_1'] = 230,  ['torso_2'] = 8,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 22,
			 ['pants_1'] = 102,   ['pants_2'] = 14,
			 ['shoes_1'] = 7,   ['shoes_2'] = 8,
			 ['helmet_1'] = 63,  ['helmet_2'] = 0,
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
			 ['tshirt_1'] = 0,  ['tshirt_2'] = 2,
			 ['torso_1'] = 230,  ['torso_2'] = 8,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 22,
			 ['pants_1'] = 102,   ['pants_2'] = 14,
			 ['shoes_1'] = 7,   ['shoes_2'] = 8,
			 ['helmet_1'] = 63,  ['helmet_2'] = 0,
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
			 ['tshirt_1'] = 0,  ['tshirt_2'] = 2,
			 ['torso_1'] = 230,  ['torso_2'] = 8,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 22,
			 ['pants_1'] = 102,   ['pants_2'] = 14,
			 ['shoes_1'] = 7,   ['shoes_2'] = 8,
			 ['helmet_1'] = 63,  ['helmet_2'] = 0,
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