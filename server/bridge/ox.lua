local ox = GetResourceState('ox_core'):find("start")
if not ox then return end

--- @param amount number
lib.callback.register('ars_tuning:hasMoney', function(source, amount)
    local money = exports.ox_inventory:Search(source, "count", "money")

    return money >= amount
end)

--- @param amount number
RegisterNetEvent("ars_tuning:payMods", function(amount)
    exports.ox_inventory:RemoveItem(source, "money", amount)
end)
