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

Config.TheLostMCStations = {
	TheLostMCBase = {

		Blip = {
			Coords  = vector3(997.12, -116.96, 74.08),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(-1883, 2058, 141)
		},

		Armories = {
			vector3(-1875, 2057, 136)
		},

		Vehicles = {
			{
				Spawner = vector3(-1900, 2035, 141),
				InsideShop = vector3(-1892, 2033, 141),
				SpawnPoints = {
					{coords = vector3(-1894, 2015,141), heading = 90.0, radius = 6.0}
				}
			}
		},

		BossActions = {
			vector3(-1876, 2061, 146)
		}
	}
}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2500 }
	},

	member = {
		{ weapon = 'WEAPON_SWITCHBLADE',   components = { nil }, price = 2500 }
	},

	intercircle = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 125000 }
	},

	boss = {
	     { weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 100000 },
		 { weapon = 'WEAPON_MINISMG',   components = { nil }, price = 275000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 350000 }
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{ model = 'g65amg', price = 25000 },
			{ model = 'm3e30', price = 25000 },
			{ model = 'rs7', price = 25000 }
		},

		member = {
			{ model = 'g65amg', price = 25000 },
			{ model = 'm3e30', price = 25000 },
			{ model = 'rs7', price = 25000 }
		},

		intercircle = {
			{ model = 'g65amg', price = 25000 },
			{ model = 'm3e30', price = 25000 },
			{ model = 'rs7', price = 25000 }
		},

		boss = {
			{ model = 'g65amg', price = 25000 },
			{ model = 'm3e30', price = 25000 },
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
		male = {},
		female = {}
	},
	member = {
		male = {},
		female = {}
	},
	intercircle = {
		male = {},
		female = {}
	},
	boss = {
		male = {},
		female = {}
	}
}
