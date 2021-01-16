Config                      = {}
Config.Locale               = 'en'
Config.DrawDistance         = 10
Config.CurrancySymbol       = '€'
Config.CanProcessInVehicle  = false -- when `true` players are allowed to sit in their vehicle and use the circle

Config.Marker = {
    ['harvest'] = {
        x = 17.66,   y = -13.39,   z = 70.12,  -- > Size 17.66, -13.39, 70.12, 143.93 
        r = 255,    g = 0,      b = 0,    -- > Color
        type = 1                          -- > Marker Type
    },
    ['transform'] = {
        x = 10.0,   y = 10.0,   z = 0.5,  -- > Size
        r = 255,    g = 0,      b = 0,    -- > Color
        type = 1                          -- > Marker Type
    },
    ['sell'] = {
        x = 10.0,   y = 10.0,   z = 0.5,  -- > Size
        r = 255,    g = 0,      b = 0,    -- > Color
        type = 1                          -- > Marker Type
    }
}

Config.Blip = {
    Display         = 4,
    Scale           = 0.8,
    AsShortRange    = true,
}