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

Config.GalaxyStations = {
	Galaxy = {
		Blip = {
			  Coords  = vector3(356.56, 306.16, 103.72),
			  Sprite  = 614,
			  Display = 4,
			  Scale   = 0.8,
			  Colour  = 4,
		},

		Cloakrooms = {
			vector3(393.4, 279.28, 94.2)
		},

		Armories = {
			vector3(388.32, 275.52, 94.2)
		},

		Vehicles = {
			{
				Spawner = vector3(362.37, 298.55, 103.88),
				InsideShop = vector3(391.7, 284.47, 102.99),
				SpawnPoints = {
					{coords = vector3(356.25, 279.09, 103.3), heading = 90.0, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(389.4, 272.8, 94.2)
		}
	}
}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2000 }
	},

	barmen = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2000 }
	},

	security = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2000 }
	},

	boss = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2000 }
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{ model = 'h6', price = 6000 }
		
		},
	barmen = {
			{ model = 'h6', price = 6000 },
                        { model = 'mqgts', price = 10000 },

		},
	security = {
			{ model = 'h6', price = 6000 },
			{ model = 'mqgts', price = 10000 },
			{ model = 'rcf', price = 15000 },
		},
	boss =  {
			{ model = 'h6', price = 6000 },
			{ model = 'mqgts', price = 10000 },
			{ model = 'rcf', price = 15000 },
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
		male = {},
		female = {}
	},
	barmen = {
		male = {},
		female = {}
	},
	security = {
		male = {},
		female = {}
	},
	boss = {
		male = {},
		female = {}
	}
}