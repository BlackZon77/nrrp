Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 150  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders
Config.EnableESXService			  = true

Config.Locale                     = 'br'

Config.EarlyRespawnTimer          = 60000 * 15  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 17 -- time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = {coords = vector3(-477.64, -340.99, 69.52), heading = 246.7}
Config.Hospitals = {
	CentralLosSantos = {

		Blip = {
			coords = vector3(-453.54, -339.99, 34.36),
			sprite = 542,
			scale  = 0.6,
			color  = 46
		},


		AmbulanceActions = {
			vector3(-443.53, -310.81, 33.91)
		},

		Pharmacies = {
			vector3(-252.41, 6313.65, 30.43)
		},
		


		Vehicles = {
			{
				Spawner = vector3(-421.28, -347.67, 24.23),
				Spawner = vector3(-233.63, 6328.39, 32.06),
				InsideShop = vector3(-447.63, -453.67, 32.96),
				InsideShop = vector3(-232.33, 6262.47, 31.49),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 225, g = 225, b = 0, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-257.91, 6347.24, 32.43), heading = 56.19, radius = 4.0 },
					{ coords = vector3(-262.17, 6342.9, 32.43), heading = 356.62, radius = 4.0 },
					{ coords = vector3(-269.02, 6336.99, 32.43 ), heading = 56.19, radius = 4.0 },
					{ coords = vector3(-419.82, -359.64, 24.23 ), heading = 56.19, radius = 4.0 },
					{ coords = vector3(-427.26, -362.46, 24.23), heading = 356.62, radius = 4.0 },
					{ coords = vector3(-434.98, -365.63, 24.23), heading = 339.8, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(338.94, -587.24, 74.17),
                InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 225, g = 225, b = 0, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(351.99, -586.68, 74.07), heading = 153.19, radius = 4.0 }
				}
			}
		},
		

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = {coords = vector3(272.8, -1358.8, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = {coords = vector3(295.8, -1446.5, 28.9), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	},
	Palleto = {

		
		Blip = {
			coords = vector3(-246.73, 6306.53, 31.47),
			sprite = 542,
			scale  = 0.6,
			color  = 46
		},

		AmbulanceActions = {
			vector3(-252.36, 6309.72, 31.43)
		},

		Pharmacies = {
			vector3(-493.42, -339.84, 41.32)
		},

		Vehicles = {
			{
				Spawner = vector3(-421.28, -347.67, 24.23),
				Spawner = vector3(-233.63, 6328.39, 32.06),
				InsideShop = vector3(-447.63, -453.67, 32.96),
				InsideShop = vector3(-232.33, 6262.47, 31.49),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 225, g = 225, b = 0, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-257.91, 6347.24, 32.43), heading = 56.19, radius = 4.0 },
					{ coords = vector3(-262.17, 6342.9, 32.43), heading = 356.62, radius = 4.0 },
					{ coords = vector3(-269.02, 6336.99, 32.43 ), heading = 56.19, radius = 4.0 },
					{ coords = vector3(-419.82, -359.64, 24.23 ), heading = 56.19, radius = 4.0 },
					{ coords = vector3(-427.26, -362.46, 24.23), heading = 356.62, radius = 4.0 },
					{ coords = vector3(-434.98, -365.63, 24.23), heading = 339.8, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(338.94, -587.24, 74.17),
                InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 225, g = 225, b = 0, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(351.99, -586.68, 74.07), heading = 153.19, radius = 4.0 }
				}
			}
		},
		

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = {coords = vector3(272.8, -1358.8, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = {coords = vector3(295.8, -1446.5, 28.9), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{ model = 'ems_gs1200', price = 50},
			{ model = 'emir_vwgolf6', price = 50},
			{ model = 'ambulance', price = 50},
			{ model = 'ambulancei', price = 50}
		},

		doctor = {
		{ model = 'ems_gs1200', price = 50},
			{ model = 'emir_vwgolf6', price = 50},
			{ model = 'ambulance', price = 50},
			{ model = 'ambulancei', price = 50}
		},

		chief_doctor = {
			{ model = 'ems_gs1200', price = 50},
			{ model = 'emir_vwgolf6', price = 50},
			{ model = 'ambulance', price = 50},
			{ model = 'ambulancei', price = 50}
		},

		medc = {
			{ model = 'ems_gs1200', price = 50},
			{ model = 'emir_vwgolf6', price = 50},
			{ model = 'ambulance', price = 50},
			{ model = 'ambulancei', price = 50}
		},

		subdiret = {
			{ model = 'ems_gs1200', price = 50},
			{ model = 'emir_vwgolf6', price = 50},
			{ model = 'ambulance', price = 50},
			{ model = 'ambulancei', price = 50}
		},

		boss = {
			{ model = 'ems_gs1200', price = 50},
			{ model = 'emir_vwgolf6', price = 50},
			{ model = 'ambulance', price = 50},
			{ model = 'ambulancei', price = 50}
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'swift', price = 5000}
		},

		chief_doctor = {
			{model = 'swift', price = 5000}
		},

		medc = {
			{model = 'swift', price = 5000}
		},

		subdiret = {
			{model = 'swift', price = 5000}
		},

		boss = {
			{model = 'swift', price = 5000}
		}
	}
}

