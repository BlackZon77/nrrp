config = {
  ["weapon"] = { "WEAPON_PISTOL", "WEAPON_COMBATPISTOL" },
  ["peds"] = {
    ["mp_m_freemode_01"] = { -- Male multiplayer ped
      ["components"] = {
        [7] = { -- Component ID, "Neck" or "Teeth" category
          [1] = 3, -- Drawable ID, can specify multiple, separated by comma and or line breaks
          [6] = 5,
          [8] = 2,
          [42] = 43,
          [110] = 111,
          [119] = 120
        },
        [8] = { 
          [16] = 18
        }
      }
    },
    ["mp_f_freemode_01"] = { -- Female multiplayer ped
      ["components"] = {
        [7] = { -- Component ID, "Neck" or "Teeth" category
          [1] = 3,
          [6] = 5,
          [8] = 2,
          [29] = 30,
          [81] = 82
        },
        [8] = {
          [9] = 10
        }
      }
    },
  }
}