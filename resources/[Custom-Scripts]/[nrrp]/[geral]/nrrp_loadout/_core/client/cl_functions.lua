--[[SetPedComponentVariation(ped, 2, 3, 4, 5)
---------------------------------------------------------------------------------------|
1-  ped: The ped handle.                                  |      0: Face               |
2-  componentId: The component that you want to set.      |      1: Mask               |
3-  drawableId: The drawable id that is going to be set.  |      2: Hair               |
4-  textureId: The texture id of the drawable.            |      3: Torso              |
5-  paletteId: 0 to 3.                                    |      4: Leg                |
                                                          |      5: Parachute / bag    |
                                                          |      6: Shoes              |
                                                          |      7: Accessory          |
                                                          |      8: Undershirt         |
                                                          |      9: Kevlar             |
                                                          |      10: Badge             |
                                                          |      11: Torso 2           |
---------------------------------------------------------------------------------------|
]]

RegisterNetEvent('nrrp:getkevlar')
AddEventHandler('nrrp:getkevlar', function(textureId, drawableId)
    local plyPed = GetPlayerPed(-1)
    
    exports["nrrp_progbar"]:startUI((Config.EquipKevlarTime * 1000), Languages[GameLanguage].DressingKevlar)
    Wait((Config.EquipKevlarTime * 1000))
    SetPedComponentVariation(plyPed, 9, textureId, drawableId, 1)
    -- set player armor to 100
    AddArmourToPed(plyPed, 100)
    SetPedArmour(plyPed, 100)
end)

RegisterNetEvent('nrrp:removekevlar')
AddEventHandler('nrrp:removekevlar', function(textureId, drawableId)
    local plyPed = GetPlayerPed(-1)
    
    exports["nrrp_progbar"]:startUI((Config.EquipKevlarTime * 1000), Languages[GameLanguage].UnDressingKevlar)
    Wait((Config.EquipKevlarTime * 1000))
    SetPedComponentVariation(plyPed, 9, textureId, drawableId, 0)
    -- set player armor to 0
    AddArmourToPed(plyPed, 0)
    SetPedArmour(plyPed, 0)
end)