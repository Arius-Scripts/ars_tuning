local esx = GetResourceState('es_extended'):find('start')
if not esx then return end

local ESX = exports.es_extended:getSharedObject()

--- @param amount number
lib.callback.register('ars_tuning:hasMoney', function(source, amount)
    local xPlayer = ESX.GetPlayerFromId(source)

    local money = xPlayer.getAccount("money").money

    return money >= amount
end)

--- @param amount number
RegisterNetEvent("ars_tuning:payMods", function(amount, properties)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeAccountMoney("money", amount)


    local properties = properties
    local isVehicleOwned = MySQL.prepare.await('SELECT plate FROM owned_vehicles WHERE plate = ?', { properties.plate })

    if isVehicleOwned then
        MySQL.update('UPDATE owned_vehicles SET vehicle = ? WHERE plate = ?',
            { json.encode(properties), properties.plate })
    end
end)
