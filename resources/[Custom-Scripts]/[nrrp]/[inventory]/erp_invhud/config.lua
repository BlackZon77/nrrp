Config = {}
Config.Locale = 'en'

Config.ESX1Point1 = false -- SET TRUE IF USING ESX1.1 OR LOWER

Config.TextLog = {
	Use = true,
	Webhook = 'https://discordapp.com/api/webhooks/767146537993109545/19V2i94SG8Sb_j8y5KY60msCHNWR7oMSMEyJoQ9OL4elauffjXp-FwaKHI2Vtcam_N4x'
}

Config.Use = { 
	-- SET ALL USE INFORMATION HERE:
	-- LICENSES(SHOULD THE SCRIPT USE THE LICENSE SYSTEM FOR ANY SHOPS)
	-- SOCIETIES(SHOULD THE SCRIPT USE THE SOCIETY SYSTEM FOR ANY SHOPS),
	-- FORCESEARCH(SHOULD THE SCRIPT ALLOW ANY PLAYER TO SEARCH ANY OTHER PLAYER THEY ARE IMMEDIATELY NEXT TO),
	-- ADMINSEARCH(POWERFUL ADMIN TOOL:SHOULD SCRIPT ALLOW PLAYERS WITH COMMAND ABILITIES TO SEARCH ANY INVENTORY USING ITS DATABASE ID OR IN THE CASE OF PLAYERS THEIR SERVER ID)
	Licenses = true,
	Societies = false,
	ForceSearch = true,
	AdminSearch = true
}

Config.IncludeOptions = { -- SET ALL NON-ITEM INCLUDED OPTIONS HERE:CASH(INCLUDE PLAYER CASH IN THEIR INVENTORY? WILL ALWAYS SHOW CASH IN SECONDARY IF PRESENT), DIRTY(INCLUDE
	-- PLAYER BLACK_MONEY IN THEIR INVENTORY? WILL ALWAYS SHOW BLACK_MONEY IN SECONDARY IF PRESENT), WEAPONS(INCLUDE PLAYER WEAPONS IN THEIR INVENTORY? DOES NOT CREATE WEAPONS
	-- AS ITEMS, SIMPLY ADD THEM AS OPTIONS TO DROP/GIVE/PLACE IN SECONDARY INVENTORY. WILL ALWAYS SHOW WEAPONS IN SECONDARY IF PRESENT)
	Cash = true,
	Dirty = true,
	Weapons = true
}

-- Config.OpenKeyName = 'f2' -- SET KEY MAPPED VALUE FOR OPEN INVENTORY COMMAND(PLAYERS CAN ADJUST THEIR OWN KEY MAP VALUE IN GAME)
Config.OpenKeyName = 289 -- SET KEY MAPPED VALUE FOR OPEN INVENTORY COMMAND(PLAYERS CAN ADJUST THEIR OWN KEY MAP VALUE IN GAME)

Config.CurrencyIcon = '€' -- SET CURRENCY ICON FOR NON HTML INSTANCES(NOTIFCATIONS MOSTLY)

Config.LicensePrice = 5000

-- List of item names that will close ui when used
Config.CloseUiItems = {
	"lockpick", "radio", "tuning_laptop"
}

