local CurrentActionData, handcuffTimer, dragStatus, blipsCops, currentTask = {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService = false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged, isInShopMenu = false, false
ESX = nil

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

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(uniform, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		local uniformObject

		if skin.sex == 0 then
			uniformObject = Config.Uniforms[uniform].male
		else
			uniformObject = Config.Uniforms[uniform].female
		end

		if uniformObject then
			TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
	
			if uniform == 'colete_wear' or uniform == 'coletecriminal2' or uniform == 'coleteleve2' or uniform == 'coletecriminal' or uniform == 'fepricoleteoficial' or uniform == 'coletelevepolicia' or uniform == 'fassaltocurto' or uniform == 'fassaltocomprida' or uniform == 'fagentecasacocolete' or uniform == 'fagentecortaventocolete' or uniform == 'fagentepcasacocolete' or uniform == 'fagentepcortaventocolete' or uniform == 'fagenteccasacocolete' or uniform == 'fchefecortaventocolete' or uniform == 'fchefepcasacocolete' or uniform == 'fchefepcortaventocolete' or uniform == 'fchefeccasacocolete' or uniform == 'fchefeccortaventocolete' or uniform == 'fsubccasacocolete' or uniform == 'fsubccortaventocolete' or uniform == 'fepricoleteoficial' or uniform == 'fepricasacooficial' or uniform == 'fcomissariocasacocolete' or uniform == 'fcomissariocortaventocolete' or uniform == 'fepricoleteoficial' or uniform == 'fepricasacooficial' or uniform == 'fardauep' or uniform == 'fardauepcinotecnica' then
				SetPedArmour(playerPed, 100)
			end
		else
			ESX.ShowNotification(_U('no_outfit'))
		end
	end)
end

function OpenCloakroomMenu()
	local playerPed = PlayerPedId()
	local grade = ESX.PlayerData.job.grade_name

	local elements = {
		{label = _U('citizen_wear'), value = 'citizen_wear'},
		{label = _U('tirarcolete_wear'), uniform = 'tirarcolete_wear'},
		{label = _U('colete_wear'), uniform = 'colete_wear'},
		{label = _U('coleter1_wear'), uniform = 'coleter1_wear'},
		{label = _U('ttt3_wear'), uniform = 'ttt3_wear'},
		{label = _U('fassaltocurto'), uniform = 'fassaltocurto'},
		{label = _U('fassaltocomprida'), uniform = 'fassaltocomprida'},
		{label = _U('ttt_wear'), uniform = 'ttt_wear'},

		--{label = _U('police_wear'), uniform = grade}
	}
	
	if grade == 'cadete' then
		table.insert(elements, {label = 'Farda EPP', uniform = 'fcadete'})
	elseif grade == 'agente' then
		table.insert(elements, {label = 'Farda Manga Curta', uniform = 'fagente'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fagentemangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fagentecerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fagentecasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fagentecasacocolete'})
		table.insert(elements, {label = 'Farda Casaco Inverno', uniform = 'fagentecasacoinverno'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fagentecortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fagentecortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet3'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteori'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorimangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
	elseif grade == 'agentep' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fagentep'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fagentepmangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fagentepcerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fagentepcasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fagentepcasacocolete'})
		table.insert(elements, {label = 'Farda Casaco Inverno', uniform = 'fagentepcasacoinverno'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fagentepcortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fagentepcortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet3'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteori'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorimangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotan'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
	elseif grade == 'agentec' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fagentec'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fagentecmangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fagenteccerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fagenteccasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fagenteccasacocolete'})
		table.insert(elements, {label = 'Farda Casaco Inverno', uniform = 'fagenteccasacoinverno'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fagenteccortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fagenteccortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet3'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteori'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorimangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotan'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricolete'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasaco'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriori'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoe'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
	elseif grade == 'chefe' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fchefe'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fchefemangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fchefecerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fchefecasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fchefecasacocolete'})
		table.insert(elements, {label = 'Farda Casaco Inverno', uniform = 'fchefecasacoinverno'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fchefecortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fchefecortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet3'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteori'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorimangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotan'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricolete'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasaco'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriori'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoe'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
	elseif grade == 'chefep' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fchefep'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fchefepmangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fchefepcerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fchefepcasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fchefepcasacocolete'})
		table.insert(elements, {label = 'Farda Casaco Inverno', uniform = 'fchefepcasacoinverno'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fchefepcortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fchefepcortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet3'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteori'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorimangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotan'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricolete'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasaco'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriori'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoe'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
	elseif grade == 'chefec' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fchefec'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fchefecmangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fchefeccerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fchefeccasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fchefeccasacocolete'})
		table.insert(elements, {label = 'Farda Casaco Inverno', uniform = 'fchefeccasacoinverno'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fchefeccortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fchefeccortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet3'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteori'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorimangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotan'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricolete'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasaco'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriori'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoe'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
	elseif grade == 'subc' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fsubc'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fsubcmangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fsubccerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fsubccasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fsubccasacocolete'})
		table.insert(elements, {label = 'Farda Casaco Inverno', uniform = 'fsubccasacoinverno'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fsubccortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fsubccortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteorioficial'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorioficialmangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotao'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricoleteoficial'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasacooficial'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriorio'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoeo'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
		table.insert(elements, {label = 'Farda UEP Colete', uniform = 'fardauep'})
		table.insert(elements, {label = 'Farda UEP Badge na Perna', uniform = 'fardauep2'})
		table.insert(elements, {label = 'Farda UEP Badge no DutyBelt', uniform = 'fardauep3'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete', uniform = 'fardauepcinotecnica'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete 2', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete Pesado', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge na Perna', uniform = 'fardauepcinotecnica2'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge no DutyBelt', uniform = 'fardauepcinotecnica3'})
		table.insert(elements, {label = '---------ACESSÓRIOS---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = '»» COLDRE/DUTYBELT ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'DutyBelt com Rádio', uniform = 'radiodutybelt'})
		table.insert(elements, {label = 'DutyBelt Unmarked', uniform = 'dutybeltunmarked'})
		table.insert(elements, {label = 'Coldre na Perna', uniform = 'coldreperna'})
		table.insert(elements, {label = 'Coldre no Cinto', uniform = 'coldrecintura1'})
		table.insert(elements, {label = 'Coldre na Cintura', uniform = 'coldrecintura2'})
		table.insert(elements, {label = 'Coldre no Braço', uniform = 'coldrebraco'})
		table.insert(elements, {label = '»» DESTINTIVOS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Destintivo no Peito cartão', uniform = 'destintivopeitocartao'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial (Colete)', uniform = 'destintivopeitooficial'})
		table.insert(elements, {label = 'Destintivo no Peito UEP (Colete)', uniform = 'destintivopeitouep'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial', uniform = 'destintivopeitooficial2'})
		table.insert(elements, {label = 'Destintivo no Peito UEP', uniform = 'destintivopeitouep2'})
		table.insert(elements, {label = 'Destintivo com Algemas Oficial', uniform = 'destintivocomalgemasoficial'})
		table.insert(elements, {label = 'Destintivo com Algemas UEP', uniform = 'destintivocomalgemasuep'})
		table.insert(elements, {label = 'Destintivo no DutyBelt Oficial', uniform = 'destintivodutybeltoficial'})
		table.insert(elements, {label = 'Destintivo no DutyBelt UEP', uniform = 'destintivodutybeltuep'})
		table.insert(elements, {label = 'Destintivo na Perna Oficial', uniform = 'destintivopernaficial'})
		table.insert(elements, {label = 'Destintivo na Perna UEP', uniform = 'destintivopernatuep'})
		table.insert(elements, {label = '»» IC ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Colete Investigação Criminal', uniform = 'coletecriminal'})
		table.insert(elements, {label = 'Colete Investigação Criminal 2', uniform = 'coletecriminal2'})
		table.insert(elements, {label = 'Colete Investigação Criminal Leve', uniform = 'coletecriminal3'})
		table.insert(elements, {label = 'Colete Leve', uniform = 'coleteleve2'})
		table.insert(elements, {label = 'Casaco IC', uniform = 'casacoic'})
		table.insert(elements, {label = 'Chapeu IC', uniform = 'chapeuic'})
		table.insert(elements, {label = '»» OUTROS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Carregadores de Pistola', uniform = 'carregadores'})
	elseif grade == 'boss' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fcomissario'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fcomissariomangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fcomissariocerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fcomissariocasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fcomissariocasacocolete'})
		table.insert(elements, {label = 'Farda Casaco Inverno', uniform = 'fcomissariocasacoinverno'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fcomissariocortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fcomissariocortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteorioficial'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorioficialmangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotao'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricoleteoficial'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasacooficial'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriorio'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoeo'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
		table.insert(elements, {label = 'Farda UEP Colete', uniform = 'fardauep'})
		table.insert(elements, {label = 'Farda UEP Badge na Perna', uniform = 'fardauep2'})
		table.insert(elements, {label = 'Farda UEP Badge no DutyBelt', uniform = 'fardauep3'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete', uniform = 'fardauepcinotecnica'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete 2', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete Pesado', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge na Perna', uniform = 'fardauepcinotecnica2'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge no DutyBelt', uniform = 'fardauepcinotecnica3'})
		table.insert(elements, {label = '---------ACESSÓRIOS---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = '»» COLDRE/DUTYBELT ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'DutyBelt com Rádio', uniform = 'radiodutybelt'})
		table.insert(elements, {label = 'DutyBelt Unmarked', uniform = 'dutybeltunmarked'})
		table.insert(elements, {label = 'Coldre na Perna', uniform = 'coldreperna'})
		table.insert(elements, {label = 'Coldre no Cinto', uniform = 'coldrecintura1'})
		table.insert(elements, {label = 'Coldre na Cintura', uniform = 'coldrecintura2'})
		table.insert(elements, {label = 'Coldre no Braço', uniform = 'coldrebraco'})
		table.insert(elements, {label = '»» DESTINTIVOS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Destintivo no Peito cartão', uniform = 'destintivopeitocartao'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial (Colete)', uniform = 'destintivopeitooficial'})
		table.insert(elements, {label = 'Destintivo no Peito UEP (Colete)', uniform = 'destintivopeitouep'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial', uniform = 'destintivopeitooficial2'})
		table.insert(elements, {label = 'Destintivo no Peito UEP', uniform = 'destintivopeitouep2'})
		table.insert(elements, {label = 'Destintivo com Algemas Oficial', uniform = 'destintivocomalgemasoficial'})
		table.insert(elements, {label = 'Destintivo com Algemas UEP', uniform = 'destintivocomalgemasuep'})
		table.insert(elements, {label = 'Destintivo no DutyBelt Oficial', uniform = 'destintivodutybeltoficial'})
		table.insert(elements, {label = 'Destintivo no DutyBelt UEP', uniform = 'destintivodutybeltuep'})
		table.insert(elements, {label = 'Destintivo na Perna Oficial', uniform = 'destintivopernaficial'})
		table.insert(elements, {label = 'Destintivo na Perna UEP', uniform = 'destintivopernatuep'})
		table.insert(elements, {label = '»» IC ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Colete Investigação Criminal', uniform = 'coletecriminal'})
		table.insert(elements, {label = 'Colete Investigação Criminal 2', uniform = 'coletecriminal2'})
		table.insert(elements, {label = 'Colete Investigação Criminal Leve', uniform = 'coletecriminal3'})
		table.insert(elements, {label = 'Colete Leve', uniform = 'coleteleve2'})
		table.insert(elements, {label = 'Casaco IC', uniform = 'casacoic'})
		table.insert(elements, {label = 'Chapeu IC', uniform = 'chapeuic'})
		table.insert(elements, {label = '»» OUTROS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Carregadores de Pistola', uniform = 'carregadores'})
	elseif grade == 'subint' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fsubint'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fsubintemangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fsubintcerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fsubintcasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fsubintcasacocolete'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fsubintcortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fsubintcortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteorioficial'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorioficialmangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotao'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricoleteoficial'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasacooficial'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriorio'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoeo'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
		table.insert(elements, {label = 'Farda UEP Colete', uniform = 'fardauep'})
		table.insert(elements, {label = 'Farda UEP Badge na Perna', uniform = 'fardauep2'})
		table.insert(elements, {label = 'Farda UEP Badge no DutyBelt', uniform = 'fardauep3'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete', uniform = 'fardauepcinotecnica'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete 2', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete Pesado', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge na Perna', uniform = 'fardauepcinotecnica2'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge no DutyBelt', uniform = 'fardauepcinotecnica3'})
		table.insert(elements, {label = '---------ACESSÓRIOS---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = '»» COLDRE/DUTYBELT ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'DutyBelt com Rádio', uniform = 'radiodutybelt'})
		table.insert(elements, {label = 'DutyBelt Unmarked', uniform = 'dutybeltunmarked'})
		table.insert(elements, {label = 'Coldre na Perna', uniform = 'coldreperna'})
		table.insert(elements, {label = 'Coldre no Cinto', uniform = 'coldrecintura1'})
		table.insert(elements, {label = 'Coldre na Cintura', uniform = 'coldrecintura2'})
		table.insert(elements, {label = 'Coldre no Braço', uniform = 'coldrebraco'})
		table.insert(elements, {label = '»» DESTINTIVOS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Destintivo no Peito cartão', uniform = 'destintivopeitocartao'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial (Colete)', uniform = 'destintivopeitooficial'})
		table.insert(elements, {label = 'Destintivo no Peito UEP (Colete)', uniform = 'destintivopeitouep'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial', uniform = 'destintivopeitooficial2'})
		table.insert(elements, {label = 'Destintivo no Peito UEP', uniform = 'destintivopeitouep2'})
		table.insert(elements, {label = 'Destintivo com Algemas Oficial', uniform = 'destintivocomalgemasoficial'})
		table.insert(elements, {label = 'Destintivo com Algemas UEP', uniform = 'destintivocomalgemasuep'})
		table.insert(elements, {label = 'Destintivo no DutyBelt Oficial', uniform = 'destintivodutybeltoficial'})
		table.insert(elements, {label = 'Destintivo no DutyBelt UEP', uniform = 'destintivodutybeltuep'})
		table.insert(elements, {label = 'Destintivo na Perna Oficial', uniform = 'destintivopernaficial'})
		table.insert(elements, {label = 'Destintivo na Perna UEP', uniform = 'destintivopernatuep'})
		table.insert(elements, {label = '»» IC ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Colete Investigação Criminal', uniform = 'coletecriminal'})
		table.insert(elements, {label = 'Colete Investigação Criminal 2', uniform = 'coletecriminal2'})
		table.insert(elements, {label = 'Colete Investigação Criminal Leve', uniform = 'coletecriminal3'})
		table.insert(elements, {label = 'Colete Leve', uniform = 'coleteleve2'})
		table.insert(elements, {label = 'Casaco IC', uniform = 'casacoic'})
		table.insert(elements, {label = 'Chapeu IC', uniform = 'chapeuic'})
		table.insert(elements, {label = '»» OUTROS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Carregadores de Pistola', uniform = 'carregadores'})
	elseif grade == 'inten' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'finten'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fintenmangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fintencerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fintencasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fintencasacocolete'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fintencortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fintencortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteorioficial'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorioficialmangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotao'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricoleteoficial'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasacooficial'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriorio'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoeo'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
		table.insert(elements, {label = 'Farda UEP Colete', uniform = 'fardauep'})
		table.insert(elements, {label = 'Farda UEP Badge na Perna', uniform = 'fardauep2'})
		table.insert(elements, {label = 'Farda UEP Badge no DutyBelt', uniform = 'fardauep3'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete', uniform = 'fardauepcinotecnica'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete 2', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete Pesado', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge na Perna', uniform = 'fardauepcinotecnica2'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge no DutyBelt', uniform = 'fardauepcinotecnica3'})
		table.insert(elements, {label = '---------ACESSÓRIOS---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = '»» COLDRE/DUTYBELT ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'DutyBelt com Rádio', uniform = 'radiodutybelt'})
		table.insert(elements, {label = 'DutyBelt Unmarked', uniform = 'dutybeltunmarked'})
		table.insert(elements, {label = 'Coldre na Perna', uniform = 'coldreperna'})
		table.insert(elements, {label = 'Coldre no Cinto', uniform = 'coldrecintura1'})
		table.insert(elements, {label = 'Coldre na Cintura', uniform = 'coldrecintura2'})
		table.insert(elements, {label = 'Coldre no Braço', uniform = 'coldrebraco'})
		table.insert(elements, {label = '»» DESTINTIVOS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Destintivo no Peito cartão', uniform = 'destintivopeitocartao'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial (Colete)', uniform = 'destintivopeitooficial'})
		table.insert(elements, {label = 'Destintivo no Peito UEP (Colete)', uniform = 'destintivopeitouep'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial', uniform = 'destintivopeitooficial2'})
		table.insert(elements, {label = 'Destintivo no Peito UEP', uniform = 'destintivopeitouep2'})
		table.insert(elements, {label = 'Destintivo com Algemas Oficial', uniform = 'destintivocomalgemasoficial'})
		table.insert(elements, {label = 'Destintivo com Algemas UEP', uniform = 'destintivocomalgemasuep'})
		table.insert(elements, {label = 'Destintivo no DutyBelt Oficial', uniform = 'destintivodutybeltoficial'})
		table.insert(elements, {label = 'Destintivo no DutyBelt UEP', uniform = 'destintivodutybeltuep'})
		table.insert(elements, {label = 'Destintivo na Perna Oficial', uniform = 'destintivopernaficial'})
		table.insert(elements, {label = 'Destintivo na Perna UEP', uniform = 'destintivopernatuep'})
		table.insert(elements, {label = '»» IC ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Colete Investigação Criminal', uniform = 'coletecriminal'})
		table.insert(elements, {label = 'Colete Investigação Criminal 2', uniform = 'coletecriminal2'})
		table.insert(elements, {label = 'Colete Investigação Criminal Leve', uniform = 'coletecriminal3'})
		table.insert(elements, {label = 'Colete Leve', uniform = 'coleteleve2'})
		table.insert(elements, {label = 'Casaco IC', uniform = 'casacoic'})
		table.insert(elements, {label = 'Chapeu IC', uniform = 'chapeuic'})
		table.insert(elements, {label = '»» OUTROS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Carregadores de Pistola', uniform = 'carregadores'})
	elseif grade == 'superin' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fsuperin'})
		table.insert(elements, {label = 'Farda Manga Comprida', uniform = 'fsuperinmangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fsuperincerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fsuperincasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fsuperincasacocolete'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fsuperincortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fsuperincortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteorioficial'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorioficialmangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotao'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricoleteoficial'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasacooficial'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriorio'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoeo'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
		table.insert(elements, {label = 'Farda UEP Colete', uniform = 'fardauep'})
		table.insert(elements, {label = 'Farda UEP Badge na Perna', uniform = 'fardauep2'})
		table.insert(elements, {label = 'Farda UEP Badge no DutyBelt', uniform = 'fardauep3'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete', uniform = 'fardauepcinotecnica'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete 2', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete Pesado', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge na Perna', uniform = 'fardauepcinotecnica2'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge no DutyBelt', uniform = 'fardauepcinotecnica3'})
		table.insert(elements, {label = '---------ACESSÓRIOS---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = '»» COLDRE/DUTYBELT ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'DutyBelt com Rádio', uniform = 'radiodutybelt'})
		table.insert(elements, {label = 'DutyBelt Unmarked', uniform = 'dutybeltunmarked'})
		table.insert(elements, {label = 'Coldre na Perna', uniform = 'coldreperna'})
		table.insert(elements, {label = 'Coldre no Cinto', uniform = 'coldrecintura1'})
		table.insert(elements, {label = 'Coldre na Cintura', uniform = 'coldrecintura2'})
		table.insert(elements, {label = 'Coldre no Braço', uniform = 'coldrebraco'})
		table.insert(elements, {label = '»» DESTINTIVOS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Destintivo no Peito cartão', uniform = 'destintivopeitocartao'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial (Colete)', uniform = 'destintivopeitooficial'})
		table.insert(elements, {label = 'Destintivo no Peito UEP (Colete)', uniform = 'destintivopeitouep'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial', uniform = 'destintivopeitooficial2'})
		table.insert(elements, {label = 'Destintivo no Peito UEP', uniform = 'destintivopeitouep2'})
		table.insert(elements, {label = 'Destintivo com Algemas Oficial', uniform = 'destintivocomalgemasoficial'})
		table.insert(elements, {label = 'Destintivo com Algemas UEP', uniform = 'destintivocomalgemasuep'})
		table.insert(elements, {label = 'Destintivo no DutyBelt Oficial', uniform = 'destintivodutybeltoficial'})
		table.insert(elements, {label = 'Destintivo no DutyBelt UEP', uniform = 'destintivodutybeltuep'})
		table.insert(elements, {label = 'Destintivo na Perna Oficial', uniform = 'destintivopernaficial'})
		table.insert(elements, {label = 'Destintivo na Perna UEP', uniform = 'destintivopernatuep'})
		table.insert(elements, {label = '»» IC ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Colete Investigação Criminal', uniform = 'coletecriminal'})
		table.insert(elements, {label = 'Colete Investigação Criminal 2', uniform = 'coletecriminal2'})
		table.insert(elements, {label = 'Colete Investigação Criminal Leve', uniform = 'coletecriminal3'})
		table.insert(elements, {label = 'Colete Leve', uniform = 'coleteleve2'})
		table.insert(elements, {label = 'Casaco IC', uniform = 'casacoic'})
		table.insert(elements, {label = 'Chapeu IC', uniform = 'chapeuic'})
		table.insert(elements, {label = '»» OUTROS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Carregadores de Pistola', uniform = 'carregadores'})
	elseif grade == 'superinchefe' then
		table.insert(elements, {label = 'Farda Patrulha', uniform = 'fsuperinchefemangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fsuperinchefecerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fsuperinchefecasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fsuperinchefecasacocolete'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fsuperinchefecortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fsuperinchefecortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteorioficial'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorioficialmangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotao'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricoleteoficial'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasacooficial'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriorio'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoeo'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
		table.insert(elements, {label = 'Farda UEP Colete', uniform = 'fardauep'})
		table.insert(elements, {label = 'Farda UEP Badge na Perna', uniform = 'fardauep2'})
		table.insert(elements, {label = 'Farda UEP Badge no DutyBelt', uniform = 'fardauep3'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete', uniform = 'fardauepcinotecnica'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete 2', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete Pesado', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge na Perna', uniform = 'fardauepcinotecnica2'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge no DutyBelt', uniform = 'fardauepcinotecnica3'})
		table.insert(elements, {label = '---------ACESSÓRIOS---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = '»» COLDRE/DUTYBELT ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'DutyBelt com Rádio', uniform = 'radiodutybelt'})
		table.insert(elements, {label = 'DutyBelt Unmarked', uniform = 'dutybeltunmarked'})
		table.insert(elements, {label = 'Coldre na Perna', uniform = 'coldreperna'})
		table.insert(elements, {label = 'Coldre no Cinto', uniform = 'coldrecintura1'})
		table.insert(elements, {label = 'Coldre na Cintura', uniform = 'coldrecintura2'})
		table.insert(elements, {label = 'Coldre no Braço', uniform = 'coldrebraco'})
		table.insert(elements, {label = '»» DESTINTIVOS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Destintivo no Peito cartão', uniform = 'destintivopeitocartao'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial (Colete)', uniform = 'destintivopeitooficial'})
		table.insert(elements, {label = 'Destintivo no Peito UEP (Colete)', uniform = 'destintivopeitouep'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial', uniform = 'destintivopeitooficial2'})
		table.insert(elements, {label = 'Destintivo no Peito UEP', uniform = 'destintivopeitouep2'})
		table.insert(elements, {label = 'Destintivo com Algemas Oficial', uniform = 'destintivocomalgemasoficial'})
		table.insert(elements, {label = 'Destintivo com Algemas UEP', uniform = 'destintivocomalgemasuep'})
		table.insert(elements, {label = 'Destintivo no DutyBelt Oficial', uniform = 'destintivodutybeltoficial'})
		table.insert(elements, {label = 'Destintivo no DutyBelt UEP', uniform = 'destintivodutybeltuep'})
		table.insert(elements, {label = 'Destintivo na Perna Oficial', uniform = 'destintivopernaficial'})
		table.insert(elements, {label = 'Destintivo na Perna UEP', uniform = 'destintivopernatuep'})
		table.insert(elements, {label = '»» IC ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Colete Investigação Criminal', uniform = 'coletecriminal'})
		table.insert(elements, {label = 'Colete Investigação Criminal 2', uniform = 'coletecriminal2'})
		table.insert(elements, {label = 'Colete Investigação Criminal Leve', uniform = 'coletecriminal3'})
		table.insert(elements, {label = 'Colete Leve', uniform = 'coleteleve2'})
		table.insert(elements, {label = 'Casaco IC', uniform = 'casacoic'})
		table.insert(elements, {label = 'Chapeu IC', uniform = 'chapeuic'})
		table.insert(elements, {label = '»» OUTROS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Carregadores de Pistola', uniform = 'carregadores'})
	elseif grade == 'diretoradjunto' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fdiretoradjuntomangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fdiretoradjuntocerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fdiretoradjuntocasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fdiretoradjuntocasacocolete'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fdiretoradjuntocortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fdiretoradjuntocortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteorioficial'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorioficialmangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotao'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricoleteoficial'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasacooficial'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriorio'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoeo'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
		table.insert(elements, {label = 'Farda UEP Colete', uniform = 'fardauep'})
		table.insert(elements, {label = 'Farda UEP Badge na Perna', uniform = 'fardauep2'})
		table.insert(elements, {label = 'Farda UEP Badge no DutyBelt', uniform = 'fardauep3'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete', uniform = 'fardauepcinotecnica'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete 2', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete Pesado', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge na Perna', uniform = 'fardauepcinotecnica2'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge no DutyBelt', uniform = 'fardauepcinotecnica3'})
		table.insert(elements, {label = '---------ACESSÓRIOS---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = '»» COLDRE/DUTYBELT ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'DutyBelt com Rádio', uniform = 'radiodutybelt'})
		table.insert(elements, {label = 'DutyBelt Unmarked', uniform = 'dutybeltunmarked'})
		table.insert(elements, {label = 'Coldre na Perna', uniform = 'coldreperna'})
		table.insert(elements, {label = 'Coldre no Cinto', uniform = 'coldrecintura1'})
		table.insert(elements, {label = 'Coldre na Cintura', uniform = 'coldrecintura2'})
		table.insert(elements, {label = 'Coldre no Braço', uniform = 'coldrebraco'})
		table.insert(elements, {label = '»» DESTINTIVOS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Destintivo no Peito cartão', uniform = 'destintivopeitocartao'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial (Colete)', uniform = 'destintivopeitooficial'})
		table.insert(elements, {label = 'Destintivo no Peito UEP (Colete)', uniform = 'destintivopeitouep'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial', uniform = 'destintivopeitooficial2'})
		table.insert(elements, {label = 'Destintivo no Peito UEP', uniform = 'destintivopeitouep2'})
		table.insert(elements, {label = 'Destintivo com Algemas Oficial', uniform = 'destintivocomalgemasoficial'})
		table.insert(elements, {label = 'Destintivo com Algemas UEP', uniform = 'destintivocomalgemasuep'})
		table.insert(elements, {label = 'Destintivo no DutyBelt Oficial', uniform = 'destintivodutybeltoficial'})
		table.insert(elements, {label = 'Destintivo no DutyBelt UEP', uniform = 'destintivodutybeltuep'})
		table.insert(elements, {label = 'Destintivo na Perna Oficial', uniform = 'destintivopernaficial'})
		table.insert(elements, {label = 'Destintivo na Perna UEP', uniform = 'destintivopernatuep'})
		table.insert(elements, {label = '»» IC ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Colete Investigação Criminal', uniform = 'coletecriminal'})
		table.insert(elements, {label = 'Colete Investigação Criminal 2', uniform = 'coletecriminal2'})
		table.insert(elements, {label = 'Colete Investigação Criminal Leve', uniform = 'coletecriminal3'})
		table.insert(elements, {label = 'Colete Leve', uniform = 'coleteleve2'})
		table.insert(elements, {label = 'Casaco IC', uniform = 'casacoic'})
		table.insert(elements, {label = 'Chapeu IC', uniform = 'chapeuic'})
		table.insert(elements, {label = '»» OUTROS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Carregadores de Pistola', uniform = 'carregadores'})
	elseif grade == 'diretornacional' then
		table.insert(elements, {label = 'Farda de Patrulha', uniform = 'fdiretornacionalmangas'})
		table.insert(elements, {label = 'Farda Cerimónias', uniform = 'fdiretornacionalcerimonias'})
		table.insert(elements, {label = 'Farda Casaco', uniform = 'fdiretornacionalcasaco'})
		table.insert(elements, {label = 'Farda Casaco c/ Colete', uniform = 'fdiretornacionalcasacocolete'})
		table.insert(elements, {label = 'Farda Corta Vento', uniform = 'fdiretornacionalcortavento'})
		table.insert(elements, {label = 'Farda Corta Vento c/ Colete', uniform = 'fdiretornacionalcortaventocolete'})
		table.insert(elements, {label = '---------TRÂNSITO---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'PSP Colete Transito', uniform = 'coletet2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Fechado', uniform = 'ftransitocoleteorioficial'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Aberto Laranja', uniform = 'ftransitocoletaberto2'})
		table.insert(elements, {label = 'PSP Trânsito Manga Curta Colete Transito', uniform = 'ftransitocoletet'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Fechado', uniform = 'ftransitocoleteorioficialmangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Amarelo', uniform = 'ftransitocoletaberto1mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Aberto Laranja', uniform = 'ftransitocoletaberto2mangas'})
		table.insert(elements, {label = 'PSP Trânsito Manga Comprida Colete Transito', uniform = 'ftransitocoletet2'})
		table.insert(elements, {label = 'PSP Trânsito Mota', uniform = 'ftransitomotao'})
		table.insert(elements, {label = '---------EPRI---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'EPRI Colete', uniform = 'fepricoleteoficial'})
		table.insert(elements, {label = 'EPRI Casaco', uniform = 'fepricasacooficial'})
		table.insert(elements, {label = 'EPRI Original', uniform = 'fepriorio'})
		table.insert(elements, {label = 'EPRI Original GOE', uniform = 'fepriorigoeo'})
		table.insert(elements, {label = '---------UEP---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Farda GOE', uniform = 'fardagoe'})
		table.insert(elements, {label = 'Farda CI Armadura', uniform = 'fardaci'})
		table.insert(elements, {label = 'Farda CI Colete Leve', uniform = 'fardaci2'})
		table.insert(elements, {label = 'Farda CI Colete Pesado', uniform = 'fardaci3'})
		table.insert(elements, {label = 'Farda Heli PSP', uniform = 'helipsp'})
		table.insert(elements, {label = 'Farda UEP Colete', uniform = 'fardauep'})
		table.insert(elements, {label = 'Farda UEP Badge na Perna', uniform = 'fardauep2'})
		table.insert(elements, {label = 'Farda UEP Badge no DutyBelt', uniform = 'fardauep3'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete', uniform = 'fardauepcinotecnica'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete 2', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Colete Pesado', uniform = 'fardauepcinotecnica4'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge na Perna', uniform = 'fardauepcinotecnica2'})
		table.insert(elements, {label = 'Farda UEP Cinotecnica Badge no DutyBelt', uniform = 'fardauepcinotecnica3'})
		table.insert(elements, {label = '---------ACESSÓRIOS---------', uniform = 'ttt_wear'})
		table.insert(elements, {label = '»» COLDRE/DUTYBELT ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'DutyBelt com Rádio', uniform = 'radiodutybelt'})
		table.insert(elements, {label = 'DutyBelt Unmarked', uniform = 'dutybeltunmarked'})
		table.insert(elements, {label = 'Coldre na Perna', uniform = 'coldreperna'})
		table.insert(elements, {label = 'Coldre no Cinto', uniform = 'coldrecintura1'})
		table.insert(elements, {label = 'Coldre na Cintura', uniform = 'coldrecintura2'})
		table.insert(elements, {label = 'Coldre no Braço', uniform = 'coldrebraco'})
		table.insert(elements, {label = '»» DESTINTIVOS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Destintivo no Peito cartão', uniform = 'destintivopeitocartao'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial (Colete)', uniform = 'destintivopeitooficial'})
		table.insert(elements, {label = 'Destintivo no Peito UEP (Colete)', uniform = 'destintivopeitouep'})
		table.insert(elements, {label = 'Destintivo no Peito Oficial', uniform = 'destintivopeitooficial2'})
		table.insert(elements, {label = 'Destintivo no Peito UEP', uniform = 'destintivopeitouep2'})
		table.insert(elements, {label = 'Destintivo com Algemas Oficial', uniform = 'destintivocomalgemasoficial'})
		table.insert(elements, {label = 'Destintivo com Algemas UEP', uniform = 'destintivocomalgemasuep'})
		table.insert(elements, {label = 'Destintivo no DutyBelt Oficial', uniform = 'destintivodutybeltoficial'})
		table.insert(elements, {label = 'Destintivo no DutyBelt UEP', uniform = 'destintivodutybeltuep'})
		table.insert(elements, {label = 'Destintivo na Perna Oficial', uniform = 'destintivopernaficial'})
		table.insert(elements, {label = 'Destintivo na Perna UEP', uniform = 'destintivopernatuep'})
		table.insert(elements, {label = '»» IC ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Colete Investigação Criminal', uniform = 'coletecriminal'})
		table.insert(elements, {label = 'Colete Investigação Criminal 2', uniform = 'coletecriminal2'})
		table.insert(elements, {label = 'Colete Investigação Criminal Leve', uniform = 'coletecriminal3'})
		table.insert(elements, {label = 'Colete Leve', uniform = 'coleteleve2'})
		table.insert(elements, {label = 'Casaco IC', uniform = 'casacoic'})
		table.insert(elements, {label = 'Chapeu IC', uniform = 'chapeuic'})
		table.insert(elements, {label = 'Chapeu IC', uniform = 'chapeuic'})
		table.insert(elements, {label = '»» OUTROS ««-', uniform = 'ttt_wear'})
		table.insert(elements, {label = 'Carregadores de Pistola', uniform = 'carregadores'})
	end
	
	if Config.EnableCustomPeds then
		for k,v in ipairs(Config.CustomPeds.shared) do
			table.insert(elements, {label = v.label, value = 'freemode_ped', maleModel = v.maleModel, femaleModel = v.femaleModel})
		end

		for k,v in ipairs(Config.CustomPeds[grade]) do
			table.insert(elements, {label = v.label, value = 'freemode_ped', maleModel = v.maleModel, femaleModel = v.femaleModel})
		end
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align = 'left',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			if Config.EnableNonFreemodePeds then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0

					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if Config.EnableESXService then
				ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
					if isInService then
						playerInService = false

						local notification = {
							title    = _U('service_anonunce'),
							subject  = '',
							msg      = _U('service_out_announce', GetPlayerName(PlayerId())),
							iconType = 1
						}

						TriggerServerEvent('esx_service:notifyAllInService', notification, 'police')

						TriggerServerEvent('esx_service:disableService', 'police')
						TriggerEvent('esx_policejob:updateBlip')
						ESX.ShowNotification(_U('service_out'))
					end
				end, 'police')
			end
		end

		if Config.EnableESXService and data.current.value ~= 'citizen_wear' then
			local awaitService

			ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
				if not isInService then

					ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
						if not canTakeService then
							ESX.ShowNotification(_U('service_max', inServiceCount, maxInService))
						else
							awaitService = true
							playerInService = true
														
							local notification = {
								title    = _U('service_anonunce'),
								subject  = '',
								msg      = _U('service_in_announce', GetPlayerName(PlayerId())),
								iconType = 1
							}

							TriggerServerEvent('esx_service:notifyAllInService', notification, 'police')
							TriggerEvent('esx_policejob:updateBlip')
							ESX.ShowNotification(_U('service_in'))
						end
					end, 'police')

				else
					awaitService = true
				end
			end, 'police')

			while awaitService == nil do
				Citizen.Wait(5)
			end

			-- if we couldn't enter service don't let the player get changed
			if not awaitService then
				return
			end
		end

		if data.current.uniform then
			setUniform(data.current.uniform, playerPed)
			exports["rp-radio"]:GivePlayerAccessToFrequencies(1, 2, 3)
		elseif data.current.value == 'freemode_ped' then
			local modelHash

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					modelHash = GetHashKey(data.current.maleModel)
				else
					modelHash = GetHashKey(data.current.femaleModel)
				end

				ESX.Streaming.RequestModel(modelHash, function()
					SetPlayerModel(PlayerId(), modelHash)
					SetModelAsNoLongerNeeded(modelHash)
					SetPedDefaultComponentVariation(PlayerPedId())

					TriggerEvent('esx:restoreLoadout')
				end)
			end)
			exports["rp-radio"]:RemovePlayerAccessToFrequencies(1, 2, 3)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)
end

function OpenArmoryMenu(station)
	local elements = {
		{label = _U('buy_weapons'), value = 'buy_weapons'}
	}

	if Config.EnableArmoryManagement then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('put_weapon'),     value = 'put_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
		table.insert(elements, {label = _U('deposit_object'), value = 'put_stock'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
		title    = _U('armory'),
		align = 'left',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'get_weapon' then
			OpenGetWeaponMenu()
		elseif data.current.value == 'put_weapon' then
			OpenPutWeaponMenu()
		elseif data.current.value == 'buy_weapons' then
			OpenBuyWeaponsMenu()
		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	end)
end

function OpenPoliceActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions', {
		title    = 'Police',
		align = 'left',
		elements = {
			--{label = _U('citizen_interaction'), value = 'citizen_interaction'},
			{label = _U('vehicle_interaction'), value = 'vehicle_interaction'},
			{label = _U('object_spawner'), value = 'object_spawner'}
	}}, function(data, menu)
		if data.current.value == 'citizen_interaction' then
			local elements = {
				{label = _U('id_card'), value = 'identity_card'},
				{label = _U('search'), value = 'search'},
				{label = _U('handcuff'), value = 'handcuff'},
				{label = _U('drag'), value = 'drag'},
				{label = _U('put_in_vehicle'), value = 'put_in_vehicle'},
				{label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
				{label = _U('fine'), value = 'fine'},
				{label = _U('unpaid_bills'), value = 'unpaid_bills'}
			}

			if Config.EnableLicenses then
				table.insert(elements, {label = _U('license_check'), value = 'license'})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('citizen_interaction'),
				align = 'left',
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value

					if action == 'identity_card' then
						OpenIdentityCardMenu(closestPlayer)
					elseif action == 'search' then
						OpenBodySearchMenu(closestPlayer)
					elseif action == 'handcuff' then
						TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))					
					elseif action == 'drag' then
						TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
					elseif action == 'put_in_vehicle' then
						TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'out_the_vehicle' then
						TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'fine' then
						OpenFineMenu(closestPlayer)
					elseif action == 'license' then
						ShowPlayerLicense(closestPlayer)
					elseif action == 'unpaid_bills' then
						OpenUnpaidBillsMenu(closestPlayer)
					end
				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'vehicle_interaction' then
			local elements  = {}
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()

			if DoesEntityExist(vehicle) then
				table.insert(elements, {label = _U('vehicle_info'), value = 'vehicle_infos'})
				table.insert(elements, {label = _U('pick_lock'), value = 'hijack_vehicle'})
				-- table.insert(elements, {label = _U('impound'), value = 'impound'})
			end

			table.insert(elements, {label = _U('search_database'), value = 'search_database'})

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
				title    = _U('vehicle_interaction'),
				align = 'left',
				elements = elements
			}, function(data2, menu2)
				local coords  = GetEntityCoords(playerPed)
				vehicle = ESX.Game.GetVehicleInDirection()
				action  = data2.current.value

				if action == 'search_database' then
					LookupVehicle()
				elseif DoesEntityExist(vehicle) then
					if action == 'vehicle_infos' then
						local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
						OpenVehicleInfosMenu(vehicleData)
					elseif action == 'hijack_vehicle' then
						if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
							TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
							Citizen.Wait(20000)
							ClearPedTasksImmediately(playerPed)

							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ESX.ShowNotification(_U('vehicle_unlocked'))
						end
					elseif action == 'impound' then
						-- is the script busy?
						if currentTask.busy then
							return
						end

						ESX.ShowHelpNotification(_U('impound_prompt'))
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

						currentTask.busy = true
						currentTask.task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							ImpoundVehicle(vehicle)
							Citizen.Wait(100) -- sleep the entire script to let stuff sink back to reality
						end)

						-- keep track of that vehicle!
						Citizen.CreateThread(function()
							while currentTask.busy do
								Citizen.Wait(1000)

								vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
								if not DoesEntityExist(vehicle) and currentTask.busy then
									ESX.ShowNotification(_U('impound_canceled_moved'))
									ESX.ClearTimeout(currentTask.task)
									ClearPedTasks(playerPed)
									currentTask.busy = false
									break
								end
							end
						end)
					end
				else
					ESX.ShowNotification(_U('no_vehicles_nearby'))
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'object_spawner' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('traffic_interaction'),
				align = 'left',
				elements = {
					{label = _U('cone'), model = 'prop_roadcone02a'},
					{label = _U('barrier'), model = 'prop_barrier_work05'},
					{label = _U('spikestrips'), model = 'p_ld_stinger_s'},
					{label = _U('box'), model = 'prop_boxpile_07d'},
					{label = _U('cash'), model = 'hei_prop_cash_crate_half_full'}
			}}, function(data2, menu2)
				local playerPed = PlayerPedId()
				local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
				local objectCoords = (coords + forward * 1.0)

				ESX.Game.SpawnObject(data2.current.model, objectCoords, function(obj)
					SetEntityHeading(obj, GetEntityHeading(playerPed))
					PlaceObjectOnGroundProperly(obj)
				end)
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end


RegisterNetEvent('p:getid')
AddEventHandler('p:getid', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		OpenIdentityCardMenu(closestPlayer)
	end
end)
RegisterNetEvent('p:putinveh')
AddEventHandler('p:putinveh', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(closestPlayer))
	end
end)
RegisterNetEvent('p:getoutveh')
AddEventHandler('p:getoutveh', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(closestPlayer))
	end
end)

RegisterNetEvent('p:handcuff')
AddEventHandler('p:handcuff', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))
	end
end)
RegisterNetEvent('p:arrest')
AddEventHandler('p:arrest', function()
	local target, distance = ESX.Game.GetClosestPlayer()
	playerheading = GetEntityHeading(GetPlayerPed(-1))
	playerlocation = GetEntityForwardVector(PlayerPedId())
	playerCoords = GetEntityCoords(GetPlayerPed(-1))
	local target_id = GetPlayerServerId(target)
	if distance <= 2.0 then
		TriggerServerEvent('esx_policejob:requestarrest', target_id, playerheading, playerCoords, playerlocation)
	else
		exports['mythic_notify']:SendAlert('inform', 'Demasiado longe para Algemar')
	end
end)
RegisterNetEvent('p:unrrest')
AddEventHandler('p:unrrest', function()
	local target, distance = ESX.Game.GetClosestPlayer()
	playerheading = GetEntityHeading(GetPlayerPed(-1))
	playerlocation = GetEntityForwardVector(PlayerPedId())
	playerCoords = GetEntityCoords(GetPlayerPed(-1))
	local target_id = GetPlayerServerId(target)
	if distance <= 2.0 then
		TriggerServerEvent('esx_policejob:requestrelease', target_id, playerheading, playerCoords, playerlocation)
	else
		exports['mythic_notify']:SendAlert('inform', 'Demasiado longe para Algemar')
	end
end)
RegisterNetEvent('p:searchinv')
AddEventHandler('p:searchinv', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		OpenBodySearchMenu(closestPlayer)
		exports['mythic_notify']:SendAlert('inform', 'Estás a ser revistado por '..GetPlayerName(closestPlayer)..'.')
	end
end)
RegisterNetEvent('p:checkLicenses')
AddEventHandler('p:checkLicenses', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		ShowPlayerLicense(closestPlayer)
	end
end)
RegisterNetEvent('p:seebills')
AddEventHandler('p:seebills', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		OpenUnpaidBillsMenu(closestPlayer)
	end
end)

RegisterNetEvent('p:arrastar')
AddEventHandler('p:arrastar', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
	end
end)

function OpenIdentityCardMenu(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local elements = {
			{label = _U('name', data.name)},
			{label = _U('job', ('%s - %s'):format(data.job, data.grade))}
		}

		if Config.EnableESXIdentity then
			table.insert(elements, {label = _U('sex', _U(data.sex))})
			table.insert(elements, {label = _U('dob', data.dob)})
			table.insert(elements, {label = _U('height', data.height)})
		end

		if data.drunk then
			table.insert(elements, {label = _U('bac', data.drunk)})
		end

		if data.licenses then
			table.insert(elements, {label = _U('license_label')})

			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
			title    = _U('citizen_interaction'),
			align = 'left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenBodySearchMenu(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local elements = {}

		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end
		end

		table.insert(elements, {label = _U('guns_label')})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label')})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
			title    = _U('search'),
			align = 'left',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				TriggerServerEvent('esx_policejob:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
				OpenBodySearchMenu(player)
			end
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenFineMenu(player)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine', {
		title    = _U('fine'),
		align = 'left',
		elements = {
			{label = _U('traffic_offense'), value = 0},
			{label = _U('minor_offense'),   value = 1},
			{label = _U('average_offense'), value = 2},
			{label = _U('major_offense'),   value = 3}
	}}, function(data, menu)
		OpenFineCategoryMenu(player, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenFineCategoryMenu(player, category)
	ESX.TriggerServerCallback('esx_policejob:getFineList', function(fines)
		local elements = {}

		for k,fine in ipairs(fines) do
			table.insert(elements, {
				label     = ('%s <span style="color:green;">%s</span>'):format(fine.label, _U('armory_item', ESX.Math.GroupDigits(fine.amount))),
				value     = fine.id,
				amount    = fine.amount,
				fineLabel = fine.label
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine_category', {
			title    = _U('fine'),
			align = 'left',
			elements = elements
		}, function(data, menu)
			menu.close()

			if Config.EnablePlayerManagement then
				TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_police', _U('fine_total', data.current.fineLabel), data.current.amount)
			else
				TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total', data.current.fineLabel), data.current.amount)
			end

			ESX.SetTimeout(300, function()
				OpenFineCategoryMenu(player, category)
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, category)
end

function LookupVehicle()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_vehicle', {
		title = _U('search_database_title'),
	}, function(data, menu)
		local length = string.len(data.value)
		if not data.value or length < 2 or length > 8 then
			ESX.ShowNotification(_U('search_database_error_invalid'))
		else
			ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(retrivedInfo)
				local elements = {{label = _U('plate', retrivedInfo.plate)}}
				menu.close()

				if not retrivedInfo.owner then
					table.insert(elements, {label = _U('owner_unknown')})
				else
					table.insert(elements, {label = _U('owner', retrivedInfo.owner)})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
					title    = _U('vehicle_info'),
					align = 'left',
					elements = elements
				}, nil, function(data2, menu2)
					menu2.close()
				end)
			end, data.value)

		end
	end, function(data, menu)
		menu.close()
	end)
end

function ShowPlayerLicense(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(playerData)
		if playerData.licenses then
			for i=1, #playerData.licenses, 1 do
				if playerData.licenses[i].label and playerData.licenses[i].type then
					table.insert(elements, {
						label = playerData.licenses[i].label,
						type = playerData.licenses[i].type
					})
				end
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license', {
			title    = _U('license_revoke'),
			align = 'left',
			elements = elements,
		}, function(data, menu)
			ESX.ShowNotification(_U('licence_you_revoked', data.current.label, playerData.name))
			TriggerServerEvent('esx_policejob:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))

			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.type)

			ESX.SetTimeout(300, function()
				ShowPlayerLicense(player)
			end)
		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))
end

function OpenUnpaidBillsMenu(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_billing:getTargetBills', function(bills)
		for k,bill in ipairs(bills) do
			table.insert(elements, {
				label = ('%s - <span style="color:red;">%s</span>'):format(bill.label, _U('armory_item', ESX.Math.GroupDigits(bill.amount))),
				billId = bill.id
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
			title    = _U('unpaid_bills'),
			align = 'left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenVehicleInfosMenu(vehicleData)
	ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(retrivedInfo)
		local elements = {{label = _U('plate', retrivedInfo.plate)}}

		if not retrivedInfo.owner then
			table.insert(elements, {label = _U('owner_unknown')})
		else
			table.insert(elements, {label = _U('owner', retrivedInfo.owner)})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
			title    = _U('vehicle_info'),
			align = 'left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, vehicleData.plate)
end

function OpenGetWeaponMenu()
	ESX.TriggerServerCallback('esx_policejob:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name),
					value = weapons[i].name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon', {
			title    = _U('get_weapon_menu'),
			align = 'left',
			elements = elements
		}, function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('esx_policejob:removeArmoryWeapon', function()
				OpenGetWeaponMenu()
			end, data.current.value)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {
				label = weaponList[i].label,
				value = weaponList[i].name
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon', {
		title    = _U('put_weapon_menu'),
		align = 'left',
		elements = elements
	}, function(data, menu)
		menu.close()

		ESX.TriggerServerCallback('esx_policejob:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value, true)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenBuyWeaponsMenu()
	local elements = {}
	local playerPed = PlayerPedId()

	for k,v in ipairs(Config.AuthorizedWeapons[ESX.PlayerData.job.grade_name]) do
		local weaponNum, weapon = ESX.GetWeapon(v.weapon)
		local components, label = {}
		local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

		if v.components then
			for i=1, #v.components do
				if v.components[i] then
					local component = weapon.components[i]
					local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

					if hasComponent then
						label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_owned'))
					else
						if v.components[i] > 0 then
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_item', ESX.Math.GroupDigits(v.components[i])))
						else
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_free'))
						end
					end

					table.insert(components, {
						label = label,
						componentLabel = component.label,
						hash = component.hash,
						name = component.name,
						price = v.components[i],
						hasComponent = hasComponent,
						componentNum = i
					})
				end
			end
		end

		if hasWeapon and v.components then
			label = ('%s: <span style="color:green;">></span>'):format(weapon.label)
		elseif hasWeapon and not v.components then
			label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_owned'))
		else
			if v.price > 0 then
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_item', ESX.Math.GroupDigits(v.price)))
			else
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_free'))
			end
		end

		table.insert(elements, {
			label = label,
			weaponLabel = weapon.label,
			name = weapon.name,
			components = components,
			price = v.price,
			hasWeapon = hasWeapon
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons', {
		title    = _U('armory_weapontitle'),
		align = 'left',
		elements = elements
	}, function(data, menu)
		if data.current.hasWeapon then
			if #data.current.components > 0 then
				OpenWeaponComponentShop(data.current.components, data.current.name, menu)
			end
		else
			ESX.TriggerServerCallback('esx_policejob:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.weaponLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, data.current.name, 1)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenWeaponComponentShop(components, weaponName, parentShop)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons_components', {
		title    = _U('armory_componenttitle'),
		align = 'left',
		elements = components
	}, function(data, menu)
		if data.current.hasComponent then
			ESX.ShowNotification(_U('armory_hascomponent'))
		else
			ESX.TriggerServerCallback('esx_policejob:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.componentLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					parentShop.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, weaponName, 2, data.current.componentNum)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_policejob:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('police_stock'),
			align = 'left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:getStockItem', itemName, count)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align = 'left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_policejob:putStockItems', itemName, count)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	Citizen.Wait(5000)
	TriggerServerEvent('esx_policejob:forceBlip')
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_police'),
		number     = 'police',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTVGcd/u3cfSXaTLEk2j80TCI8ECI9ABCyoiBqhBVQqVG2ppVKBQqUVgUl5OU7HKqNOHUHU0oHamZZWoGkVS6cWAR2JPJuAQBPy2ISEvLN57+v2u2E33e4k6Ngz85+9d++95/zP9/h/39GpqsqiRYsIGz8QZAq28/8PRfC+4HT4fMXFxeiH+GC54NeCbYLLATLpYe/ECx4VnBTsF0wWhM6lXY8VbBE0Ch4IzLcpfDFD2P1TgrdC7nMCZLRxQ9AkiAkQCn77DcH3BC2COoFRkCSIG2JzLwqiQi0RSmCD4JXbmNKh0+kc/X19tLtc9Ll9sk9ZS1yoU71YIk3xsbEx8QaDEc2ttxmaJSKC1ggSKBK8MKwTFQVXRzs3WzpJGjmZgvxcMpMtWIwqsjztvSrlzjYul56jp+46qSmJmMwR+P3+4aZ8TtCprRkk0DvUW7JjmV6lsqoKW/pU1q9YQOE4Nxkx4ladE7zd8ivuVmJQfXZKW5dx5EwPRw4fxNx2g5SUVLw+33AkzoRaQDP9SkFu6OKqz0uF8yaz7vsOL6ycQVLkcSg/BlWNsjuFoKE1knqDSl5aNnmPLmThrE0UvXqQqvJPyMrMGorEHwQfEha57/3P7mXS684GFjy8kreLppPUuBXfyd/ibeoS2kb0mWPANhJdYjb61AxUvx5PdT3+4y+Tb3mTd19ZSebE+VTXVGNQlHAC7w4VhH8TbA36vKq6ilnzlvPSunHw6Trc7XpZ14AyfgYeyz18crGN1Alz6e3qwNNQSv4dZox1h/BW9+O7eIaEsVv41Y4XeHJDG83Nl4mLTwzGhJYtx0PzNTjOB9KMTlc7Nkcem39YAGU7cbeBKVLMPGMVf296nMd2VbBq1wmizHoqqm/wrS1/Zf0+N19YN2PIu1fcIda4Vk66Zx/rVi+jo9eIX9wZGGcFXUMR6BHUa76/2ezioYcXMtpyAl91DSaTfDxlJbtLprHm2ecpObqPuTPzSNV9yKz4a4zJSuLo71/j8Q17ON69EmXiPIlNMe6FoyzOqWPW/MU03Lw5EFcyKghTrNDh7+/vw545mcJcWbTiGKpRdGPMXbx90sGmDaux6sXk+kimjU+BjnMkx3kYP34cXrFuZ+3nrHi6iDMt92JITcPjk3R3naRwZhpuNSqoD93DKaFVU7j2dhcF8+YzNlpErbIBTVh8toVccbaysPB+4pMcuPw25kwSsau7BIlmHpy3guaOPtISYyi/UkaJM5Lpc5agq5Xkcl6gIHkmqaMn0dtylcjIyPThCNyhaXyfR2W0I1our0v6qBii07ih5rDtGSOxNVdk1y4R2SR8jR/g7hQD9l1jUeY/WLJB5m39AlZN4GZyIQ1fFJNsEgt0duBIc5GRkcZF53mNwIzhXPDgQPoZIkiMkbTxtstDMVnmFA4cOsbz2/aKjSQjev4Mp9ZAg+hIpFhB3EH5Yal16+X+Kq3dGfxkzRY+KauBjBzREvGN0kNCTARu94AejBLMHorAQ7cEQMGs2cXvkWshYLDi6e9l728O8P1XW6hKeB2yv42q18tjj+iFTGoSi+X9jJM9RTxS9E+OHT0krhNiZqlbqraoT7RAU5bBGrEknEBhgJks7KXbLS8qERI0ErVqF/Y4K6NHZfLZB+/wzJvncacvFd91oXO3o/O40MfZKJOKu/rne+mRQByXM4lYreb1tUnkizVVA/0SpfpbWaCNBeEE5gb/UH19NLqEgDF+oNDQWcn41Cj0EXFEWqzkOIyYekslFkThsvMxpIyE2hIc6lXGZ6cPyK7Nnk5OipixRdxgUESAYmhq68VsGgy5CYKCUAJTg0+izApXne3CJFmUTwg4L3FProFxU+6krqmXu3MskkhSD2av41jLdzlnfFrSdCZxyqfMnppN6ZUa7pwt0h3fiK9DCt4IO9e7YqisvI7VYgmNv7mhBKKD/9psNi5dOMv5ZjukjsLdr0ffWsyTi6eSlfcA+dmiVyOXs+/sHNZu3M6PdxzgVO9GmDSHsSNqmTz/R6y6Xxqma4fwaS5Mn85n1ZE0Vl3CHBER3lUNEhiURpPJRFdTOcVnpUJnPIhR7cZXfoH5UYc5+E4RzRH3sfSnl9m2dSMjE+Tz9msse+o5dr7UwcQ5T3HwlWUkNuzG3dKFSTbsNs7m/Y8vExOlC29UWkMJlAxKoRQMR3IC7x85zOn6fHS50+U/2Untx2R1voinu5no+DQmz7yPXmMKZnsu0wrm0Oe3YhOVHdm8A09dBQYhTv4T7C+xUPrZh8Qn2MMr4qcDSRfoirWgKAvtgOpv1JI8Zi77X15G7L+fxeOUOiUFxZiULD5fSlNzNM62W+k1yq5gjajGX/ZHvOIyxd+Fkj+P092rWP/si0Qr7VisMaEWuCiYonXFwbAUTWWPYLV245NITnGkUXnpI9butLJn2y6iba+hlp7C09qBcvoN7FYL9mhxo1/y/LoEXK8Pv6qIC8WbBY/xr9YlPLf9dZT+OqKTUwfmDBm/GOw7ws4FWpuUP2gJEZvKqmocuXPZuWYJMzKuSsH+SNwh3bo0p6hao6HeEqwYEZ2M6aKWd3PwTCy7du/D0F1DsmzE6/WGLr5LsDF4LggnYBacCOboQLHQ3FFfR58SR+HCR1iQH8ukhA5s5o5AYZMwUqOp74nl8xvRHDlRTsnxYpJsUjtsceHt2C8Fm0MPJrphTkZvBc4It9RKLOFx91Pf0Igu0k7W2MmkOewS2QYJUJVWVz9VNbXUVVwkyuAmKTFJayrDo/4Jwe/CT0aGYTrWVYEeUfsgXssMRcpyenraQJa0VX9O3ZU+Ma1fax4xGxUsUVFkOUbcama1hf+7+LmA9juHWshwmwOE1iMmCFYEzg1jtIm1BaxW6wCGGoFdewPfvyE4ertTiv4rHC73B855dwp2a23bbd4tC1hvhOCbX7b4VyUQKhxrtSOaYKngasizvwi0RmOS4O1QZf2yYfiaR+73AvhTQEVf+rpn9/8IMAChKDrDzfsdIQAAAABJRU5ErkJggg=='
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.name == dispatchNumber then
		-- if esx_service is enabled
		if Config.EnableESXService and not playerInService then
			CancelEvent()
		end
	end
end)

AddEventHandler('esx_policejob:hasEnteredMarker', function(station, part, partNum)
	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	elseif part == 'Armory' then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	elseif part == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('garage_prompt')
		CurrentActionData = {station = station, part = part, partNum = partNum}
	elseif part == 'Helicopters' then
		CurrentAction     = 'Helicopters'
		CurrentActionMsg  = _U('helicopter_prompt')
		CurrentActionData = {station = station, part = part, partNum = partNum}
	elseif part == 'BossActions' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_policejob:hasExitedMarker', function(station, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

AddEventHandler('esx_policejob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and IsPedOnFoot(playerPed) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('remove_prop')
		CurrentActionData = {entity = entity}
	end

	if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle, i, true, 1000)
			end
		end
	end
end)

AddEventHandler('esx_policejob:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)

RegisterNetEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(100)
		end

		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		-- FreezeEntityPosition(playerPed, true)
		DisplayRadar(false)

		if Config.EnableHandcuffTimer then
			if handcuffTimer.active then
				ESX.ClearTimeout(handcuffTimer.task)
			end

			StartHandcuffTimer()
		end
	else
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		-- FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('esx_policejob:unrestrain')
AddEventHandler('esx_policejob:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)


RegisterNetEvent('esx_policejob:getarrested')
AddEventHandler('esx_policejob:getarrested', function(playerheading, playercoords, playerlocation)
	playerPed = GetPlayerPed(-1)
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Citizen.Wait(3760)
	isHandcuffed = true
	TriggerEvent('esx_policejob:handcuff')
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)

end)

RegisterNetEvent('esx_policejob:doarrested')
AddEventHandler('esx_policejob:doarrested', function()
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)
end)

RegisterNetEvent('esx_policejob:douncuffing')
AddEventHandler('esx_policejob:douncuffing', function()
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('esx_policejob:getuncuffed')
AddEventHandler('esx_policejob:getuncuffed', function(playerheading, playercoords, playerlocation)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	isHandcuffed = false
	TriggerEvent('esx_policejob:handcuff')
	ClearPedTasks(GetPlayerPed(-1))

end)


RegisterNetEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(copId)
	if isHandcuffed then
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.CopId = copId
	end
end)

Citizen.CreateThread(function()
	local wasDragged

	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed and dragStatus.isDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true
				else
					Citizen.Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(playerPed, true, false)
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(playerPed, true, false)
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if IsAnyVehicleNearPoint(coords, 5.0) then
			local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

			if DoesEntityExist(vehicle) then
				local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

				for i=maxSeats - 1, 0, -1 do
					if IsVehicleSeatFree(vehicle, i) then
						freeSeat = i
						break
					end
				end

				if freeSeat then
					TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
					dragStatus.isDragged = false
				end
			end
		end
	end
end)

RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 16)
	end
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed then
			-- DisableControlAction(0, 1, true) -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			-- DisableControlAction(0, 32, true) -- W
			-- DisableControlAction(0, 34, true) -- A
			-- DisableControlAction(0, 31, true) -- S
			-- DisableControlAction(0, 30, true) -- D

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.PoliceStations) do
		local blip = AddBlipForCoord(v.Blip.Coords)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('map_blip'))
		EndTextCommandSetBlipName(blip)
	end
end)

--local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
    -- {title="Posto Unidade Marítima", colour=63, id=427, x = -1325.82, y = -1514.44, z = 4.43},
 -- }
      
--Citizen.CreateThread(function()

   -- for _, info in pairs(blips) do
   --   info.blip = AddBlipForCoord(info.x, info.y, info.z)
  --    SetBlipSprite(info.blip, info.id)
   --   SetBlipDisplay(info.blip, 4)
   --   SetBlipScale(info.blip, 0.8)
   --   SetBlipColour(info.blip, info.colour)
   --   SetBlipAsShortRange(info.blip, true)
	--  BeginTextCommandSetBlipName("STRING")
   --   AddTextComponentString(info.title)
    --  EndTextCommandSetBlipName(info.blip)
  --  end
--end)

-- Draw markers and more
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			local isInMarker, hasExited, letSleep = false, false, true
			local currentStation, currentPart, currentPartNum

			for k,v in pairs(Config.PoliceStations) do
				for i=1, #v.Cloakrooms, 1 do
					local distance = #(playerCoords - v.Cloakrooms[i])

					if distance < Config.DrawDistance then
						DrawMarker(25, v.Cloakrooms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Cloakroom', i
						end
					end
				end

				for i=1, #v.Armories, 1 do
					local distance = #(playerCoords - v.Armories[i])

					if distance < Config.DrawDistance then
						DrawMarker(25, v.Armories[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Armory', i
						end
					end
				end

				for i=1, #v.Vehicles, 1 do
					local distance = #(playerCoords - v.Vehicles[i].Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(36, v.Vehicles[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Vehicles', i
						end
					end
				end

				for i=1, #v.Helicopters, 1 do
					local distance =  #(playerCoords - v.Helicopters[i].Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(34, v.Helicopters[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Helicopters', i
						end
					end
				end

				if Config.EnablePlayerManagement and ESX.PlayerData.job.grade_name == 'subint' or 'inten' or 'superin' or 'superinchefe' or 'diretoradjunto' or 'diretornacional' then
					for i=1, #v.BossActions, 1 do
						local distance = #(playerCoords - v.BossActions[i])

						if distance < Config.DrawDistance then
							DrawMarker(25, v.BossActions[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
							letSleep = false

							if distance < Config.MarkerSize.x then
								isInMarker, currentStation, currentPart, currentPartNum = true, k, 'BossActions', i
							end
						end
					end
				end
			end

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastStation and LastPart and LastPartNum) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_policejob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()
	local trackedEntities = {
		'prop_roadcone02a',
		'prop_barrier_work05',
		'p_ld_stinger_s',
		'prop_boxpile_07d',
		'hei_prop_cash_crate_half_full'
	}

	while true do
		Citizen.Wait(500)

		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(playerCoords, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance = #(playerCoords - objCoords)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_policejob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity then
				TriggerEvent('esx_policejob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then

				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu()
				elseif CurrentAction == 'menu_armory' then
					if not Config.EnableESXService then
						OpenArmoryMenu(CurrentActionData.station)
					elseif playerInService then
						OpenArmoryMenu(CurrentActionData.station)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'menu_vehicle_spawner' then
					if not Config.EnableESXService then
						OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					elseif playerInService then
						OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'Helicopters' then
					if not Config.EnableESXService then
						OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					elseif playerInService then
						OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'delete_vehicle' then
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				elseif CurrentAction == 'menu_boss_actions' then
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
						menu.close()

						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, { wash = false }) -- disable washing money
				elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end

				CurrentAction = nil
			end
		end -- CurrentAction end

		if IsControlJustReleased(0, 167) and not isDead and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') then
			if not Config.EnableESXService then
				OpenPoliceActionsMenu()
			elseif playerInService then
				OpenPoliceActionsMenu()
			else
				ESX.ShowNotification(_U('service_not'))
			end
		end

		if IsControlJustReleased(0, 38) and currentTask.busy then
			ESX.ShowNotification(_U('impound_canceled'))
			ESX.ClearTimeout(currentTask.task)
			ClearPedTasks(PlayerPedId())

			currentTask.busy = false
		end
	end
end)

-- Create blip for colleagues
function createBlip(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)
		SetBlipColour(blip, 57)

		table.insert(blipsCops, blip) -- add blip to array so we can remove it later
	end
end

RegisterNetEvent('esx_policejob:updateBlip')
AddEventHandler('esx_policejob:updateBlip', function()

	-- Refresh all blips
	for k, existingBlip in pairs(blipsCops) do
		RemoveBlip(existingBlip)
	end

	-- Clean the blip table
	blipsCops = {}

	-- Enable blip?
	if Config.EnableESXService and not playerInService then
		return
	end

	if not Config.EnableJobBlip then
		return
	end

	-- Is the player a cop? In that case show all the blips for other cops
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
			for i=1, #players, 1 do
				if players[i].job.name == 'police' then
					local id = GetPlayerFromServerId(players[i].source)
					if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
						createBlip(id)
					end
				end
			end
		end)
	end

end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerEvent('esx_policejob:unrestrain')

	if not hasAlreadyJoined then
		TriggerServerEvent('esx_policejob:spawned')
	end
	hasAlreadyJoined = true
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_policejob:unrestrain')
		TriggerEvent('esx_phone:removeSpecialContact', 'police')

		if Config.EnableESXService then
			TriggerServerEvent('esx_service:disableService', 'police')
		end

		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('esx_policejob:unrestrain')
		handcuffTimer.active = false
	end)
end

-- TODO
--   - return to garage if owned
--   - message owner that his vehicle has been impounded
function ImpoundVehicle(vehicle)
	--local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	ESX.Game.DeleteVehicle(vehicle)
	ESX.ShowNotification(_U('impound_successful'))
	currentTask.busy = false
end