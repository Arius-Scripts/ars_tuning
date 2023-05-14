local esx = GetResourceState('es_extended'):find('start')
if not esx then return end

local ESX = exports.es_extended:getSharedObject()


lib.callback.register('ars_tuning:hasMoney', function(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)

    local money = xPlayer.getAccountMoney("money").money

    return money >= amount
end)

RegisterNetEvent("ars_tuning:payMods", function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeAccountMoney("money", amount)
end)