Config.Weight = { -- SET ALL WEIGHT INFORMATION HERE:ADDWEAPONSTOPLAYERWEIGHT(SHOULD THE SCRIPT ADD WEAPON WEIGHT TO THE PLAYER INVENTORY?), STASHWEIGHT(WEIGHT FOR STASHES),
	-- WEAPONWEIGHTS(HOW MUCH DOES EACH WEAPON WEIGH?), VEHICLELIMITS(CLASSES(HOW MUCH WEIGHT SHOULD EACH VEHICLE CLASS HOLD IN THE GLOVEBOX AND TRUNK?), CUSTOMWEIGHT(CAR MODELS AND THEIR CUSTOM WEIGHT VALUES)),
	-- HOUSES(SHELLS(SHELL SPECIFIC WEIGHTS FOR HOUSING))
	AddWeaponsToPlayerWeight = true,
	StashWeight = 5000,
	Motels = 5000,
	WeaponWeights = {
		['WEAPON_KNIFE'] = 24,
		['WEAPON_STUNGUN'] = 2,
		['WEAPON_FLAREGUN'] = 2,
		['WEAPON_SNSPISTOL'] = 2,
		['WEAPON_SNSPISTOL_MK2'] = 2,
		['WEAPON_PISTOL'] = 2,
		['WEAPON_PISTOL_MK2'] = 2,
		['WEAPON_COMBATPISTOL'] = 2,
		['WEAPON_HEAVYPISTOL'] = 2,
		['WEAPON_VINTAGEPISTOL'] = 2,
		['WEAPON_MARKSMANPISTOL'] = 2,
		['WEAPON_DOUBLEACTION'] = 2,
		['WEAPON_MICROSMG'] = 2,
		['WEAPON_MACHINEPISTOL'] = 2,
		['WEAPON_MINISMG'] = 2,
		['WEAPON_APPISTOL'] = 2,
		['WEAPON_PISTOL50'] = 2,
		['WEAPON_REVOLVER'] = 2,
		['WEAPON_REVOLVER_MK2'] = 2,
		['WEAPON_COMBATPDW'] = 2,
		['WEAPON_SMG'] = 2,
		['WEAPON_SMG_MK2'] = 2,
		['WEAPON_ASSAULTSMG'] = 2,
		['WEAPON_CARBINERIFLE'] = 2,
		['WEAPON_GUSENBERG'] = 2,
		['WEAPON_SPECIALCARBINE'] = 2,
		['WEAPON_BULLPUPRIFLE'] = 2,
		['WEAPON_COMPACTRIFLE'] = 2,
		['WEAPON_DBSHOTGUN'] = 2,
		['WEAPON_MUSKET'] = 2,
		['WEAPON_MG'] = 2,
		['WEAPON_COMBATMG'] = 2,
		['WEAPON_ASSAULTRIFLE'] = 2,
		['WEAPON_ASSAULTRIFLE_MK2'] = 2,
		['WEAPON_CARBINERIFLE_MK2'] = 2,
		['WEAPON_ADVANCEDRIFLE'] = 2,
		['WEAPON_SPECIALCARBINE_MK2'] = 2,
		['WEAPON_BULLPUPRIFLE_MK2'] = 2,
		['WEAPON_PUMPSHOTGUN'] = 2,
		['WEAPON_SAWNOFFSHOTGUN'] = 2,
		['WEAPON_COMBATMG_MK2'] = 2,
		['WEAPON_PUMPSHOTGUN_MK2'] = 2,
		['WEAPON_BULLPUPSHOTGUN'] = 2,
		['WEAPON_AUTOSHOTGUN'] = 2,
		['WEAPON_GRENADELAUNCHER'] = 2,
		['WEAPON_COMPACTLAUNCHER'] = 2,
		['WEAPON_ASSAULTSHOTGUN'] = 2,
		['WEAPON_HEAVYSHOTGUN'] = 2,
		['WEAPON_MARKSMANRIFLE'] = 2,
		['WEAPON_MARKSMANRIFLE_MK2'] = 2,
		['WEAPON_SNIPERRIFLE'] = 2,
		['WEAPON_FLASHLIGHT'] = 2,
		['WEAPON_BAT'] = 2,
		['WEAPON_MINIGUN'] = 2,
		['WEAPON_HEAVYSNIPER'] = 2,
		['WEAPON_HEAVYSNIPER_MK2'] = 2,
		['WEAPON_FIREWORK'] = 2,
		['WEAPON_RPG'] = 2,
		['WEAPON_HOMINGLAUNCHER'] = 2,
		['WEAPON_RAILGUN'] = 2,
	},
	
	VehicleLimits = { -- FOR VEHICLE CLASSES WITHOUT TRUNKS, GLOVEBOX IS WEIGHTED AS AN INTERIOR(BOATS/HELICOPTERS/CYCLES/TRAINS)
		Classes = {
			[0] = {['gbox'] = 30, ['trunk'] = 200}, -- COMPACTS
			[1] = {['gbox'] = 30, ['trunk'] = 200}, -- SEDANS
			[2] = {['gbox'] = 60, ['trunk'] = 200}, -- SUVS
			[3] = {['gbox'] = 30, ['trunk'] = 250}, -- COUPES
			[4] = {['gbox'] = 30, ['trunk'] = 400}, -- MUSCLES
			[5] = {['gbox'] = 20, ['trunk'] = 200}, -- SPORTS CLASSICS
			[6] = {['gbox'] = 20, ['trunk'] = 200}, -- SPORTS
			[7] = {['gbox'] = 20, ['trunk'] = 250}, -- SUPERS
			[8] = {['gbox'] = 20, ['trunk'] = 30}, -- MOTORCYCLES
			[9] = {['gbox'] = 30, ['trunk'] = 400}, -- OFF-ROAD
			[10] = {['gbox'] = 30, ['trunk'] = 800}, -- INDUSTRIAL
			[11] = {['gbox'] = 30, ['trunk'] = 6000}, -- UTILITY
			[12] = {['gbox'] = 30, ['trunk'] = 1600}, -- VANS
			[13] = {['gbox'] = 5, ['trunk'] = 0}, -- BICYCLES
			[14] = {['gbox'] = 100, ['trunk'] = 0}, -- BOATS
			[15] = {['gbox'] = 100, ['trunk'] = 0}, -- HELICOPTERS
			[16] = {['gbox'] = 100, ['trunk'] = 0}, -- PLANES
			[17] = {['gbox'] = 30, ['trunk'] = 200}, -- SERVICE
			[18] = {['gbox'] = 30, ['trunk'] = 200}, -- EMERGENCY
			[19] = {['gbox'] = 30, ['trunk'] = 200}, -- MILITARY
			[20] = {['gbox'] = 60, ['trunk'] = 400}, -- COMMERCIAL
			[21] = {['gbox'] = 3000, ['trunk'] = 0} -- TRAINS
		},
		CustomWeight = {
			['zentorno'] = {['gbox'] = 15, ['trunk'] = 50},
		}
	},
	
	Houses = {
		Shells = {
			playerhouse_tier1 = 5000,
			shell_frankaunt = 5000,
			shell_medium2 = 5000,
			shell_medium3 = 5000,
			breze_shell_01 = 5000,
			breze_shell_02 = 5000,
			breze_shell_03 = 5000,
			shell_office1 = 50000,
			Office1 = 50000,
			shell_office2 = 50000,
			Office2 = 50000,
			shell_officebig = 50000,
			OfficeBig = 50000,

			shell_coke1 = 25000,
			CokeShell1 = 25000,
			shell_coke2 = 25000,
			CokeShell2 = 25000,
			shell_meth = 25000,
			MethShell = 25000,
			shell_weed = 25000,
			WeedShell1 = 25000,
			shell_weed2 = 25000,
			WeedShell2 = 25000,

			shell_garages = 15000,
			GarageShell1 = 15000,
			shell_garagem = 15000,
			GarageShell2 = 15000,
			shell_garagel = 15000,
			GarageShell3 = 15000,

			shell_apartment1 = 15000,
			NewApt1 = 15000,
			shell_apartment2 = 15000,
			NewApt2 = 15000,
			shell_apartment3 = 15000,
			NewApt3 = 15000,

			shell_warehouse1 = 500000,
			Warehouse1 = 500000,
			shell_warehouse2 = 500000,
			Warehouse2 = 500000,
			shell_warehouse3 = 500000,
			Warehouse3 = 500000,

			shell_v16low = 5000,
			HotelV2 = 5000,
			shell_trailer = 5000,
			Trailer = 5000,
			shell_trevor = 5000,
			Trevor = 5000,
			shell_v16mid = 10000,
			ApartmentV2 = 10000,
			shell_lester = 5000,
			Lester = 5000,
			shell_ranch = 15000,
			Ranch = 15000,
			shell_highend = 15000,
			HighEndV1 = 15000,
			shell_highendv2 = 15000,
			HighEndV2 = 15000,
			shell_michael = 10000,
			Michaels = 10000,
		},
	}
}

