ESX              = nil
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('nrrp_myinfo:obterinfo', function (source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = xPlayer.identifier

	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier ', {
		['identifier'] = xPlayer.identifier
	}, function(result)
		local thongtin = {}
		if (result[1] ~= nil) then
			for i=1, #result, 1 do
				table.insert(thongtin, {
					playerid		= _source,
					name       		= result[i].firstname .. ' ' .. result[i].lastname,
					sex      		= result[i].sex,
					dateofbirth 	= result[i].dateofbirth,
					job				= xPlayer.job.label .. " - " .. xPlayer.job.grade_label,
					phone_number	= result[i].phone_number,
					money 			= xPlayer.getMoney(),
					bank 			= xPlayer.getAccount('bank').money,
					black_money		= xPlayer.getAccount('black_money').money,
				})
			end
			cb(thongtin)
		end
	end)
end)


RegisterCommand('dsociedade', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
	local jobgrade = xPlayer.job.grade_name

    if jobgrade == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end

		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens ' .. money .. ' € na tua sociedade', length = 4000})											
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Acesso negado, não podes ver o dinheiro da sociedade!', length = 4000})										
	end
end, false)


function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

TriggerEvent('esx_society:getSocieties', function(societies) 
	RegisteredSocieties = societies
end)

function GetSociety(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end


function PayBills(d, h, m)
	CreateThread(function()
		Wait(0)
		MySQL.Async.fetchAll('SELECT * FROM billing', {}, function (result)
			for i=1, #result, 1 do
				local xPlayer = ESX.GetPlayerFromIdentifier(result[i].identifier)
				
				if xPlayer then
					local accountMoney = xPlayer.getAccount('bank').money
					
					if accountMoney > 0 then
						if math.floor(accountMoney/100*10) >= result[i].amount then
							xPlayer.removeAccountMoney('bank', result[i].amount)
							TriggerEvent('esx_addonaccount:getSharedAccount', result[i].target, function(account)
								account.addMoney(result[i].amount)
							end)
							MySQL.Sync.execute('DELETE FROM billing WHERE id = @id',
							{
								['@id'] = result[i].id
							})
						else
							xPlayer.removeAccountMoney('bank', math.floor(accountMoney/100*10))
							TriggerEvent('esx_addonaccount:getSharedAccount', result[i].target, function(account)
								account.addMoney(math.floor(accountMoney/100*10))
							end)
							MySQL.Sync.execute('UPDATE billing SET amount = amount - @amount WHERE id = @id',
							{
								['@amount'] = math.floor(accountMoney/100*10),
								['@id'] = result[i].id
							})
						end
						
					end
				else -- pay rent either way
					MySQL.Async.fetchScalar('SELECT accounts FROM users WHERE identifier = @identifier', 
					{
						['@identifier'] = result[i].identifier
					}, function(jsonAccounts)
						local accounts = json.decode(jsonAccounts)
						if accounts.bank > 0 then
							if math.floor(accounts.bank/100*10) >= result[i].amount then
								accounts.bank = accounts.bank - result[i].amount
								MySQL.Sync.execute('UPDATE users SET accounts = @accounts WHERE identifier = @identifier',
								{
									['@accounts']   = json.encode(accounts),
									['@identifier'] = result[i].identifier
								})
								TriggerEvent('esx_addonaccount:getSharedAccount', result[i].target, function(account)
									account.addMoney(result[i].amount)
								end)
								MySQL.Sync.execute('DELETE FROM billing WHERE `id` = @id',
								{
									['@id'] = result[i].id
								})
							else
								accounts.bank = accounts.bank - math.floor(accounts.bank/100*10)
								MySQL.Sync.execute('UPDATE users SET accounts = @accounts WHERE identifier = @identifier',
								{
									['@accounts']   = json.encode(accounts),
									['@identifier'] = result[i].identifier
								})
								MySQL.Sync.execute('UPDATE billing SET amount = amount - @amount WHERE id = @id',
								{
									['@amount']       = math.floor(accounts.bank/100*10),
									['@id'] = result[i].id
								})
							end
						end
					end)
				end
			end
		end)
	end)
end

TriggerEvent('cron:runAt', 8, 0, PayBills)