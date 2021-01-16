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


Config.TQLLStations = {
	tequilala = {

		Blip = {
			Coords  = vector3(-556.0, 273.48, 83.0),
			Sprite  = 93,
			Display = 4,
			Scale   = 0.8,
			Colour  = 27
		},

		Cloakrooms = {
			vector3(-552.12, 278.36, 81.26)
		},

		Armories = {
			vector3(-576.2, 291.36, 78.26)
		},

		Vehicles = {
			{
				Spawner = vector3(-566.86, 302.59, 83.13),
				InsideShop = vector3(-614.87, 340.56, 85.12),
				SpawnPoints = {
					{coords = vector3(-548.42, 334.68, 84.37), heading = 90.0, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(-571.48, 285.64, 78.26)
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
			{ model = 'rumpo', price = 0 }
		
		},
	barmen = {
			{ model = 'rumpo', price = 0 },
		},
	security = {
			{ model = 'rumpo', price = 0 },
		},
	boss =  {
			{ model = 'rumpo', price = 0 },
		}
	}
}

Config.CustomPeds = {
	shared = {},

	recruit = {},
	barmen = {},
	security = {},
	boss = {}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			 ['tshirt_1'] = 0,  ['tshirt_2'] = 0,
			 ['torso_1'] = 20,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 0,   ['pants_2'] = 0,
			 ['shoes_1'] = 15,   ['shoes_2'] = 0,
			 ['helmet_1'] = 7,  ['helmet_2'] = 0,
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
			 ['tshirt_1'] = 0,  ['tshirt_2'] = 0,
			 ['torso_1'] = 20,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 0,   ['pants_2'] = 0,
			 ['shoes_1'] = 15,   ['shoes_2'] = 0,
			 ['helmet_1'] = 7,  ['helmet_2'] = 0,
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
			 ['tshirt_1'] = 7,  ['tshirt_2'] = 2,
			 ['torso_1'] = 21,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 10,   ['pants_2'] = 0,
			 ['shoes_1'] = 50,   ['shoes_2'] = 0,
			 ['helmet_1'] = 29,  ['helmet_2'] = 0,
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
			 ['tshirt_1'] = 7,  ['tshirt_2'] = 2,
			 ['torso_1'] = 25,  ['torso_2'] = 0,
			 ['decals_1'] = 0,   ['decals_2'] = 0,
			 ['arms'] = 0,
			 ['pants_1'] = 0,   ['pants_2'] = 0,
			 ['shoes_1'] = 78,   ['shoes_2'] = 0,
			 ['helmet_1'] = 61,  ['helmet_2'] = 0,
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