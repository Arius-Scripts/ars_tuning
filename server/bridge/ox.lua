local ox = GetResourceState('ox_core'):find("start")
if not ox then return end

lib.callback.register('ars_tuning:hasMoney', function(source, amount)
    local money = exports.ox_inventory:Search(source, "count", "money")

    return money >= amount
end)

RegisterNetEvent("ars_tuning:payMods", function(amount)
    exports.ox_inventory:RemoveItem(source, "money", amount)
end)
