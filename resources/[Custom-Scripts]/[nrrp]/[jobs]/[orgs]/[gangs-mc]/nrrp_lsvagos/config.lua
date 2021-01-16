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


Config.LSVagosStations = {
	LSVagosBase = {

		Blip = {
			Coords  = vector3(364.8, -2065.12, 21.76),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(344.87, -2021.86, 22.39)
		},

		Armories = {
			vector3(331.72, -2013.93, 22.64)
		}, 

		Vehicles = {
			{ 
				Spawner = vector3(336.22, -2040.61, 21.14),
				InsideShop = vector3(596.6, 2525.28, 59.26),
				SpawnPoints = { 
					{coords = vector3(329.75, -2036.84, 20.94), heading = 90.0, radius = 6.0}
				} 
			}
		},

		BossActions = {
			vector3(359.91, -2038.52, 25.59 )
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
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_PISTOL',   components = { nil }, price = 75000 }
	},

	boss = {
		{ weapon = 'WEAPON_BAT',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_PISTOL',   components = { nil }, price = 75000 },
                { weapon = 'WEAPON_MICROSMG',   components = { nil }, price = 150000 },

	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{ model = 'fox', price = 10000 }
		},

		member = {
			{ model = 'fox', price = 10000 },
			{ model = 'fe86', price = 30000 },
			{ model = 'm3e30', price = 30000 }
		},

		intercircle = {
			{ model = 'fox', price = 10000 },
		    { model = 'fe86', price = 30000 },
			{ model = 'm3e30', price = 30000 }
		},

		boss = {
			{ model = 'm3e30', price = 10000 },
			{ model = 'fe86', price = 30000 }
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
			 ['tshirt_1'] = 2,  ['tshirt_2'] = 0,
			 ['torso_1'] = 75,  ['torso_2'] = 5,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 8,   ['pants_2'] = 3,
			 ['shoes_1'] = 1,   ['shoes_2'] = 8,
			 ['helmet_1'] = 4,  ['helmet_2'] = 3,
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
			 ['tshirt_1'] = 2,  ['tshirt_2'] = 0,
			 ['torso_1'] = 75,  ['torso_2'] = 5,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 8,   ['pants_2'] = 3,
			 ['shoes_1'] = 1,   ['shoes_2'] = 8,
			 ['helmet_1'] = 4,  ['helmet_2'] = 3,
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
			 ['tshirt_1'] = 2,  ['tshirt_2'] = 0,
			 ['torso_1'] = 75,  ['torso_2'] = 5,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 8,   ['pants_2'] = 3,
			 ['shoes_1'] = 1,   ['shoes_2'] = 8,
			 ['helmet_1'] = 4,  ['helmet_2'] = 3,
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
			 ['tshirt_1'] = 2,  ['tshirt_2'] = 0,
			 ['torso_1'] = 75,  ['torso_2'] = 5,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 8,   ['pants_2'] = 3,
			 ['shoes_1'] = 1,   ['shoes_2'] = 8,
			 ['helmet_1'] = 4,  ['helmet_2'] = 3,
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