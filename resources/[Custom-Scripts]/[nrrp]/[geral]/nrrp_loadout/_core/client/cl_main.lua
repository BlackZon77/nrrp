ESX						= nil
local PlayerData		= {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
    MenuInit = function()
        WarMenu.CreateMenu("loadoutmenu", Config.Title)

        WarMenu.SetMenuWidth("loadoutmenu", Config.MenuWidth)
        WarMenu.SetMenuX("loadoutmenu", Config.MenuX)
        WarMenu.SetMenuY("loadoutmenu", Config.MenuY)
        WarMenu.SetMenuMaxOptionCountOnScreen("loadoutmenu", 30)
        WarMenu.SetTitleColor("loadoutmenu", 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor("loadoutmenu", 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor("loadoutmenu", 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor("loadoutmenu", 255, 255, 255, 255)

        WarMenu.CreateSubMenu('closeMenu',   'loadoutmenu')
        WarMenu.CreateSubMenu('getarmor',    'loadoutmenu')
        WarMenu.CreateSubMenu('removearmor', 'loadoutmenu')
        WarMenu.CreateSubMenu('getguns',     'loadoutmenu')
        WarMenu.CreateSubMenu('removeguns',  'loadoutmenu')
        WarMenu.CreateSubMenu('getbandage',  'loadoutmenu')
    end

    MenuInit()
	while true do
		if WarMenu.IsMenuOpened('loadoutmenu') then
            if WarMenu.MenuButton(Config.ButtonNames['GetArmor'], 'getarmor') then
            end  
            if WarMenu.MenuButton(Config.ButtonNames['RemoveArmor'], 'removearmor') then
            end     
            if WarMenu.MenuButton(Config.ButtonNames['GetGun'], 'getguns') then
            end            
            if WarMenu.MenuButton(Config.ButtonNames['RemoveGun'], 'removeguns') then
            end  
            if WarMenu.MenuButton(Config.ButtonNames['GetBandage'], 'getbandage') then
            end            
            if WarMenu.MenuButton(Config.ButtonNames['Exit'], 'closeMenu') then
            end

            WarMenu.Display()
		elseif WarMenu.IsMenuOpened('getarmor') then
            if WarMenu.Button('Colete Normal') then
                TriggerEvent('nrrp:getkevlar', Config.KevlarTextureID['Kevlar1'], Config.KevlarDrawableID['Kevlar1'])



                -- WarMenu.CloseMenu()
            elseif WarMenu.Button('Colete Normal 2') then
                TriggerEvent('nrrp:getkevlar', Config.KevlarTextureID['Kevlar2'], Config.KevlarDrawableID['Kevlar2'])

                -- WarMenu.CloseMenu()
            end	

            WarMenu.Display()
		elseif WarMenu.IsMenuOpened('removearmor') then
            if WarMenu.Button('Colete Normal') then
                TriggerEvent('nrrp:removekevlar', 0)

                -- WarMenu.CloseMenu()
            elseif WarMenu.Button('Colete Normal 2') then
                TriggerEvent('nrrp:removekevlar', 0)

                -- WarMenu.CloseMenu()
            end	

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('getguns') then
            if WarMenu.Button('M4') then
                if Config.ClipAmmo then
                    TriggerServerEvent('nrrp:giveitem', '762x39clip', 5)        
                    TriggerServerEvent('nrrp:giveweapon', 'WEAPON_CARBINERIFLE', 0)   
                else
                    TriggerServerEvent('nrrp:giveweapon', 'WEAPON_CARBINERIFLE', 240)   
                end
 
                -- WarMenu.CloseMenu()
            elseif WarMenu.Button('Shotgun MK2') then
                if Config.ClipAmmo then
                    TriggerServerEvent('nrrp:giveitem', '12gauge', 45) 
                    TriggerServerEvent('nrrp:giveweapon', 'WEAPON_PUMPSHOTGUN_MK2', 0) 
                else
                    TriggerServerEvent('nrrp:giveweapon', 'WEAPON_PUMPSHOTGUN_MK2', 45) 
                end
   
                -- WarMenu.CloseMenu()
            elseif WarMenu.Button('Shotgun Borracha') then
                if Config.ClipAmmo then
                    TriggerServerEvent('nrrp:giveitem', '12gauge', 45) 
                    TriggerServerEvent('nrrp:giveweapon', 'WEAPON_PUMPSHOTGUN', 0)
                else
                    TriggerServerEvent('nrrp:giveweapon', 'WEAPON_PUMPSHOTGUN', 45)
                end
       
                -- WarMenu.CloseMenu()
            end

			WarMenu.Display()
		elseif WarMenu.IsMenuOpened('removeguns') then
            if WarMenu.Button('M4') then
                if Config.ClipAmmo then
                    TriggerServerEvent('nrrp:removeitem', '762x39clip')
                end
                TriggerServerEvent('nrrp:removeweapon', 'WEAPON_CARBINERIFLE') 

                -- WarMenu.CloseMenu()
            elseif WarMenu.Button('Shotgun MK2') then
                if Config.ClipAmmo then
                    TriggerServerEvent('nrrp:removeitem', '12gauge')
                end
                TriggerServerEvent('nrrp:removeweapon', 'WEAPON_PUMPSHOTGUN_MK2') 

                -- WarMenu.CloseMenu()
            elseif WarMenu.Button('Shotgun Borracha') then
                if Config.ClipAmmo then
                    TriggerServerEvent('nrrp:removeitem', '12gauge')
                end
                TriggerServerEvent('nrrp:removeweapon', 'WEAPON_PUMPSHOTGUN')    

                -- WarMenu.CloseMenu()
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('getbandage') then
            if WarMenu.Button('Pegar Bandagem') then
                TriggerServerEvent('nrrp:giveitem', 'bandage', 5)

                    -- WarMenu.CloseMenu()
            end

            WarMenu.Display()
		elseif WarMenu.IsMenuOpened('closeMenu') then
			WarMenu.CloseMenu()
			WarMenu.Display()
        elseif IsControlJustReleased(0, Config.OpenLoadOut) and (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == Config.Job) then
            OpenMenu()
        end

		Citizen.Wait(0)
	end
end)

OpenMenu = function()
    WarMenu.OpenMenu('loadoutmenu')
end