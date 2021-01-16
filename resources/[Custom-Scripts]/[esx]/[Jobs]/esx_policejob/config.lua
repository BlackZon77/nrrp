Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = 20

Config.Locale                     = 'br'

Config.PoliceStations = {
	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 29.7)
		},

		Armories = {
			vector3(461.07, -981.15, 29.69)
		},

		Vehicles = {
			{
				Spawner = vector3(458.7, -1017.1, 28.2),
				InsideShop = vector3(471, -1089.16, 29.2),
				SpawnPoints = {
					{coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0},
					{coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0},
					{coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0},
					{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 29.6)
		}
	},
PRAIA = {

		Blip = {
			Coords  = vector3(-1325.82, -1514.44, 4.43),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 29
		},
		Cloakrooms = {
			vector3(-1327.5, -1520.98, 3.43)
		},

		Armories = {
			vector3(-1324.83, -1515.55, 3.44)
		},

		Vehicles = {
			{
				Spawner = vector3(-1319.19, -1510.39, 4.43),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(-1327.66, -1507.6, 4.35), heading = 39.04, radius = 6.0},
					{coords = vector3(-1332.91, -1512.75, 4.32), heading = 61.87, radius = 6.0},
				}
			},

			{
				Spawner = vector3(-1202, -1800.09, 3.91),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(-1272.32, -1860.5, 0.76), heading = 276.1, radius = 6.0},
					{coords = vector3(-1284.04, -1845.47, 0.8), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(1860.2, 3697.84, 33.28),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(1879.08, 3724.52, 32.92), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(-1318.93, -1529.49, 3.42)
		}
	},

	Sandy = {
		Blip = {
			Coords  = vector3(1849.12, 3695.12, 34.28),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(1849.12, 3695.12, 33.28)
		},

		Armories = {
			vector3(1842.4, 3691.92, 33.28)
		},

		Vehicles = {
			{
				Spawner = vector3(1865.92, 3684.52, 33.8),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(1867.0, 3695.44, 33.64), heading = 90.0, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(1860.2, 3697.84, 32.28),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(1879.08, 3724.52, 32.92), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(1862.4, 3688.76, 33.28)
		}
	},

	Paleto = {
		Blip = {
			Coords  = vector3(-448.28, 6008.36, 30.72),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.8,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(-448.28, 6008.36, 30.72)
		},

		Armories = {
			vector3(-450.0, 6016.24, 30.72)
		},

		Vehicles = {
			{
				Spawner = vector3(-448.6, 6026.24, 31.48),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(-467.92, 6036.96, 31.36), heading = 90.0, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-457.88, 6017.48, 31.48),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(-475.0, 5988.36, 31.32), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(-449.72, 6011.08, 30.72)
		}
	}
}

Config.AuthorizedWeapons = {
	cadete = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 500 }

	},

	agente = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 }
	},

	agentep = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 }
	},

	agentec = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 }
	},

	chefe = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 }
	},

	chefep = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components =  { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 }
	},

	chefec = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components =  { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 }
	},

	subc = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	boss = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	subint = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	inten = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	superin = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	superinchefe = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	diretoradjunto = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	},

	diretornacional = {
		{ weapon = 'WEAPON_COMBATPISTOL',   components = { nil }, price = 5000 },
		{ weapon = 'WEAPON_STUNGUN',   components = { nil }, price = 2500 },
		{ weapon = 'WEAPON_NIGHTSTICK',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_FLASHLIGHT',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',   components = { nil }, price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN_MK2',   components = { nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMG',   components = { nil }, price = 35000 },
		{ weapon = 'WEAPON_SMOKEGRENADE',   components = { nil }, price = 100 },
		{ weapon = 'WEAPON_SNIPERRIFLE',   components = { nil }, price = 80000 }
	}
}

