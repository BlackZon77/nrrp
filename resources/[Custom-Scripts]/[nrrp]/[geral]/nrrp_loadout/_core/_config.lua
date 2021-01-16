local Keys = {
    ["ESC"] = 642, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 64, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config = {}

Config.OpenLoadOut = Keys['K']

Config.Job = 'police'

Config.Title = 'Loadout Menu'
Config.ButtonNames = {
    ["GetArmor"] = 'Equipar Armadura',
    ["RemoveArmor"] = 'Remover Armadura',
    ["GetGun"] = 'Equipar Arma',
    ["RemoveGun"] = 'Desequipar Arma',
    ["GetBandage"] = 'Pegar Bandagem',
    ["Exit"] = 'Sair'
}

Config.MenuWidth = 0.25
Config.MenuX = 0.71
Config.MenuY = 0.017

Config.ClipAmmo = true         -- this was made for my weapon ammo system but it can be used with disc-ammo

Config.EquipKevlarTime = 8     -- seconds
-- TextureID of your kevlar (skinchanger = bproof_1)
Config.KevlarTextureID = {
    ["Kevlar1"] = 12,
    ["Kevlar2"] = 12
}
Config.KevlarDrawableID = {
    ["Kevlar1"] = 0,
    ["Kevlar2"] = 1
}

GameLanguage = "PT"
Languages = {
    ["PT"] = {
        DressingKevlar    = 'A vestir Colete.',
        UnDressingKevlar  = 'A retirar Colete.',
        AlreadyHasThatW   = 'Já tens essa arma.',
        AlreadyUnquippedW = 'Já desequipaste essa arma',
    }
}