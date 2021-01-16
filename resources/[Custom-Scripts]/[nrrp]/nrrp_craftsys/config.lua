Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 2

Config.Recipes = {	
	['762x39'] = { 
		{item = "copper", quantity = 3 }, 
		{item = "iron", quantity = 3 }, 
	},	
	['12gauge'] = { 
		{item = "copper", quantity = 2 }, 
		{item = "iron", quantity = 2 }, 
	},	
	['50bmg'] = { 
		{item = "copper", quantity = 5 }, 
		{item = "iron", quantity = 5 }, 
	},	
	['45acp'] = { 
		{item = "copper", quantity = 2 }, 
		{item = "iron", quantity = 2 }, 
	},	
	['9mm'] = { 
		{item = "copper", quantity = 1 }, 
		{item = "iron", quantity = 1 }, 
	},	
	['762x39clip'] = { 
		{item = "762x39", quantity = 30 }, 
		{item = "iron", quantity = 5 }, 
	},	
	['45acpclip'] = { 
		{item = "45acp", quantity = 30 }, 
		{item = "iron", quantity = 4 }, 
	},	
	['50bmgclip'] = { 
		{item = "copper", quantity = 12 }, 
		{item = "iron", quantity = 5 }, 
	},	
	['9mmclip'] = { 
		{item = "copper", quantity = 18 }, 
		{item = "iron", quantity = 2 }, 
	},

	['bulletproof'] = { 
		{item = "cloth", quantity = 35 }, 
		{item = "iron", quantity = 75 }, 
	},

	['WEAPON_SAWNOFFSHOTGUN'] = { 
		{item = "iron",   quantity = 45},
		{item = "copper",   quantity = 35},
		{item = "spring",   quantity = 4},
		{item = "sawnoffshotgunpipe",   quantity = 1},
		{item = "sawnoffshotgunframe",   quantity = 1},
		{item = "blueprint_sawnoffshotgun", quantity = 1},
	},
	['WEAPON_ASSAULTRIFLE'] = { 
		{item = "madera", quantity = 20 }, 
		{item = "maderag", quantity = 20 }, 
		{item = "iron",   quantity = 15},
		{item = "copper",   quantity = 15},
		{item = "springbig",   quantity = 5},
		{item = "assaultriflepipe",   quantity = 1},
		{item = "assaultrifleframe",   quantity = 1},
		{item = "blueprint_assaultrifle", quantity = 1},
	},
	['WEAPON_MICROSMG'] = { 
		{item = "madera", quantity = 25 }, 
		{item = "maderaf", quantity = 30 }, 
		{item = "iron",   quantity = 30},
		{item = "spring",   quantity = 4},
		{item = "microsmgpipe",   quantity = 1},
		{item = "microsmgframe",   quantity = 1},
		{item = "blueprint_microsmg", quantity = 1},
	},
	['WEAPON_PISTOL'] = { 
		{item = "madera", quantity = 20 }, 
		{item = "iron",   quantity = 50},
		{item = "spring",   quantity = 2},
		{item = "pistolpipe",   quantity = 1},
		{item = "pistolframe",   quantity = 1},
		{item = "blueprint_pistol", quantity = 1},
	}
}

-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = true, 
	shopCoordinates = { x= -2149.09, y= 3302.73, z=  37.73, h=  252.85 },
	shopName = "Mesa de Craft", 
	shopBlipID = 446,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 },
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = false,
	keyCode = 303
}