Config.LicenseShop = {
	LicenseShop = {
        Locations = {    
            { x = 457.79, y = -982.93, z =26.68}
        }
    }
}

Config.Shops = { 
	-- SET ALL SHOP INFORMATION HERE: TABLE NAME IS STORE NAME, TYPE(TYPE OF SHOP, 'purchase', 'sell', 'mix' AVAILABLE, CHOOSE WHAT THE PLAYER CAN DO AT THAT SHOP),
	-- ACCOUNT(PLAYER ACCOUNT TO GIVE/TAKE MONEY FROM), LOCATIONS(SHOP LOCATIONS), SOCIETY(SET SOCIETY NAME TO PAY TO/FROM, SET false IF NO SOCIETY IS USED),
	-- BUYBACK(SET VALUE FROM 0.0-1.0, AMOUNT OF ITEM PRICE GIVEN WHEN SELLING TO SHOP), ITEMS(ITEMS SHOP CAN SELL/BUY), 
	-- MARKERS(USE MARKERS?, WHAT SHAPE?, HOW FAR?, SHOW NAME?, WHAT COLOR?), BLIPS(USE BLIPS?, WHAT PICTURE?, WHAT COLOR?, HOW BIG?, WHERE TO DISPLAY?)
    ['Mini-Preço'] = {
		Type = 'purchase',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
        Locations = {
			Store = {
				vector3(373.875,   325.896,  102.566),
				vector3(2557.458,  382.282,  107.622),
				vector3(-3038.939, 585.954,  6.908),
				vector3(-3241.927, 1001.462, 11.830),
				vector3(547.431,   2671.710, 41.156),
				vector3(1961.464,  3740.672, 31.343),
				vector3(2678.916,  3280.671, 54.241),
				vector3(1729.216,  6414.131, 34.037),
				vector3(-48.519,   -1757.514, 28.421),
				vector3(1163.373,  -323.801,  68.205),
				vector3(-707.501,  -914.260,  18.215),
				vector3(-1820.523, 792.518,   137.118),
				vector3(1698.388,  4924.404,  41.063),
				vector3(25.723,   -1346.966, 28.497),
			},
			Boss = {
				vector3(372.875,   322.896,  102.566),
				-- vector3(2557.458,  382.282,  107.622),
				-- vector3(-3038.939, 585.954,  6.908),
				-- vector3(-3241.927, 1001.462, 11.830),
				-- vector3(547.431,   2671.710, 41.156),
				-- vector3(1961.464,  3740.672, 31.343),
				-- vector3(2678.916,  3280.671, 54.241),
				-- vector3(1729.216,  6414.131, 34.037),
				-- vector3(-48.519,   -1757.514, 28.421),
				-- vector3(1163.373,  -323.801,  68.205),
				-- vector3(-707.501,  -914.260,  18.215),
				-- vector3(-1820.523, 792.518,   137.118),
				-- vector3(1698.388,  4924.404,  41.063),
				-- vector3(25.723,   -1346.966, 28.497),
			},
        },
        Items = {
           
            {name = 'chips'},
            {name = 'fanta'},
            {name = 'cocacola'},
            {name = 'water'},
            {name = 'coffe'},
            {name = 'sandwich'},
            {name = 'bread'},
            {name = 'drugbags'},
            {name = 'lighter'},
            {name = 'rolpaper'},
            {name = 'filter'},
            {name = 'chocolate'},
            {name = 'cigarett'},
			{name = 'pastelnata'},
			{name = 'donuts'},
            {name = 'icetea'}
        },
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = true,
			Sprite = 52,
			Color = 2,
			Scale = 0.7,
			Display = 4
		}
    },

    ['Robs Liquour'] = {
		Type = 'purchase',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
		Locations = {  
			Store = {
				vector3(1135.808,  -982.281,  45.415),
				vector3(-1222.915, -906.983,  11.326),
				vector3(-1487.553, -379.107,  39.163),
				vector3(-2968.243, 390.910,   14.043),
				vector3(1166.024,  2708.930,  37.157),
				vector3(1392.562,  3604.684,  33.980),
				vector3(1946.19,    3841.03,  31.22),
				vector3(-1393.409, -606.624,  29.319)
			},
			Boss = {
				vector3(1134.808,  -983.281,  45.415),
				-- vector3(-1222.915, -906.983,  11.326),
				-- vector3(-1487.553, -379.107,  39.163),
				-- vector3(-2968.243, 390.910,   14.043),
				-- vector3(1166.024,  2708.930,  37.157),
				-- vector3(1392.562,  3604.684,  33.980),
				-- vector3(-1393.409, -606.624,  29.319)
			},
        },
        Items = {
            {name = 'beer'},
            {name = 'wine'},
            {name = 'vodka'},
            {name = 'tequila'},
            {name = 'whisky'},
            {name = 'energy'},
			{name = 'poncha'},
			{name = 'bagaco'}
        },
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = true,
			Sprite = 93,
			Color = 2,
			Scale = 0.7,
			Display = 4
		}
	},
	['McDonalds'] = {
		Type = 'purchase',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
		Locations = {  
			Store = {
				vector3(279.1, -971.94, 28.37)
			},
			Boss = {},
        },
        Items = {
           {name = 'chips'},
            {name = 'fanta'},
            {name = 'cocacola'},
            {name = 'water'},
            {name = 'coffe'},  
            {name = 'hamburger'},
			{name = 'tartemaça'},
			{name = 'batatasfritas'},
			{name = 'hamburgerr'},
			{name = 'hamburgerrr'},
			{name = 'hburger'},
			{name = 'hburgerr'},
			{name = 'nuggets'},
			{name = 'icetea'}
        },
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = true,
			Sprite = 78,
			Color = 1,
			Scale = 0.7,
			Display = 4
		}
	},
	['McDonaldsSandy'] = {
		Type = 'purchase',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
		Locations = {  
			Store = {  
				vector3( 1700.37, 3781.68, 33.74)
			},
			Boss = {},
        },
        Items = {
           {name = 'chips'},
            {name = 'fanta'},
            {name = 'cocacola'},
            {name = 'water'},
            {name = 'coffe'},  
            {name = 'hamburger'},
			{name = 'tartemaça'},
			{name = 'batatasfritas'},
			{name = 'hamburgerr'},
			{name = 'hamburgerrr'},
			{name = 'hburger'},
			{name = 'hburgerr'},
			{name = 'nuggets'},
			{name = 'icetea'}
        },
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = true,
			Sprite = 78,
			Color = 1,
			Scale = 0.7,
			Display = 4
		}
	},
	['La Carte'] = {
		Type = 'purchase',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
		Locations = {  
			Store = {  
				vector3( -633.16, 236.36, 80.88)
			},
			Boss = {},
        },
        Items = {
           {name = 'francesinha'},
            {name = 'frango'},  
            {name = 'cozido'},
			{name = 'polvo'},
			{name = 'bacalhau'},
			{name = 'fanta'},
            {name = 'cocacola'},
            {name = 'water'},
			{name = 'icetea'}
        },
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = true,
			Sprite = 52,
			Color = 1,
			Scale = 0.7,
			Display = 4
		}
	},
	['Xeidafome'] = {
		Type = 'purchase',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
		Locations = {  
			Store = {  
				vector3( -40.22, -1114.85, 25.44)
			},
			Boss = {},
        },
        Items = {
            {name = 'chips'},
            {name = 'fanta'},
            {name = 'cocacola'},
            {name = 'water'},
            {name = 'coffe'},
            {name = 'sandwich'},
            {name = 'bread'},
			{name = 'bifana'}
        },
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = true,
			Sprite = 52,
			Color = 2,
			Scale = 0.7,
			Display = 4
		}
	},
	 ['Departamento de Justiça'] = {
		Type = 'purchase',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
		Locations = {
			Store = {
				vector3(249.48, -1101.37, 35.21)
			},
			Boss = {},
        },
        Items = {},
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = true,
			Sprite = 285,
			Color = 66,
			Scale = 0.7,
			Display = 4
		}
	},
    ['Ilegal'] = {
		Type = 'purchase',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
		Locations = {
			Store = {
				vector3(2004.33,  3790.9,  31.18)
			},
			Boss = {},
        },
        Items = {
            {name = 'cokeburn'},
            {name = 'weedburn'},
            {name = 'methburn'},
			{name = 'lockpick'},
			{name = 'hackerDevice'}
        },
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = false,
			Sprite = 78,
			Color = 2,
			Scale = 0.7,
			Display = 4
		}
	},

    ['Fnuc'] = {
		Type = 'purchase',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
        Locations = {
			Store = {
				vector3(-628.99, -275.68, 34.58),
			},
			Boss = {
				vector3(2747.0, 3474.0, 55.68),
			},
        },
        Items = {
            {name = 'radio'},
            {name = 'phone'},
            {name = 'laptop_h'},
			{name = 'binoculars'},
            {name = 'hqscale'},
            {name = 'repairkit'}


        },
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = true,
			Sprite = 606,
			Color = 38,
			Scale = 0.9,
			Display = 4
		}
    },

    ['Prisão'] = {
		Type = 'purchase',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
        Locations = {
			Store = {
				vector3(1728.41, 2584.31, 45.84),
			},
			Boss = {
				vector3(1727.41, 2583.31, 45.84),
			},
        },
        Items = {
            {name = 'bread'},
            {name = 'water'},
            {name = 'sandwich'},
            {name = 'fanta'},
            {name = 'chips'}
        },
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = true,
			Sprite = 52,
			Color = 2,
			Scale = 0.7,
			Display = 4
		}
    },

    ['Ammunation'] = {
		Type = 'purchase',
		NeedsLicense = 'weapon',
		Account = 'money',
		Society = {
			Name = false,
			Options = {
				withdraw = true,
				deposit = true,
				wash = false,
				employess = true,
				grades = true
			},
		},
		BuyBack = 0.5,
        Locations = {
			Store = {
				
				vector3(810.25, -2157.60, 28.62),
				vector3(1693.44, 3760.16, 33.71),
				vector3(-330.24, 6083.88, 30.45),
				
			},
			Boss = {
				vector3(810.25, -2157.60, 28.62),
				-- vector3(810.25, -2157.60, 28.62),
				-- vector3(1693.44, 3760.16, 33.71),
				-- vector3(-330.24, 6083.88, 30.45),
				-- vector3(252.63, -50.00, 68.94),
				-- vector3(22.09, -1107.28, 28.80),
				-- vector3(2567.69, 294.38, 107.73),
				-- vector3(-1117.58, 2698.61, 17.55),
				-- vector3(842.44, -1033.42, 27.19),
			},
        },
        Weapons = {
            {name = 'WEAPON_KNUCKLE', label = 'Soqueira', price = 500},
            {name = 'WEAPON_STUNGUN', label = 'Taser', price = 35000},
            {name = 'WEAPON_PISTOL', label = 'Pistola', price = 80000}

        },
        Items = {
            {name = 'bulletproof'},
            {name = '9mmclip'}
        },
		Markers = {
			Use = true,
			Type = 1,
			Draw = 5,
			UseText = true,
			RGB = vector3(255, 0, 0)
		},
		Blips = {
			Use = true,
			Sprite = 110,
			Color = 2,
			Scale = 0.7,
			Display = 4
		}
    },
}

