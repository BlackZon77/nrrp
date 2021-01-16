Config = {}

-- Pawn Shop Positions:
Config.PawnZones = {
	PawnShops = {
		Pos = {
			{x = 412.42,  y = 314.41, z = 103.02},
			{x = 182.76821899414,  y = -1319.3857421875, z = 29.317152023315},
			{x = -1459.3402099609,  y = -413.79244995117, z = 35.739379882813}
		}
	}
}

-- Pawn Shop Blip Settings:
Config.EnablePawnShopBlip = true
Config.BlipSprite = 59
Config.BlipDisplay = 4
Config.BlipScale = 0.65
Config.BlipColour = 5
Config.BlipName = "Revendedor"

-- Pawn Shop Marker Settings:
Config.KeyToOpenShop = 38														-- default 38 is E
Config.ShopMarker = 27 															-- marker type
Config.ShopMarkerColor = { r = 255, g = 255, b = 0, a = 100 } 					-- rgba color of the marker
Config.ShopMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  						-- the scale for the marker on the x, y and z axis
Config.ShopDraw3DText = "Pressiona ~g~[E]~s~ para vender ao ~y~Revendedor~s~"					-- set your desired text here

-- Pawn Shop Item List:
Config.ItemsInPawnShop = {
	{ itemName = 'earrings', label = 'Brincos', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 750 },
	{ itemName = 'necklace', label = 'Colar', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 950 },
	{ itemName = 'wedding_ring', label = 'Anel de Casamento', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 1250 },
	{ itemName = 'rolex', label = 'Rolex', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 1500 },
	{ itemName = 'goldbar', label = 'Barra de ouro', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 2500 },
	{ itemName = 'phone', label = 'Telemovel', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 250 },
	{ itemName = 'lockpick', label = 'Lockpick', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 75 },
	{ itemName = 'radio', label = 'Radio', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 350 },
	{ itemName = 'lighter', label = 'Isqueiro', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 2 },
	{ itemName = 'binoculars', label = 'Binóculos', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 50 },
	{ itemName = 'diamondbox', label = 'Caixa de diamantes', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 4500 },
	{ itemName = 'cloth', label = 'Tecido', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 150 },
	{ itemName = 'spring', label = 'Mola', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 500 },
	{ itemName = 'springbig', label = 'Mola Grande', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 500 },

	{ itemName = 'thermal_charge', label = 'Carga Térmica', BuyInPawnShop = true, BuyPrice = 30000, SellInPawnShop = true, SellPrice = 15000 },
}