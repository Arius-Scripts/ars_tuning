lib.locale()

function confirmPayment()
    if not cart[1] then return end

    local cost = 0
    local modListMsg = ""

    for k, v in ipairs(cart) do
        local modPrice = tonumber(v.modPrice)
        cost = cost + modPrice
        modListMsg = modListMsg .. "- " .. v.modLabel .. " " .. v.modLevel .. " **" .. modPrice .. "$**  \n"
    end

    local confirmation = lib.alertDialog({
        header = 'Payment confirmation',
        content = modListMsg,
        centered = false,
        cancel = true
    })

    if confirmation == "confirm" then
        local hasMoney = lib.callback.await('ars_tuning:hasMoney', false, cost)

        if not hasMoney then
            lib.setVehicleProperties(cache.vehicle, currentVehProperties.old)
            cart = {}

            showNotification(locale("no_money"))
            return
        end

        cart = {}
        lib.setVehicleProperties(cache.vehicle, currentVehProperties.new)
        TriggerServerEvent("ars_tuning:payMods", cost, currentVehProperties.new)
        return
    end

    lib.setVehicleProperties(cache.vehicle, currentVehProperties.old)
    cart = {}
end