Config.Stash = {
    ['PSP'] = {
        coords = vector3(452.16, -980.14, 29.69),
		useText = true,
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 2,
		draw = 5,
        markerColour = vector3(255, 0, 0),
        msg = 'PSP - Stash'
    },
	['taxi '] = { 
        coords = vector3(906.95, -162.01, 74.13),
		useText = true,
        size = vector3(1.0, 1.0, 1.0),
        job = 'taxi',
        markerType = 2,
		draw = 5,
        markerColour = vector3(255, 0, 0),
        msg = 'Taxi armario'
    }
    -- ['1'] = {
    --     coords = vector3(1848.28, 3689.40, 33.27),
	-- 	useText = true,
    --     size = vector3(1.0, 1.0, 1.0),
    --     job = 'identifier',
    --     markerType = -1,
	-- 	draw = 5,
    --     markerColour = vector3(255, 0, 0),
    --     msg = 'Player Stash'
    -- },
    -- ['2'] = {
    --     coords = vector3(444.37, -980.02, 29.69),
	-- 	useText = true,
    --     size = vector3(1.0, 1.0, 1.0),
    --     job = 'identifier',
    --     markerType = 2,
	-- 	draw = 5,
    --     markerColour = vector3(255, 0, 0),
    --     msg = 'Player Stash'
    -- }
}