Config.AuthorizedVehicles = {
	car = {
		cadete = {
			{ model = 'police', price = 50 },
			{ model = 'police2', price = 100 }
		},

		agente = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = 'f450s', price = 100 }
		},

		agentep = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'f450s', price = 100 }
		},

		agentec = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 }

		},

		chefe = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'pd_bmw', price = 100 }
		},

		chefep = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'pd_bmw', price = 100 },
			{ model = 'camarounmarked2018', price = 100 }
		},

		chefec = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'camarobt', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'pd_bmw', price = 100 },
			{ model = 'camarounmarked2018', price = 100 },
			{ model = 'sv2', price = 100 }
		},

		subc = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = 'tahoepsp', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'camarobt', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'pd_bmw', price = 100 },
			{ model = 'camarounmarked2018', price = 100 },
			{ model = 'camaroBBunmarked', price = 100 },
			{ model = 'sv2', price = 100 },
			{ model = 'challenger18', price = 100 }
		},

		boss = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'camaroBB', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = 'tahoepsp', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'camarobt', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'c8b', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'policebee', price = 100 },
			{ model = 'psp_rtwizy', price = 100 },
			{ model = 'medboat', price = 100 },
			{ model = 'smallboat', price = 100 },
			{ model = 'gator', price = 100 },
			{ model = 'pspjski', price = 100 },
			{ model = 'pd_bmw', price = 100 },
			{ model = 'camarounmarked2018', price = 100 },
			{ model = 'camaroBBunmarked', price = 100 },
			{ model = 'sv2', price = 100 },
			{ model = 'challenger18', price = 100 },
			{ model = 'ngt19', price = 100 },
			{ model = 'fbi2', price = 100 },
			{ model = 'ssu', price = 100 },
			{ model = 'gcso5', price = 100 }
		},

	subint = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'camaroBB', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = 'tahoepsp', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'camarobt', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'c8b', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'policebee', price = 100 },
			{ model = 'psp_rtwizy', price = 100 },
			{ model = 'medboat', price = 100 },
			{ model = 'smallboat', price = 100 },
			{ model = 'gator', price = 100 },
			{ model = 'pspjski', price = 100 },
			{ model = 'pd_bmw', price = 100 },
			{ model = 'camarounmarked2018', price = 100 },
			{ model = 'camaroBBunmarked', price = 100 },
			{ model = 'sv2', price = 100 },
			{ model = 'challenger18', price = 100 },
			{ model = 'ngt19', price = 100 },
			{ model = 'fbi2', price = 100 },
			{ model = 'ssu', price = 100 },
			{ model = 'gcso5', price = 100 }
		},

	inten = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'camaroBB', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = 'tahoepsp', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'camarobt', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'c8b', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'policebee', price = 100 },
			{ model = 'psp_rtwizy', price = 100 },
			{ model = 'medboat', price = 100 },
			{ model = 'smallboat', price = 100 },
			{ model = 'gator', price = 100 },
			{ model = 'pspjski', price = 100 },
			{ model = 'pd_bmw', price = 100 },
			{ model = 'camarounmarked2018', price = 100 },
			{ model = 'camaroBBunmarked', price = 100 },
			{ model = 'sv2', price = 100 },
			{ model = 'challenger18', price = 100 },
			{ model = 'ngt19', price = 100 },
			{ model = 'fbi2', price = 100 },
			{ model = 'ssu', price = 100 },
			{ model = 'gcso5', price = 100 }
		},

	superin = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'camaroBB', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = 'tahoepsp', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'camarobt', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'c8b', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'policebee', price = 100 },
			{ model = 'psp_rtwizy', price = 100 },
			{ model = 'medboat', price = 100 },
			{ model = 'smallboat', price = 100 },
			{ model = 'gator', price = 100 },
			{ model = 'pspjski', price = 100 },
			{ model = 'pd_bmw', price = 100 },
			{ model = 'camarounmarked2018', price = 100 },
			{ model = 'camaroBBunmarked', price = 100 },
			{ model = 'sv2', price = 100 },
			{ model = 'challenger18', price = 100 },
			{ model = 'ngt19', price = 100 },
			{ model = 'fbi2', price = 100 },
			{ model = 'ssu', price = 100 },
			{ model = 'gcso5', price = 100 }
		},

	superinchefe = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'camaroBB', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = 'tahoepsp', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'camarobt', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'c8b', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'policebee', price = 100 },
			{ model = 'psp_rtwizy', price = 100 },
			{ model = 'medboat', price = 100 },
			{ model = 'smallboat', price = 100 },
			{ model = 'gator', price = 100 },
			{ model = 'pspjski', price = 100 },
			{ model = 'pd_bmw', price = 100 },
			{ model = 'camarounmarked2018', price = 100 },
			{ model = 'camaroBBunmarked', price = 100 },
			{ model = 'sv2', price = 100 },
			{ model = 'challenger18', price = 100 },
			{ model = 'ngt19', price = 100 },
			{ model = 'fbi2', price = 100 },
			{ model = 'ssu', price = 100 },
			{ model = 'gcso5', price = 100 }
		},

	diretoradjunto = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'camaroBB', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = 'tahoepsp', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'camarobt', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'c8b', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'policebee', price = 100 },
			{ model = 'psp_rtwizy', price = 100 },
			{ model = 'medboat', price = 100 },
			{ model = 'smallboat', price = 100 },
			{ model = 'gator', price = 100 },
			{ model = 'pspjski', price = 100 },
			{ model = 'pd_bmw', price = 100 },
			{ model = 'camarounmarked2018', price = 100 },
			{ model = 'camaroBBunmarked', price = 100 },
			{ model = 'sv2', price = 100 },
			{ model = 'challenger18', price = 100 },
			{ model = 'ngt19', price = 100 },
			{ model = 'fbi2', price = 100 },
			{ model = 'ssu', price = 100 },
			{ model = 'gcso5', price = 100 }
		},

	diretornacional = {
			{ model = 'palablue', price = 100 },
			{ model = 'psp_ftipo2', price = 100 },
			{ model = 'bmwpsp', price = 100 },
			{ model = '14tesla', price = 100 },
			{ model = '2020camaropp', price = 100 },
			{ model = 'camaroBB', price = 100 },
			{ model = 'psp_thilux', price = 100 },
			{ model = '16explorer', price = 100 },
			{ model = '17zr2bb', price = 100 },
			{ model = 'tahoepsp', price = 100 },
			{ model = '1200RTbt', price = 100 },
			{ model = 'pspp_530dbt', price = 100 },
			{ model = '14teslabt', price = 100 },
			{ model = 'camarobt', price = 100 },
			{ model = 'policesu', price = 100 },
			{ model = 'police3', price = 100 },
			{ model = 'c8b', price = 100 },
			{ model = 'psp_ftipo', price = 100 },
			{ model = 'carrinhaci', price = 100 },
			{ model = 'riot', price = 100 },
			{ model = 'psp_ftransit', price = 100 },
			{ model = 'uep_thilux', price = 100 },
			{ model = 'psp_bmwgs', price = 100 },
			{ model = 'dgrsp_vwcrafter', price = 100 },
			{ model = 'ems_djim600', price = 100 },
			{ model = 'f450s', price = 100 },
			{ model = 'policebee', price = 100 },
			{ model = 'psp_rtwizy', price = 100 },
			{ model = 'medboat', price = 100 },
			{ model = 'smallboat', price = 100 },
			{ model = 'gator', price = 100 },
			{ model = 'pspjski', price = 100 },
			{ model = 'pd_bmw', price = 100 },
			{ model = 'camarounmarked2018', price = 100 },
			{ model = 'camaroBBunmarked', price = 100 },
			{ model = 'sv2', price = 100 },
			{ model = 'challenger18', price = 100 },
			{ model = 'ngt19', price = 100 },
			{ model = 'fbi2', price = 100 },
			{ model = 'ssu', price = 100 },
			{ model = 'gcso5', price = 100 }
		}
	},

	helicopter = {
		cadete = {},

		agente = {
			{model = 'swift', props = {modLivery = 0}, price = 50}
		},

		agentep = {
			{model = 'swift', props = {modLivery = 0}, price = 50}
		},

		agentec = {
			{model = 'swift', props = {modLivery = 0}, price = 50}
		},

		chefe = {
			{model = 'swift', props = {modLivery = 0}, price = 50}
		},

		chefep = {
			{model = 'swift', props = {modLivery = 0}, price = 50}
		},

		chefec = {
			{model = 'swift', props = {modLivery = 0}, price = 50}
		},

		subc = {
			{model = 'swift', props = {modLivery = 0}, price = 50}
		},

		boss = {
			{model = 'swift', props = {modLivery = 0}, price = 50}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Police 3 Ped', maleModel = 's_m_y_r8bt_01', femaleModel = 's_f_y_r8bt_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	cadete = {},
	agente = {},
	agentep = {},
	agentec = {},
	chefe = {},
	boss = {},

	chefec = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	fcadete = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 12,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 114,  helmet_2 = 3,
			chain_1 = 2,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagente = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentemangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fagentep = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 1,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 1,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentepcortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fagentec = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 2,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagentecmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 2,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fagenteccortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 2,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fchefe = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 3,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefemangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 3,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 3,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fchefep = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 4,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 4,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 4,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefepcortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fchefec = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 5,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefecmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 5,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 6,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 5,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fchefeccortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fsubc = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 6,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 6,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubcmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 6,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 6,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 1,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 6,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubccortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fcomissario = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 7,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariomangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 7,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 8,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 7,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fcomissariocortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoleteorioficial = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoleteori = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 6
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoletaberto1 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 10,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoletaberto2 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 10,  bproof_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoletet = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 10,  bproof_2 = 2
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoleteorimangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 6
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	ftransitocoleteorioficialmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoletaberto1mangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 10,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoletaberto2mangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 10,  bproof_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitocoletet2 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 34,    bags_2 = 0,
			bproof_1 = 10,  bproof_2 = 2
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitomotan = {
		male = {
			tshirt_1 = 71,  tshirt_2 = 0,
			torso_1 = 123,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 33,
			pants_1 = 49,   pants_2 = 1,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 2,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 2,  bproof_2 = 2
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	ftransitomotao = {
		male = {
			tshirt_1 = 71,  tshirt_2 = 0,
			torso_1 = 123,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 33,
			pants_1 = 49,   pants_2 = 1,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 2,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 2,  bproof_2 = 2
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fepricoleteoficial = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 111,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 32,   pants_2 = 1,
			shoes_1 = 33,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 3,
			mask_1 = 56,    mask_2 = 1,
			glasses_1 = 25,  glasses_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fepricolete = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 111,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 32,   pants_2 = 1,
			shoes_1 = 33,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 2,
			mask_1 = 56,    mask_2 = 1,
			glasses_1 = 25,  glasses_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fepriori = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 219,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 32,   pants_2 = 1,
			shoes_1 = 33,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 56,    mask_2 = 1,
			glasses_1 = 25,  glasses_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fepriorigoe = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 219,  torso_2 = 4,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 32,   pants_2 = 1,
			shoes_1 = 33,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 56,    mask_2 = 1,
			glasses_1 = 25,  glasses_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fepriorigoeo = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 219,  torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 32,   pants_2 = 1,
			shoes_1 = 33,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 56,    mask_2 = 1,
			glasses_1 = 25,  glasses_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fepriorio = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 219,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 32,   pants_2 = 1,
			shoes_1 = 33,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0,
			mask_1 = 56,    mask_2 = 1,
			glasses_1 = 25,  glasses_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fepricasacooficial = {
		male = {
			tshirt_1 = 71,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 32,   pants_2 = 1,
			shoes_1 = 33,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			mask_1 = 56,    mask_2 = 1,
			glasses_1 = 25,  glasses_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fepricasaco = {
		male = {
			tshirt_1 = 71,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 32,   pants_2 = 1,
			shoes_1 = 33,   shoes_2 = 0,
			helmet_1 = 48,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			mask_1 = 56,    mask_2 = 1,
			glasses_1 = 25,  glasses_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},


	fassaltocurto = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 125,  helmet_2 = 5,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 1,
			bproof_1 = 12,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fassaltocomprida = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 7,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 125,  helmet_2 = 5,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 1,
			bproof_1 = 12,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardagoe = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 111,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 33,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 53,   shoes_2 = 0,
			helmet_1 = 75,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 69,    bags_2 = 1,
			bproof_1 = 16,  bproof_2 = 0,
			mask_1 = 56,    mask_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardaci = {
		male = {
			tshirt_1 = 127,  tshirt_2 = 0,
			torso_1 = 111,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 54,   shoes_2 = 0,
			helmet_1 = 126,  helmet_2 = 5,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 74,    bags_2 = 0,
			bproof_1 = 2,  bproof_2 = 0,
			mask_1 = 56,    mask_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardaci2 = {
		male = {
			tshirt_1 = 122,  tshirt_2 = 0,
			torso_1 = 111,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 54,   shoes_2 = 0,
			helmet_1 = 126,  helmet_2 = 5,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 74,    bags_2 = 0,
			bproof_1 = 12,  bproof_2 = 2,
			mask_1 = 56,    mask_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardaci3 = {
		male = {
			tshirt_1 = 122,  tshirt_2 = 0,
			torso_1 = 111,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 17,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 54,   shoes_2 = 0,
			helmet_1 = 126,  helmet_2 = 5,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 74,    bags_2 = 0,
			bproof_1 = 16,  bproof_2 = 1,
			mask_1 = 56,    mask_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardauep = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 111,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 53,   shoes_2 = 0,
			helmet_1 = 28,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardauep2 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 49,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 53,   shoes_2 = 0,
			helmet_1 = 28,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 69,     bags_2 = 1,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardauep3 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 49,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 53,   shoes_2 = 0,
			helmet_1 = 28,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 74,     bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardauepcinotecnica = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 111,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 53,   shoes_2 = 0,
			helmet_1 = 28,  helmet_2 = 2,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,     bags_2 = 0,
			bproof_1 = 25,  bproof_2 = 1
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardauepcinotecnica2 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 49,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 53,   shoes_2 = 0,
			helmet_1 = 28,  helmet_2 = 2,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 69,     bags_2 = 1,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardauepcinotecnica3 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 49,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 53,   shoes_2 = 0,
			helmet_1 = 28,  helmet_2 = 2,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 74,     bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardauepcinotecnica4 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 49,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 53,   shoes_2 = 0,
			helmet_1 = 28,  helmet_2 = 2,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 74,     bags_2 = 0,
			bproof_1 = 12,  bproof_2 = 3
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},
	fardauepcinotecnica5 = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 49,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 22,
			pants_1 = 33,   pants_2 = 0,
			shoes_1 = 53,   shoes_2 = 0,
			helmet_1 = 28,  helmet_2 = 2,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 74,     bags_2 = 0,
			bproof_1 = 16,  bproof_2 = 2
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	helipsp = {
		male = {
			tshirt_1 = 54,  tshirt_2 = 0,
			torso_1 = 54,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 96,
			pants_1 = 41,   pants_2 = 0,
			shoes_1 = 54,   shoes_2 = 0,
			helmet_1 = 78,  helmet_2 = 0,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 74,     bags_2 = 0,
			bproof_1 = 13,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	tirarcolete_wear = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},
	coleter1_wear = {
		male = {
			bproof_1 = 10,  bproof_2 = 3
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},
	colete_wear = {
		male = {
			bproof_1 = 12,  bproof_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},
	ttt_wear = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	ttt2_wear = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	ttt3_wear = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	ttt4_wear = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	cartaocoldre = {
		male = {
			tshirt_1 = 20,  tshirt_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	golaaltapolicia = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	golaaltauep = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 1
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	radiodutybelt = {
		male = {
			tshirt_1 = 88,  tshirt_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivopeitouep = {
		male = {
			tshirt_1 = 113,  tshirt_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivopeitocartao = {
		male = {
			bproof_1 = 21,  bproof_2 = 2
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivopeitooficial = {
		male = {
			tshirt_1 = 113,  tshirt_2 = 1
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	dutybeltunmarked = {
		male = {
			tshirt_1 = 53,  tshirt_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	coletecriminal = {
		male = {
			bproof_1 = 12,  bproof_2 = 1
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	coletecriminal3 = {
		male = {
			bproof_1 = 18,  bproof_2 = 1
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	coleteleve2 = {
		male = {
			bproof_1 = 18,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivocomalgemasoficial = {
		male = {
			bproof_1 = 24,  bproof_2 = 1
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivocomalgemasuep = {
		male = {
			bproof_1 = 24,  bproof_2 = 2
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	coletecriminal2 = {
		male = {
			bproof_1 = 25,  bproof_2 = 5
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	coletet2 = {
		male = {
			bproof_1 = 25,  bproof_2 = 7
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	coletet3 = {
		male = {
			bproof_1 = 25,  bproof_2 = 8
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	coldreperna = {
		male = {
			chain_1 = 1,    chain_2 = 0,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	coldrecintura1 = {
		male = {
			chain_1 = 6,    chain_2 = 0,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	coldrecintura2 = {
		male = {
			chain_1 = 8,    chain_2 = 0,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivodutybeltuep = {
		male = {
			bags_1 = 74,     bags_2 = 0,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivodutybeltoficial = {
		male = {
			bags_1 = 74,     bags_2 = 1,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivopernaficial = {
		male = {
			bags_1 = 69,     bags_2 = 0,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivopernatuep = {
		male = {
			bags_1 = 69,     bags_2 = 1,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	carregadores = {
		male = {
			bags_1 = 66,     bags_2 = 0,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivopeitooficial2 = {
		male = {
			bags_1 = 59,     bags_2 = 1,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	destintivopeitouep2 = {
		male = {
			bags_1 = 59,     bags_2 = 2,
		},
		female = {
			bproof_1 = 0,  bproof_2 = 1
		}
	},
	coldrebraco = {
		male = {
			tshirt_1 = 16,  tshirt_2 = 0
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},
	casacoic = {
		male = {
			torso_1 = 35,  torso_2 = 2
		},
		female = {
			torso_1 = 74,  torso_2 = 8
		}
	},
	chapeuic = {
		male = {
			helmet_1 = 10,  helmet_2 = 1
		},
		female = {
			helmet_1 = 10,  helmet_2 = 0
		}
	},

	fsubint = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 8,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 8,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubintemangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 8,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 8,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubintcerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 9,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 8,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubintcasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubintcasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubintcasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 9,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubintcortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsubintcortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	finten = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 9,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 9,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fintenmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 9,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 9,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fintencerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 10,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 52,    bags_2 = 9,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fintencasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fintencasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fintencasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 10,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fintencortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fintencortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperin = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 10,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperinmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 10,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 0,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperincerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 11,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperincasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperincasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperincasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 11,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperincortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperincortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperinchefe = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 11,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 1,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperinchefemangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 11,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 1,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperinchefecerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 12,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 1,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperinchefecasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperinchefecasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperinchefecasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 12,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperinchefecortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fsuperinchefecortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0

		}
	},

	fdiretoradjunto = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 12,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 2,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretoradjuntomangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 12,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 2,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretoradjuntocerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 13,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 2,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretoradjuntocasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretoradjuntocasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretoradjuntocasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 13,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretoradjuntocortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretoradjuntocortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretornacional = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 74,  torso_2 = 13,
			decals_1 = 0,   decals_2 = 0,
			arms = 19,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 3,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretornacionalmangas = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 193,  torso_2 = 13,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 3,
			bproof_1 = 19,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretornacionalcerimonias = {
		male = {
			tshirt_1 = 56,  tshirt_2 = 0,
			torso_1 = 200,  torso_2 = 14,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 36,   shoes_2 = 3,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 37,    bags_2 = 3,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretornacionalcasaco = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretornacionalcasacocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 156,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretornacionalcasacoinverno = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 154,  torso_2 = 14,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 34,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretornacionalcortavento = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	fdiretornacionalcortaventocolete = {
		male = {
			tshirt_1 = 72,  tshirt_2 = 0,
			torso_1 = 35,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 20,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 51,   shoes_2 = 0,
			helmet_1 = 10,  helmet_2 = 3,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bags_1 = 0,    bags_2 = 0,
			bproof_1 = 5,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	}
}
