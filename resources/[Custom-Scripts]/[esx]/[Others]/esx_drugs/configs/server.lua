ServerConfig = {}

ServerConfig.DetermineLimit = 'weight' -- Possible options are: Weight or Limit
ServerConfig.SyncPoliceInterval = 5 * 60000 -- how often to sync the number of police in milliseconds

ServerConfig.Zones = {
    -- entradaWeedHouse = vector3(183.03, -1836.59, 28.10),
    -- saidaWeedHouse - vector3(1066.28, -3183.46, -39.16),
	HarvestWeed	= {
		position = vector3(1057.54,-3197.2,-39.13),
        whitelistedFor = { },
		blacklistedFor = { 'police', 'offpolice', 'ambulance', 'offambulance' },
		requiredCops = 1,
		timeToHarvest = 30.0,
		type = 'harvest',
		outputs = {
			{
                item = 'weedbrick',
			    count = 1
			}
		}
	},
	TransformWeed = {
		position = vector3(413.2, -984.32, -197.68),
        whitelistedFor = { },
		blacklistedFor = { 'police', 'offpolice', 'ambulance' },
		requiredCops = 1,
		timeToTransform = 4.0,
		type = 'transform',
		inputs = {
			{
                item = 'weed',
			    count = 5
            }
		},
		outputs = {
			{
                item = 'weed_pooch',
			    count = 1
            }
		}
	},
	SellWeed = {
        position = vector3(413.2, -984.32, -197.68),
        whitelistedFor = { },
		blacklistedFor = { 'police', 'offpolice', 'ambulance' },
		requiredCops = 1,
		timeToSell = 3.5,
		type = 'sell',
		inputs = {
			{
                item = 'weed_pooch',
			    count = 1
            }
		},
		outputs = {
			{
                account = 'black_money',
                price = {
                    min = 500,
                    max = 800,
                    requiredCopsForMax = 4
                }
            }
		}
	},	
	-- entradaCokeHouse = vector3(465.00, -1894.07, 25.90),
	-- saidaCokeHouse = vector3(1088.74, -3187.61, -38.99),
	HarvestCoke	= {
        position = vector3(1093.18,-3194.925,-39.60),
        whitelistedFor = { },
		blacklistedFor = { 'police', 'offpolice', 'ambulance', 'offambulance' },
		requiredCops = 2,
		timeToHarvest = 30.0,
		type = 'harvest',
		outputs = {
			{
                item = 'cokebrick',
			    count = 1
            }
		}
	},
	TransformCoke = {
        position = vector3(413.2, -984.32, -197.68),
        whitelistedFor = { },
		blacklistedFor = { 'police', 'offpolice', 'ambulance', 'offambulance' },
		requiredCops = 2,
		timeToTransform = 4.5,
		type = 'transform',
		inputs = {
			{
                item = 'coke',
			    count = 5
            }
		},
		outputs = {
			{
                item = 'coke_pooch',
			    count = 1
            }
		}
	},
	SellCoke = {
        position = vector3(413.2, -984.32, -197.68),
        whitelistedFor = { },
		blacklistedFor = { 'police', 'offpolice', 'ambulance', 'offambulance' },
		requiredCops = 2,
		timeToSell = 4.0,
		type = 'sell',
		inputs = {
			{
                item = 'coke_pooch',
			    count = 1
            }
		},
		outputs = {
			{
                account = 'black_money',
                price = {
                    min = 700,
                    max = 1000,
                    requiredCopsForMax = 5
                }
            }
		}
	},	
	-- entradaMethHouse = vector3(-161.6598, -1638.28, 37.2459),
	-- saidaMethHouse = vector3(997.0199, -3200.684, -36.39373),
	HarvestMeth	= {
        position = vector3(1005.80,-3200.40,-38.90),
        whitelistedFor = { },
		blacklistedFor = { 'police', 'offpolice', 'ambulance', 'offambulance' },
		requiredCops = 3,
		timeToHarvest = 30.0,
		type = 'harvest',
		outputs = {
			{
                item = 'methbrick',
			    count = 1
            }
		}
	},
	TransformMeth = {
        position = vector3(413.2, -984.32, -197.68),
        whitelistedFor = { },
		blacklistedFor = { 'police', 'offpolice', 'ambulance', 'offambulance' },
		requiredCops = 2,
		timeToTransform = 4.5,
		type = 'transform',
		inputs = {
			{
                item = 'coke',
			    count = 5
            }
		},
		outputs = {
			{
                item = 'coke_pooch',
			    count = 1
            }
		}
	},
	SellMeth = {
        position = vector3(413.2, -984.32, -197.68),
        whitelistedFor = { },
		blacklistedFor = { 'police', 'offpolice', 'ambulance', 'offambulance' },
		requiredCops = 2,
		timeToSell = 4.0,
		type = 'sell',
		inputs = {
			{
                item = 'coke_pooch',
			    count = 1
            }
		},
		outputs = {
			{
                account = 'black_money',
                price = {
                    min = 700,
                    max = 1000,
                    requiredCopsForMax = 5
                }
            }
		}
	},	

}