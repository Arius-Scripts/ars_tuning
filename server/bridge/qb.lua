local qb = GetResourceState('qb-core'):find("start")
if not qb then return end

local QBCore = exports['qb-core']:GetCoreObject()

--- @param amount number
lib.callback.register('ars_tuning:hasMoney', function(source, amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    local money = xPlayer.Functions.GetMoney('cash')

    return money >= amount
end)

--- @param amount number
RegisterNetEvent("ars_tuning:payMods", function(amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    xPlayer.Functions.RemoveMoney('cash', amount)
end)