Config.Uniforms = {
	teph = {
		male = {
			tshirt_1 = 54,  tshirt_2 = 0,
			torso_1 = 102,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 85,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 30,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 13, 	bproof_2 = 0
		},
		female = {
			tshirt_1 = 65,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 85,
			pants_1 = 51,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		}
	},
	enfer = {
		male = {
			tshirt_1 = 54,  tshirt_2 = 0,
			torso_1 = 102,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 85,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 30,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 13, 	bproof_2 = 0
		},
		female = {
			tshirt_1 = 65,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 85,
			pants_1 = 51,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		}
	},
	medico = {
		male = {
			tshirt_1 = 54,  tshirt_2 = 0,
			torso_1 = 102,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 85,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 30,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 13, 	bproof_2 = 0
		},
		female = {
			tshirt_1 = 65,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 85,
			pants_1 = 51,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		}
	},
	dele = {
		male = {
			tshirt_1 = 54,  tshirt_2 = 0,
			torso_1 = 102,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 85,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 30,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 13, 	bproof_2 = 0
		},
		female = {
			tshirt_1 = 65,  tshirt_2 = 0,
			torso_1 = 93,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 85,
			pants_1 = 51,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		}
	},
	tephcasaco = {
		male = {
			tshirt_1 = 54,  tshirt_2 = 0,
			torso_1 = 53,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 88,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		},
		female = {
			tshirt_1 = 65,  tshirt_2 = 0,
			torso_1 = 46,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 101,
			pants_1 = 51,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		}
	},
	enfercasaco = {
		male = {
			tshirt_1 = 54,  tshirt_2 = 0,
			torso_1 = 53,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 88,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		},
		female = {
			tshirt_1 = 65,  tshirt_2 = 0,
			torso_1 = 46,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 101,
			pants_1 = 51,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		}
	},
	medicocasaco = {
		male = {
			tshirt_1 = 54,  tshirt_2 = 0,
			torso_1 = 53,  torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 88,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		},
		female = {
			tshirt_1 = 65,  tshirt_2 = 0,
			torso_1 = 46,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 101,
			pants_1 = 51,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		}
	},
	delecasaco = {
		male = {
			tshirt_1 = 54,  tshirt_2 = 0,
			torso_1 = 53,  torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 88,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		},
		female = {
			tshirt_1 = 65,  tshirt_2 = 0,
			torso_1 = 46,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 101,
			pants_1 = 51,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 14, 	bproof_2 = 0
		}
	},
	mota = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 249,  torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 90,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 30,    chain_2 = 2,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 0, 	bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 257,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 101,
			pants_1 = 51,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 14,    chain_2 = 0,
			ears_1 = 2,    ears_2 = 0,
			bproof_1 = 0, 	bproof_2 = 0
		}
	},
	hoodie = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 249,  torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 90,
			pants_1 = 49,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 30,    chain_2 = 2,
			ears_1 = -1,    ears_2 = 0,
			bproof_1 = 0, 	bproof_2 = 0
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 257,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 101,
			pants_1 = 51,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 14,    chain_2 = 0,
			ears_1 = 2,    ears_2 = 0,
			bproof_1 = 0, 	bproof_2 = 0
		}
	},
	chapeuinem = {
		male = {
			helmet_1 = 10,  helmet_2 = 4,
		},
		female = {
			helmet_1 = 10,  helmet_2 = 0,
		}
	},
	motainem = {
		male = {
			helmet_1 = 16,  helmet_2 = 0,
		},
		female = {
			helmet_1 = 16,  helmet_2 = 0,
		}
	},
	heliinem = {
		male = {
			helmet_1 = 78,  helmet_2 = 1,
		},
		female = {
			helmet_1 = 16,  helmet_2 = 0,
		}
	},
	ttt_wear = {
		male = {
			helmet_1 = -1,  helmet_2 = 0,
		},
		female = {
			helmet_1 = -1,  helmet_2 = 0,
		}
	}
}