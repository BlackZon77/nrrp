NRRP.NightVision = {}
local NRRPNV = NRRP.NightVision
NRRPNV.ESX = NRRP.ESX

NRRPNV.EnableKey = "F5"
NRRPNV.EnableNV  = 0
NRRPNV.EnableTV  = 0

function NRRPNV:Start()
	if not self then return; end
	while not ESX do Citizen.Wait(100); end
	self.ESX = ESX
	while not ESX.IsPlayerLoaded() do Citizen.Wait(100); end
	print("nrrp_NightVision:Start() - Successful")
	self.Started = 1
end

function NRRPNV:Update()
	while true do
		Citizen.Wait(0)
		local hotkey = IsControlJustPressed(0, NRRPUtils.Keys[self.EnableKey]) or IsDisabledControlJustPressed(0, NRRPUtils.Keys[self.EnableKey])
		if hotkey then self:ToggleNightvision(); end
	end
end

function NRRPNV:ToggleNightvision()
	local ped = PlayerPedId()
	self.EnableNV = self.EnableNV + 1
	if self.EnableNV > 1 then self.EnableNV = 0; end
	if GetPedPropIndex(ped, 0) == 116 then
		if self.EnableNV == 1 then
			SetNightvision(true)
			exports['mythic_notify']:SendAlert('success', 'Visão Noturna Ativada')
		elseif self.EnableNV == 0 then
			SetNightvision(false)
			exports['mythic_notify']:SendAlert('inform', 'Visão Noturna desativada')
		end
	end

	self.EnableTV = self.EnableTV + 1
	if self.EnableTV > 1 then self.EnableTV = 0; end
	if GetPedPropIndex(ped, 0) == 118 then
		if self.EnableTV == 1 then
			SetSeethrough(true)
			exports['mythic_notify']:SendAlert('success', 'Visão Térmica Ativada')
		elseif self.EnableTV == 0 then
			SetSeethrough(false)
			exports['mythic_notify']:SendAlert('inform', 'Visão Térmica desativada')
		end
	end
end

Citizen.CreateThread(function(...) NRRPNV:Update(...); end)
Citizen.CreateThread(function(...) NRRPNV:Start(...); end)
